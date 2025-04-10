Table 52193468 "General Set-Up"
{

    fields
    {
        field(1; "Share Interest (%)"; Decimal)
        {
        }
        field(2; "Loan Defaulting Period"; Code[10])
        {
        }
        field(3; "Min. Contribution"; Decimal)
        {
        }
        field(4; "Min. Dividend Proc. Period"; Code[10])
        {
        }
        field(5; "Loan to Share Ratio"; Decimal)
        {
        }
        field(6; "Min. Loan Application Period"; Code[10])
        {
        }
        field(7; "Min. Guarantors"; Integer)
        {
        }
        field(8; "Max. Guarantors"; Integer)
        {
        }
        field(9; "Member Can Guarantee Own Loan"; Boolean)
        {
        }
        field(10; "Insurance Premium (%)"; Decimal)
        {
        }
        field(11; Record; Integer)
        {
            NotBlank = false;
        }
        field(12; "Commision (%)"; Decimal)
        {
        }
        field(13; "Contactual Shares (%)"; Decimal)
        {
        }
        field(14; "Registration Fee"; Decimal)
        {
        }
        field(15; "Welfare Contribution"; Decimal)
        {
        }
        field(16; "Administration Fee"; Decimal)
        {
        }
        field(17; "Dividend (%)"; Decimal)
        {
        }
        field(24; "Defaut Batch"; Code[20])
        {
            TableRelation = "Sacco Payment Batch"."Journal Batch Name";
        }
        field(25; "Min. Member Age"; DateFormula)
        {
        }
        field(26; "Approved Loans Letter"; Code[10])
        {
            TableRelation = "Interaction Template".Code;
        }
        field(27; "Rejected Loans Letter"; Code[10])
        {
            TableRelation = "Interaction Template".Code;
        }
        field(28; "Max. Contactual Shares"; Decimal)
        {
        }
        field(29; "Shares Contribution"; Decimal)
        {
        }
        field(30; "Boosting Shares %"; Decimal)
        {
        }
        field(31; "Boosting Shares Maturity (M)"; DateFormula)
        {
        }
        field(32; "Min Loan Reaplication Period"; DateFormula)
        {
        }
        field(33; "Welfare Breakdown #1 (%)"; Decimal)
        {
        }
        field(34; "Loan to Share Ratio (4M)"; Decimal)
        {
        }
        field(35; "BOSA CURRENT ACC"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(36; "BOSA Bank Acc"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(37; "Guarantor Loan No Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(38; "Interest Due Document No."; Code[20])
        {
        }
        field(39; "Interest Due Posting Date"; Date)
        {
        }
        field(40; "Withholding Tax (%)"; Decimal)
        {
        }
        field(41; "Withdrawal Fee"; Decimal)
        {
        }
        field(42; "Retained Shares"; Decimal)
        {
        }
        field(43; "Multiple Disb. Acc."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(44; "Receipt Document No."; Code[20])
        {
        }
        field(45; "Minimum Balance"; Decimal)
        {
        }
        field(46; "Use Bands"; Boolean)
        {
        }
        field(47; "Retirement Age"; DateFormula)
        {
        }
        field(48; "ABF Retension Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(49; "Withholding Tax G/L"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(50; January; Decimal)
        {
        }
        field(51; February; Decimal)
        {
        }
        field(52; March; Decimal)
        {
        }
        field(53; April; Decimal)
        {
        }
        field(54; May; Decimal)
        {
        }
        field(55; June; Decimal)
        {
        }
        field(56; July; Decimal)
        {
        }
        field(57; August; Decimal)
        {
        }
        field(58; September; Decimal)
        {
        }
        field(59; October; Decimal)
        {
        }
        field(60; November; Decimal)
        {
        }
        field(61; December; Decimal)
        {
        }
        field(62; "Total Share Distributed"; Decimal)
        {
        }
        field(63; "Open Balance"; Decimal)
        {
        }
        field(64; "Total Qualifying"; Decimal)
        {
            FieldClass = Normal;
        }
        field(65; "Total Qualifying SHARES"; Decimal)
        {
            CalcFormula = sum("Dividends Progression"."Qualifying Shares");
            FieldClass = FlowField;
        }
        field(66; "Email Subject"; Text[250])
        {
        }
        field(67; "Sender Address"; Text[100])
        {
        }
        field(68; "Outgoing Mail Server"; Text[100])
        {
        }
        field(69; "Sender User ID"; Text[100])
        {
        }
        field(70; "Delay Time"; Integer)
        {
        }
        field(71; "Template Location"; Text[30])
        {
        }
        field(72; "Share Capita Acc"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(73; "Share Capital Date"; Date)
        {
        }
        field(74; "from date"; Date)
        {
        }
        field(75; "to date"; Date)
        {
        }
        field(76; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(77; "Minimum Share Capital"; Decimal)
        {
        }
        field(78; "Max Loans to Guarantee"; Integer)
        {
        }
        field(79; "Income-Deductions Rule"; Decimal)
        {
            DecimalPlaces = 5 : 5;
        }
        field(80; "Reg Fee Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;

            trigger OnValidate()
            begin
                if "Reg Fee Posting Group" <> '' then
                    if CustPost.Get("Reg Fee Posting Group") then begin
                        "Reg Fee Account" := CustPost."Receivables Account";
                        Validate("Reg Fee Account");
                    end;
            end;
        }
        field(81; "Reg Fee Account"; Code[10])
        {
        }
        field(82; "Application Attachments Used"; Boolean)
        {
        }
        field(83; "Send Notification Emails"; Boolean)
        {
        }
        field(84; "Send Notification SMS"; Boolean)
        {
        }
        field(85; "Funeral Expenses G/L"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(86; "Funeral Expenses Amount"; Decimal)
        {
        }
        field(87; "No of Time Shares to Guarantee"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Record)
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

