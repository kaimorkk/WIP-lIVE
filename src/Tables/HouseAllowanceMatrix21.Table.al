Table 52193935 "House Allowance Matrix21"
{

    fields
    {
        field(1;"Salary Scale";Code[30])
        {
            TableRelation = "Salary Scales21".Scale;
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

