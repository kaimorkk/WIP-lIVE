Page 52194165 "Employee Holidays/Off"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Holidays_Off Days1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LeaveType;"Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MaturityDate;"Maturity Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReasonforOff;"Reason for Off")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedtoWork;"Approved to Work")
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
            action(SendEmail)
            {
                ApplicationArea = Basic;
                Caption = 'Send Email';

                trigger OnAction()
                begin
                    /*
                    TESTFIELD("Application No");
                    TESTFIELD("Days Applied");
                    TESTFIELD("Leave Code");
                    */
                    
                    //"Approved to Work"
                    //"Leave Type
                    
                    EmployeeRec.Reset;
                    if EmployeeRec.Get("Employee No.") then
                    email:=EmployeeRec."Company E-Mail";
                    
                    
                    // Mail.NewIncidentMail('', 'Employee Holiday/Off', "Employee Name" +
                    // ' has applied for ' + Format("No. of Days") +' '+Description+ ' on ' + Format(Date)  + ' reason for off ' +"Reason for Off" );
                    
                    // Mail.NewIncidentMail(email, 'Employee Holiday/Off', "Employee Name" +
                    // ' has applied for ' + Format("No. of Days") +' '+Description+ ' on ' + Format(Date)  + ' reason for off ' +"Reason for Off" );
                    
                    
                    /*
                    IF "Leave Allowance Payable"="Leave Allowance Payable"::Yes THEN BEGIN
                    Mail.NewIncidentMail('finance@erc.go.ke', 'Leave App No ' +  "Application No" , "Employee Name" +
                    ' has applied ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date"));
                     END
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
        Mail: Codeunit Mail;
        email: Text[50];
        EmployeeRec: Record Employee;
}

