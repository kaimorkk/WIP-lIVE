Codeunit 52193440 "Store Management"
{

    trigger OnRun()
    begin
    end;

    var
        Text000: label 'There is no Employee No associated with %1';
        Text001: label 'User does not exist';
        Text002: label 'Sending Payment Notification of Order No #1#######\   Vendor Name:  #2#######\   to ##3####### ';
        Text003: label 'Are you sure you want to initialise payment for the selected Inspections?';
        Text004: label 'The Requisition cannot be posted before it is fully approved';
        Text005: label 'User %1 is not allowed to post the item issue \ Contact your system administrator';


    procedure InitiatePayment(var InspectionHeader: Record "Inspection Header1")
    var
        PurchHeader: Record "Purchase Header";
        PSetup: Record "Purchases & Payables Setup";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        Sender: Text[70];
        SenderName: Text[70];
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        UserSetup2: Record "User Setup";
        Receipient: Text[30];
        Window: Dialog;
    begin
        PurchHeader.Reset;
        PurchHeader.SetRange("No.", InspectionHeader."Order No");
        PurchHeader.SetRange("Document Type", PurchHeader."document type"::Order);
        PurchHeader.SetRange(Status, PurchHeader.Status::Released);
        if PurchHeader.Find('-') then begin
            //Send Notification
            PSetup.Get;
            if PSetup."Send Payment Notification" then begin
                if UserSetup.Get(UserId) then begin
                    UserSetup.TestField("Unlimited Member Approval");
                    UserSetup.TestField("E-Mail");
                    if Employee.Get(UserSetup."Unlimited Member Approval") then begin
                        SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        Sender := UserSetup."E-Mail";
                    end else
                        Error(Text000, UserId);
                end else
                    Error(Text001);
                PSetup.TestField(PSetup."Finance Notification");
                if UserSetup2.Get(PSetup."Finance Notification") then begin
                    UserSetup2.TestField("E-Mail");
                    Receipient := UserSetup2."E-Mail";
                end else
                    Error(Text000);
                InspectionHeader.CalcFields(Amount);
                Window.Open(Text002, PurchHeader."No.", PurchHeader."Buy-from Vendor Name", Receipient);
                SMTP.Create(Receipient, 'Payment Notification of Order No ' + PurchHeader."No.",
                                   'Please process payment of the following order to ' + InspectionHeader."Supplier Name" +
                                   ' therein totalling ' + Format(InspectionHeader.Amount), true);
                Email.Send(SMTP);
                Window.Update;
                Sleep(2000);
                Window.Close;

            end;
            //PurchHeader."Released for Payment" := true;
            PurchHeader.Modify;
            InspectionHeader.Status := InspectionHeader.Status::"Payment Processing";
            InspectionHeader.Modify;
        end else
            exit;
    end;


    procedure IssueItems(RequisitionRec: Record "Requisition Header1")
    var
        ItemJnLine: Record "Item Journal Line";
        PPSetup: Record "Purchases & Payables Setup";
        Batch: Record "Item Journal Batch";
        RequisitionLines: Record "Requisition Lines1";
        ItemReg: Record "Item Register";
    begin


        if RequisitionRec.Status <> RequisitionRec.Status::Released then
            Error(Text004);


        PPSetup.Get;
        if UpperCase(UserId) <> PPSetup."Stores Issuer" then
            Error(Text005, UserId);

        // Delete Lines Present on the Item Journal Line
        ItemJnLine.Reset;
        ItemJnLine.SetRange("Journal Template Name", PPSetup."Item Issue Journal Template");
        ItemJnLine.SetRange("Journal Batch Name", RequisitionRec."No.");
        ItemJnLine.DeleteAll;

        Batch.Init;
        Batch."Journal Template Name" := PPSetup."Item Issue Journal Template";
        Batch.Name := RequisitionRec."No.";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;

        RequisitionLines.Reset;
        RequisitionLines.SetRange(RequisitionLines."Requisition No", RequisitionRec."No.");
        if RequisitionLines.Find('-') then
            repeat
                if RequisitionLines.No <> '' then begin
                    ItemJnLine.Init;
                    ItemJnLine."Journal Template Name" := PPSetup."Item Issue Journal Template";
                    ItemJnLine."Journal Batch Name" := RequisitionRec."No.";
                    ItemJnLine."Line No." := ItemJnLine."Line No." + 10000;
                    ItemJnLine."Posting Date" := Today;
                    ItemJnLine."Entry Type" := ItemJnLine."entry type"::"Negative Adjmt.";
                    ItemJnLine."Document No." := RequisitionLines."Requisition No";
                    ItemJnLine."External Document No." := RequisitionLines."Requisition No";
                    ItemJnLine."Item No." := RequisitionLines.No;
                    ItemJnLine.Validate("Item No.");
                    ItemJnLine."Shortcut Dimension 1 Code" := RequisitionLines."Global Dimension 1 Code";
                    ItemJnLine.Validate("Shortcut Dimension 1 Code");
                    ItemJnLine."Shortcut Dimension 2 Code" := RequisitionLines."Global Dimension 2 Code";
                    ItemJnLine.Validate("Shortcut Dimension 2 Code");
                    ItemJnLine.Quantity := RequisitionLines."Quantity Approved";
                    ItemJnLine.Validate(Quantity);
                    if ItemJnLine.Quantity <> 0 then
                        ItemJnLine.Insert;
                end;
            until RequisitionLines.Next = 0;

        //Post The Item Issue
        Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemJnLine);
        ItemReg.Reset;
        ItemReg.SetRange(ItemReg."Journal Batch Name", RequisitionRec."No.");
        if ItemReg.Find('+') then begin
            RequisitionRec.Posted := true;
            RequisitionRec.Modify;
        end;
    end;


    procedure ReceiveItems(StoreRec: Record "Stores Return Header")
    var
        ItemJnLine: Record "Item Journal Line";
        PPSetup: Record "Purchases & Payables Setup";
        Batch: Record "Item Journal Batch";
        RequisitionLines: Record "Requisition Lines1";
        ItemReg: Record "Item Register";
        StoreLines: Record "Stores Return Lines";
    begin

        /*
        IF Status<>Status::Released THEN
        ERROR('The Requisition cannot be posted before it is fully approved');
        */

        PPSetup.Get;
        if UpperCase(UserId) <> PPSetup."Stores Issuer" then
            Error(Text005, UserId);

        // Delete Lines Present on the Item Journal Line
        ItemJnLine.Reset;
        ItemJnLine.SetRange("Journal Template Name", PPSetup."Item Issue Journal Template");
        ItemJnLine.SetRange("Journal Batch Name", StoreRec."No.");
        ItemJnLine.DeleteAll;

        Batch.Init;
        Batch."Journal Template Name" := PPSetup."Item Issue Journal Template";
        Batch.Name := StoreRec."No.";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;


        StoreLines.Reset;
        StoreLines.SetRange(StoreLines."Requisition No", StoreRec."No.");
        if StoreLines.Find('-') then
            repeat

                ItemJnLine.Init;
                ItemJnLine."Journal Template Name" := PPSetup."Item Issue Journal Template";
                ItemJnLine."Journal Batch Name" := StoreRec."No.";
                ItemJnLine."Line No." := ItemJnLine."Line No." + 10000;
                ItemJnLine."Posting Date" := Today;
                ItemJnLine."Entry Type" := ItemJnLine."entry type"::"Positive Adjmt.";
                ItemJnLine."Document No." := StoreLines."Requisition No";
                ItemJnLine."External Document No." := StoreLines."Requisition No";
                ItemJnLine."Item No." := StoreLines.No;
                ItemJnLine.Validate("Item No.");
                ItemJnLine.Quantity := StoreLines."Quantity Approved";
                ItemJnLine.Validate(Quantity);
                if ItemJnLine.Quantity <> 0 then
                    ItemJnLine.Insert(true);
            until StoreLines.Next = 0;

        //Receive the Item
        Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemJnLine);

        ItemReg.Reset;
        ItemReg.SetRange(ItemReg."Journal Batch Name", StoreRec."No.");
        if ItemReg.Find('+') then begin
            StoreRec.Posted := true;
            StoreRec.Modify;
        end;

    end;
}

