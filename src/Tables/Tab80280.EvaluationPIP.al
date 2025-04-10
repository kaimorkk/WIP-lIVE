Table 80280 "Evaluation PIP."
{
    //DrillDownPageID = UnknownPage80401;
    //LookupPageID = UnknownPage80401;

    fields
    {
        field(1; "Perfomance Evaluation No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "PIP Number"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "PIP Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evaluation PIP Category".Code;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Perfomance Evaluation No", "PIP Number", "PIP Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

