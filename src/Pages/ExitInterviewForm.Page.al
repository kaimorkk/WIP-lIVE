Page 52194277 "Exit Interview Form"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle;"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(EligibleforRehire;"Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                    Caption = 'Eligible for Re-hire';
                }
            }
            part(Control1000000002;"Exit Interview Lines 2")
            {
                Caption = '<Exit Interview Lines>';
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
    }
}

