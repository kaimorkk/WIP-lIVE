Table 52194027 "Probation Appraisal Criteria"
{

    fields
    {
        field(1;"Score ID";Integer)
        {
        }
        field(2;"Lower Limit";Decimal)
        {
        }
        field(3;"Upper Limit";Decimal)
        {
        }
        field(4;"Score Category(Self)";Text[30])
        {
        }
        field(5;"Score Category(Appraiser)";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Score ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

