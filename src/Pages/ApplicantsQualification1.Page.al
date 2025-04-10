Page 52193870 "Applicants Qualification1"
{
    PageType = ListPart;
    SourceTable = "Applicants Qualification1";

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
                field(Qualification;Qualification)
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

