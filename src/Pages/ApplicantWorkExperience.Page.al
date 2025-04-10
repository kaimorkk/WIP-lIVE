Page 52194247 "Applicant Work Experience"
{
    PageType = List;
    SourceTable = "Applicant Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PositionCode;"Position Code")
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(InstitutionCompany;"Institution/Company")
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
                field(Responsibility;Responsibility)
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

