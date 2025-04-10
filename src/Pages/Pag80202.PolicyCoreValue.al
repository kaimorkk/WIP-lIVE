

page 80202 "Policy Core Value"
{
    PageType = List;
    SourceTable = "Policy Core Value";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Core Value"; Rec."Core Value")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

