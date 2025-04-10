
table 69700 "Ability Test Question"
{

    fields
    {
        field(1; "Test ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ability Test";
        }
        field(2; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Question; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Test ID", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

