Table 52193921 "Appraisal Grades1"
{
    LookupPageID = "Grade Matrix";

    fields
    {
        field(1;Grade;Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[200])
        {
        }
        field(3;"Lowest Points Awarded";Decimal)
        {
        }
        field(4;"Highest Points Awarded";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;Grade)
        {
            Clustered = true;
        }
        key(Key2;"Lowest Points Awarded")
        {
        }
    }

    fieldgroups
    {
    }
}

