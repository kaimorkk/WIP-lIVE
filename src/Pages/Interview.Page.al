Page 52193483 Interview
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Interview Questions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(InterviewQuestions; "Interview Questions")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = Basic;
                }
                field(Score; Score)
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

