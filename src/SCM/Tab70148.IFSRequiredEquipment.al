
table 70148 "IFS Required Equipment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Equipment Type Code"; Code[60])
        {
            //TableRelation = "Works Equipment Type".Code;
        }
        field(3; Description; Text[100])
        {
        }
        field(4; Category; Code[50])
        {
            //TableRelation = "Works Equipment Category".Code;
        }
        field(5; "Minimum Required Qty"; Decimal)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Equipment Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

