Page 52194153 "Telephone Request"
{
    PageType = Card;
    SourceTable = "Telephone Request1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApproval; "No of Approval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000010; "Telephone Request Lines")
            {
                SubPageLink = "Request No" = field("Request No.");
                SubPageView = sorting("Request No", "Line No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Telephone)
            {
                Caption = 'Telephone';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin









                        //if ApprovalMgt.SendTelcomApprovalRequest(Rec) then;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange("User ID", UserId);
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

