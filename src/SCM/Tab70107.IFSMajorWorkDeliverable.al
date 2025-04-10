
table 70107 "IFS Major Work_Deliverable"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
            TableRelation = "Standard Purchase Code".Code;
        }
        field(2; "Entry No"; Integer)
        {
        }
        field(3; "Major Activity Description"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

