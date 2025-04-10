report 50128 "Units Not Submitted"
{
    ApplicationArea = All;
    Caption = 'Units Not Submitted';
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/Rep50128.UnitsNotSubmitted.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(DimensionValue; "Dimension Value")
        {
            DataItemTableView = where("Global Dimension No." = const(2), Blocked = const(false), "Has Budget" = const(true));
            column(Code; "Code")
            {
            }
            column(Name; Name)
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(Process; Process)
            {
            }
            column(BudgetCode; BudgetCode)
            {
            }
            trigger OnAfterGetRecord()
            begin
                AWP.Reset();
                AWP.SetRange("Year Reporting Code", BudgetCode);
                AWP.SetRange("Planning Budget Type", Process);
                AWP.SetRange("Global Dimension 2 Code", DimensionValue.Code);
                AWP.SetFilter("Approval Status", '<>%1', AWP."Approval Status"::Open);
                if AWP.FindFirst() then
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
                    field(Process; Process)
                    {
                        ApplicationArea = All;
                        OptionCaption = 'Resource Requirements,Workplan';
                    }
                    field(BudgetCode; BudgetCode)
                    {
                        ApplicationArea = All;
                        TableRelation = "CSP Planned Years"."Annual Year Code";
                    }
                }
            }
        }

    }
    var
        Process: Option Original,Supplementary;
        BudgetCode: Code[20];
        AWP: Record "Annual Strategy Workplan";

    procedure setFilters(Process1: Option Original,Supplementary; BudgetCode1: Code[20])
    begin
        Process := Process1;
        BudgetCode := BudgetCode1;
    end;
}
