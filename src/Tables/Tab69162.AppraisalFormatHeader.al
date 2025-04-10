
table 69162 "Appraisal Format Header"
{
    // DrillDownPageID = "HR Lookup Values Factbox";
    // LookupPageID = "HR Lookup Values Factbox";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Header; Text[50])
        {
        }
        field(2; Priority; Integer)
        {
        }
    }

    keys
    {
        key(Key1; Header)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

