report 70025 "Workplan Submission Analysis"
{
    Caption = 'Workplan Submission Analysis';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Workplan Submission Analysis.rdlc';
    dataset
    {
        dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
        {
            DataItemTableView = where(Consolidated = filter(true));
            RequestFilterFields = "Annual Workplan";
            column(No; No)
            {
            }
            column(Description; Description)
            {
            }
            column(DateConsolidated; "Date Consolidated")
            {
            }
        }

        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = where("Dimension Value Type" = filter(Standard), "Global Dimension No." = const(2));
            column(Name_DimensionValue; Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                AnnualWorkplan.Reset();
                AnnualWorkplan.SetFilter("Annual Workplan", AnnualStrategyWorkplan.GetFilter("Annual Workplan"));
                AnnualWorkplan.SetRange(Consolidated, true);
                AnnualWorkplan.SetRange("Global Dimension 2 Code", "Code");
                if AnnualWorkplan.FindFirst() then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        AnnualWorkplan: Record "Annual Strategy Workplan";
}
