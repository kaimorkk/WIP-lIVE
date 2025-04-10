Page 52193459 "Grievance Card-GS"
{
    PageType = Card;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category = const(Grievance));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(GrievanceReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Reference';
                }
                field(GrievanceDescription; "Incident Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Description';
                }
                field(GrievanceDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Date';
                    Editable = false;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UseremailAddress; "User email Address")
                {
                    ApplicationArea = Basic;
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
                field(GrievanceStatus; "Incident Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grievance Status';
                }
                field(WorkplaceController; "Work place Controller")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(WorkplaceControllerName; "Work place Controller Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Actiontaken; "Action taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ActionDate; "Action Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SystemSupportEmailAddress; "System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(RemarksHR; "Remarks HR")
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
        Category := Category::Grievance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Category := Category::Grievance;
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

