
table 69417 "Inspection Response Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Response Type"; Code[20])
        {
            TableRelation = "Inspection Response Type".Code;
        }
        field(2; "Response Code"; Code[20])
        {
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Score %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Response Type", "Response Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

