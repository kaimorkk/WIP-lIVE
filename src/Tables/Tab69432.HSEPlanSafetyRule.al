
table 69432 "HSE Plan Safety Rule"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Category Code"; Code[20])
        {
            TableRelation = "HSE Plan Safety Rule Category"."Category Code";
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

