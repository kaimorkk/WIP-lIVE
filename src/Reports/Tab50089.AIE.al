table 50109 AIE
{
    Caption = 'AIE';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Corporate Strategy"; Code[20])
        {
            Caption = 'Corporate Strategy';
        }
        field(2; "Reporting Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Workplan Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Quarter"; Option)
        {
            OptionMembers = "Quarter 1","Quarter 2","Quarter 3","Quarter 4";
            trigger OnValidate()
            var
                QuarterDates: Array[12, 2] of Date;
                WorkplanMgt: Codeunit "Workplan Management";
            begin
                WorkPlanMgt.GetBudgetDates("Budget Code", 1, QuarterDates);
                case
                    Quarter of
                    Quarter::"Quarter 1":
                        begin
                            "Start Date" := QuarterDates[1] [1];
                            "End Date" := QuarterDates[1] [2];
                        end;
                    Quarter::"Quarter 2":
                        begin
                            "Start Date" := QuarterDates[2] [1];
                            "End Date" := QuarterDates[2] [2];
                        end;
                    Quarter::"Quarter 3":
                        begin
                            "Start Date" := QuarterDates[3] [1];
                            "End Date" := QuarterDates[3] [2];
                        end;
                    Quarter::"Quarter 4":
                        begin
                            "Start Date" := QuarterDates[4] [1];
                            "End Date" := QuarterDates[4] [2];
                        end;
                end;
            end;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(7; "AIE Amount"; Decimal)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(8; "Date Issued"; Date)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(9; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(10; "Source Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Issued By"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(14; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = AIE,"Special AIE";
            OptionCaption = 'AIE,Special AIE';
        }
        field(15; Description; Text[500])
        {

            FieldClass = FlowField;
            CalcFormula = lookup("Auth. Inc. Expend. Header".Description where("No." = FIELD("Source Document No.")));
        }
    }
    keys
    {
        key(PK; "Corporate Strategy", "Reporting Year Code", "Workplan Code", Quarter, "Source Document No.")
        {
            Clustered = true;
        }
    }
}
