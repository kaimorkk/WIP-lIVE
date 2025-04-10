Page 52193879 "Purchase Requisition Archived"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Requisition Header1";
    // SourceTableView = where("Requisition Type" = const(MemberApplication),
    //                         Status = const(Archived));

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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    OptionCaption = '<Open,Released,Pending Approval,Pending Prepayment,Rejected,Archived';
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                Visible = true;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if UserSetup.Get(UserId) then
                            if "Employee Code" <> UserSetup."Employee No." then begin
                                Message('You can only send for approval the document that you prapared');
                                exit;
                            end;
                        // //if ApprovalMgt.FindProbaApproverAppraisal(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Visible = false;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.FinishProbApprovalEntryAppraisal(Rec, true, true) then;
                    end;
                }
                action(ReOpen1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';

                    trigger OnAction()
                    begin
                        Reopen();
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
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(50003, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Requisition Type" := "requisition type"::MemberApplication;
    end;

    trigger OnOpenPage()
    begin
        SetRange("Raised by", UserId);

        // if UserSetup.Get(UserId) then begin

        //     if UserSetup."Approver ID" = UserId then
        //         SetRange("Raised by");
        //     ApprovalTemplate.Reset;
        //     // ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID", UserId);
        //         if AdditionalApprovers.Find('+') then
        //             SetRange("Raised by");
        //     end;
        //     if ApprovalSetup.Get then
        //         if ApprovalSetup."Approval Administrator" = UserId then
        //             SetRange("Raised by");


        //     ApprovalTemplate.Reset;
        //     // ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         if AdditionalApprovers.Find('-') then
        //             repeat

        //                 UserSetupRec.Reset;
        //                 UserSetupRec.SetRange(UserSetupRec.Substitute, AdditionalApprovers."Approver ID");
        //                 if UserSetupRec.Find('-') then
        //                     SetRange("Raised by");
        //             until AdditionalApprovers.Next = 0;

        //     end;




        // end;
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        Archive: Record "Requisition Header1";


    procedure Reopen()
    begin

        if Rec.Status = Rec.Status::Archived then begin
            Archive.Reset;
            Archive.SetRange(Archive."No.", Rec."No.");
            Rec.Status := Rec.Status::Open;
            Rec."Document Type" := Rec."document type"::"Purchase Requisition";
            Modify;
            Message('The Purchase Requisition  has been Re-Opened');
        end;
    end;
}

