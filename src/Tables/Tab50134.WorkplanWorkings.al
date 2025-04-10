table 50134 "Workplan Workings"
{
    Caption = 'Workplan Workings';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Procurable,NonProcurable;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                if "Type" = "Type"::NonProcurable then begin
                    "Item Type" := "Item type"::" ";
                    "Item No" := "Budget Item";
                    if GLAccount.Get("Item No") then
                        Description := GLAccount.Name;
                end;
            end;

        }
        field(70015; "Item Type"; Option)
        {
            Caption = 'Item Type';
            OptionCaption = ' ,Item,Fixed Asset';
            OptionMembers = " ",Item,"Fixed Asset";
        }
        field(3; "Item No"; Code[30])
        {
            // TableRelation = if ("Item Type" = const(Item)) Item."No." where("Procurement Category" = field("Budget Item"))
            // else
            // if ("Item Type" = const("Fixed Asset")) "Fixed Asset"."No." where("Asset Purchase Groups" = const(true))
            // else
            // "G/L Account"."No." where("No." = field("Budget Item"));
            Caption = 'Item No';
            trigger OnValidate()
            var
                // ProcurementLines: Record "Procurement Plan Lines";
                ProcurementPlan: Record "Procurement Plan";
                // ProcurementPlanEntry: Record "Procurement Plan Entry";
                FixedAsset: Record "Fixed Asset";
                Items: Record Item;
                ProcurementPlan1: Record "Procurement Plan";
                TotalQuanties: Integer;
                ProcurementPlans: Record "Procurement Plan";
            begin

                if "Item Type" = "Item type"::"Fixed Asset" then begin
                    FixedAsset.Reset;
                    FixedAsset.SetRange("No.", "Item No");
                    if FixedAsset.FindSet then
                        Description := FixedAsset.Description;
                    // "Unit Cost":=Items."Last Direct Cost";
                    //  "Unit of Measure":=Items."Base Unit of Measure";
                end;
                if "Item Type" = "item type"::Item then begin
                    Items.Reset;
                    Items.SetRange("No.", "Item No");
                    if Items.FindSet then
                        Description := Items.Description;
                    //IF Items."Unit Cost"=0 THEN BEGIN
                    "Unit Cost" := Items."Unit Cost";
                    // END;
                    "Unit of Measure" := Items."Base Unit of Measure";
                end;
                //  END;
            end;
        }


        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(5; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            trigger OnValidate()
            begin
                Validate(Unit);
            end;
        }
        field(6; Unit; Integer)
        {
            Caption = 'Total Units';
            trigger OnValidate()
            begin
                "Total Amount" := "Unit Cost" * Unit;
            end;
        }
        field(7; "Unit of Measure"; Code[20])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure".Code;
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            trigger OnValidate()
            begin
                "Total Amount" := "Q1 Amount" + "Q2 Amount" + "Q3 Amount" + "Q4 Amount";
            end;
        }
        field(9; "Strategy Plan ID"; Code[20])
        {
            Caption = 'Strategy Plan ID';
        }
        field(10; "KRA ID"; Code[20])
        {
            Caption = 'KRA ID';
        }
        field(11; "Core Strategy ID"; Code[20])
        {
            Caption = 'Core Strategy ID';
        }
        field(12; "Strategy ID"; Code[20])
        {
            Caption = 'Strategy ID';
        }
        field(13; "Activity ID"; Code[20])
        {
            Caption = 'Activity ID';
        }
        field(14; "Input Line No."; Integer)
        {
            Caption = 'Input Line No.';
        }
        field(15; "Budget Item"; Code[20])
        {
            Caption = 'Budget Item';
        }
        field(16; "Line No."; Code[20])
        {
            Caption = 'Line No.';
        }
        field(17; "Q1 Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Unit := "Q1 Quantity" + "Q2 Quantity" + "Q3 Quantity" + "Q4 Quantity";
                if "Unit Cost" <> 0 then
                    "Q1 Amount" := "Q1 Quantity" * "Unit Cost";
                Validate(Unit);
            end;
        }
        field(18; "Q2 Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Unit := "Q1 Quantity" + "Q2 Quantity" + "Q3 Quantity" + "Q4 Quantity";
                if "Unit Cost" <> 0 then
                    "Q2 Amount" := "Q2 Quantity" * "Unit Cost";
                Validate(Unit);
            end;
        }
        field(19; "Q3 Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Unit := "Q1 Quantity" + "Q2 Quantity" + "Q3 Quantity" + "Q4 Quantity";
                if "Unit Cost" <> 0 then
                    "Q3 Amount" := "Q3 Quantity" * "Unit Cost";
                Validate(Unit);
            end;
        }
        field(20; "Q4 Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Unit := "Q1 Quantity" + "Q2 Quantity" + "Q3 Quantity" + "Q4 Quantity";
                if "Unit Cost" <> 0 then
                    "Q4 Amount" := "Q4 Quantity" * "Unit Cost";
                Validate(Unit);
            end;
        }
        field(50029; "Q1 Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Amount");
            end;
        }
        field(50030; "Q2 Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Amount");
            end;
        }
        field(50031; "Q3 Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Amount");
            end;
        }
        field(50032; "Q4 Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Total Amount");
            end;
        }
    }
    keys
    {
        key(PK; "Entry No", "Strategy Plan ID", "KRA ID", "Core Strategy ID", "Strategy ID", "Activity ID", "Input Line No.", "Budget Item", "Line No.")
        {
            Clustered = true;
        }
    }
    var
        BudgetLine: Record "Workplan Budget Line";
        Workings: Record "Workplan Workings";

    procedure UpdateBudgetLine()
    begin
        BudgetLine.Reset;
        BudgetLine.SetRange("Strategy Plan ID", "Strategy Plan ID");
        BudgetLine.SetRange("KRA ID", "KRA ID");
        BudgetLine.SetRange("Core Strategy ID", "Core Strategy ID");
        BudgetLine.SetRange("Strategy ID", "Strategy ID");
        BudgetLine.SetRange("Activity ID", "Activity ID");
        BudgetLine.SetRange("Input Line No.", "Input Line No.");
        BudgetLine.SetRange("Budget Item", "Budget Item");
        BudgetLine.SetRange("Line No.", "Line No.");
        if BudgetLine.FindFirst() then begin
            Workings.Reset();
            Workings.SetRange("Strategy Plan ID", "Strategy Plan ID");
            Workings.SetRange("KRA ID", "KRA ID");
            Workings.SetRange("Core Strategy ID", "Core Strategy ID");
            Workings.SetRange("Strategy ID", "Strategy ID");
            Workings.SetRange("Activity ID", "Activity ID");
            Workings.SetRange("Input Line No.", "Input Line No.");
            Workings.SetRange("Budget Item", "Budget Item");
            if Workings.FindSet then begin
                Workings.CalcSums("Q1 Quantity", "Q2 Quantity", "Q3 Quantity", "Q4 Quantity", "Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount", "Total Amount", Unit);
                BudgetLine."Q1 Quantity" := Workings."Q1 Quantity";
                BudgetLine."Q2 Quantity" := Workings."Q2 Quantity";
                BudgetLine."Q3 Quantity" := Workings."Q3 Quantity";
                BudgetLine."Q4 Quantity" := Workings."Q4 Quantity";
                BudgetLine."Q1 Unit Amount" := Workings."Unit Cost";
                BudgetLine."Q2 Unit Amount" := Workings."Unit Cost";
                BudgetLine."Q3 Unit Amount" := Workings."Unit Cost";
                BudgetLine."Q4 Unit Amount" := Workings."Unit Cost";
                BudgetLine."Q1 Amount" := Workings."Q1 Amount";
                BudgetLine."Q2 Amount" := Workings."Q2 Amount";
                BudgetLine."Q3 Amount" := Workings."Q3 Amount";
                BudgetLine."Q4 Amount" := Workings."Q4 Amount";
                BudgetLine."Total Amount" := Workings."Total Amount";
                BudgetLine."Total Item Amount" := Workings."Total Amount";
                BudgetLine.Modify;
            end;

        end;

    end;
}
