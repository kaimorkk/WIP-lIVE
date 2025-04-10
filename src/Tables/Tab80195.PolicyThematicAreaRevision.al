
table 80195 "Policy Thematic Area Revision"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Revision No."; Code[30])
        {
        }
        field(5; "Implementation Percentage"; Decimal)
        {
        }
        field(6; Comments; Text[255])
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

