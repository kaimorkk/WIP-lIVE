report 50134 "Budget Reallocation FO3"
{
    ApplicationArea = All;
    Caption = 'Budget Reallocation FO3';
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/Rep50134.BudgetReallocationFO3.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(BudgetReallocationHeader; "Budget Reallocation Header")
        {
            RequestFilterFields = "Document No";
            DataItemTableView = where("Document Type" = const(Consolidated));
            column(DocumentNo; "Document No")
            {
            }
            column(Description; Description)
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(PostedOn; "Posted On")
            {
            }
            dataitem("Budget Modification Lines"; "Budget Modification Lines")
            {
                DataItemTableView = where("ReAllocation Request" = const(false));
                DataItemLink = "Consolidation No" = field("Document No");
                column(GlobalDimension2Code_BudgetModificationLines; "Global Dimension 2 Code")
                {
                }
                column(BudgetCode_BudgetModificationLines; "Budget Code")
                {
                }
                column(AdjustmentAmount_BudgetModificationLines; "Adjustment Amount")
                {
                }
                column(GLAccountNo_BudgetModificationLines; "G/L Account No")
                {
                }
                column(GLAccountName_BudgetModificationLines; "G/L Account Name")
                {
                }
                column(ShortcutDimension3Code_BudgetModificationLines; "Shortcut Dimension 3 Code")
                {
                }
                column(ShortcutDimension4Code_BudgetModificationLines; "Shortcut Dimension 4 Code")
                {
                }
                column(ShortcutDimension5Code_BudgetModificationLines; "Shortcut Dimension 5 Code")
                {
                }
                column(ShortcutDimension6Code_BudgetModificationLines; "Shortcut Dimension 6 Code")
                {
                }
                column(AllocatedAmt1; AllocatedAmt)
                {
                }
                column(SupplimentaryAmt1; SupplimentaryAmt)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    DimensionMgt.GetShortcutDimensions("Dimension Set ID", DimensionCode);
                    BudgetName.Get("Budget Code");
                    AllocatedAmt := Budgetmgt.GetBudgetAllocationAmount("Budget Code", "G/L Account No", DimensionCode, BudgetName."Start Date", BudgetName."End Date");
                    SupplimentaryAmt := Budgetmgt.GetBudgetSupplimentaryAmount("Budget Code", "G/L Account No", DimensionCode, BudgetName."Start Date", BudgetName."End Date");
                end;
            }
            dataitem("Budget Reallocation Line"; "Budget Reallocation Line")
            {
                DataItemLink = "Consolidation No" = field("Document No");
                column(GlobalDimension2Code_BudgetReallocationLine; "Global Dimension 2 Code")
                {
                }
                column(AdjustmentAmount_BudgetReallocationLine; "Adjustment Amount")
                {
                }
                column(BudgetCode_BudgetReallocationLine; "Budget Code")
                {
                }
                column(GLAccountName_BudgetReallocationLine; "G/L Account Name")
                {
                }
                column(GLAccountNo_BudgetReallocationLine; "G/L Account No")
                {
                }
                column(ShortcutDimension3Code_BudgetReallocationLine; "Shortcut Dimension 3 Code")
                {
                }
                column(ShortcutDimension4Code_BudgetReallocationLine; "Shortcut Dimension 4 Code")
                {
                }
                column(ShortcutDimension5Code_BudgetReallocationLine; "Shortcut Dimension 5 Code")
                {
                }
                column(ShortcutDimension6Code_BudgetReallocationLine; "Shortcut Dimension 6 Code")
                {
                }
                column(ShortcutDimension7Code_BudgetReallocationLine; "Shortcut Dimension 7 Code")
                {
                }
                column(AllocatedAmt; AllocatedAmt2)
                {
                }
                column(SupplimentaryAmt; SupplimentaryAmt2)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    DimensionMgt.GetShortcutDimensions("Dimension Set ID", DimensionCode);
                    BudgetName.Get("Budget Code");
                    AllocatedAmt2 := Budgetmgt.GetBudgetAllocationAmount("Budget Code", "G/L Account No", DimensionCode, BudgetName."Start Date", BudgetName."End Date");
                    SupplimentaryAmt2 := Budgetmgt.GetBudgetSupplimentaryAmount("Budget Code", "G/L Account No", DimensionCode, BudgetName."Start Date", BudgetName."End Date");
                end;
            }
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
        DimensionCode: array[8] of Code[20];
        Budgetmgt: Codeunit "Budget Management";
        AllocatedAmt, AllocatedAmt2 : Decimal;
        SupplimentaryAmt, SupplimentaryAmt2 : Decimal;
        DimensionMgt: Codeunit DimensionManagement;
        BudgetName: Record "G/L Budget Name";
}
