
table 70097 "Proc Regulation Version"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Version Code"; Code[10])
        {
        }
        field(2; "Primary Document No"; Code[10])
        {
            TableRelation = "Procurement Law & Regulation".Code;
        }
        field(3; "External Document No"; Code[10])
        {
        }
        field(4; Description; Text[30])
        {
        }
        field(5; "Effective Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Version Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

