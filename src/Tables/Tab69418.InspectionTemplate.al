
table 69418 "Inspection Template"
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
        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Last Review Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Inspection Type", "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

