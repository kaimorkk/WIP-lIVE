

page 95028 "Risk Management Responsibility"
{
    PageType = Card;
    SourceTable = "Risk Management Responsibility";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility ID"; Rec."Responsibility ID")
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

