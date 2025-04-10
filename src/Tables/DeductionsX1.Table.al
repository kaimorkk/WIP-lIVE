Table 52193839 DeductionsX1
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Deductions listing";
    LookupPageID = "Deductions listing";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
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
            OptionMembers = "Flat Amount","% of Basic Pay","Based on Table","Based on Hourly Rate","Based on Daily Rate ","% of Gross Pay","% of Basic Pay+Hse Allowance","% of Salary Recovery";
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
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = filter(Deduction | "Saving Scheme"),
                                                                   Code = field(Code),
                                                                   "Posting Group Filter" = field("Posting Group Filter"),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Employee No" = field("Employee Filter"),
                                                                   "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                   "Reference No" = field("Reference Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Date Filter"; Date)
        {
        }
        field(16; "Posting Group Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX1";
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
            TableRelation = "Payroll PeriodX1";
        }
        field(26; "Pension Scheme"; Boolean)
        {
        }
        field(27; "Deduction Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx1";
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
            CalcFormula = sum("Assignment Matrix-X1"."Employer Amount" where(Type = const(Deduction),
                                                                              Code = field(Code),
                                                                              "Payroll Period" = field("Pay Period Filter"),
                                                                              "Posting Group Filter" = field("Posting Group Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Employee No" = field("Employee Filter")));
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
            TableRelation = Employee;
        }
        field(37; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1"."Opening Balance" where(Type = const(Deduction),
                                                                              Code = field(Code),
                                                                              "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(38; "Global Dimension 2 Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(39; "Balance Mode"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = Increasing," Decreasing";
            ////TableRelation = Table0;
        }
        field(40; "Main Loan Code"; Code[20])
        {
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
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Deduction),
                                                                   Code = field(Code),
                                                                   "Employee No" = field("Employee Filter"),
                                                                   Shares = const(true)));
            FieldClass = FlowField;
        }
        field(47; Rate; Decimal)
        {
        }
        field(48; "PAYE Code"; Boolean)
        {
        }
        field(49; "Total Days"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50; "Housing Earned Limit"; Decimal)
        {
        }
        field(51; "Pension Limit Percentage"; Decimal)
        {
        }
        field(52; "Pension Limit Amount"; Decimal)
        {
        }
        field(53; "Applies to All"; Boolean)
        {
        }
        field(54; "Show on Master Roll"; Boolean)
        {
        }
        field(55; "Pension Scheme Code"; Boolean)
        {
        }
        field(56; "Main Deduction Code"; Code[10])
        {
        }
        field(57; "Insurance Code"; Boolean)
        {
        }
        field(58; Block; Boolean)
        {
        }
        field(59; "Institution Code"; Code[20])
        {
            TableRelation = Institution1;
        }
        field(60; "Reference Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(61; "Show on Payslip Information"; Boolean)
        {
        }
        field(62; "Voluntary Percentage"; Decimal)
        {
        }
        field(63; "Salary Recovery"; Boolean)
        {
            Description = 'For Paye manual calculation';
        }
        field(64; Gratuity; Boolean)
        {
        }
        field(65; "Gratuity Arrears"; Boolean)
        {
        }
        field(66; Informational; Boolean)
        {
        }
        field(67; Board; Boolean)
        {
        }
        field(68; "Pension Arrears"; Boolean)
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
        key(Key8; "Pension Scheme Code")
        {
        }
        key(Key9; "Institution Code")
        {
        }
    }

    fieldgroups
    {
    }
}

