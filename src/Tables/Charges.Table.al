Table 52193470 Charges
{
    DrillDownPageID = Charges;
    LookupPageID = Charges;

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;"Charge Amount";Decimal)
        {
        }
        field(4;Percentage;Decimal)
        {
        }
        field(5;"G/L Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(6;"Use Perc";Boolean)
        {
        }
        field(7;"Min Amount";Decimal)
        {
        }
        field(8;"Max Amount";Decimal)
        {
        }
        field(10;"Charge Type";Option)
        {
            OptionCaption = ' ,Loans,Special Advance,Discounting,Standing Order Fee,Failed Standing Order Fee';
            OptionMembers = " ",Loans,"Special Advance",Discounting,"Standing Order Fee","Failed Standing Order Fee";
        }
        field(11;Statutory;Boolean)
        {
        }
        field(12;IsInsurance;Boolean)
        {
        }
        field(13;"Short term Insuarance";Boolean)
        {
        }
        field(14;"Customer Posting Group";Code[20])
        {
            TableRelation = "Customer Posting Group".Code;

            trigger OnValidate()
            begin
                 if "Customer Posting Group" <> '' then
                 if CustPost.Get("Customer Posting Group") then begin
                "G/L Account":=CustPost."Receivables Account";
                 Validate("G/L Account");
                 end;
            end;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CustPost: Record "Customer Posting Group";
}

