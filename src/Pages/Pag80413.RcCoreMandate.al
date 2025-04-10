

page 80413 "Rc Core Mandate"
{
    PageType = List;
    SourceTable = "Core Mandates";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Core Mandates"; Rec."Core Mandates")
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

#pragma implicitwith restore

