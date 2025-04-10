Page 52194148 "Leave Recall"
{
    PageType = Card;
    SourceTable = "Employee Off/Holidays1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RecallDate; "Recall Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveApplication; "Leave Application")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(LeaveEndingDate; "Leave Ending Date")
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
                    Caption = 'Employee Name';
                    Editable = false;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofRecalledDays; "No. of Off Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Recalled Days';
                    Editable = true;
                }
                field(RecalledFrom; "Recalled From")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledTo; "Recalled To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RecalledBy; "Recalled By")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(RecallingDepartment; "Head Of Department")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recalling Department';
                    Editable = false;
                    NotBlank = true;
                }
                field(ReasonforRecall; "Reason for Recall")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
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

                    TestField("Leave Application");
                    TestField("Employee No");
                    TestField(Name);
                    TestField("Leave Ending Date");
                    TestField("Recalled From");
                    TestField("Recalled To");
                    TestField("Recalled By");
                    TestField("Reason for Recall");
                    TestField("Head Of Department");
                    TestField("Department Name");
                    TestField("Recall Date");
                    //TESTFIELD();

                    EmployeeRec.Reset;
                    if EmployeeRec.Get("Employee No") then
                        email := EmployeeRec."E-Mail";

                    UserSetup.Reset;
                    UserSetup.SetRange(UserSetup."Employee No.", "Employee No");
                    if UserSetup.Find('-') then begin
                        OfficeEmail := UserSetup."E-Mail";
                        Users.Reset;
                        if Users.Get(UserSetup.HOD) then
                            hod := Users."E-Mail"
                    end;

                    if UserSetup.Get(UserId) then
                        SenderAddress := UserSetup."E-Mail";


                    //SMTP.Create(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted);

                    //Mail.NewIncidentMail
                    SMTP.Create(hod, 'Recall for Leave No ' + "Leave Application", "Employee Name" +
                    ' on leave to ' + Format("Leave Ending Date") + ' has been recalled for ' + Format("No. of Off Days") + ' from '
                    + Format("Recalled From") + ' to ' + Format("Recalled To") + ' by ' + Name + 'on ' + Format("Recall Date") +
                    ' reason for recall, ' + "Reason for Recall" + ', as requested by ' + "Department Name" + ' department', true);
                    Emails.Send(SMTP);


                    //Mail.NewIncidentMail
                    SMTP.Create(OfficeEmail, 'Recall for Leave No ' + "Leave Application", 'This is to notify you, ' + "Employee Name" +
                    ' on leave upto ' + Format("Leave Ending Date") + ' that you have been recalled from '
                    + Format("Recalled From") + ' to ' + Format("Recalled To") + ', by ' + Name + ' on ' + Format("Recall Date") +
                    '. The reason for your recall is ' + "Reason for Recall" + ', as requested by ' + "Department Name" + ' department', true);
                    //SMTP.AddCC(email);
                    Emails.Send(SMTP);


                    /*
                   //Mail.NewIncidentMail
                   SMTP.Create(COMPANYNAME,SenderAddress,, 'Leave Recall No ' +  "Leave Application" , 'This is to notify you, '+"Employee Name" +
                   ' on leave upto ' +  FORMAT("Leave Ending Date") +' that you have been recalled from '
                   +FORMAT("Recalled From")+' to '+FORMAT("Recalled To")+', by '+Name+ ' on '+FORMAT("Recall Date")+
                   '. The reason for your recall is '+"Reason for Recall"+', requested by '+"Department Name"+' department',TRUE);
                   Email.Send(SMTP);
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
        d: Date;
        Mail: Codeunit Mail;
        EmployeeRec: Record Employee;
        email: Text[50];
        UserSetup: Record "User Setup";
        OfficeEmail: Text[50];
        Requester: Text[50];
        hod: Text[80];
        CompInfo: Record "Company Information";
        SMTP: Codeunit "Email Message";
        Emails: Codeunit Email;
        SenderAddress: Text[80];
        Users: Record "User Setup";
}

