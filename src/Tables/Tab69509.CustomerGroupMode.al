
table 69509 "Customer Group &  Mode"
{
    DrillDownPageID = "Customer Group & Mode";
    LookupPageID = "Customer Group & Mode";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Customer Group"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }


}

