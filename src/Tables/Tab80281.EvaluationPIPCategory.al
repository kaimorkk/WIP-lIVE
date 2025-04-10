Table 80281 "Evaluation PIP Category."
{
    //DrillDownPageID = UnknownPage80402;
    //LookupPageID = UnknownPage80402;

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Desription; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

