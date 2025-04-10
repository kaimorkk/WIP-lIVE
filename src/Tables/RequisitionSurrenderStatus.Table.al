Table 52194101 RequisitionSurrenderStatus
{

    fields
    {
        field(1;RequisitionSurrenderStatusID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;RequisitionSurrenderStatusName;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;RequisitionSurrenderStatusID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

