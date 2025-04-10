Table 52193803 "Employee Account Mapping1"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee;
        }
        field(2; "Loan Type"; Code[10])
        {
            //TableRelation = "Loan Product Type1";
        }
        field(3; "Customer A/c"; Code[10])
        {
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Loan Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

