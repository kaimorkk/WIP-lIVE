Table 52194099 RequisitionNotes
{

    fields
    {
        field(1;RequisitionNoteID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;RequisitionNote;Text[250])
        {
        }
        field(3;UserID;Integer)
        {
        }
        field(4;CreatedDate;Date)
        {
        }
        field(5;RequisitionID;Integer)
        {
        }
        field(6;RequisitionStatusID;Integer)
        {
        }
        field(7;RequisitionSurrenderStatusID;Integer)
        {
        }
        field(8;RequisitionApprovalStatusID;Integer)
        {
        }
    }

    keys
    {
        key(Key1;RequisitionNoteID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

