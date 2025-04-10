table 50099 "Budget Reallocation Line"
{
    Caption = 'Budget Reallocation Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "G/L Account No"; Code[10])
        {
            //TableRelation = "Workplan Budget Line"."Budget Item" where("Strategy Plan ID" = field(Workplan));
            trigger OnLookup()
            var
                WorkplanBudgetLine: Record "Workplan Budget Line";
            begin
                WorkplanBudgetLine.Reset();
                WorkplanBudgetLine.SetRange("Strategy Plan ID", Workplan);

                if Page.RunModal(Page::"Workplan Budget Lookup", WorkplanBudgetLine) = Action::LookupOK then begin
                    "G/L Account No" := WorkplanBudgetLine."Budget Item";
                    Activity := WorkplanBudgetLine."Activity ID";
                end;
                Validate("G/L Account No");
            end;
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                if GLAccount.Get("G/L Account No") then
                    "G/L Account Name" := GLAccount.Name;
                Validate("New Balance");
            end;
        }
        field(4; "G/L Account Name"; Text[250])
        {
            Editable = false;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),Blocked=const(false),"Shortcut Dimension 1 Code"=field("Global Dimension 1 Code"));
            trigger OnValidate()
            begin
                PRSetup.Get();
                PRSetup.TestField("Payroll PVS Default Dim 3");
                PRSetup.TestField("Payroll PVS Default Dim 4");
                PRSetup.TestField("Payroll PVS Default Dim 5");
                PRSetup.TestField("Payroll PVS Default Dim 6");
                Validate("Shortcut Dimension 3 Code", PRSetup."Payroll PVS Default Dim 3");
                Validate("Shortcut Dimension 4 Code", PRSetup."Payroll PVS Default Dim 4");
                Validate("Shortcut Dimension 5 Code", PRSetup."Payroll PVS Default Dim 5");
                Validate("Shortcut Dimension 6 Code", PRSetup."Payroll PVS Default Dim 6");
                Validate("Shortcut Dimension 7 Code", PRSetup."Payroll PVS Default Dim 7");
                DimensionMgt.ValidateShortcutDimValues(2, "Global Dimension 2 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(7; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
        }
        field(9; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(3, "Shortcut Dimension 3 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(10; "Shortcut Dimension 4 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(4, "Shortcut Dimension 4 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(11; "Shortcut Dimension 5 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(5, "Shortcut Dimension 5 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(12; "Shortcut Dimension 6 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(6, "Shortcut Dimension 6 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(13; "Shortcut Dimension 7 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(7, "Shortcut Dimension 7 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(14; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(8, "Shortcut Dimension 8 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(15; "Quarter"; Option)
        {
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
            trigger OnValidate()
            var
                BudgetDates: array[12, 2] of Date;
                WorkplanMgt: Codeunit "Workplan Management";
            begin
                TestField("Budget Code");
                //get Quarter Dates
                "Quarter Start Date" := 0D;
                "Quarter End Date" := 0D;
                WorkplanMgt.GetBudgetDates("Budget Code", 1, BudgetDates);
                case
                    Quarter of
                    Quarter::"Quarter 1":
                        begin
                            "Quarter Start Date" := BudgetDates[1] [1];
                            "Quarter End Date" := BudgetDates[1] [2];
                        end;
                    Quarter::"Quarter 2":
                        begin
                            "Quarter Start Date" := BudgetDates[2] [1];
                            "Quarter End Date" := BudgetDates[2] [2];
                        end;
                    Quarter::"Quarter 3":
                        begin
                            "Quarter Start Date" := BudgetDates[3] [1];
                            "Quarter End Date" := BudgetDates[3] [2];
                        end;
                    Quarter::"Quarter 4":
                        begin
                            "Quarter Start Date" := BudgetDates[4] [1];
                            "Quarter End Date" := BudgetDates[4] [2];
                        end;
                end;
                Validate("New Balance");
            end;
        }
        field(16; "Quarter Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Quarter End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Current Balance"; Decimal)
        {
            Editable = false;
        }
        field(19; Amount; Decimal)
        {
            MinValue = 0;
            trigger OnValidate()
            begin
                "Adjustment Amount" := Amount;
                if "ReAllocation Request" then begin
                    "Adjustment Amount" := -Amount;

                    if Amount > "Current Balance" then
                        Error('You cannot reallocate amount more than the available balance of %1', "Current Balance")
                end;
                Validate("New Balance");
            end;
        }
        field(20; "New Balance"; Decimal)
        {
            Editable = false;
            trigger OnValidate()
            var
                BudgetMgt: Codeunit "Budget Management";
                GLBudgetEntry: Record "G/L Budget Entry";
                DimensionCodes: array[8] of Code[20];
            begin
                DimensionMgt.GetShortcutDimensions("Dimension Set ID", DimensionCodes);
                "Allocated Amount" := BudgetMgt.GetSimpleBudgetAllocation("Budget Code", "G/L Account No", DimensionCodes, "Quarter Start Date", "Quarter End Date");
                "Current Balance" := BudgetMgt.GetBudgetBalance2("Budget Code", "G/L Account No", DimensionCodes, "Quarter Start Date", "Quarter End Date");
                "New Balance" := "Current Balance" + "Adjustment Amount";
                "Total Allocated" := "Allocated Amount" + "Adjustment Amount";
            end;
        }
        field(21; "Source Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Allocated Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Total Allocated"; Decimal)
        {
            Editable = false;
        }
        field(26; "ReAllocation Request"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = False;
        }
        field(27; "Adjustment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Consolidation No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; Workplan; Code[20])
        {
            TableRelation = "Annual Strategy Workplan" where(Archived = const(false),
                                                             Consolidated = const(true),
                                                            "Planning Budget Type" = filter(<> Original),
                                                            "Global Dimension 2 Code" = field("Global Dimension 2 Code"));
            DataClassification = CustomerContent;
        }
        field(36; Activity; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key1; "Document No.")
        {
        }
        key(Key2; "Document No.", "ReAllocation Request")
        {
        }
        key(Key3; "Document No.", "Source Line No")
        {
            SumIndexFields = Amount;
        }
    }
trigger OnInsert()
    var
        BudgReAllocHeader: Record "Budget Reallocation Header";
    begin
        if BudgReAllocHeader.Get("Document No.") then begin
            BudgReAllocHeader.TestField("Consolidation Template");
            "Budget Code" := BudgReAllocHeader."Budget Code";
            Quarter := BudgReAllocHeader.Quarter;
            //"Consolidation No" := BudgReAllocHeader."Consolidation Template";
            Validate(Quarter);
        end;
    end;
    var
        DimensionMgt: Codeunit DimensionManagement;
        PRSetup: Record "PR Vital Setup Info";
}
