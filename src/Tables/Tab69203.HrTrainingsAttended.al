
table 69203 "Hr Trainings Attended"
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
        field(6; "Course Name"; Text[30])
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
        field(12; Attained; Text[50])
        {
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

