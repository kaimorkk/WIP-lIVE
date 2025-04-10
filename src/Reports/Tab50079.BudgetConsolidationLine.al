Table 80266 "Budget Consolidation Lines"
{
    fields
    {
        field(1; "Consolidation Header No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
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
                    "Actual Budgeted Amount" := JobTask."Schedule (Total Cost)";
                end;
            end;
        }
        field(8; "Vote Desription"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Draft Budgeted Amount"; Decimal)
        {
            CalcFormula = sum("Consolidated Bugdet Entry".Amount where("Consolidation Header No" = field("Consolidation Header No"),
                                                                        "Job No" = field("Job No"),
                                                                        "Vote id" = field("Vote id")));
            FieldClass = FlowField;
        }
        field(10; "Actual Budgeted Amount"; Decimal)
        {
            CalcFormula = sum("Consolidated Bugdet Entry"."Actual Amount" where("Consolidation Header No" = field("Consolidation Header No"),
                                                                                 "Job No" = field("Job No"),
                                                                                 "Vote id" = field("Vote id")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Draft Budgeted Amount");
                "Deficit/Surplus" := "Draft Budgeted Amount" - "Actual Budgeted Amount";
            end;
        }
        field(11; Reason; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Deficit/Surplus"; Decimal)
        {
            FieldClass = Normal;
        }
        field(13; "Workplan No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Initiative No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "GL Budgeted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Consolidation Header No", "Job No", "Vote id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobTask: Record "Job Task";
}

