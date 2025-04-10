Page 52194011 "Training Request Lines"
{
    PageType = ListPart;
    SourceTable = "Training Request1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution;"Training Insitution")
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(CourseTitle;"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate;"Planned End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
                field(CountryCode;"Country Code")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetName;"Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingObjective;"Training Objective")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

