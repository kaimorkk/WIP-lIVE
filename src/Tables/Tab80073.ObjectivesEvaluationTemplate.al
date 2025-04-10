
table 80073 "Objectives Evaluation Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[200])
        {
        }
        field(3; "General Instructions"; Text[200])
        {
        }
        field(4; "Global?"; Boolean)
        {
        }
        field(5; "Primary Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(6; "Performance Rating Scale"; Code[200])
        {
        }
        field(7; "Total Score Model"; Code[50])
        {
        }
        field(8; "Effective Date"; Date)
        {
        }
        field(9; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

