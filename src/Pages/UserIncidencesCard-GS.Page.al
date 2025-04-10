Page 52194009 "User Incidences Card-GS"
{
    PageType = Card;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category = filter(<> Maintenance));

    layout
    {
        area(content)
        {
            group(IncidentLogging)
            {
                Caption = 'Incident Logging';
                field(IncidentReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IncidentDescription; "Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Incident Date';
                }
                field(UseremailAddress; "User email Address")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceLocationName; "Incidence Location Name")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceOutcome; "Incidence Outcome")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentResultininjury; "Incident Outcome")
                {
                    ApplicationArea = Basic;
                    Caption = 'Incident Result in injury';
                }
                field(Sent; Sent)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IncidentTime; "Incident Time")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplaceController; "Work place Controller")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplaceControllerName; "Work place Controller Name")
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
            action(ReportIncident)
            {
                ApplicationArea = Basic;
                Caption = 'Report Incident';

                trigger OnAction()
                begin
                    TestField("Incident Description");
                    TestField("Incident Date");
                    TestField(User);
                    TestField("User email Address");

                    Users.Reset;
                    Users.SetRange(Users."Employee No.", "Work place Controller");
                    if Users.Find('-') then begin
                        WCEmail := Users."E-Mail";
                    end;

                    SenderName := "Employee Name";
                    SenderAddress := "User email Address";

                    if Sent = true then
                        Error('It has already been sent by the user!!')
                    else begin
                        // Mail.NewIncidentMail(,,);
                        SMTPSetup.Create("System Support Email Address", "Incident Reference", "Incident Description", true);
                        //SMTPSetup.AddCC(WCEmail);
                        Email.Send(SMTPSetup);
                        Sent := true;
                        Modify;
                        if Sent = true then
                            Message('Incident data submitted');

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(ReportIncident_Promoted; ReportIncident)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::ICT;
        compinfo.Get;
        //"System Support Email Address":=compinfo."Sytem Support Email Address";
        Category := Category::Incident;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::ICT;
        User := UserId;
        Users.Get(UserId);
        "User email Address" := Users."E-Mail";
        //  "Employee No":=Users."Employee No.";
        //   emp.GET("Employee No");
        //   "Employee Name":=emp."First Name"+' '+emp."Last Name";
        compinfo.Get;
        //"System Support Email Address":=compinfo."Sytem Support Email Address";
        //INSERT;
        Category := Category::Incident;
    end;

    trigger OnOpenPage()
    begin
        SetRange(User, UserId);
    end;

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        WCEmail: Text[50];
        SenderName: Text[50];
        SenderAddress: Text[50];
}

