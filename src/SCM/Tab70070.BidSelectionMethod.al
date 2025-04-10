
table 70070 "Bid Selection Method"
{
    DrillDownPageID = "Bid Selection Method";
    LookupPageID = "Bid Selection Method";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[80])
        {
        }
        field(3; Overview; Text[250])
        {
        }
        field(4; "Applies To Goods"; Boolean)
        {
        }
        field(5; "Applies To Works"; Boolean)
        {
        }
        field(6; "Applies To Services"; Boolean)
        {
        }
        field(7; "No. of Invitations For Supply"; Decimal)
        {
        }
        field(8; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

