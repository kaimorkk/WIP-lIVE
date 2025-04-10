Table 80282 "Evaluation Training needs."
{
    //DrillDownPageID = UnknownPage80403;
    //LookupPageID = UnknownPage80403;

    fields
    {
        field(1; "Perfomance Evaluation No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Training Need Number"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Training Need Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Evaluation Needs Category".Code;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Perfomance Evaluation No", "Training Need Number", "Training Need Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

