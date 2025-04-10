Table 52194047 "Qualifying Employees"
{

    fields
    {
        field(1;"Employee No";Code[20])
        {
        }
        field(2;"Job ID";Code[20])
        {
        }
        field(3;"Employee Name";Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"Employee No","Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

