
table 70032 "Purchases Types"
{
    DrillDownPageID = "Purchases Types";
    LookupPageID = "Purchases Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Purchase Type"; Code[20])
        {
        }
        field(2; "Purchase Type Description"; Text[150])
        {
        }
        field(3; Remarks; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Purchase Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

