
table 70017 "Tender Mandatory Requirements"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Tender No"; Code[50])
        {
        }
        field(2; Specification; Text[250])
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6; No; Code[30])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(7; Description; Text[100])
        {
        }
        field(8; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Tender No", Specification)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

