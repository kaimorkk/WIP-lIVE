Page 52194084 "HR Empl. Informal Training L"
{
    PageType = Card;
    SourceTable = "HR Company or Other Training1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(FullName; FullName1("Employee No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field(CourseTitle; "Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(CostIncurredByEmployee; "Cost Incurred By Employee")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Post; Post)
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
            group(InformalTraining)
            {
                Caption = 'Informal Training';
                action(InformalTrainingCard)
                {
                    ApplicationArea = Basic;
                    Caption = 'Informal Training Card';
                    // RunObject = Page "Training Needs Disapproved";
                    // RunPageLink = Code=field("Employee No.");
                    ShortCutKey = 'Shift+Ctrl+L';
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

