Table 52194088 Activities
{

    fields
    {
        field(1;ActivityID;Integer)
        {
        }
        field(2;ActivityTitle;Text[30])
        {
        }
        field(3;Notes;Text[250])
        {
        }
        field(4;ActivitySequence;Integer)
        {
        }
        field(5;PhaseID;Integer)
        {
        }
        field(6;DependencyTypeID;Integer)
        {
        }
        field(7;CreatedDate;Date)
        {
        }
        field(8;UserID;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;ActivityID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

