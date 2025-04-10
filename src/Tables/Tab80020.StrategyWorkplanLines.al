Table 80020 "Strategy Workplan Lines"
{
    DrillDownPageID = "Strategy Workplan Lines";
    LookupPageID = "Strategy Workplan Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3; "Activity ID"; Code[50])
        {
            TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field("Resource Req. No"));
            // ValidateTableRelation = false;
            trigger OnValidate()
            var
                AnnualActivityPlan: Record "Workplan Activity";
            begin
                AnnualActivityPlan.Reset();
                AnnualActivityPlan.SetRange("Strategic Plan ID", "Resource Req. No");
                AnnualActivityPlan.SetRange("Code", "Activity ID");
                if AnnualActivityPlan.Findfirst() then begin
                    "Perfomance Indicator" := AnnualActivityPlan."Performance Measures";
                    Description := AnnualActivityPlan.Descriptions;
                    "Annual Target2" := AnnualActivityPlan."Annual Target";
                end;

            end;
            // TableRelation = if ("Cross Cutting" = const(false)) "Strategic Initiative".Code where("Strategic Plan ID" = field("Strategy Plan ID"))
            // else
            // if ("Cross Cutting" = const(true)) "Cross Cutting Activity"."Entry No";

            // trigger OnValidate()
            // begin
            //     if "Cross Cutting" = false then begin
            //         StrategicInt.Reset;
            //         StrategicInt.SetRange(Code, "Activity ID");
            //         if StrategicInt.Find('-') then begin
            //             Description := StrategicInt.Description;
            //             "Primary Directorate" := StrategicInt."Primary Directorate";
            //             Validate("Primary Directorate");
            //             "Primary Department" := StrategicInt."Primary Department";
            //             Validate("Primary Department Name");
            //             "Perfomance Indicator" := StrategicInt."Perfomance Indicator";
            //             Validate("Perfomance Indicator");
            //             "Imported Annual Target Qty" := StrategicInt."CSP Planned Target";
            //             Validate("Imported Annual Target Qty");
            //             "Imported Annual Budget Est." := StrategicInt."Collective Budget";
            //             Validate("Imported Annual Budget Est.");
            //         end;
            //     end;

            //     if "Cross Cutting" = true then begin
            //         CrossCutting.Reset;
            //         CrossCutting.SetRange("Entry No", "Activity ID");
            //         if CrossCutting.Find('-') then begin
            //             Description := CrossCutting.Description;
            //         end;
            //     end;
            // end;
        }
        field(4; Description; Text[1080])
        {
        }
        field(5; "Imported Annual Target Qty"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Imported Annual Target Qty" <> 0 then begin
                    Remainder := ROUND("Imported Annual Target Qty" MOD 4, 1, '=');
                    "Q1 Target" := ("Imported Annual Target Qty" - Remainder) / 4 + Remainder;
                    "Q2 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                    "Q3 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                    "Q4 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                end;
            end;
        }
        field(6; "Imported Annual Budget Est."; Decimal)
        {
            trigger OnValidate()
            begin
                // IF ("Imported Annual Budget Est."<>0) THEN BEGIN
                //  "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
                //  "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
                //  "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
                //  "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
                // END;
            end;
        }
        field(7; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(8; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(9; "Q1 Target"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Annual Budget" < ("Q1 Target" + "Q2 Target" + "Q3 Target" + "Q4 Target") then begin
                    Error('Sum of Targets should Equal to Annual Quantity');
                end;
            end;
        }
        field(10; "Q1 Budget"; Decimal)
        {
        }
        field(11; "Q2 Target"; Decimal)
        {

            trigger OnLookup()
            begin
                if "Annual Budget" < ("Q1 Target" + "Q2 Target" + "Q3 Target" + "Q4 Target") then begin
                    Error('Sum of Targets should Equal to Annual Quantity');
                end;
            end;

            trigger OnValidate()
            begin
                if "Annual Budget" < ("Q1 Target" + "Q2 Target" + "Q3 Target" + "Q4 Target") then begin
                    Error('Sum of Targets should Equal to Annual Quantity');
                end;
            end;
        }
        field(12; "Q2 Budget"; Decimal)
        {
        }
        field(13; "Q3 Target"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Annual Budget" < ("Q1 Target" + "Q2 Target" + "Q3 Target" + "Q4 Target") then begin
                    Error('Sum of Targets should Equal to Annual Quantity');
                end;
            end;
        }
        field(14; "Q3 Budget"; Decimal)
        {
        }
        field(15; "Q4 Target"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Annual Budget" < ("Q1 Target" + "Q2 Target" + "Q3 Target" + "Q4 Target") then begin
                    Error('Sum of Targets should Equal to Annual Quantity');
                end;
            end;
        }
        field(16; "Q4 Budget"; Decimal)
        {
        }
        field(17; "Entry Type"; Option)
        {
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(18; "Year Reporting Code"; Code[10])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(19; "Perfomance Indicator"; Text[1080])
        {
            // TableRelation = "Performance Indicator";

            // trigger OnValidate()
            // begin
            //     PerformanceIndicator.Reset;
            //     PerformanceIndicator.SetFilter(KPI, "Perfomance Indicator");
            //     if PerformanceIndicator.FindSet then begin
            //         "Unit of Measure" := PerformanceIndicator."Unit of Measure";
            //     end;
            // end;
        }
        field(20; "Source Of Fund"; Code[50])
        {
            Caption = 'Source Of Fund';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(21; "Unit of Measure"; Text[100])
        {
        }
        field(22; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(23; "Framework Perspective"; Code[255])
        {
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(24; "Strategy Framework"; Code[10])
        {
            TableRelation = "Strategy Framework";
        }
        field(25; "AnnualWorkplan Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Annual Workplan" = field(No),
                                                                            "Activity ID" = field("Activity ID")));
            FieldClass = FlowField;
        }
        field(26; "Primary Directorate Name"; Text[250])
        {
        }
        field(27; "Primary Department Name"; Text[250])
        {
        }
        field(28; "Key Performance Indicator"; Text[250])
        {
        }
        field(29; "Assigned Weight(%)"; Decimal)
        {
            Caption = 'Summation of Subactivity Weight(%)';
        }
        field(30; "Annual Target"; Decimal)
        {
        }
        field(31; "Annual Budget"; Decimal)
        {
        }
        field(32; "Achieved Performance Level"; Decimal)
        {
        }
        field(33; "Departmental Activity Weight"; Decimal)
        {
        }
        field(34; "Cross Cutting"; Boolean)
        {
        }
        field(35; "Total Subactivity budget"; Decimal)
        {
        }
        field(36; "Sub Activity Budget Sum"; Decimal)
        {
            CalcFormula = sum("Sub Workplan Activity"."Total Budget" where("Workplan No." = field(No),
                                                                            "Activity Id" = field("Activity ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Planning Budget Type"; Option)
        {
            OptionCaption = 'Original,Supplementary';
            OptionMembers = Original,Supplementary;
        }
        field(65; "Core Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective"."Objective ID" where("Strategic Plan ID" = field("Strategy Plan ID"), "Theme Id" = field("KRA ID"));
        }
        field(66; "KRA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Theme"."Theme ID" where("Strategic Plan ID" = field("Strategy Plan ID"));
        }
        field(67; "Strategy ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy"."Strategy ID" where("Strategic Plan ID" = field("Strategy Plan ID"), "Theme Id" = field("KRA ID"), "Objective ID" = field("Core Strategy ID"));
        }
        field(68; "Annual Target2"; Text[50])
        {
            Caption = 'Target';
            DataClassification = ToBeClassified;
        }
        field(69; "Resource Req. No"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Validate("Activity ID");
            end;
        }
        field(70; Source; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Source Process"; Enum "Budget Processes")
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No, "Strategy Plan ID", "KRA ID", "Core Strategy ID", "Strategy ID", "Activity ID", "Resource Req. No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    Var
        AnnualWorkplan: Record "Annual Strategy Workplan";
    begin
        if AnnualWorkplan.Get(No) then begin
            AnnualWorkPlan.Testfield("Strategy Plan ID");
            AnnualWorkplan.TestField("Year Reporting Code");
            "Strategy Plan ID" := AnnualWorkPlan."Strategy Plan ID";
            "Year Reporting Code" := AnnualWorkPlan."Strategy Plan ID";
            "Resource Req. No" := AnnualWorkplan."Resource Req. No";
            if "Resource Req. No" = '' then
                "Resource Req. No" := AnnualWorkplan.No;
        end;

    end;

    trigger OnDelete()
    begin
        UserSetup.Get(UserId);
        // if not UserSetup."Exam Support Admin" then
        //     Error('You do not have the rights to delete this record');
        Activity.Reset();
        Activity.SetRange("Workplan No.", No);
        Activity.SetRange("KRA ID", "KRA ID");
        Activity.SetRange("Activity ID", "Activity ID");
        Activity.DeleteAll();
        WorkplanBudgets.Reset();
        WorkplanBudgets.SetRange("Strategy Plan ID", No);
        WorkplanBudgets.SetRange("KRA ID", "KRA ID");
        WorkplanBudgets.SetRange("Core Strategy ID", "Core Strategy ID");
        WorkplanBudgets.SetRange("Activity ID", "Activity ID");
        WorkplanBudgets.DeleteAll();
        Workings.Reset();
        Workings.SetRange("Strategy Plan ID", No);
        Workings.SetRange("KRA ID", "KRA ID");
        Workings.SetRange("Core Strategy ID", "Core Strategy ID");
        Workings.SetRange("Activity ID", "Activity ID");
        Workings.DeleteAll();

    end;

    var
        StrategicInt: Record "Strategic Initiative";
        QQuantity: Integer;
        Remainder: Integer;
        CrossCutting: Record "Cross Cutting Activity";
        PerformanceIndicator: Record "Performance Indicator";
        WorkplanBudgets: Record "Workplan Budget Line";
        Outputs: Record "Workplan Activity";
        Activity: Record "SubWorkPlan Activity Inputs";
        UserSetup: Record "User Setup";
        WPLines: Record "Strategy Workplan Lines";
        Workings: Record "Workplan Workings";
}
