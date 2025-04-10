Table 52193777 Referees1
{

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = Applicants1."No.";
        }
        field(2;Names;Text[200])
        {
        }
        field(3;Designation;Text[100])
        {
        }
        field(4;Company;Text[100])
        {
        }
        field(5;Address;Text[200])
        {
        }
        field(6;"Telephone No";Text[100])
        {
        }
        field(7;"E-Mail";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;No,Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

