Table 52193620 "Bosa Setup"
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
        field(5;"Loan Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6;"Reallocation Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;"FOSA Loans Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(8;"Membership App Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9;"BOSA Loans Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10;"Loans Batch Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(11;"BOSA Applicant Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12;"Micro Finance Loan Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13;"Mf-Trans Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14;"Withholding Tax %";Decimal)
        {
        }
        field(15;"Withholding Tax Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(16;"VAT %";Decimal)
        {
        }
        field(17;"VAT Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(18;"Customer Nos.";Code[20])
        {
            Caption = 'Customer Nos.';
            TableRelation = "No. Series";
        }
        field(19;"Interest Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(20;"Post VAT";Boolean)
        {
        }
        field(21;"Rounding Type";Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(22;"Rounding Precision";Decimal)
        {
        }
        field(23;"Employer Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(24;"Loan Top Up No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(25;"Department Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26;"Member Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(27;"Branch2 Member Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(28;"Branch3 Member Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(29;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(30;"Branch1 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Maseru Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(32;"Customer Posting Group";Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(33;"Branch2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Leribe Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(34;"Branch3 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Mohales-Hoek Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(35;"Male Code";Code[10])
        {
        }
        field(36;"Female Code";Code[10])
        {
        }
        field(37;"Business Code";Code[10])
        {
        }
        field(38;"Additional Account Code";Code[20])
        {
        }
        field(39;"Default Contribution Trans";Code[30])
        {
            TableRelation = "Transactions Type";
        }
        field(40;"Employer Dimension";Code[30])
        {
            TableRelation = Dimension;
        }
        field(41;"Product Dimension";Code[30])
        {
            TableRelation = Dimension;
        }
        field(42;"Default Product Code";Code[20])
        {
            TableRelation = "Bosa Products";
        }
        field(43;"Loan Repayment Transaction";Code[30])
        {
            TableRelation = "Transactions Type";
        }
        field(44;"Posting Group - Interest Due";Code[20])
        {
            Caption = 'Posting Group - Interest Due';
            TableRelation = "Customer Posting Group";
        }
        field(45;"Posting Group - Interest Paid";Code[20])
        {
            Caption = 'Posting Group - Interest Paid';
            TableRelation = "Customer Posting Group";
        }
        field(46;"OffSetting No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(47;"Share Transfer No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(48;"Share Capital Product Code";Code[20])
        {
            TableRelation = "Bosa Products";
        }
        field(49;"PV Nos";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50;"Loan Transaction";Code[30])
        {
            TableRelation = "Transactions Type";
        }
        field(51;"Other Transactions";Code[30])
        {
            TableRelation = "Transactions Type";
        }
        field(52;"Withdrawal No.";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(53;"Group No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(54;"Min Group Members";Integer)
        {
        }
        field(55;"Max Group Members";Integer)
        {
        }
        field(56;"Group Application No";Code[20])
        {
            TableRelation = "No. Series";
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

