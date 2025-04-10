Table 52193745 "HoD Committee1"
{

    fields
    {
        field(1;"Meeting Code";Code[20])
        {
        }
        field(2;"HoD code";Code[10])
        {
            TableRelation = Employee;
        }
        field(3;"Hod Name";Text[40])
        {
        }
        field(4;"Committee Code";Code[20])
        {
        }
        field(5;Email;Text[100])
        {
        }
        field(6;Attended;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Meeting Code","HoD code","Committee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

