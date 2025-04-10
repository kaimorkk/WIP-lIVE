
table 80197 "Policy Guiding Principle Rev"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy;
        }
        field(2; "Code"; Code[100])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

