
table 56903 "HRPortalUsers"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "code"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; employeeNo; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(3; IdNo; Code[8])
        {
        }
        field(4; password; Text[250])
        {
        }
        field(5; changedPassword; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
