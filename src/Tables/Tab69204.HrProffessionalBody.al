
table 69204 "Hr Proffessional Body"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[30])
        {
            TableRelation = "HR Job Applications"."Application No";
        }
        field(2; "Job ID"; Text[30])
        {
        }
        field(3; "Membership Type"; Text[30])
        {
        }
        field(4; "Membership No"; Text[30])
        {
        }
        field(5; Institution; Text[30])
        {
        }
        field(9; "Id Number"; Text[30])
        {
        }
        field(10; "Employee No"; Text[30])
        {
        }
        field(11; "Renewal Date"; Date)
        {
        }
        field(12; "Code"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Application No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

