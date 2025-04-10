
table 80189 "Policy Framework Implication"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Framework Code"; Code[50])
        {
            TableRelation = "External Policy Framework".Code;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "No. of Supporting Articles"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Framework Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

