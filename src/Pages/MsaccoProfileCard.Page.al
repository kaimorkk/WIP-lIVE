Page 52193450 "Msacco Profile Card"
{
    PageType = Card;
    SourceTable = "Msacco User Profile";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(UserName; UserName)
                {
                    ApplicationArea = Basic;
                }
                field(Password; Password)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field(MemberNo; MemberNo)
                {
                    ApplicationArea = Basic;
                }
                field(FailedAttempts; FailedAttempts)
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate; CreationDate)
                {
                    ApplicationArea = Basic;
                }
                field(Reset; Reset)
                {
                    ApplicationArea = Basic;
                }
                field(Locked; Locked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000016; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(processing)
        {
            action(List)
            {
                ApplicationArea = Basic;
                RunObject = Page "Msacco Profile List";
                ShortCutKey = 'F5';
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    // ApprovalMgt.SendMsaccoApprovalRequest(Rec)
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    // //if ApprovalMgt.CancelMsaccoApprovalRequest(Rec, true, true) then;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(List_Promoted; List)
                {
                }
            }
            group(Category_Process)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }
}

