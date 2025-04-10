
table 50243 "Policy Thematic Area Rev"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Implementation Percentage"; Decimal)
        {
        }
        field(5; Comments; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

