Table 52193527 "Cashier Link"
{
    // DrillDownPageID = "Induction Activities";
    // LookupPageID = "Induction Activities";

    fields
    {
        field(1;UserID;Code[20])
        {
            NotBlank = true;
            TableRelation = User."User Security ID";
        }
        field(2;"Bank Account No";Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(3;"Branch Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('BRANCHES'));
        }
    }

    keys
    {
        key(Key1;UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

