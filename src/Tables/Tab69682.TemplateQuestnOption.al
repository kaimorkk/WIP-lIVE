
table 69682 "Template Questn Option"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            TableRelation = "Pre-Screen Template";
        }
        field(2; "Question ID"; Integer)
        {
            TableRelation = "Pre-Screen Template Line"."Question Id";
        }
        field(3; "Option Code"; Code[10])
        {
        }
        field(4; Description; Text[10])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Question ID", "Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

