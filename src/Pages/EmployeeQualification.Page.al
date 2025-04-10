Page 52194049 "Employee Qualification"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Employee Qualification";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                }
                field(QualificationCode;"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(CourseType;CourseType)
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
                field(GradDate;"Grad. Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(InstitutionCompany;"Institution/Company")
                {
                    ApplicationArea = Basic;
                }
                field(ScoreID;"Score ID")
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

