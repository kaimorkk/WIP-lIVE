
table 80032 "Risk Impact Level"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Impact Level Code"; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Impact Level Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

