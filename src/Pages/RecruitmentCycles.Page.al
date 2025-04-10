Page 52194404 "Recruitment Cycles"
{
    PageType = List;
    SourceTable = "Recruitment Cycles1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CycleCode;"Cycle Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate;"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate;"Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(RecruitmentAgent;"Recruitment Agent")
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

