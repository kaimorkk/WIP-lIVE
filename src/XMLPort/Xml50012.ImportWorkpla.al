 
xmlport 50012 "Export Workplan"
{
    Caption = 'Export Workplan';
    Direction = Export;
    Format = VariableText;
    //FormatEvaluate = Legacy;
    //TextEncoding = WINDOWS;
    FileName = 'Workplan.csv';
    TableSeparator = '<CR/LF>';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(WorkplanBudgetLine; "Workplan Budget Line")
            {
                fieldelement(StrategyPlanID; WorkplanBudgetLine."Strategy Plan ID")
                {
                }
                fieldelement(KRAID; WorkplanBudgetLine."KRA ID")
                {
                }
                fieldelement(CoreStrategyID; WorkplanBudgetLine."Core Strategy ID")
                {
                }
                fieldelement(StrategyID; WorkplanBudgetLine."Strategy ID")
                {
                }
                fieldelement(ActivityID; WorkplanBudgetLine."Activity ID")
                {
                }
                fieldelement(InputLineNo; WorkplanBudgetLine."Input Line No.")
                {
                }
                fieldelement(LineNo; WorkplanBudgetLine."Line No.")
                {
                }
                fieldelement(BudgetItem; WorkplanBudgetLine."Budget Item")
                {
                }
                fieldelement(BudgetItemDescription; WorkplanBudgetLine."Budget Item Description")
                {
                }
                fieldelement(GlobalDimension1Code; WorkplanBudgetLine."Global Dimension 1 Code")
                {
                }
                fieldelement(GlobalDimension2Code; WorkplanBudgetLine."Global Dimension 2 Code")
                {
                }
                fieldelement(ShortcutDimension3Code; WorkplanBudgetLine."Shortcut Dimension 3 Code")
                {
                }
                fieldelement(ShortcutDimension4Code; WorkplanBudgetLine."Shortcut Dimension 4 Code")
                {
                }
                fieldelement(ShortcutDimension5Code; WorkplanBudgetLine."Shortcut Dimension 5 Code")
                {
                }
                fieldelement(ShortcutDimension6Code; WorkplanBudgetLine."Shortcut Dimension 6 Code")
                {
                }
                fieldelement(Q1Amount; WorkplanBudgetLine."Q1 Amount")
                {
                }
                fieldelement(Q2Amount; WorkplanBudgetLine."Q2 Amount")
                {
                }
                fieldelement(Q3Amount; WorkplanBudgetLine."Q3 Amount")
                {
                }
                fieldelement(Q4Amount; WorkplanBudgetLine."Q4 Amount")
                {
                }
                fieldelement(TotalAmount; WorkplanBudgetLine."Total Amount")
                {
                }
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
}
