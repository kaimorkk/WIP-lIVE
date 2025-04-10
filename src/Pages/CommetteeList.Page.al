Page 52193816 "Commettee List"
{
    PageType = Card;
    SourceTable = "Committee Type1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(CommitteeCode;"Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeName;"Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field(CommiteeDescription;"Commitee Description")
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

