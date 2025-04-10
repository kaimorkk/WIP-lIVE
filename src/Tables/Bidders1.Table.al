Table 52193789 Bidders1
{

    fields
    {
        field(1;"Ref No.";Code[50])
        {
            TableRelation = "Procurement Request1";
        }
        field(2;Name;Code[100])
        {
        }
        field(3;"Physical Address";Text[250])
        {
        }
        field(4;"Postal Address";Text[250])
        {
        }
        field(5;City;Code[100])
        {
        }
        field(6;"E-mail";Text[100])
        {
        }
        field(7;"Telephone No";Code[100])
        {
        }
        field(8;"Mobile No";Code[50])
        {
        }
        field(9;"Contact Person";Text[50])
        {
        }
        field(10;"KBA Bank Code";Code[50])
        {
        }
        field(11;"KBA Branch Code";Code[3])
        {
        }
        field(12;"Bank account No";Code[10])
        {
        }
        field(13;Category;Code[10])
        {
        }
        field(14;"Fiscal Year";Code[10])
        {
        }
        field(15;Selected;Boolean)
        {
        }
        field(16;"Pre Qualified";Boolean)
        {
        }
        field(17;"Tender Amount";Decimal)
        {
        }
        field(18;"Bid Security Amount";Decimal)
        {
        }
        field(19;"No. of Copies Submitted";Decimal)
        {
        }
        field(20;"Bid Expiry Date";Date)
        {
        }
        field(21;Successful;Boolean)
        {
        }
        field(22;"Fixed Asset No";Code[20])
        {
        }
        field(23;"Cheque No";Code[20])
        {
        }
        field(24;Response;Option)
        {
            OptionCaption = 'Offer,Regret,No Bid';
            OptionMembers = Offer,Regret,"No Bid";
        }
        field(25;"Tender Doc Receipt Date";Date)
        {
        }
        field(26;"Receipt No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Receipts Header1";
        }
    }

    keys
    {
        key(Key1;"Ref No.","E-mail")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

