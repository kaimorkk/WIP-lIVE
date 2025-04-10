Table 52193539 DeductionsL
{
    DataCaptionFields = "Code", Description;
    // //DrillDownPageID = UnknownPage51507372;
    // //LookupPageID = UnknownPage51507372;

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[60])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(6; "Tax deductible"; Boolean)
        {
        }
        field(7; Advance; Boolean)
        {
        }
        field(8; "Start date"; Date)
        {
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; Percentage; Decimal)
        {
        }
        field(11; "Calculation Method"; Option)
        {
            OptionMembers = "Flat Amount","% of Basic Pay","Based on Table","Based on Hourly Rate","Based on Daily Rate ","% of Gross Pay","% of Basic Pay+Hse Allowance";
        }
        field(12; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Flat Amount"; Decimal)
        {
        }
        field(14; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Deduction),
                                                                Code = field(Code),
                                                                "Posting Group Filter" = field("Posting Group Filter"),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Employee No" = field("Employee Filter"),
                                                                "Employee No" = field("Department Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Date Filter"; Date)
        {
        }
        field(16; "Posting Group Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            //TableRelation = Table51004;
        }
        field(17; Loan; Boolean)
        {
        }
        field(18; "Maximum Amount"; Decimal)
        {
        }
        field(19; "Grace period"; DateFormula)
        {
        }
        field(20; "Repayment Period"; DateFormula)
        {
        }
        field(21; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            // //TableRelation = Table39003926;
        }
        field(26; "Pension Scheme"; Boolean)
        {
        }
        field(27; "Deduction Table"; Code[10])
        {
            TableRelation = "Bracket Tables";
        }
        field(28; "G/L Account Employer"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(29; "Percentage Employer"; Decimal)
        {
        }
        field(30; "Minimum Amount"; Decimal)
        {
        }
        field(31; "Flat Amount Employer"; Decimal)
        {
        }
        field(32; "Total Amount Employer"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."Employer Amount" where(Type = const(Deduction),
                                                                           Code = field(Code),
                                                                           "Posting Group Filter" = field("Posting Group Filter"),
                                                                           "Payroll Period" = field("Pay Period Filter"),
                                                                           "Employee No" = field("Employee Filter"),
                                                                           "Employee No" = field("Department Filter")));
            FieldClass = FlowField;
        }
        field(33; "Loan Type"; Option)
        {
            OptionMembers = " ","Low Interest Benefit","Fringe Benefit";
        }
        field(34; "Show Balance"; Boolean)
        {
        }
        field(35; CoinageRounding; Boolean)
        {
        }
        field(36; "Employee Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            // ////TableRelation = "Loans transactions";
        }
        field(37; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."Opening Balance" where(Type = const(Deduction),
                                                                           Code = field(Code),
                                                                           "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(38; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(39; "Balance Mode"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = Increasing," Decreasing";
            ////TableRelation = Table0;
        }
        field(40; "Main Loan Code"; Code[10])
        {
            TableRelation = DeductionsL;
        }
        field(41; Shares; Boolean)
        {
        }
        field(42; "Show on report"; Boolean)
        {
        }
        field(43; "Non-Interest Loan"; Boolean)
        {
        }
        field(44; "Exclude when on Leave"; Boolean)
        {
        }
        field(45; "Co-operative"; Boolean)
        {
        }
        field(46; "Total Shares"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Deduction),
                                                                Code = field(Code),
                                                                "Employee No" = field("Employee Filter"),
                                                                Shares = const(true)));
            FieldClass = FlowField;
        }
        field(47; Rate; Decimal)
        {
        }
        field(48; IsMandatory; Boolean)
        {
        }
        field(49; IsStatutoryDeduction; Boolean)
        {
        }
        field(50; "IsCoop/LnRep"; Boolean)
        {
        }
        field(51; "IsUnion/SalAdvance"; Boolean)
        {
        }
        field(52; Sorting; Integer)
        {
            AutoIncrement = true;
        }
        field(53; Rounding; Boolean)
        {
        }
        field(54; IsProvident; Boolean)
        {
        }
        field(55; StaffBenevolent; Boolean)
        {
        }
        field(56; Insurance; Boolean)
        {
        }
        field(57; StimaInvestment; Boolean)
        {
        }
        field(58; SACCOLoanRepay; Boolean)
        {
        }
        field(59; "SACCOShare Contr"; Boolean)
        {
        }
        field(60; "Customer Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(61; PostingGroup; Code[20])
        {
            TableRelation = "Employee Posting Group".Code;
        }
        field(62; "Loan Product Type"; Code[20])
        {
            // //TableRelation = "Loan Product Types".Code;
        }
        field(63; "New Sacco Member"; Boolean)
        {
        }
        field(64; "New Sacco Type"; Option)
        {
            OptionMembers = ,Deposit,Shares,Insurance,Fee;
        }
        field(65; NHIF; Boolean)
        {
        }
        field(67; "NSSF Vol."; Boolean)
        {
        }
        field(68; NSSF; Boolean)
        {
        }
        field(69; Interest; Boolean)
        {
        }
        field(70; SACCOINTREPAY; Boolean)
        {
        }
        field(71; "BBF SHARES"; Boolean)
        {
        }
        field(72; "INVESTMENT  SHARES"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Show on report")
        {
        }
        key(Key3; "Exclude when on Leave")
        {
        }
        key(Key4; "Co-operative")
        {
        }
        key(Key5; Rate)
        {
        }
        key(Key6; Shares)
        {
        }
        key(Key7; Loan)
        {
        }
        key(Key8; "Customer Posting Group")
        {
        }
        key(Key9; PostingGroup)
        {
        }
    }

    fieldgroups
    {
    }
}

