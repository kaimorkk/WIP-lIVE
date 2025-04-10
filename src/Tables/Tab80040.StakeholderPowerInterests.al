
table 80040 "Stakeholder Power & Interests"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Stakeholder Analysis No"; Integer)
        {
            TableRelation = "Stakeholder Analysis Matrix"."Entry No";
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; Type; Option)
        {
            OptionCaption = 'Power/Influence,Interests/Expectation';
            OptionMembers = "Power/Influence","Interests/Expectation";
        }
        field(5; Description; Text[255])
        {
        }
        field(6; Level; Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
    }

    keys
    {
        key(Key1; "Document No", "Stakeholder Analysis No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

