

page 75286 "Purchase Contract Insurance"
{
    PageType = List;
    SourceTable = "Purchase Contract Insurance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage (LCY)"; Rec."Policy Coverage (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Company"; Rec."Insurance Company")
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

