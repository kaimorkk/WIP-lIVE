Table 52194102 UnitofMeasure
{

    fields
    {
        field(1;UnitofMeasureID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;UnitofMeasureName;Text[50])
        {
        }
        field(3;Notes;Text[250])
        {
        }
        field(4;CreatedDate;Date)
        {
        }
        field(5;UserID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;UnitofMeasureID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

