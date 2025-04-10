Table 52193498 "Bank Branch"
{

    fields
    {
        field(1;"Bank No";Code[20])
        {
            NotBlank = true;
            TableRelation = "Bank Account"."No.";
        }
        field(2;"Branch No";Code[20])
        {
            NotBlank = true;
        }
        field(3;"Branch Name";Text[100])
        {
        }
        field(4;"Telephone No";Text[50])
        {
        }
        field(5;"Postal Address";Text[50])
        {
        }
        field(6;"Physical Address";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Bank No","Branch No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

