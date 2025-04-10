Page 52193810 "Bench Mark Implementaion"
{
    PageType = Card;
    SourceTable = "Bench Mark1";
    SourceTableView = where(Status = const(Clossed));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ActivityNo; "Activity No")
                {
                    ApplicationArea = Basic;
                }
                field(ActivityDescription; "Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Action"; Action)
                {
                    ApplicationArea = Basic;
                }
                field(ScheduleDate; "Schedule Date")
                {
                    ApplicationArea = Basic;
                }
                field(ActionStatus; "Action Status")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
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
                    TestField("Activity Description");
                    TestField("Employee Id");
                    //TESTFIELD(Department);
                    //TESTFIELD("User Email");

                    if "Action Status" <> "action status"::Open then
                        Error('You have already been send by the user!!')
                    else begin
                        if Vetted = true then begin

                            Subject := 'BENCH MARKING REQUEST';
                            Body := 'The following Bench marking has been clossed' + "Activity No";
                            ToName := "User Email";
                            CCname := compinfo."CS Email";
                            AttachFileName := '';
                            OpenDialog := false;

                            Mail.CreateMessage(ToName, CCname, '', Subject, Body, true, OpenDialog);

                            "Action Status" := "action status"::Clossed;
                            Modify;

                            Message('Request Submitted')

                        end;
                    end
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

