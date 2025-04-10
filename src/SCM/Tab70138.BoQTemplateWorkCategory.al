
table 70138 "BoQ Template Work Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "BoQ Template Code"; Code[50])
        {
            TableRelation = "Purchase Requisition Template";
        }
        field(2; "Works Category Code"; Code[50])
        {
        }
        field(3; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "BoQ Template Code", "Works Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

