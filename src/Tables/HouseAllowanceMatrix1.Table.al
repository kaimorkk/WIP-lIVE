Table 52193849 "House Allowance Matrix1"
{

    fields
    {
        field(1;"Salary Scale";Code[10])
        {
            TableRelation = "Salary Scales1".Scale;
        }
        field(2;Station;Code[30])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(3;"House Allowance";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Salary Scale",Station)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

