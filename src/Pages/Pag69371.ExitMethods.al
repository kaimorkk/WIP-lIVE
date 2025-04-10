page 69371 "Exit Methods"
{
    PageType = List;
    SourceTable = "Exit Methods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Is Death"; "Is Death")
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

