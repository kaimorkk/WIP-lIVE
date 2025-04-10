

page 69417 "Safety Permit Consequences"
{
    CardPageID = "Safety Permit Consequence";
    PageType = List;
    SourceTable = "Safety Permit Consequence";

    layout
    {
        area(content)
        {
            repeater(Group)
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

