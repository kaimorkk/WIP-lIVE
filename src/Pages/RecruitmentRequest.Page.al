Page 52194133 "Recruitment Request"
{
    PageType = Card;
    SourceTable = "Recruitment Needs1";

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
                field(JobID; "Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforRecruitment; "Reason for Recruitment")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedReportingDate; "Expected Reporting Date")
                {
                    ApplicationArea = Basic;
                }
                field(RecruitmentCycle; "Recruitment Cycle")
                {
                    ApplicationArea = Basic;
                }
                field(RequestedBy; "Requested By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    // //if ApprovalMgt.SendRecruitApprovalRequest(Rec) then;
                end;
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

