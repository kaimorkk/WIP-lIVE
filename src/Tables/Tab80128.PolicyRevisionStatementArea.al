
table 80128 "Policy Revision Statement Area"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[30])
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
        key(Key1; "Policy ID", "Revision No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

