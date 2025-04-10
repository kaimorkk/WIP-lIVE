Table 52193431 "Directors-App"
{

    fields
    {
        field(1; "Director Name"; Text[50])
        {
            NotBlank = true;
        }
        field(2; Address; Text[30])
        {
        }
        field(3; Telephone; Code[20])
        {
        }
        field(4; Fax; Code[20])
        {
        }
        field(5; Email; Text[30])
        {
        }
        field(6; "Account Opening No"; Code[20])
        {
            //TableRelation = "Fosa Accounts Applications"."No.";
        }
        field(7; "ID No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Account Opening No", "Director Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

