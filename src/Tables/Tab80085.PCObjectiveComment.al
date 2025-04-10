
table 80085 "PC Objective Comment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No"; Code[30])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; "Objective ID"; Code[30])
        {
            TableRelation = "PC Objective";
        }
        field(3; "Comment/Additional Notes"; Code[255])
        {
        }
        field(4; " UserID"; Code[100])
        {
        }
        field(5; "Last Update Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

