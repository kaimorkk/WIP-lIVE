table 50118 "Workplan Budget Line"
{
    Caption = 'Workplan Budget Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategy Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "KRA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."KRA ID" where("No" = field("Strategy Plan ID"));
        }
        field(3; "Core Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Core Strategy Id" where("No" = field("Strategy Plan ID"));
        }
        field(4; "Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Strategy ID" where("No" = field("Strategy Plan ID"));
        }
        field(6; "Activity ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Workplan Lines"."Activity ID" where("No" = field("Strategy Plan ID"));
        }
        field(7; "Input Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Line No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Budget Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." where("Direct Posting" = const(true)/*, "Available for workplaning" = const(true)*/);
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                if GLAccount.Get("Budget Item") then
                    "Budget Item Description" := GLAccount.Name;
            end;
        }
        field(10; "Budget Item Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(13; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(3, "Shortcut Dimension 3 Code", "Dimension Set ID");
            end;
        }
        field(14; "Shortcut Dimension 4 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(4, "Shortcut Dimension 4 Code", "Dimension Set ID");
            end;
        }
        field(15; "Shortcut Dimension 5 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(5, "Shortcut Dimension 5 Code", "Dimension Set ID");
            end;
        }
        field(16; "Shortcut Dimension 6 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(6, "Shortcut Dimension 6 Code", "Dimension Set ID");
            end;
        }
        field(17; "Shortcut Dimension 7 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(7, "Shortcut Dimension 7 Code", "Dimension Set ID");
            end;
        }
        field(18; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(8, "Shortcut Dimension 8 Code", "Dimension Set ID");
            end;
        }
        field(19; "Dimension Set Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Q1 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quarter 1 Amount';
            DecimalPlaces = 0 : 0;
            Editable = false;
            trigger OnValidate()
            begin
                //if ("Q1 Quantity" <> 0) and ("Q1 Unit Amount" <> 0) then
                "Q1 Amount" := "Q1 Unit Amount" * "Q1 Quantity";
                validate("Total Amount");
            end;
        }
        field(21; "Q2 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quarter 2 Amount';
            Editable = false;
            DecimalPlaces = 0 : 0;
            trigger OnValidate()
            begin
                //if ("Q2 Quantity" <> 0) and ("Q2 Unit Amount" <> 0) then
                "Q2 Amount" := "Q2 Unit Amount" * "Q2 Quantity";
                validate("Total Amount");
            end;
        }
        field(22; "Q3 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quarter 3 Amount';
            DecimalPlaces = 0 : 0;
            Editable = false;
            trigger OnValidate()
            begin
                //if ("Q3 Quantity" <> 0) and ("Q3 Unit Amount" <> 0) then
                "Q3 Amount" := "Q3 Unit Amount" * "Q3 Quantity";
                validate("Total Amount");
            end;
        }
        field(23; "Q4 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quarter 4 Amount';
            DecimalPlaces = 0 : 0;
            Editable = false;
            trigger OnValidate()
            begin
                //if ("Q4 Quantity" <> 0) and ("Q4 Unit Amount" <> 0) then
                "Q4 Amount" := "Q4 Unit Amount" * "Q4 Quantity";
                validate("Total Amount");
            end;
        }
        field(24; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            DecimalPlaces = 0 : 0;
            trigger OnValidate()
            var
                Line: Record "Workplan Budget Line";
            begin
                "Total Amount" := "Q1 Amount" + "Q2 Amount" + "Q3 Amount" + "Q4 Amount";
                Line.Reset();
                Line.SetRange("Strategy Plan ID", "Strategy Plan ID");
                Line.SetRange("Budget Item", "Budget Item");
                Line.SetRange("G/L Updated", true);
                if Line.FindSet() then
                    Line.ModifyAll("G/L Updated", false);

            end;
        }
        field(26; "G/L Updated"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Corporate Strategy"; Code[20])
        {
            FieldClass = FlowField;
            Calcformula = Lookup("Annual Strategy Workplan"."Strategy Plan ID" where(No = field("Strategy Plan Id")));
            Editable = false;
        }
        field(28; "Reporting Year Code"; Code[20])
        {
            FieldClass = FlowField;
            Calcformula = Lookup("Annual Strategy Workplan"."Year Reporting Code" where(No = field("Strategy Plan Id")));
            Editable = false;
        }
        field(29; "Planning Budget Type"; Option)
        {
            OptionMembers = Original,Supplementary,"Supplementary 2";
            fieldclass = flowfield;
            Calcformula = lookup("Annual Strategy Workplan"."Planning Budget Type" where(No = field("Strategy Plan ID")));
            Editable = false;
        }
        field(30; "Input Description"; Text[2048])
        {
            Caption = 'Input';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("SubWorkPlan Activity Inputs".Description where("Workplan No." = field("Strategy Plan ID"), "KRA ID" = field("KRA ID"), "Core Strategy ID" = field("Core Strategy Id"), "Strategy ID" = field("Strategy ID"), "Activity ID" = field("Activity ID"), "Line No." = field("Input Line No.")));
        }
        field(31; "Q1 Quantity"; Decimal)
        {
            Caption = 'Quarter 1 Quantity';
            DecimalPlaces = 0 : 0;
            InitValue = 1;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

                Validate("Q1 Amount");
            end;
        }
        field(32; "Q1 Unit Amount"; Decimal)
        {
            Caption = 'Quarter 1 Unit Cost';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q1 Amount");
            end;
        }
        field(33; "Q2 Quantity"; Decimal)
        {
            Caption = 'Quarter 2 Quantity';
            DecimalPlaces = 0 : 0;
            InitValue = 1;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q2 Amount");
            end;
        }
        field(34; "Q2 Unit Amount"; Decimal)
        {
            Caption = 'Quarter 2 Unit Cost';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q2 Amount");
            end;
        }
        field(35; "Q3 Quantity"; Decimal)
        {
            Caption = 'Quarter 3 Quantity';
            DecimalPlaces = 0 : 0;
            InitValue = 1;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q3 Amount");
            end;
        }
        field(36; "Q3 Unit Amount"; Decimal)
        {
            Caption = 'Quarter 3 Unit Cost';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q3 Amount");
            end;
        }
        field(37; "Q4 Quantity"; Decimal)
        {
            Caption = 'Quarter 4 Quantity';
            DecimalPlaces = 0 : 0;
            InitValue = 1;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q4 Amount");
            end;
        }
        field(38; "Q4 Unit Amount"; Decimal)
        {
            Caption = 'Quarter 4 Unit Cost';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Q4 Amount");
            end;
        }
        field(39; "Total Ceiling"; Decimal)
        {
            DataClassification = ToBeClassified;
            //Editable = false;
        }
        field(40; "Total Item Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Workplan Budget Line"."Total Amount" where("Strategy Plan ID" = field("Strategy Plan ID"), "Budget Item" = field("Budget Item")));
            Editable = false;
        }
        field(70; Source; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Source Process"; Enum "Budget Processes")
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Q1 Budget Entry"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Q2 Budget Entry"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(74; "Q3 Budget Entry"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Q4 Budget Entry"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Strategy Plan ID", "KRA ID", "Core Strategy ID", "Strategy ID", "Activity ID", "Input Line No.", "Budget Item", "Line No.")
        {
            Clustered = true;
        }
        Key(Key2; "Strategy Plan ID", "KRA ID", "Core Strategy ID", "Strategy ID", "Activity ID", "Input Line No.")
        {
            SumIndexFields = "Q1 Amount", "Q2 Amount", "Q3 Amount", "Q4 Amount", "Total Amount";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Activity ID", "Budget Item", "Budget Item Description")
        {
        }
    }

    var
        DimensionMgt: Codeunit DimensionManagement;

    trigger OnInsert()
    var
        AnnualStrategy: Record "Annual Strategy Workplan";
        DimensionCodes: array[8] of Code[20];
    begin
        if AnnualStrategy.Get("Strategy Plan ID") then begin
            DimensionMgt.GetShortcutDimensions(AnnualStrategy."Dimension Set Id", DimensionCodes);
            "Global Dimension 1 Code" := DimensionCodes[1];
            "Global Dimension 2 Code" := DimensionCodes[2];
            "Shortcut Dimension 3 Code" := DimensionCodes[3];
            "Shortcut Dimension 4 Code" := DimensionCodes[4];
            "Shortcut Dimension 5 Code" := DimensionCodes[5];
            "Shortcut Dimension 6 Code" := DimensionCodes[6];
            "Shortcut Dimension 7 Code" := DimensionCodes[7];
            "Shortcut Dimension 8 Code" := DimensionCodes[8];
            "Dimension Set Id" := AnnualStrategy."Dimension Set Id";
        end;
    end;

    trigger OnDelete()
    var
        Workings: Record "Workplan Workings";
    begin
        Workings.Reset();
        Workings.SetRange("Strategy Plan ID", "Strategy Plan ID");
        Workings.SetRange("KRA ID", "KRA ID");
        Workings.SetRange("Core Strategy ID", "Core Strategy ID");
        Workings.SetRange("Strategy ID", "Strategy ID");
        Workings.SetRange("Activity ID", "Activity ID");
        Workings.SetRange("Input Line No.", "Input Line No.");
        Workings.SetRange("Line No.", "Line No.");
        Workings.SetRange("Budget Item", "Budget Item");
        Workings.DeleteAll();
    end;
}
