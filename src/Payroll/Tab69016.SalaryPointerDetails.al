
table 69016 "Salary Pointer Details"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No"; Code[20])
        {
        }
        field(2; "Payroll Period"; Date)
        {
        }
        field(3; Present; Code[20])
        {
        }
        field(4; Previous; Code[20])
        {
        }
        field(5; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period", Present, Previous, "Salary Scale")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

