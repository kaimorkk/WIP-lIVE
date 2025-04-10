
table 80088 "Performance Participant"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Doc No."; Code[30])
        {
        }
        field(2; "Employee ID"; Code[30])
        {
            TableRelation = Employee;
        }
        field(3; "Employee Name"; Code[100])
        {
        }
        field(4; Role; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Doc No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

