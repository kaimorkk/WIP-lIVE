

page 95025 "Risk Response Strategies"
{
    CardPageID = "Risk Response Strategy";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Response Strategy";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategy ID"; Rec."Strategy ID")
                {
                    ApplicationArea = Basic;
                    Caption = '<Strategy_ID>';
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
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

