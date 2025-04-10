
codeunit 57007 "KasnebFunctions"
{

    trigger OnRun()
    begin
        Item.Reset;
        if Item.FindSet then begin
            repeat
                if not ItemUnitofMeasure.Get(Item."No.", Item."Base Unit of Measure") then begin
                    ItemUnitofMeasure.Init;
                    ItemUnitofMeasure."Item No." := Item."No.";
                    ItemUnitofMeasure.Code := Item."Base Unit of Measure";
                    ItemUnitofMeasure.Insert;
                end;
            until Item.Next = 0;
        end;
        Message('Done');
    end;

    var
        GlSetUp: Record "General Ledger Setup";
        GenPostingSetup: Record "General Posting Setup";
        GenProdGroup: Record "Gen. Product Posting Group";
        Item: Record Item;
        ItemUnitofMeasure: Record "Item Unit of Measure";

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInitRecord', '', false, false)]

    procedure AssignUserToInvoice(var PurchHeader: Record "Purchase Header")
    begin
        PurchHeader."Assigned User ID" := UserId;
    end;


    procedure CreateLPOFromLines(ProcurementRequestLines: Record "Procurement Request Lines")
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        DocumentNo: Code[20];
        Vendor: Record Vendor;
        PurchaseOrder: Page "Purchase Order";
    begin
        // ProcurementRequestLines.TestField("Supplier Category");
        // ProcurementRequestLines.TestField("Vendor No");
        PurchasesPayablesSetup.Get;
        PurchasesPayablesSetup.TestField("Order Nos.");
        PurchasesPayablesSetup.TestField("Posted Invoice Nos.");
        PurchasesPayablesSetup.TestField("Posted Receipt Nos.");
        DocumentNo := '';
        DocumentNo := NoSeriesManagement.GetNextNo(PurchasesPayablesSetup."Order Nos.", Today, true);
        //Purchase Header
        PurchaseHeader.Init;
        PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
        PurchaseHeader."No." := DocumentNo;
        // PurchaseHeader."Buy-from Vendor No." := ProcurementRequestLines."Vendor No";
        // PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
        // if Vendor.Get(ProcurementRequestLines."Vendor No") then
        //     PurchaseHeader."Supplier Type" := Vendor."Special Groups Type";
        PurchaseHeader."Requisition No" := ProcurementRequestLines."Requisition No";
        PurchaseHeader.Insert(true);
        //Purchase Lines
        PurchaseLine.Init;
        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
        PurchaseLine."Document No." := PurchaseHeader."No.";
        PurchaseLine."Line No." := ProcurementRequestLines."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
        // PurchaseLine."Buy-from Vendor No." := ProcurementRequestLines."Vendor No";
        // if ProcurementRequestLines.Type = ProcurementRequestLines.Type::"Non Stock Item" then
        //     PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
        // if ProcurementRequestLines.Type = ProcurementRequestLines.Type::"Fixed Asset" then
        //     PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
        if ProcurementRequestLines.Type = ProcurementRequestLines.Type::Item then
            PurchaseLine.Type := PurchaseLine.Type::Item;
        PurchaseLine."No." := ProcurementRequestLines.No;
        PurchaseLine.Description := ProcurementRequestLines.Description;
        PurchaseLine."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
        PurchaseLine.Quantity := ProcurementRequestLines.Quantity;
        PurchaseLine."Direct Unit Cost" := ProcurementRequestLines."Unit Price";
        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
        //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
        if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", ProcurementRequestLines."Line No") then
            PurchaseLine.Insert(true);
        Commit;
        Clear(PurchaseOrder);
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Order);
        PurchaseHeader.SetRange("No.", DocumentNo);
        if PurchaseHeader.FindFirst then begin
            PurchaseOrder.SetTableview(PurchaseHeader);
            PurchaseOrder.RunModal;
        end;
    end;


    // procedure PostBudgetReallocations(BudgetReallocationHeader: Record "Budget Reallocation Header")
    // var
    //     BudgetModificationLines: Record "Budget Modification Lines";
    //     GLBudgetName: Record "G/L Budget Name";
    //     GLBudgetEntry: Record "G/L Budget Entry";
    //     LineNo: Integer;
    // begin
    //     GLBudgetName.Get(BudgetReallocationHeader."Budget Code");
    //     GLBudgetName.TestField(Blocked, false);
    //     GLBudgetEntry.Reset;
    //     if GLBudgetEntry.FindLast then
    //         LineNo := GLBudgetEntry."Entry No." + 1000
    //     else
    //         LineNo := 1000;
    //     BudgetModificationLines.Reset;
    //     BudgetModificationLines.SetRange("Document No", BudgetReallocationHeader."Document No");
    //     if BudgetModificationLines.FindSet then begin
    //         repeat
    //             GLBudgetEntry.Init;
    //             GLBudgetEntry."Entry No." := LineNo;
    //             LineNo += 1000;
    //             GLBudgetEntry."Budget Name" := BudgetReallocationHeader."Budget Code";
    //             GLBudgetEntry."G/L Account No." := BudgetModificationLines."G/L Account No";
    //             GLBudgetEntry.Date := BudgetModificationLines."Posting Date";
    //             GLBudgetEntry."Global Dimension 1 Code" := BudgetModificationLines."Global Dimension 1 Code";
    //             GLBudgetEntry."Global Dimension 2 Code" := BudgetModificationLines."Global Dimension 2 Code";
    //             GLBudgetEntry.Validate("Global Dimension 1 Code");
    //             GLBudgetEntry.Validate("Global Dimension 2 Code");
    //             GLBudgetEntry.Amount := BudgetModificationLines.Amount;
    //             GLBudgetEntry.Validate(Amount);
    //             GLBudgetEntry.Description := BudgetReallocationHeader.Description;
    //             GLBudgetEntry."User ID" := UserId;
    //             GLBudgetEntry.Insert;
    //         until BudgetModificationLines.Next = 0;
    //     end;
    //     BudgetReallocationHeader.Posted := true;
    //     BudgetReallocationHeader.Modify;
    // end;


    // procedure PostEmployeeHandover(EmployeeHandoverHeader: Record "Employee Handover Header")
    // var
    //     EmployeeHandoverLines: Record "Employee Handover Lines";
    //     MiscArticleInformation: Record "Misc. Article Information";
    //     MiscArticleInformation1: Record "Misc. Article Information";
    //     LineNo: Integer;
    // begin
    //     MiscArticleInformation.Reset;
    //     if MiscArticleInformation.FindLast then
    //         LineNo := MiscArticleInformation."Line No."
    //     else
    //         LineNo := 1;
    //     EmployeeHandoverLines.Reset;
    //     EmployeeHandoverLines.SetRange("Handover/Return", true);
    //     EmployeeHandoverLines.SetRange("Document No", EmployeeHandoverHeader."Document No");
    //     if not EmployeeHandoverLines.FindSet then
    //         Error('There is Nothing to Handover!')
    //     else begin
    //         repeat
    //             if EmployeeHandoverLines."New Employee No" <> '' then begin
    //                 EmployeeHandoverLines.TestField("New Employee Start Date");
    //                 EmployeeHandoverLines.TestField("New Employee End Date");
    //                 MiscArticleInformation.Init;
    //                 MiscArticleInformation."Employee No." := EmployeeHandoverLines."New Employee No";
    //                 MiscArticleInformation."Misc. Article Code" := EmployeeHandoverLines.Code;
    //                 MiscArticleInformation."Line No." := LineNo;
    //                 LineNo += 1000;
    //                 MiscArticleInformation.Description := EmployeeHandoverLines.Description;
    //                 MiscArticleInformation."From Date" := EmployeeHandoverLines."New Employee Start Date";
    //                 MiscArticleInformation."To Date" := EmployeeHandoverLines."New Employee End Date";
    //                 MiscArticleInformation."In Use" := true;
    //                 MiscArticleInformation."Serial No." := EmployeeHandoverLines."Serial No";
    //                 MiscArticleInformation.Insert;
    //             end;
    //             MiscArticleInformation1.Reset;
    //             MiscArticleInformation1.SetRange("Serial No.", EmployeeHandoverLines."Serial No");
    //             MiscArticleInformation1.SetRange("Employee No.", EmployeeHandoverHeader."Employee No");
    //             MiscArticleInformation1.SetRange("Misc. Article Code", EmployeeHandoverLines.Code);
    //             if MiscArticleInformation1.FindFirst then begin
    //                 MiscArticleInformation1."In Use" := false;
    //                 MiscArticleInformation1.Modify;
    //             end;
    //             EmployeeHandoverLines.Changed := true;
    //             EmployeeHandoverLines.Modify(true);
    //         until EmployeeHandoverLines.Next = 0;
    //     end;
    //     EmployeeHandoverHeader.Processed := true;
    //     EmployeeHandoverHeader.Modify;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Approval Document", 'OnAfterReleaseInspection', '', false, false)]

    procedure ArchiveLPOOnRejectionOfInspection(InspectionHeader1: Record "Inspection Header1")
    var
        PurchaseHeader: Record "Purchase Header";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        if PurchaseHeader.Get(PurchaseHeader."document type"::Order, InspectionHeader1."Order No") then
            ArchiveManagement.ArchivePurchDocument(PurchaseHeader);
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Approval Document", 'OnAfterReleaseInspection', '', false, false)]

    procedure CopyInspectionsToLPO(InspectionHeader1: Record "Inspection Header1")
    var
        PurchaseHeader: Record "Purchase Header";
        DocumentAttachment: Record "Document Attachment";
        DocumentAttachment1: Record "Document Attachment";
        Ok: Boolean;
    begin
        if PurchaseHeader.Get(PurchaseHeader."document type"::Order, InspectionHeader1."Order No") then begin
            DocumentAttachment1.Reset;
            DocumentAttachment1.SetRange("No.", InspectionHeader1."Inspection No");
            DocumentAttachment1.SetRange("Table ID", Database::"Inspection Header1");
            if DocumentAttachment1.FindSet then begin
                repeat
                    DocumentAttachment.Init;
                    DocumentAttachment.TransferFields(DocumentAttachment1, false);
                    DocumentAttachment."Table ID" := Database::"Purchase Header";
                    DocumentAttachment."No." := PurchaseHeader."No.";
                    DocumentAttachment."Document Type" := DocumentAttachment."document type"::Order;
                    DocumentAttachment."Line No." := DocumentAttachment1."Line No.";
                    DocumentAttachment.ID := DocumentAttachment1.ID;
                    Ok := DocumentAttachment.Insert;
                until DocumentAttachment1.Next = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]

    procedure NotifyFinance(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var
        UserSetup: Record "User Setup";
        SMTPMail: Codeunit "Email Message";
        Subject: Text[250];
        Body: Text[250];
        SenderAddress: Text[250];
        SenderName: Text[250];
        Receipient: Text[250];
        PurchInvLine: Record "Purch. Inv. Line";
        SMTPMailSetup: Record "Email Account";
    begin
        // Commit;
        // SMTPMailSetup.Get;
        // SenderName := 'Purchase Posting';
        // Subject := PurchInvHdrNo + ' Posted';
        // SenderAddress := SMTPMailSetup."User ID";
        // Receipient := SMTPMailSetup."User ID";
        // PurchaseHeader.CalcFields("Amount Including VAT");
        // Body := 'Dear Finance<br>The Purchase Order ' + PurchaseHeader."No." + ' has been invoiced. Please proceed with Payment process';
        // SMTPMail.Create(SenderName, SenderAddress, Receipient, Subject, Body, true);
        // UserSetup.Reset;
        // UserSetup.SetRange("Finance Dept.", true);
        // if UserSetup.FindSet then begin
        //     repeat
        //         SMTPMail.AddBCC(UserSetup."E-Mail");
        //     until UserSetup.Next = 0;
        // end;
        // SMTPMail.Send;
    end;

    local procedure NotifyPurchaseDocumentOriginator()
    begin
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Approval Document", 'OnAfterReleaseLeave', '', false, false)]

    procedure UpdateApprovalUserMemberWithReliever(HRLeaveApplication: Record "HR Leave Application")
    var
        WorkflowUserGroupMember: Record "Workflow User Group Member";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
    // ICTSetup: Record "ICT Helpdesk Global Parameters";
    begin
        // ICTSetup.Get;
        // if ICTSetup.Delegate then begin
        //     UserSetup.Reset;
        //     UserSetup.SetRange("Employee No.", HRLeaveApplication.Reliever);
        //     if UserSetup.FindSet then begin
        //         UserSetup1.Reset;
        //         UserSetup1.SetRange("Employee No.", HRLeaveApplication."Employee No");
        //         if UserSetup1.FindFirst then begin
        //             WorkflowUserGroupMember.Reset;
        //             WorkflowUserGroupMember.SetRange("User Name", UserSetup1."User ID");
        //             if WorkflowUserGroupMember.FindFirst then begin
        //                 repeat
        //                     WorkflowUserGroupMember.Rename(WorkflowUserGroupMember."Workflow User Group Code", UserSetup."User ID");
        //                 until WorkflowUserGroupMember.Next = 0;
        //             end;
        //         end;
        //     end;
        // end;
    end;


    procedure IanSendEmailWithoutAttachementWithCC(SenderName: Text; SenderAddress: Text; Recipients: Text; Subject: Text; Body: Text; ToCopy: Text)
    var
        SMTPMail: Codeunit "Email Message";
    begin
        if (SenderName <> '') and (SenderAddress <> '') and (Recipients <> '') and (Subject <> '') and (Body <> '') then begin
            // SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);

            // SMTPMail.AddCC(ToCopy);
            // SMTPMail.Send();
        end;
    end;


    procedure IanSendEmailWithoutAttachement(SenderName: Text; SenderAddress: Text; Recipients: Text; Subject: Text; Body: Text)
    var
        SMTPMail: Codeunit "Email Message";
    begin
        if SenderName = '' then
            SenderName := 'Approval Workflow';
        // if (SenderName <> '') and (SenderAddress <> '') and (Recipients <> '') and (Subject <> '') and (Body <> '') then begin
        //     SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);

        //     GlSetUp.Get;
        //     SMTPMail.Send;
        //     Message('Mail sent');
        // end;
    end;


    procedure IanSendEmailWithSingleAttachement(SenderName: Text; SenderAddress: Text; Recipients: Text; Subject: Text; Body: Text; AttachementPath: Text; AttachementName: Code[50])
    var
        SMTPMail: Codeunit "Email Message";
    begin
        // if (SenderName <> '') and (SenderAddress <> '') and (Recipients <> '') and (Subject <> '') and (Body <> '') then begin
        //     SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);

        //     SMTPMail.AddAttachment(AttachementPath, AttachementName);
        //     SMTPMail.Send;
        // end;
    end;


    procedure IanSendEmailWithSeveralAttachement(SenderName: Text; SenderAddress: Text; Recipients: Text; Subject: Text; Body: Text; AttachementPath: Text; AttachementName: Code[50])
    var
        SMTPMail: Codeunit "Email Message";
    begin
        // if (SenderName <> '') and (SenderAddress <> '') and (Recipients <> '') and (Subject <> '') and (Body <> '') then begin
        //     SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);
        //     SMTPMail.AddAttachment(AttachementPath, AttachementName);

        //     GlSetUp.Get;
        //     SMTPMail.Send();
        // end;
    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'IanOnBeforeRejectApprovalRequest', '', false, false)]
    local procedure IanCheckForRejectionComments(ApprovalEntry: Record "Approval Entry")
    var
        ApprovalCommentLine: Record "Approval Comment Line";
    begin
        ApprovalCommentLine.Reset;
        ApprovalCommentLine.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
        ApprovalCommentLine.SetRange("User ID", UserId);
        if ApprovalCommentLine.IsEmpty then
            Error('You must atleast state one rejection reason');
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Approval Document", 'OnAfterReleaseCommittee', '', false, false)]

    procedure NotifyCommiteeApointment(TenderCommiteeAppointment1: Record "Tender Commitee Appointment1")
    var
        CommiteeMembers: Record "Commitee Members";
        UserSetup: Record "User Setup";
        SMTPMail: Codeunit "Email Message";
        Subject: Text[250];
        Body: Text[250];
        SenderAddress: Text[250];
        SenderName: Text[250];
        Receipient: Text[250];
        PurchInvLine: Record "Purch. Inv. Line";
        SMTPMailSetup: Record "Email Account";
    begin
        SMTPMailSetup.Get;
        SenderName := 'Purchase Posting';
        Subject := TenderCommiteeAppointment1."Appointment No" + ' Approved';
        //SenderAddress := SMTPMailSetup."User ID";
        // Receipient := SMTPMailSetup."User ID";
        CommiteeMembers.Reset;
        CommiteeMembers.SetRange("Appointment No", TenderCommiteeAppointment1."Appointment No");
        if CommiteeMembers.FindSet then begin
            repeat
                Body := 'Dear ' + CommiteeMembers.Name + '<br>Your Appoint ment to Commitee ' + TenderCommiteeAppointment1."Appointment No" + '  ' + TenderCommiteeAppointment1."Committee Name"
                + ' Has Been Approved';
                UserSetup.Reset;
                UserSetup.SetRange("Employee No.", CommiteeMembers."Employee No");
                if UserSetup.FindSet then begin
                    Receipient := UserSetup."E-Mail";
                end;
            //   if Receipient <> '' then begin
            //      SMTPMail.Create(SenderName, SenderAddress, Receipient, Subject, Body, true);
            //      SMTPMail.Send;
            //  end;
            until CommiteeMembers.Next = 0;
        end;
    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Payments-Post", 'OnAfterPostPaymentVoucher', '', false, false)]

    // procedure CreatePayslipDeduction(Payments: Record Payments)
    // var
    //     AssignmentMatrixX: Record "Assignment Matrix-X";
    //     PVLines: Record "PV Lines";
    //     Payments1: Record Payments;
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No, Payments."No.");
    //     if PVLines.FindSet then begin
    //         repeat
    //             if Payments1.Get(PVLines."S/Advance No") then begin
    //                 if ((Payments1."Account Type" = Payments1."account type"::Employee) and (Payments1."Payment Type" = Payments1."payment type"::"Salary Advance")) then begin
    //                     if Payments1."Payroll Deduction Code" <> '' then begin
    //                         if not AssignmentMatrixX.Get(Payments1."Account No.", AssignmentMatrixX.Type::Deduction,
    //                           Payments1."Payroll Deduction Code", Payments1."Recovery From", Payments1."No.") then begin
    //                             AssignmentMatrixX.Init;
    //                             AssignmentMatrixX."Employee No" := Payments1."Account No.";
    //                             AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
    //                             AssignmentMatrixX.Code := Payments1."Payroll Deduction Code";
    //                             AssignmentMatrixX.Validate(Code);
    //                             AssignmentMatrixX."Payroll Period" := Payments1."Recovery From";
    //                             AssignmentMatrixX.Validate("Payroll Period");
    //                             AssignmentMatrixX."Reference No" := Payments1."No.";
    //                             AssignmentMatrixX."Effective Start Date" := Payments1."Recovery From";
    //                             AssignmentMatrixX.Amount := -1 * Payments1."Monthly Installment";
    //                             AssignmentMatrixX.Insert;
    //                         end;
    //                     end;
    //                 end;
    //             end;
    //         until PVLines.Next = 0;
    //     end;
    // end;


    procedure UpdateLocations(PurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        InventorySetup: Record "Inventory Setup";
    begin
        InventorySetup.Get;
        if InventorySetup."Location Mandatory" then begin
            PurchaseLine.Reset;
            PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
            PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            if PurchaseLine.FindFirst then begin
                repeat
                    PurchaseLine.TestField("Location Code");
                    PurchaseLine.Validate("Location Code");
                    PurchaseLine.Modify;
                until PurchaseLine.Next = 0;
            end;
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterReleasePurchaseDoc', '', false, false)]

    // procedure CreatePurchaseHeaderCommitment(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var LinesWereModified: Boolean)
    // var
    //     CommitmentEntries1: Record "Commitment Entries1";
    //     PurchaseLine: Record "Purchase Line";
    //     LineNo: Integer;
    // begin
    //     if not PreviewMode then begin
    //         PurchaseLine.Reset;
    //         PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
    //         PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
    //         if PurchaseLine.FindSet then begin
    //             repeat
    //                 CommitmentEntries1.Reset;
    //                 if CommitmentEntries1.FindLast then
    //                     LineNo := CommitmentEntries1."Entry No" + 1
    //                 else
    //                     LineNo := 1;
    //                 CommitmentEntries1.Init;
    //                 CommitmentEntries1."Entry No" := LineNo;
    //                 CommitmentEntries1."Commitment Date" := PurchaseHeader."Posting Date";
    //                 CommitmentEntries1."Document No." := PurchaseHeader."No.";
    //                 CommitmentEntries1.Amount := PurchaseLine."Amount Including VAT";
    //                 CommitmentEntries1."Budget Line" := PurchaseLine."Job Task No.";
    //                 CommitmentEntries1."Global Dimension 1 Code" := PurchaseLine."Shortcut Dimension 1 Code";
    //                 CommitmentEntries1."Commitment Type" := CommitmentEntries1."commitment type"::LPO;
    //                 CommitmentEntries1."Global Dimension 2 Code" := PurchaseLine."Shortcut Dimension 2 Code";
    //                 CommitmentEntries1."User ID" := UserId;
    //                 CommitmentEntries1.Description := PurchaseLine.Description;
    //                 CommitmentEntries1."Commitment No" := PurchaseLine."Document No.";
    //                 CommitmentEntries1.Type := CommitmentEntries1.Type::Committed;
    //                 CommitmentEntries1.GLAccount := PurchaseLine."No.";
    //                 CommitmentEntries1.InvoiceNo := PurchaseLine."Document No.";
    //                 CommitmentEntries1."Account Type" := PurchaseLine.Type;
    //                 CommitmentEntries1."Account No." := PurchaseLine."No.";
    //                 CommitmentEntries1."Account Name" := PurchaseLine.Description;
    //                 CommitmentEntries1.Job := PurchaseLine."Job No.";
    //                 CommitmentEntries1."Job Task No" := PurchaseLine."Job Task No.";
    //                 CommitmentEntries1."Posted?" := true;
    //                 CommitmentEntries1.Insert;
    //             until PurchaseLine.Next = 0;
    //         end;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]

    // procedure ReversePurchaseHeaderCommitments(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    // var
    //     CommitmentEntries1: Record "Commitment Entries1";
    //     PurchaseLine: Record "Purchase Line";
    //     LineNo: Integer;
    // begin
    //     if not CommitIsSupressed then begin
    //         PurchaseLine.Reset;
    //         PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
    //         PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
    //         if PurchaseLine.FindSet then begin
    //             repeat
    //                 CommitmentEntries1.Reset;
    //                 if CommitmentEntries1.FindLast then
    //                     LineNo := CommitmentEntries1."Entry No" + 1
    //                 else
    //                     LineNo := 1;
    //                 CommitmentEntries1.Init;
    //                 CommitmentEntries1."Entry No" := LineNo;
    //                 CommitmentEntries1."Commitment Date" := PurchaseHeader."Posting Date";
    //                 CommitmentEntries1."Document No." := PurchaseHeader."No.";
    //                 CommitmentEntries1.Amount := -1 * PurchaseLine."Amount Including VAT";
    //                 CommitmentEntries1."Budget Line" := PurchaseLine."Job Task No.";
    //                 CommitmentEntries1."Global Dimension 1 Code" := PurchaseLine."Shortcut Dimension 1 Code";
    //                 CommitmentEntries1."Commitment Type" := CommitmentEntries1."commitment type"::LPO;
    //                 CommitmentEntries1."Global Dimension 2 Code" := PurchaseLine."Shortcut Dimension 2 Code";
    //                 CommitmentEntries1."User ID" := UserId;
    //                 CommitmentEntries1.Description := PurchaseLine.Description;
    //                 CommitmentEntries1."Commitment No" := PurchaseLine."Document No.";
    //                 CommitmentEntries1.Type := CommitmentEntries1.Type::Committed;
    //                 CommitmentEntries1.GLAccount := PurchaseLine."No.";
    //                 CommitmentEntries1.InvoiceNo := PurchaseLine."Document No.";
    //                 CommitmentEntries1."Account Type" := PurchaseLine.Type;
    //                 CommitmentEntries1."Account No." := PurchaseLine."No.";
    //                 CommitmentEntries1."Account Name" := PurchaseLine.Description;
    //                 CommitmentEntries1.Job := PurchaseLine."Job No.";
    //                 CommitmentEntries1."Job Task No" := PurchaseLine."Job Task No.";
    //                 CommitmentEntries1."Posted?" := true;
    //                 CommitmentEntries1.Insert;
    //             until PurchaseLine.Next = 0;
    //         end;
    //     end;
    // end;
}

