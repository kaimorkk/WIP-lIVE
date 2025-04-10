
table 80041 "Stakeholder Implication"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Stakeholder Matrix No"; Integer)
        {
            TableRelation = "Stakeholder Power & Interests"."Entry No";
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; "Strategic Implication"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Stakeholder Matrix No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

