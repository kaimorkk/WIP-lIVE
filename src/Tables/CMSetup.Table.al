Table 52193638 CMSetup
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
        }
        field(2;"Payment Voucher Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3;"Imprest Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4;"Imprest Surrender Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(5;"Petty Cash Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6;"Receipt Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(7;"Post VAT";Boolean)
        {
        }
        field(8;"Rounding Type";Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(9;"Rounding Precision";Decimal)
        {
        }
        field(10;"Imprest Limit";Decimal)
        {
        }
        field(11;"Imprest Due Date";DateFormula)
        {
        }
        field(12;"Imprest Posting Group";Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(13;"General Bus. Posting Group";Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(14;"VAT Bus. Posting Group";Code[20])
        {
            TableRelation = "VAT Business Posting Group";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

