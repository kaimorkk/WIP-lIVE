
table 69444 "Safety Permit Workgroup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "Safe Work Permit Header"."Document No.";
        }
        field(3; "Record Type"; Option)
        {
            OptionMembers = " ","Emergency Response","To-be Informed";
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Workgroup Type"; Code[20])
        {
            TableRelation = "Safety Workgroup"."Workgroup ID" where(Blocked = const(false));
        }
        field(6; Description; Text[2048])
        {
        }
        field(7; "Contact Person"; Text[100])
        {
        }
        field(8; "Telephone No."; Text[30])
        {
        }
        field(9; Email; Text[30])
        {
        }
        field(10; "Date Informed"; Date)
        {
        }
        field(11; "Comments/Additional Notes"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Record Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

