Page 52193926 "Store Requisition Header GS"
{
    PageType = Card;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Store Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reason; Reason)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequisitionDate; "Requisition Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000016; "Store Requisition Line")
            {
                SubPageLink = "Requisition No" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Requisition)
            {
                Caption = 'Requisition';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        if Status = Status::Open then
                            RequsitionLines.Reset;
                        RequsitionLines.SetRange(RequsitionLines."Requisition No", "No.");
                        if RequsitionLines.Find('-') then begin
                            repeat
                                QtyDiff := RequsitionLines."Quantity in Store" - RequsitionLines.Quantity;
                                if (RequsitionLines."Quantity in Store" < 0) or (QtyDiff < 0) then begin

                                    Message('Procurement Notified ! The stock item: %1 is out of stock, The quantity in store is %2 ,'
                                    , RequsitionLines.Description, RequsitionLines."Quantity in Store");

                                    //Mail.NewIncidentMail('smbuthia@cma.or.ke', RequsitionLines.Description +' is Out of stock  ', "Employee Name"
                                    //+  'Has Requested'  +  FORMAT(RequsitionLines.Quantity)   + RequsitionLines.Description + ' but it is out of stock');
                                    //   EXIT;
                                end;
                            until RequsitionLines.Next = 0;
                        end;
                        //EXIT;




                        //if ApprovalMgt.SendPurchaseReqApprovalRequest(Rec) then;
                        //ApprovalMgt.SendPurchaseReqApprovalRequest(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.CancelPurchaseApprovalRRequest(Rec, true, true) then;
                    end;
                }
                action(Receive)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receive';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField(Status, Status::Released);

                        if Received = false then begin
                            Received := true;
                            "Received By" := UserId;
                            "Date Received" := CurrentDatetime;
                            Modify;

                            CompanyInfo.Get();
                            SenderAddress := CompanyInfo."Administrator Email";

                            SenderName := COMPANYNAME;

                            Subject := StrSubstNo('Requisition %1 Receipt', "No.");
                            Body := StrSubstNo('This is to inform you that Store Requisition %1 has been Received and you are required to post it and hand over the Item(s) requested.', "No.");

                            CompanyInfo.Get();

                            Recipients := CompanyInfo."Procurement Support E-mail";

                            SMTPSetup.Create(Recipients, Subject, Body, true);

                            Email.Send(SMTPSetup);
                        end else
                            Error('You have already Received this Store Requisition!!');
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511004, true, true, Rec);
                    Reset;
                end;
            }
            group(Attachments)
            {
                Caption = '&Attachments';
                Visible = true;
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := Reason;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Receive_Promoted; Receive)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Requisition Type" := "requisition type"::"Store Requisition";
    end;

    trigger OnOpenPage()
    begin
        /*
           SETRANGE("Raised by",USERID);
        
           IF UserSetup.GET(USERID) THEN
           BEGIN
        
           IF UserSetup."Approver ID"=USERID THEN
           SETRANGE("Raised by");
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
           IF AdditionalApprovers.FIND('+') THEN
           SETRANGE("Raised by");
           END;
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=USERID THEN
           SETRANGE("Raised by");
        
        
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           IF AdditionalApprovers.FIND('-') THEN
           REPEAT
        
            UserSetupRec.RESET;
            UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
            IF UserSetupRec.FIND('-') THEN
            SETRANGE("Raised by");
           UNTIL AdditionalApprovers.NEXT=0;
        
           END;
        
        
        
        
           END;
        */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        RequsitionLines: Record "Requisition Lines1";
        ItemJournaline: Record "Item Journal Line";
        CurrentJnlBatchName: Code[10];
        ItemPostline: Codeunit "Item Jnl.-Post Line";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        QtyDiff: Integer;
        Mail: Codeunit Mail;
        ItemLedger: Record "Item Ledger Entry";
        Trash: Record "Requisition Header1";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        CompanyInfo: Record "Company Information";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[50];
        Body: Text[250];
        Subject: Text[80];
}

