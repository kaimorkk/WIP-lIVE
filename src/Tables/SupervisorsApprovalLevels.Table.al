Table 52193502 "Supervisors Approval Levels"
{

    fields
    {
        field(1;SupervisorID;Code[50])
        {
            NotBlank = true;
            TableRelation = "User Setup";
        }
        field(2;"Maximum Approval Amount";Decimal)
        {
        }
        field(3;"Transaction Type";Option)
        {
            OptionMembers = "Cash Deposits","Cheque Deposits",Withdrawals;
        }
    }

    keys
    {
        key(Key1;SupervisorID,"Transaction Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

