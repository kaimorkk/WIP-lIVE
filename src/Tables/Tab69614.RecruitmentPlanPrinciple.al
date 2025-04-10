
table 69614 "Recruitment Plan Principle"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Recruitment Plan ID"; Code[30])
        {
            TableRelation = "Recruitment Plan";
        }
        field(2; "Guiding Principle ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Recruitment Plan ID", "Guiding Principle ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

