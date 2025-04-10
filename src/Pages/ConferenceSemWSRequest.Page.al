Page 52194173 "Conference/Sem/WS Request"
{
    PageType = Card;
    SourceTable = "Conf/Seminar/WShop Request1";

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
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Objective; "Event Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                }
                field(Title; "Course Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Title';
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedStartDate; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedEndDate; "Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Insitution; Insitution)
                {
                    ApplicationArea = Basic;
                    Caption = 'Institution';
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                }
                field(Fee; "Tuition Fee")
                {
                    ApplicationArea = Basic;
                    Caption = ' Fee';
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(FundedBy; "Funded By")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field(PerDiem; "Per Diem")
                {
                    ApplicationArea = Basic;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicket; "Air Ticket")
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
            group(SendRequest)
            {
                Caption = 'Send Request';
                action(Action1000000016)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Request';

                    trigger OnAction()
                    begin
                        if Status <> Status::Released then begin
                            CName := 'hr@erc.go.ke';
                            Subject := 'Event Request:  ' + "Course Title";
                            Body := 'Event Description: ' + Description;
                            Mail.CreateMessage(CName, CCName, '', Subject, Body, true, false);
                            if MailSent then
                                // MailSent:=Mail.Send()
                                Message('Message Sent')
                            else
                                Mail.CreateMessage(CCName, '', '', Subject, Body,
                            true, true);
                        end else
                            Message('You request is already submitted');


                        ////if ApprovalMgt.SendTrainingApprovalRequest(Rec) THEN;
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
        D: Date;
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        empl: Record Employee;
        CName: Text[30];
        usersetup: Record "User Setup";
}

