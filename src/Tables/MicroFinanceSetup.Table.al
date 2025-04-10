Table 52193624 "Micro Finance Setup"
{

    fields
    {
        field(1;"Primary Key";Code[20])
        {
        }
        field(2;"Receipts Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3;"Payments Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4;"Micro Finance Loan Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5;"Loan Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6;"Mf-Trans Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;"Withdrawal No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(8;"Group No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9;"Min Group Members";Integer)
        {
        }
        field(10;"Max Group Members";Integer)
        {
        }
        field(11;"Group Application No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(13;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(14;"Customer Posting Group";Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
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

