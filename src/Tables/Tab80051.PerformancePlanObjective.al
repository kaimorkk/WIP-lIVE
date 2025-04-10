
table 80051 "Performance Plan Objective"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Mgt Plan ID"; Code[50])
        {
            TableRelation = "Performance Management Plan".No;
        }
        field(2; "Objective Entry No"; Integer)
        {
        }
        field(3; Description; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Mgt Plan ID", "Objective Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

