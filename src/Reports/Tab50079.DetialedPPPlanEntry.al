#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70238 "Detailed PP Plan Entry"
{

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Initiative No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Activity Id"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StrategyWorkplanLines.Reset;
                StrategyWorkplanLines.SetRange("Activity ID", "Activity Id");
                if StrategyWorkplanLines.Find('-') then begin
                    "Activity Description" := StrategyWorkplanLines.Description;
                end;
            end;
        }
        field(4; Description; Code[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                SubActivityBudget := 0;
                TotalCostElements := 0;
                SubWorkplanActivity.Reset;
                SubWorkplanActivity.SetRange("Workplan No.", "Workplan No.");
                SubWorkplanActivity.SetRange("Activity Id", "Activity Id");
                SubWorkplanActivity.SetRange("Sub Initiative No.", "Sub Activity No");
                if SubWorkplanActivity.FindFirst then begin
                    SubActivityBudget := SubWorkplanActivity."Total Budget";
                end;

                WorkplanCostElements.Reset;
                WorkplanCostElements.SetRange("Workplan No.", "Workplan No.");
                WorkplanCostElements.SetRange("Activity Id", "Activity Id");
                WorkplanCostElements.SetRange("Sub Activity No", "Sub Activity No");
                if WorkplanCostElements.FindFirst then begin
                    repeat
                        TotalCostElements := TotalCostElements + Amount;
                    until WorkplanCostElements.Next = 0;
                end;



                //IF TotalCostElements> SubActivityBudget THEN
                //  ERROR('Your Workplan Cost Elements of Amount %1 are more than Sub Activity Budget of %2',TotalCostElements,SubActivityBudget);
            end;
        }
        field(6; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(Budget = filter(true));
        }
        field(7; "Vote id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange("Job No.", "Job No");
                JobTask.SetRange("Job Task No.", "Vote id");
                if JobTask.Find('-') then begin
                    "Vote Desription" := JobTask.Description;
                end;
            end;
        }
        field(8; "Vote Desription"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Procurment Plan No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated),
                                                           "Revision Voucher" = const(false));
        }
        field(10; "Plan Item No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No." where("Item Category Code" = field("Plan Category"));

            trigger OnValidate()
            begin
                /*ProcurementPlanEntry.RESET;
                ProcurementPlanEntry.SETRANGE("Entry No.","Plan Item No");
                IF ProcurementPlanEntry.FIND('-') THEN BEGIN
                   "Plan Item Description":=ProcurementPlanEntry.Description;
                    "Unit Cost":=ProcurementPlanEntry."Unit Cost";
                END;*/
                Item.Reset;
                Item.SetRange("No.", "Plan Item No");
                if Item.FindFirst then begin
                    "Unit Cost" := Item."Unit Cost";
                    "Plan Item Description" := Item.Description;
                end;

            end;
        }
        field(11; "Plan Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
        }
        field(12; "Activity Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Plan Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Sub Activity No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub Workplan Activity"."Sub Initiative No." where("Workplan No." = field("Workplan No."),
                                                                                "Initiative No." = field("Initiative No."));
        }
        field(15; "Sub Activity Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Amount := "Unit Cost" * Quantity;
                Validate(Amount);
            end;
        }
        field(18; "Functional Procurment Plan No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(19; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(20; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(21; "Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Functional,Consolidated';
            OptionMembers = " ",Functional,Consolidated;
        }
        field(22; "Plan Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(23; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Q1 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Quantity<("Q1 Quantity"+"Q2 Quantity"+"Q3 Quantity"+"Q4 Quantity")THEN  BEGIN
                //  ERROR('Error!, Kindly Align the Planning Quantities Correctly');
                //  END;
                // "Q1 Amount":="Q1 Quantity"*"Unit Cost";
                // VALIDATE("Q1 Amount");
            end;
        }
        field(25; "Q1 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Line Budget Cost"<("Q1 Amount"+"Q2 Amount"+"Q3 Amount"+"Q4 Amount") THEN BEGIN
                // ERROR('Error!, Kindly Align the Planning  Amounts Correctly');
                //  END;
            end;
        }
        field(26; "Q2 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Quantity<("Q1 Quantity"+"Q2 Quantity"+"Q3 Quantity"+"Q4 Quantity")THEN  BEGIN
                //  ERROR('Error!, Kindly Align the Planning Quantities Correctly');
                //  END;
                // "Q2 Amount":="Q2 Quantity"*"Unit Cost";
                // VALIDATE("Q2 Amount");
            end;
        }
        field(27; "Q2 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Line Budget Cost"<("Q1 Amount"+"Q2 Amount"+"Q3 Amount"+"Q4 Amount") THEN BEGIN
                // ERROR('Error!, Kindly Align the Planning  Amounts Correctly');
                //  END;
            end;
        }
        field(28; "Q3 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Quantity<("Q1 Quantity"+"Q2 Quantity"+"Q3 Quantity"+"Q4 Quantity")THEN  BEGIN
                //  ERROR('Error!, Kindly Align the Planning Quantities Correctly');
                //  END;
                // "Q3 Amount":="Q3 Quantity"*"Unit Cost";
                // VALIDATE("Q3 Amount");
            end;
        }
        field(29; "Q3 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Line Budget Cost"<("Q1 Amount"+"Q2 Amount"+"Q3 Amount"+"Q4 Amount") THEN BEGIN
                // ERROR('Error!, Kindly Align the Planning  Amounts Correctly');
                //  END;
            end;
        }
        field(30; "Q4 Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Quantity<("Q1 Quantity"+"Q2 Quantity"+"Q3 Quantity"+"Q4 Quantity")THEN  BEGIN
                //  ERROR('Error!, Kindly Align the Planning Quantities Correctly');
                //  END;
                // "Q4 Amount":="Q4 Quantity"*"Unit Cost";
                // VALIDATE("Q4 Amount");
            end;
        }
        field(31; "Q4 Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Line Budget Cost"<("Q1 Amount"+"Q2 Amount"+"Q3 Amount"+"Q4 Amount") THEN BEGIN
                // ERROR('Error!, Kindly Align the Planning  Amounts Correctly');
                //  END;
            end;
        }
        field(32; Comments; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Detailed Quantity PP"; Decimal)
        {
            CalcFormula = lookup("Detailed PP Plan Entry".Quantity where("Procurment Plan No" = field("Procurment Plan No"),
                                                                          "Workplan No." = field("Workplan No."),
                                                                          "Initiative No." = field("Initiative No."),
                                                                          "Plan Type" = field("Plan Type"),
                                                                          "Activity Id" = field("Activity Id"),
                                                                          "Plan Item Description" = field("Plan Item Description")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Workplan No.", "Activity Id", "Initiative No.", "Sub Activity No", "Plan Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobTask: Record "Job Task";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubActivityBudget: Decimal;
        WorkplanCostElements: Record "Workplan Cost Elements";
        TotalCostElements: Decimal;
        Item: Record Item;
}

