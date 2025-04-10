

page 69418 "Safety Permit Consequence"
{
    PageType = Card;
    SourceTable = "Safety Permit Consequence";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
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

