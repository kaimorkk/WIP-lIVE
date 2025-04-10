
table 69419 "Inspection Template Category"
{

    fields
    {
        field(1; "Inspection Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","OSH Inspection","Project Supervision";
        }
        field(2; "Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Template"."Template ID";
        }
        field(3; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Compliance Requirements"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Inspection Type", "Template ID", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

