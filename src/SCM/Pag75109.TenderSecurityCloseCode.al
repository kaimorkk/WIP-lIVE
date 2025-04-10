

page 75109 "Tender Security Close Code"
{
    PageType = List;
    SourceTable = "Tender Security Close Code";
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
                field("Close Type"; Rec."Close Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Transactions"; Rec."No. of Transactions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Determines the No. of Forfeiture and Release transactions done for the bid & performance securities';
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

