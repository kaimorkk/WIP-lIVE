Table 52193489 "Account Types"
{
    DrillDownPageID = "Account Types List";
    LookupPageID = "Account Types List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = false;
        }
        field(2; Description; Text[50])
        {
        }
        field(4; "Minimum Balance"; Decimal)
        {
        }
        field(5; "Closure Fee"; Decimal)
        {
        }
        field(6; "Fee Below Minimum Balance"; Decimal)
        {
        }
        field(7; "Dormancy Period (M)"; DateFormula)
        {
        }
        field(8; "Interest Calc Min Balance"; Decimal)
        {
        }
        field(9; "Interest Calculation Method"; Code[30])
        {
        }
        field(13; "Earns Interest"; Boolean)
        {
        }
        field(14; "Interest Rate"; Decimal)
        {
        }
        field(15; "Withdrawal Interval"; DateFormula)
        {
        }
        field(17; "Business Acc Service Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(18; "Personal Acc Maintenence Fee"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(19; "Minimum Interest Period (M)"; DateFormula)
        {
        }
        field(20; "Requires Closure Notice"; Boolean)
        {
        }
        field(21; "Transfer Fee"; Decimal)
        {
        }
        field(22; "Pass Book Fee"; Decimal)
        {
        }
        field(23; "Withdrawal Penalty"; Decimal)
        {
            Description = 'Charged on withdrawing more than the interval period';
        }
        field(24; "Salary Processing Fee"; Decimal)
        {
        }
        field(25; "Loan Application Fee"; Decimal)
        {
        }
        field(26; "Maximum Withdrawal Amount"; Decimal)
        {
        }
        field(31; "Max Period For Acc Topup (M)"; DateFormula)
        {
        }
        field(32; "Non Staff Loan Security(%)"; Decimal)
        {
        }
        field(33; "Staff Loan Security(%)"; Decimal)
        {
        }
        field(34; "Maximum Allowable Deposit"; Decimal)
        {
        }
        field(35; "Entered By"; Code[30])
        {
        }
        field(36; "Date Entered"; Date)
        {
        }
        field(37; "Time Entered"; Time)
        {
        }
        field(39; "Fixed Deposit Type"; Code[30])
        {
            // //TableRelation = Table53026;
        }
        field(40; "Last Date Modified"; Date)
        {
        }
        field(41; "Modified By"; Text[30])
        {
        }
        field(43; "Reject App. Pending Period"; DateFormula)
        {
        }
        field(44; "Maintenence Duration"; DateFormula)
        {
        }
        field(45; "Fixed Deposit"; Boolean)
        {
        }
        field(46; "Overdraft Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(47; "Charge Closure Before Maturity"; Decimal)
        {
        }
        field(48; "Posting Group"; Code[10])
        {
            Caption = 'Vendor Posting Group';
            TableRelation = "Vendor Posting Group";
        }
        field(49; "Account No Prefix"; Code[10])
        {
        }
        field(50; "Interest Expense Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(51; "Interest Payable Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(52; "Requires Opening Deposit"; Boolean)
        {
        }
        field(53; "Interest Forfeited Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(54; "Allow Loan Applications"; Boolean)
        {
        }
        field(55; "Closing Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(56; "Min Bal. Calc Frequency"; DateFormula)
        {
        }
        field(57; "SMS Description"; Text[150])
        {
        }
        field(58; "Authorised Ovedraft Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(59; "Fee bellow Min. Bal. Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(60; "Withdrawal Interval Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(61; "No. Series"; Code[20])
        {
        }
        field(62; "Ending Series"; Code[10])
        {
        }
        field(63; "Account Openning Fee"; Decimal)
        {
        }
        field(64; "Account Openning Fee Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(65; "Re-activation Fee"; Decimal)
        {
        }
        field(66; "Re-activation Fee Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(67; "Standing Orders Suspense"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(68; "Closing Prior Notice Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(69; "Closure Notice Period"; DateFormula)
        {
        }
        field(70; "Bankers Cheque Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(71; "Tax On Interest"; Decimal)
        {
        }
        field(72; "Interest Tax Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(73; "External EFT Charges"; Decimal)
        {
        }
        field(74; "Internal EFT Charges"; Decimal)
        {
        }
        field(75; "EFT Charges Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(76; "EFT Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(77; Branch; Code[20])
        {
        }
        field(78; "Statement Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(80; "Quarterly Ledger Fees"; Decimal)
        {
        }
        field(81; "Ledger Fees Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(82; "Don't Allow Transactions"; Boolean)
        {
        }
        field(83; Type; Option)
        {
            OptionCaption = ' ,Savings,Thala boliba,Fixed Deposit,Molula-Qhooa,Membership';
            OptionMembers = " ",Savings,"Thala boliba","Fixed Deposit","Molula-Qhooa",Membership;
        }
        field(84; "Check Off Recovery"; Boolean)
        {
        }
        field(85; "RTGS Charges"; Decimal)
        {
        }
        field(86; "RTGS Charges Account"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(87; "Allow Overdraft"; Boolean)
        {
        }
        field(88; "Salaries / Wages Processing"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(89; "Cheque Requisition"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(90; "Coin Deposit Charge"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(91; "Coin Deposit Minimum Amount"; Decimal)
        {
        }
        field(92; "Coin Deposit Flat Charge"; Decimal)
        {
        }
        field(93; "Cheque Leaf  Requisition"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(94; "Charge Monthly Service Fee"; Boolean)
        {
        }
        field(95; "Interest Receivable"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(96; "Investment Account"; Boolean)
        {
        }
        field(97; "Savings Withdrawal penalty"; Decimal)
        {
        }
        field(98; "Savings Penalty Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(99; "Loan Letter of Guarantee Charg"; Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(100; "Min Amount on Tax Interest"; Decimal)
        {
        }
        field(101; "Interest Capitalization Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
            SumIndexFields = "Minimum Balance";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            //   FosaSetup.Get;
            //   FosaSetup.TestField(FosaSetup."Account Types Nos.");
            //   NoSeriesMgt.InitSeries(FosaSetup."Account Types Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;


        "Last Date Modified" := Today;
        "Modified By" := UserId;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        "Modified By" := UserId;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
        "Modified By" := UserId;
    end;

    var
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        //FosaSetup: Record UnknownRecord51507702;
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

