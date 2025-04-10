Table 52193761 "external comm. categories1"
{

    fields
    {
        field(1;No;Code[10])
        {
        }
        field(2;"Category Name";Text[30])
        {
        }
        field(3;"Category ID";Integer)
        {
        }
        field(4;"No. Of Stakeholders";Integer)
        {
            Description = 'Calculated Field';
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

