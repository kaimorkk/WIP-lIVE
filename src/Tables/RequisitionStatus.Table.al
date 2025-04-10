Table 52194100 RequisitionStatus
{

    fields
    {
        field(1;RequisitionStatusID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;RequisitionStatusName;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;RequisitionStatusID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

