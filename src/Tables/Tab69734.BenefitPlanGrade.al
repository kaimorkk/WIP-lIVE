
table 69734 "Benefit Plan Grade"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Package ID"; Code[30])
        {
            TableRelation = "Benefit Package";
        }
        field(2; "Plan ID"; Code[30])
        {
        }
        field(3; "Job Grade ID"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
    }

    keys
    {
        key(Key1; "Package ID", "Plan ID", "Job Grade ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

