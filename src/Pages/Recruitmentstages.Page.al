Page 52193861 "Recruitment stages"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Recruitment Stages1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RecruitementStage;"Recruitement Stage")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(FailedResponseTemplates;"Failed Response Templates")
                {
                    ApplicationArea = Basic;
                }
                field(PassedResponseTemplates;"Passed Response Templates")
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

