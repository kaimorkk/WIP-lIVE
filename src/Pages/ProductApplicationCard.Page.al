Page 52193463 "Product Application Card"
{
    PageType = Card;
    SourceTable = "Monthly Contributions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(MemberNo; "Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(MemberName; "Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProductCode; "Product Code")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedDate; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedContribution; "Expected Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(ShareCapital; "Share Capital")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000013; Links)
            {
                Visible = true;
            }
            systempart(Control1000000012; Notes)
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
                RunObject = Page "Monthly Contributions";
                RunPageLink = "Member No." = field("Member No.");
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
                    // ApprovalMgt.SendMemberProdApprovalRequest(Rec)
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
                    // //if ApprovalMgt.CancelMemberProdApprovalRequest(Rec, true, true) then;
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

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

