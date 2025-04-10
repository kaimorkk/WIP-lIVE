Page 52194329 "Maintenance Request Card"
{
    PageType = Card;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category = const(Maintenance));

    layout
    {
        area(content)
        {
            group(IncidentLogging)
            {
                Caption = 'Incident Logging';
                field(MaintenanceReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Reference';
                }
                field(Description; "Incident Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(MaintenanceReqDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Date';
                }
                field(MaintenanceReqTime; "Incident Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Time';
                }
                field(MaintenanceReqStatus; "Incident Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Status';
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(UseremailAddress; "User email Address")
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
                field(MaintenanceReqLocation; "Incidence Location Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Location';
                }
                field(Sent; Sent)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendMaintenanceRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Maintenance Request';

                trigger OnAction()
                begin
                    /*
                    TESTFIELD("Incident Description");
                    TESTFIELD("Incident Date");
                    TESTFIELD(User);
                    TESTFIELD("User email Address");
                    IF Sent=TRUE THEN
                    ERROR('It has already been sent by the user!!')
                      ELSE BEGIN
                     Mail.NewIncidentMail("System Support Email Address","Incident Reference","Incident Description");
                    Sent:=TRUE;
                    MODIFY;
                    IF Sent=TRUE  THEN
                    MESSAGE('Incident data submitted');
                    
                                END;
                     */
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
                        Error('Request has already been sent by the user!!')
                    else begin
                        // Mail.NewIncidentMail(,,);
                        SMTPSetup.Create("System Support Email Address", 'Maintenance Request ' + "Incident Reference", "Incident Description", true);
                        // SMTPSetup.AddCC(WCEmail);
                        Email.Send(SMTPSetup);
                        Sent := true;
                        Modify;
                        if Sent = true then
                            Message('Maintenance details submitted');

                    end;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendMaintenanceRequest_Promoted; SendMaintenanceRequest)
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
        Category := Category::Maintenance;
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
        Category := Category::Maintenance;
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

