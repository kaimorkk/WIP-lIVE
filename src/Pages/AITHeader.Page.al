Page 52194280 "AIT Header"
{
    PageType = Card;
    SourceTable = "AIT Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(AssessmentDate;"Assessment  Date")
                {
                    ApplicationArea = Basic;
                }
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
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution;"Training Insitution")
                {
                    ApplicationArea = Basic;
                }
                field(CourseTitle;"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedStartDate;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedEndDate;"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000022;"AIT Lines")
            {
                SubPageLink = "Evaluation No"=field("No.");
            }
        }
    }

    actions
    {
    }
}

