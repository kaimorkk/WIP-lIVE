Page 52194152 "Employee Absentism"
{
    PageType = Card;
    SourceTable = "Employee Absentism1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(AbsentNo;"Absent No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    NotBlank = true;
                }
                field(AbsentFrom;"Absent From")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Absent From");
                        frmcalendar.RUNMODAL;
                        d := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF d <> 0D THEN
                         "Absent From" := d;
                        VALIDATE("Absent From");
                                */

                    end;
                }
                field(AbsentTo;"Absent To")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Absent To");
                        frmcalendar.RUNMODAL;
                        d := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF (d <> 0D) AND (d < "Absent From") THEN BEGIN
                          ERROR('You cannot enter a date earlier than %1',"Absent From");
                        END
                        ELSE
                        IF (d <> 0D)  AND (d >= "Absent From")  THEN
                         "Absent To" := d;
                        VALIDATE("Absent To");
                         */

                    end;
                }
                field(ReasonforAbsentism;"Reason for Absentism")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Penalty;Penalty)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofDaysAbsent;"No. of  Days Absent")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000049;"Employee Absentism Line")
            {
                SubPageLink = "Employee No"=field("Employee No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendEmail)
            {
                ApplicationArea = Basic;
                Caption = 'Send Email';

                trigger OnAction()
                begin
                    
                    //TESTFIELD();
                    //TESTFIELD();
                    //TESTFIELD();
                    EmployeeRec.Reset;
                    if EmployeeRec.Get("Employee No") then
                    email:=EmployeeRec."E-Mail";
                    //email:=EmployeeRec."Company E-Mail";
                    
                    UserSetup.Reset;
                    UserSetup.SetRange(UserSetup."Employee No.","Employee No");
                    if UserSetup.Find('-') then
                    OfficeEmail:=UserSetup."E-Mail";
                    
                    
                    // Mail.NewIncidentMail('', "Absent No.","Employee Name" +' has been absent for ' + Format("No. of  Days Absent") +
                    //  ' days from ' + Format("Absent From")  + ' to ' +  Format("Absent To")+' reason for absentism '+"Reason for Absentism"
                    //  +' and the penalty is '+Format(Penalty));
                    
                    // Mail.NewIncidentMail(email,  "Absent No.",'This is to notify you '+"Employee Name" +' having been absent for '+
                    // Format("No. of  Days Absent") +' days from '+Format("Absent From")+ ' to '+Format("Absent To")+', reason for absentism being '
                    // +"Reason for Absentism"+' that the penalty is '+Format(Penalty)+'.');
                    
                    // Mail.NewIncidentMail(OfficeEmail,  "Absent No.",'This is to notify you '+"Employee Name" +' having been absent for '+
                    // Format("No. of  Days Absent") +' days from '+Format("Absent From")+ ' to '+Format("Absent To")+', reason for absentism being '
                    // +"Reason for Absentism"+' that the penalty is '+Format(Penalty)+'.');
                    
                    
                    
                    /*
                    IF "Leave Allowance Payable"="Leave Allowance Payable"::Yes THEN BEGIN
                    Mail.NewIncidentMail('finance@erc.go.ke', 'Leave App No ' +  "Application No" , "Employee Name" +
                    ' has applied ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date"));
                     END
                    
                    "Employee No"
                    
                    
                    
                    
                    
                    
                    Name
                    Status
                    */

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendEmail_Promoted; SendEmail)
                {
                }
            }
        }
    }

    var
        email: Text[50];
        Mail: Codeunit Mail;
        EmployeeRec: Record Employee;
        UserSetup: Record "User Setup";
        OfficeEmail: Text[50];
        d: Date;
}

