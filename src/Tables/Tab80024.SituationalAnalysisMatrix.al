
table 80024 "Situational Analysis Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Strategy Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(3; "Situational Analysis Model"; Code[100])
        {
        }
        field(4; Description; Text[255])
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

