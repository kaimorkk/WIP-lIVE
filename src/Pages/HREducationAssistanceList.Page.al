Page 52194127 "HR Education Assistance List"
{
    // CardPageID = 51511427;
    PageType = List;
    SourceTable = "HR Education Assistance1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = true;
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName; FullName1("Employee No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field(RefundLevel; "Refund Level")
                {
                    ApplicationArea = Basic;
                }
                field(YearOfStudy; "Year Of Study")
                {
                    ApplicationArea = Basic;
                }
                field(StudentNumber; "Student Number")
                {
                    ApplicationArea = Basic;
                }
                field(EducationalInstitution; "Educational Institution")
                {
                    ApplicationArea = Basic;
                }
                field(TypeOfInstitution; "Type Of Institution")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(EducationAssistance)
            {
                Caption = 'Education Assistance';
                action(EducationAssistanceCard)
                {
                    ApplicationArea = Basic;
                    Caption = 'Education Assistance Card';
                    RunObject = Page "Key Performance Areas LookUp";
                    RunPageLink = "Employee No" = field("Employee No.");
                    ShortCutKey = 'Shift+Ctrl+L';
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;
                }
            }
        }
    }


    procedure FullName1(EmployeeNumber: Code[20]) Name: Text[150]
    var
        Employee: Record Employee;
        OK: Boolean;
    begin
        OK := Employee.Get("Employee No.");
        if OK then Name := Employee.FullName();
    end;
}

