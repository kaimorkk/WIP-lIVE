
table 80037 "Strategic Analysis Implication"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Analysis Matrix No"; Code[50])
        {
            TableRelation = "Strategic Analysis Matrix"."Entry No";
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; "Strategic Implication"; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Analysis Matrix No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

