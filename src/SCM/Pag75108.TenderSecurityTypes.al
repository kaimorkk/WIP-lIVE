

page 75108 "Tender Security Types"
{
    PageType = List;
    SourceTable = "Tender Security Types";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Security"; Rec."Nature of Security")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Securities"; Rec."No. of Filed Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Filed Securities Value (LCY)"; Rec."Filed Securities Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Forfeited Securities"; Rec."No. of Forfeited Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Forfeited Securities Value LCY"; Rec."Forfeited Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Released Securities"; Rec."No. of Released Securities")
                {
                    ApplicationArea = Basic;
                }
                field("Released Securities Value LCY"; Rec."Released Securities Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field(BLocked; Rec.BLocked)
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

