

page 95020 "Risk Category Trigger"
{
    PageType = Card;
    SourceTable = "Risk Category Trigger";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Risk Category ID"; Rec."Risk Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Trigger ID"; Rec."Trigger ID")
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

