Table 52193432 Directors
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
        field(6; "Account No"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(7; "ID No."; Code[20])
        {
        }
        field(8; "Account Opening"; Code[20])
        {
            //TableRelation = "Fosa Accounts Applications"."No.";
        }
    }

    keys
    {
        key(Key1; "Account No", "Director Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

