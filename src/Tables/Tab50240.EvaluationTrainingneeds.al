
table 50240 "Evaluation Training needs"
{
    DataClassification = CustomerContent;
    //DrillDownPageID = "Evaluation Training Needs";
    //LookupPageID = "Evaluation Training Needs";

    fields
    {
        field(1; "Perfomance Evaluation No"; Code[30])
        {
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Training Need Number"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Training Need Category"; Code[30])
        {
            // TableRelation = "Evaluation Needs Category".Code;
        }
        field(4; Description; Text[255])
        {
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

