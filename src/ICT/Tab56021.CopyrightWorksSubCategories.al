
table 56021 "Copyright Works Sub-Categories"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Category Code"; Code[20])
        {
            TableRelation = "Copyright Works Categories";
        }
        field(3; Description; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

