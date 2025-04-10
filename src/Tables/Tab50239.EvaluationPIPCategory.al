
table 50239 "Evaluation PIP Category"
{
    DataClassification = CustomerContent;
    //DrillDownPageID = "Evaluation PIP Category";
    //LookupPageID = "Evaluation PIP Category";

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Desription; Text[255])
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

    fieldgroups
    {
    }
}

