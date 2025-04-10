
table 56055 "ICT Helpdesk Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "No. Series"; Code[50])
        {
        }
        field(4; "Category Head"; Text[250])
        {
            TableRelation = "User Setup";
        }
        field(5; "Expected Duration"; Duration)
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Category Head")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

