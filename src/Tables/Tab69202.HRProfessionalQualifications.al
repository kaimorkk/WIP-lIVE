
table 69202 "HR Professional Qualifications"
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
        field(3; "From Date"; Date)
        {
        }
        field(4; "To Date"; Date)
        {
        }
        field(5; Institution; Text[30])
        {
        }
        field(6; Attainment; Text[30])
        {
        }
        field(7; Specialization; Text[30])
        {
        }
        field(8; Grade; Text[50])
        {
        }
        field(9; "Id Number"; Text[30])
        {
        }
        field(10; "Employee No"; Text[30])
        {
        }
        field(11; "Code"; Integer)
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

