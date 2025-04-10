Table 80267 "Consolidated Bugdet Entry"
{

    fields
    {
        field(1; "Consolidation Header No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(3; "Vote id"; Code[30])
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
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

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
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Code[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Vote Desription"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Activity Id"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Activity Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Actual Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Workplan No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Initiative No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Sub Initiative No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(16; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(17; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Planned Item No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
    }

    keys
    {
        key(Key1; "Consolidation Header No", "Vote id", "Job No", "Entry No")
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

