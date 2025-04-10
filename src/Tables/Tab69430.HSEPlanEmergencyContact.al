
table 69430 "HSE Plan Emergency Contact"
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
        field(3; "Safety Workgroup ID"; Code[20])
        {
            TableRelation = "Safety Workgroup"."Workgroup ID" where(Blocked = const(false));
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Contact Person"; Text[2048])
        {
        }
        field(6; "Phone No."; Text[2048])
        {
        }
        field(7; Email; Text[2048])
        {
        }
        field(8; Address; Text[2048])
        {
        }
        field(9; Blocked; Boolean)
        {
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

