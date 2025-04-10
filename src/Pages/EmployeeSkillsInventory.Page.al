Page 52194328 "Employee Skills Inventory"
{
    ApplicationArea = Basic;
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Employee Qualification";
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
                field(EmployeeStatus;"Employee Status")
                {
                    ApplicationArea = Basic;
                }
                field(QualificationCode;"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(FromDate;"From Date")
                {
                    ApplicationArea = Basic;
                }
                field(ToDate;"To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(InstitutionCompany;"Institution/Company")
                {
                    ApplicationArea = Basic;
                }
                field(Cost;Cost)
                {
                    ApplicationArea = Basic;
                }
                field(CourseGrade;"Course Grade")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
                field(ExpirationDate;"Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                }
                field(CourseType;CourseType)
                {
                    ApplicationArea = Basic;
                }
                field(Weight;Weight)
                {
                    ApplicationArea = Basic;
                }
                field(ScoreID;"Score ID")
                {
                    ApplicationArea = Basic;
                }
                field(GradDate;"Grad. Date")
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

