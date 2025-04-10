
table 69246 "HR Medical Claim Entries"
{
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage51516147;
    //LookupPageID = UnknownPage51516147;

    fields
    {
        field(10; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(11; "Document No."; Code[30])
        {
        }
        field(12; "Employee No"; Code[30])
        {
        }
        field(13; "Employee Name"; Text[80])
        {
        }
        field(14; "Claim Date"; Date)
        {
        }
        field(15; "Hospital Visit Date"; Date)
        {
        }
        field(16; "Claim Limit"; Decimal)
        {
        }
        field(17; "Balance Claim Amount"; Decimal)
        {
        }
        field(18; "Amount Claimed"; Decimal)
        {
        }
        field(19; "Amount Charged"; Decimal)
        {
        }
        field(20; Comments; Text[100])
        {
        }
        field(21; "USER ID"; Code[30])
        {
        }
        field(22; "Claim No"; Code[30])
        {
        }
        field(23; "Date Posted"; Date)
        {
        }
        field(24; "Time Posted"; Time)
        {
        }
        field(25; Posted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

