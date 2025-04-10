
table 69438 "Emergency Drill Workgroup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Drill ID"; Code[20])
        {
            TableRelation = "Emergency Drill Log"."Drill ID";
        }
        field(2; "Record Type"; Option)
        {
            OptionMembers = " ","Emergency Response","To-be Informed";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Workgroup Type"; Code[20])
        {
            TableRelation = "Safety Workgroup"."Workgroup ID" where(Blocked = const(false));
        }
        field(5; Description; Text[2048])
        {
        }
        field(6; "Contact Person"; Text[2048])
        {
        }
        field(7; "Telephone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(8; Email; Text[100])
        {
            ExtendedDatatype = EMail;
        }
        field(9; "Date Informed"; Date)
        {
        }
        field(10; "Comments/Additional Notes"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Drill ID", "Record Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

