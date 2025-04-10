
table 80028 "Risk Source Sub-Class"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Source Class ID"; Code[50])
        {
            TableRelation = "Risk Categories";
        }
        field(2; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Source Class ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

