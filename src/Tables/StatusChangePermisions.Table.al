Table 52193506 "Status Change Permisions"
{
    DrillDownPageID = "Status Change Permissions";
    LookupPageID = "Status Change Permissions";

    fields
    {
        field(1;"User ID";Code[100])
        {
            NotBlank = true;
            TableRelation = "User Setup";
        }
        field(2;"Function";Option)
        {
            NotBlank = false;
            OptionCaption = 'Account Status,Standing Order,Loan Charges,Sto';
            OptionMembers = "Account Status","Standing Order","Loan Charges",Sto;
        }
    }

    keys
    {
        key(Key1;"Function","User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

