

page 75145 "Bid Audited Income Statement"
{
    PageType = List;
    SourceTable = "Bid Audited Income Statement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Audit Year Code Reference"; Rec."Audit Year Code Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Year Code Reference field.';
                }
                field("Total Revenue (LCY)"; Rec."Total Revenue (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Revenue (LCY) field.';
                }
                field("Total COGS (LCY)"; Rec."Total COGS (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total COGS (LCY) field.';
                }
                field("Gross Margin (LCY)"; Rec."Gross Margin (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Margin (LCY) field.';
                }
                field("Total Operating Expenses (LCY)"; Rec."Total Operating Expenses (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Operating Expenses (LCY) field.';
                }
                field("Operating Income/EBIT (LCY)"; Rec."Operating Income/EBIT (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Operating Income/EBIT (LCY) field.';
                }
                field("Other Non-operating Re/Exp LCY"; Rec."Other Non-operating Re/Exp LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Non-operating Revenues/Expenses (LCY) field.';
                }
                field("Interest Expense (LCY)"; Rec."Interest Expense (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Expense (LCY) field.';
                }
                field("Income Before Taxes (LCY)"; Rec."Income Before Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income Before Taxes (LCY) field.';
                }
                field("Income Tax Expense (LCY)"; Rec."Income Tax Expense (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income Tax Expense (LCY) field.';
                }
                field("Net Income from Ops  (LCY)"; Rec."Net Income from Ops  (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Income from Continuing Operations (LCY) field.';
                }
                field("Below-the-line Items (LCY)"; Rec."Below-the-line Items (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Below-the-line Items (LCY) field.';
                }
                field("Net Income"; Rec."Net Income")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Income field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

