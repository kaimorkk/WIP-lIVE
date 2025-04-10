Table 52193716 "Office Spaces1"
{
    // //DrillDownPageID = UnknownPage51028;
    // //LookupPageID = UnknownPage51028;

    fields
    {
        field(1; "Office Code"; Code[10])
        {
        }
        field(2; "Office Description"; Text[80])
        {
        }
        field(3; "Office Dimensions"; Text[30])
        {
        }
        field(4; "Floor No."; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Office Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

