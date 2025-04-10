
table 59023 "Licence Types"
{
    DrillDownPageID = "Licence Types";
    LookupPageID = "Licence Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Licence Type Code"; Code[30])
        {
        }
        field(2; "Licence Type Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Licence Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

