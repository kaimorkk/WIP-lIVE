#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 57101 "Budget Modification Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
        }
        field(2; "G/L Account No"; Code[10])
        {
            //TableRelation = "G/L Account"."No.";
            //TableRelation = "Workplan Budget Line"."Budget Item" where("Strategy Plan ID" = field(Workplan));
            Caption = 'Budget Line Item';
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
            begin
                if GLAccount.Get("G/L Account No") then
                    "G/L Account Name" := GLAccount.Name;
                Validate("New Balance");
            end;
        }
        field(3; "G/L Account Name"; Text[250])
        {
            Editable = false;
            Caption = 'Budget Line Name';
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                DimensionMgt.ValidateShortcutDimValues(1, "Global Dimension 1 Code", "Dimension Set ID");
                Validate("New Balance");
            end;
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false), "Shortcut Dimension 1 Code" = field("Global Dimension 1 Code"));
            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
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
        field(6; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
        }
        field(7; "Budget Name"; Code[10])
        {
            CalcFormula = lookup("Budget Reallocation Header"."Budget Code" where("Document No" = field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Current Balance"; Decimal)
        {
            Editable = false;
        }
        field(9; Amount; Decimal)
        {
            trigger OnValidate()
            begin
                case
                  "Entry Type" of
                    "Entry Type"::"Re-Allocation":
                        begin
                            if Amount < 0 then
                                Error('You can only Reallocate / Request Amount more than zero');
                            if "ReAllocation Request" then
                                "Adjustment Amount" := Amount
                            else
                                "Adjustment Amount" := -Amount;
                        end;
                    "Entry Type"::Supplementary:
                        begin
                            "Adjustment Amount" := Amount;
                        end;
                end;
                Validate("New Balance");
            end;
        }
        field(10; "New Balance"; Decimal)
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
        field(11; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Date';
        }
        field(13; "Shortcut Dimension 3 Code"; Code[20])
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
        field(14; "Shortcut Dimension 4 Code"; Code[20])
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
        field(15; "Shortcut Dimension 5 Code"; Code[20])
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
        field(16; "Shortcut Dimension 6 Code"; Code[20])
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
        field(17; "Shortcut Dimension 7 Code"; Code[20])
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
        field(18; "Shortcut Dimension 8 Code"; Code[20])
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
        field(19; "Quarter"; Option)
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
        field(20; "Quarter Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Quarter End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if Posted then begin
                    "Date Posted" := CurrentDateTime;
                    "Posted By" := UserId;
                end else begin
                    "Date Posted" := 0DT;
                    "Posted By" := '';
                end;
            end;
        }
        field(24; "Date Posted"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Allocated Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Total Allocated"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Entry Type"; Option)
        {
            OptionCaption = 'Re-Allocation,Supplementary';
            OptionMembers = "Re-Allocation",Supplementary;
        }
        field(29; "Adjustment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "ReAllocation Request"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Allocated Amounts"; Decimal)
        {
            Fieldclass = FlowField;
            CalcFormula = sum("Budget Reallocation Line".Amount where("Document No." = field("Document No"), "Source Line No" = field("Line No")));
            Editable = false;
        }
        field(32; "Error"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Error Message"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; "Consolidation No"; Code[20])
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
        key(Key1; "Document No", "Line No")
        {
            Clustered = true;
        }
        key(Key2; "Document No")
        {
        }
        Key(Key3; "Document No", "ReAllocation Request")
        {
        }
    }
    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        DimensionMgt: Codeunit DimensionManagement;
        PRSetup: Record "PR Vital Setup Info";

    trigger OnInsert()
    var
        BudgReAllocHeader: Record "Budget Reallocation Header";
    begin
        if BudgReAllocHeader.Get("Document No") then begin
            BudgReAllocHeader.TestField("Consolidation Template");
            "Entry Type" := BudgReAllocHeader."Entry Type";
            "Budget Code" := BudgReAllocHeader."Budget Code";
            Quarter := BudgReAllocHeader.Quarter;
            //"Consolidation No" := BudgReAllocHeader."Consolidation Template";
            Validate(Quarter);
        end;
    end;

    trigger OnDelete()
    var
        BudgetAllocationLines: Record "Budget Reallocation Line";
    begin
        BudgetAllocationLines.Reset;
        BudgetAllocationLines.Setrange("Document No.", Rec."Document No");
        BudgetAllocationLines.Setrange("Source Line No", Rec."Line No");
        BudgetAllocationLines.DeleteAll();

    end;
}

