Table 52194098 RequisitionApprovalStatus
{

    fields
    {
        field(1;RequisitionApprovalStatusID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;RequisitionApprovalStatusName;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;RequisitionApprovalStatusID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

