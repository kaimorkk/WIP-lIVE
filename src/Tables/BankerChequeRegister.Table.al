Table 52193510 "Banker Cheque Register"
{
    DrillDownPageID = "Cheque Register";
    LookupPageID = "Cheque Register";

    fields
    {
        field(1; "Book No."; Code[20])
        {
            // TableRelation = "Cheque Book";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Banker Cheque No."; Code[10])
        {
        }
        field(4; "Book Issued"; Boolean)
        {
        }
        field(5; "Leaf Issued"; Boolean)
        {
        }
        field(6; "Leaf Cancelled"; Boolean)
        {
        }
        field(7; "Book Cancelled"; Boolean)
        {
        }
        field(8; Transacted; Boolean)
        {
        }
        field(9; Blocked; Boolean)
        {
        }
        field(10; "Selected Leaf"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Book No.", "Banker Cheque No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

