Table 52193754 "Custorme Survey Index1"
{

    fields
    {
        field(1;"Survey Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Survey Type";Option)
        {
            OptionMembers = "Customer Survey","Performance Rating","Overal Rating","CSS Statement","Customer Statement";
        }
        field(4;Statement;Text[250])
        {
        }
        field(5;N;Integer)
        {
        }
        field(6;Mean;Decimal)
        {
        }
        field(7;"Satisfaction Index %";Decimal)
        {
        }
        field(8;Bold;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Survey Code","Line No","Survey Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

