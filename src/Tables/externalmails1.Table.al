Table 52193762 "external mails1"
{

    fields
    {
        field(1;"Stakeholder ID";Integer)
        {
        }
        field(2;Name;Text[30])
        {
        }
        field(3;"Postal Address";Text[30])
        {
        }
        field(4;"Physical Address";Text[30])
        {
        }
        field(5;"Contact Person";Text[30])
        {
        }
        field(6;"E-mail";Text[30])
        {
        }
        field(7;"Telephone No";Text[30])
        {
        }
        field(8;"Mobile No";Integer)
        {
        }
        field(9;"Stake holder Category";Text[30])
        {
        }
        field(10;"Fax No";Text[30])
        {
        }
        field(11;Type;Text[30])
        {
            Description = 'Company, Individual';
        }
        field(12;"External mails No.";Code[10])
        {
            NotBlank = false;
            TableRelation = "Doc Templates1"."Litigation Code";
        }
        field(13;"Commitee Code";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Commitee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

