

page 75248 "Tender Addendum Amendment"
{
    PageType = List;
    SourceTable = "Tender Addendum Amendment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Amended Section of Tender Doc"; Rec."Amended Section of Tender Doc")
                {
                    ApplicationArea = Basic;
                }
                field("Amendment Type"; Rec."Amendment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Amendment Description"; Rec."Amendment Description")
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

