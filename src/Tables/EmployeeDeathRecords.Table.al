Table 52193964 "Employee Death Records"
{

    fields
    {
        field(1;"Entry No.";Code[20])
        {
        }
        field(2;"Employee No.";Code[20])
        {
        }
        field(3;"Employee Name";Text[50])
        {
        }
        field(4;"Date of Occurrance";Date)
        {
        }
        field(5;"Cause of Death";Text[50])
        {
        }
        field(6;Insured;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

