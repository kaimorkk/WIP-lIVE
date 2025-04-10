Page 52193888 "Requisition Header"
{
    PageType = Card;
    SourceTable = "Requisition Header1";

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
                field(DateofUse; "Date of Use")
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Reason)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Programme; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme';
                    Editable = false;
                    Visible = false;
                }
                field(GlobalDimension3Code; "Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(GlobalDimension4Code; "Global Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PurchaseType; "Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000016; "Requisition Line")
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
                    var
                        Rline: Record "Requisition Lines1";
                    begin
                        if UserSetup.Get(UserId) then
                            if "Employee Code" <> UserSetup."Employee No." then begin
                                Message('You can only send for approval the document that you prepared');
                                exit;
                            end;
                        if Reason = '' then Error('Reason must not be empty');
                        Rline.Reset;
                        Rline.SetRange(Rline."Requisition No", Rec."No.");
                        if Rline.FindSet then
                            repeat
                                if Rline."Procurement Plan Item" = '' then Error('Procurement plan item must be specified for item no %1', Rline.No);
                                if Rline.No = '' then Error('Item No must be specified in requisition lines');
                                if Rline.Description = '' then Error('Description must be specified in requisition lines');

                            until Rline.Next = 0;
                        // //if ApprovalMgt.SendPurchaseReqApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelPurchaseApprovalRRequest(Rec, true, true) then;
                    end;
                }
                action(Archive1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                        Archive();

                        Status := Status::Archived;
                    end;
                }
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
        area(processing)
        {
            action(PrintRequisitionWithExtendedDescription)
            {
                ApplicationArea = Basic;
                Caption = 'Print Requisition With Extended Description';
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511008, true, true, Rec);
                    Reset;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511003, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PrintRequisitionWithExtendedDescription_Promoted; PrintRequisitionWithExtendedDescription)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Requisition Type" := "requisition type"::"Purchase Requisition";
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
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
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
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
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
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        Trash: Record "Requisition Header1";


    procedure Archive()
    begin

        if Rec.Status = Rec.Status::Open then begin
            Trash.Reset;
            Trash.SetRange(Trash."No.", Rec."No.");
            Rec.Status := Rec.Status::Archived;
            Rec."Document Type" := Rec."document type"::"Purchase Requisition";
            Modify;
            Message('The Purchase Requisition has been Archived');
        end;
    end;
}

