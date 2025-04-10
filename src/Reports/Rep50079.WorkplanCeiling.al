report 50079 "Workplan Ceilings"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/Rep50079.WorkplanCeiling.rdl';

    dataset
    {
        dataitem(AWP; "Annual Strategy Workplan")
        {
            column(No; No)
            {
            }
            column(Description; Description)
            {
            }
            column(Strategy_Plan_ID; "Strategy Plan ID")
            {
            }
            column(Year_Reporting_Code; "Year Reporting Code")
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(GeographicalArea; DimensionValue.GetDimensionDescription(1, AWP."Global Dimension 1 Code"))
            {
            }
            column(SpendingUnit; DimensionValue.GetDimensionDescription(2, AWP."Global Dimension 2 Code"))
            {
            }
            column(Ceiling_Amount; "Ceiling Amount")
            {
            }
            column(PlannedAmount; AWP.GetBudgetAmount())
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        DimensionValue: Record "Dimension Value";
}