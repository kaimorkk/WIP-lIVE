Page 52193805 "Legal Approval Form"
{
    PageType = Card;
    SourceTable = "Legal Advice1";
    SourceTableView = where(Status = const("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestID; "Request ID")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDescription; "Request Description")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeId; "Employee Id")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(RequestTitle; "Request Title")
                {
                    ApplicationArea = Basic;
                }
                field(Advice; Advice)
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                }
                field(RequestType; "Request Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Request';

                trigger OnAction()
                begin

                    TestField("Request Description");
                    TestField("Employee Id");
                    TestField(Department);
                    //TESTFIELD("User Email");
                    if Status <> Status::"Pending Approval" then
                        Error('You have already been send by the user!!')
                    else begin


                        Subject := 'LEGAL ADVICE REQUEST';
                        Body := 'Please handle the follwoing Legal request of Request No ' + "Request ID";
                        ToName := compinfo."CS Email";
                        CCname := compinfo."CS Email";
                        AttachFileName := '';
                        OpenDialog := false;

                        Mail.CreateMessage(ToName, CCname, '', Subject, Body, true, OpenDialog);

                        Status := Status::Procesing;
                        Modify;

                        Message('Request Submitted')

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send Request_Promoted"; "Send Request")
                {
                }
            }
        }
    }

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        Subject: Text[250];
        Body: Text[250];
        MailSent: Boolean;
        ToName: Text[30];
        CCname: Text[30];
        AttachFileName: Text[30];
        OpenDialog: Boolean;
}

