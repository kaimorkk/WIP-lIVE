

page 75243 "PRN Equipment Specification"
{
    PageType = List;
    SourceTable = "PRN Equipment Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Required Qty"; Rec."Minimum Required Qty")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

