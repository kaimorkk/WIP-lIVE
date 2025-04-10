Table 52193626 "Fosa Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
        }
        field(2; "Loan Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3; "FOSA Loans Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "Loans Batch Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5; "Withholding Tax %"; Decimal)
        {
        }
        field(6; "Withholding Tax Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(7; "VAT %"; Decimal)
        {
        }
        field(8; "VAT Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(9; "Interest Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(10; "Post VAT"; Boolean)
        {
        }
        field(11; "Rounding Type"; Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(12; "Rounding Precision"; Decimal)
        {
        }
        field(13; "Employer Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "Loan Top Up No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(15; "Transaction Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Treasury Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Standing Orders Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "FOSA Current Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(19; "Teller Transactions No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(20; "Treasury Transactions No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(21; "FOSA Applicants Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(22; "STO Register No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "EFT Header Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(24; "EFT Details Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(25; "Salaries Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26; "Normal Cheque Transfers Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(27; "Account Types Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(28; "Fosa Account Nos."; Code[20])
        {
            Caption = 'Fosa Account Nos.';
            TableRelation = "No. Series";
        }
        field(29; "ATM Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(30; "Transaction Types Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(31; "Teller Request Nos."; Code[20])
        {
            Caption = 'Teller Request Nos.';
            TableRelation = "No. Series";
        }
        field(32; "Def. Account Type"; Code[30])
        {
            TableRelation = "Account Types";
        }
        field(33; "Business Acc App Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(34; "Cheque Deposit Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(35; "Cheque Processing Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(36; "EFT Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(37; "Loans Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(38; "Loans Repayment Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(39; "Transaction Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(40; "Standing Order Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(41; "Account Charges Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(42; "Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch";
        }
        field(43; "Interest  Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(44; "Flat rate Charge on CW"; Decimal)
        {
        }
        field(45; "Amount Per Charge"; Decimal)
        {
        }
        field(46; "Cheque No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(47; "Cheque Req"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(48; "Maximum Charge"; Decimal)
        {
        }
        field(49; "Default Current Account Code"; Code[20])
        {
            TableRelation = "Account Types";
        }
        field(50; "Commission on Bolibeng"; Decimal)
        {
        }
        field(51; "Bolibeng Commission Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(52; "Bolibeng Control Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(53; "Share Holders Class"; Code[20])
        {
            TableRelation = "Class Code";
        }
        field(54; "Staff Class"; Code[20])
        {
            TableRelation = "Class Code";
        }
        field(55; "Factory Class"; Code[20])
        {
            TableRelation = "Class Code";
        }
        field(56; "Default Savings Account Code"; Code[20])
        {
            TableRelation = "Account Types";
        }
        field(57; "Treasury Transaction Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(58; "Withdrawal Percentage"; Decimal)
        {
        }
        field(59; "Maximum Amount"; Decimal)
        {
        }
        field(60; "Salary Charge"; Decimal)
        {
        }
        field(61; "Salary Charge Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(62; "External Loan Processing Fee"; Decimal)
        {
        }
        field(63; "Accrued Interest Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(64; "Investment  Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(65; "Lost Pass Book Charges"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(66; "Default Share Capital Amount"; Decimal)
        {
        }
        field(67; "Overdraft No"; Code[20])
        {
            Caption = 'Overdraft No';
            TableRelation = "No. Series";
        }
        field(68; "Funeral Scheme No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(69; "Loan Commission"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(70; "RTGS No"; Code[20])
        {
            Caption = 'Fosa Account Nos.';
            TableRelation = "No. Series";
        }
        field(80; "RTGS Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(81; "Minimum RTGS Amount"; Decimal)
        {
        }
        field(82; "Maximum RTGS Amount"; Decimal)
        {
        }
        field(83; Transaction; Code[20])
        {
            TableRelation = "Transaction Types";
        }
        field(84; "Failed Sto Re-Nos"; Code[20])
        {
            Caption = 'Failed Sto Re-Nos';
            TableRelation = "No. Series";
        }
        field(85; CarLoan; Code[20])
        {
            //TableRelation = "Loan Product Types";
        }
        field(86; "Next Service Fee Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

