query 50007 "Workplan Budget Lines"
{
    Caption = 'Workplan Budget Lines';
    QueryType = Normal;
    OrderBy = ascending(StrategyPlanID);

    elements
    {
        dataitem(WorkplanBudgetLine; "Workplan Budget Line")
        {
            column(StrategyPlanID; "Strategy Plan ID")
            {
            }
            column(BudgetItem; "Budget Item")
            {
            }
            column(BudgetItemDescription; "Budget Item Description")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(ShortcutDimension6Code; "Shortcut Dimension 6 Code")
            {
            }
            column(ShortcutDimension7Code; "Shortcut Dimension 7 Code")
            {
            }
            column(ShortcutDimension8Code; "Shortcut Dimension 8 Code")
            {
            }
            column(DimensionSetId; "Dimension Set Id")
            {
            }
            column(Q1Amount; "Q1 Amount")
            {
                Method = Sum;
            }
            column(Q2Amount; "Q2 Amount")
            {
                Method = Sum;
            }
            column(Q3Amount; "Q3 Amount")
            {
                Method = Sum;
            }
            column(Q4Amount; "Q4 Amount")
            {
                Method = Sum;
            }
            column(Total_Amount; "Total Amount")
            {
                Method = Sum;
            }
            filter(CorporateStrategy; "Corporate Strategy")
            {
            }
            filter(ReportingYearCode; "Reporting Year Code")
            {
            }
            filter(Planning_Budget_Type; "Planning Budget Type")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
