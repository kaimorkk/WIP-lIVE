

page 75242 "PRN Personnel Experience"
{
    PageType = List;
    SourceTable = "PRN Personnel Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Experience Req"; Rec."Minimum Experience Req")
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

