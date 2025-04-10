Table 52193485 "Approvals Users Set Up"
{

    fields
    {
        field(1;"Approval Type";Option)
        {
            OptionMembers = Loans,"Special Loans","Personal Loans",Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans";
        }
        field(2;Stage;Integer)
        {
        }
        field(3;"User ID";Code[20])
        {
            TableRelation = User;
        }
    }

    keys
    {
        key(Key1;"Approval Type",Stage,"User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

