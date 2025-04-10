

page 75144 "Bid Audited Balance Sheet"
{
    PageType = List;
    SourceTable = "Bid Audited Balance Sheet";

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
                field("Current Assets (LCY)"; Rec."Current Assets (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Assets (LCY) field.';
                }
                field("Fixed Assets (LCY)"; Rec."Fixed Assets (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Assets (LCY) field.';
                }
                field("Total Assets (LCY)"; Rec."Total Assets (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Assets (LCY) field.';
                }
                field("Current Liabilities (LCY)"; Rec."Current Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Liabilities (LCY) field.';
                }
                field("Long-term Liabilities (LCY)"; Rec."Long-term Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Long-term Liabilities (LCY) field.';
                }
                field("Total Liabilities (LCY)"; Rec."Total Liabilities (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Liabilities (LCY) field.';
                }
                field("Owners Equity (LCY)"; Rec."Owners Equity (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owners Equity (LCY) field.';
                }
                field("Total Liabilities & Equity(LCY"; Rec."Total Liabilities & Equity(LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Liabilities & Equity(LCY field.';
                }
                field("Debt Ratio"; Rec."Debt Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Debt Ratio field.';
                }
                field("Current Ratio"; Rec."Current Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Ratio field.';
                }
                field("Working Capital (LCY)"; Rec."Working Capital (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Working Capital (LCY) field.';
                }
                field("Assets-To-Equity Ratio"; Rec."Assets-To-Equity Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assets-To-Equity Ratio field.';
                }
                field("Debt-To-Equity Ratio"; Rec."Debt-To-Equity Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Debt-To-Equity Ratio field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

