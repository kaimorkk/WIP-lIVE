table 50136 "Unit Specific Controls"
{
    Caption = 'Unit Specific Controls';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Line No"; Code[20])
        {
            Caption = 'Line No';
        }
        field(3; "Workplan No"; Code[20])
        {
            Caption = 'Workplan No';
            TableRelation = "Annual Strategy Workplan".No where("Global Dimension 2 Code" = field("Admin Unit"), Consolidated = const(true));
        }
        field(4; "Unit Name"; Text[100])
        {
            Caption = 'Unit Name';
        }
        field(5; "Approved Amount"; Decimal)
        {
            Caption = 'Approved Amount';
        }
        field(6; "Supplementary Ceiling"; Decimal)
        {
            Caption = 'Supplementary Ceiling';
        }
        field(7; "Admin Unit"; Code[20])
        {
            Caption = 'Admin Unit';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            var
                AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
                WorkPlanBudgetLinesQ: Record "Workplan Budget Line";
            begin
                AnnualStrategyWorkplan.Reset();
                AnnualStrategyWorkplan.SetRange("Global Dimension 2 Code", "Admin Unit");
                AnnualStrategyWorkplan.SetRange("Annual Workplan", No);
                if AnnualStrategyWorkplan.FindFirst() then begin
                    "Workplan No" := AnnualStrategyWorkplan.No;
                    "Unit Name" := AnnualStrategyWorkplan.Description;
                    clear(WorkPlanBudgetLinesQ);
                    WorkPlanBudgetLinesQ.SetRange(WorkPlanBudgetLinesQ."Strategy Plan ID", AnnualStrategyWorkplan."Strategy Plan ID");
                    WorkPlanBudgetLinesQ.SetRange("Budget Item", "Line No");
                    if workPlanBudgetLinesQ.FindSet() then begin
                        "Approved Amount" := WorkPlanBudgetLinesQ."Total Amount";
                        "Supplementary Ceiling" := "Approved Amount";

                    end;
                end;
            end;
        }

    }
    keys
    {
        key(PK; No, "Line No", "Admin Unit")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;
}
