
table 69409 "Safety Permit Consequence"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Permit Type"; Code[20])
        {
            TableRelation = "Safe Work Permit Type".Code;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Permit Type", "Line No.")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }
}

