
table 80084 "Performance Plan Guideline"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Mgt Plan ID"; Code[30])
        {
            TableRelation = "Performance Management Plan";
        }
        field(2; "Policy/Guideline ID"; Code[30])
        {
            TableRelation = "Policy & Guideline".Code;
        }
        field(3; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Mgt Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

