Page 52193478 "Job Applicants List-GS"
{
    CardPageID = "Job Applicant Card-GS";
    PageType = List;
    SourceTable = Applicants1;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicantType; "Applicant Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateEmployed; DateEmployed)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(MaritalStatus; "Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship; Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field(DateOfBirth; "Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Employ; Employ)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.Reset;
        if UserSetup.Get(UserId) then
            SetRange("Employee No", UserSetup."Employee No.");
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        if UserSetup.Get(UserId) then
            SetRange("Employee No", UserSetup."Employee No.");
    end;

    var
        UserSetup: Record "User Setup";
}

