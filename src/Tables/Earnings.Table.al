Table 52193538 Earnings
{
    DataCaptionFields = "Code", Description;
    // //DrillDownPageID = UnknownPage51507370;
    // //LookupPageID = UnknownPage51507370;

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(2; Description; Text[60])
        {
        }
        field(3; "Pay Type"; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Taxable; Boolean)
        {
        }
        field(7; "Calculation Method"; Option)
        {
            OptionMembers = "Flat amount","% of Basic pay","% of Gross pay","% of Taxable income","% of Basic after tax","Based on Hourly Rate","Based on Daily Rate";
        }
        field(8; "Flat Amount"; Decimal)
        {
        }
        field(9; Percentage; Decimal)
        {
        }
        field(10; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Payment),
                                                                Code = field(Code),
                                                                "Posting Group Filter" = field("Posting Group Filter"),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Employee No" = field("Employee Filter"),
                                                                "Branch Code" = field("Department Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Date Filter"; Date)
        {
        }
        field(13; "Posting Group Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting Groups".Code where("Pay Period Filter" = field("Pay Period Filter"));
        }
        field(14; "Pay Period Filter"; Date)
        {
            ClosingDates = false;
            FieldClass = FlowFilter;
            TableRelation = "Payroll Period";
        }
        field(15; Quarters; Boolean)
        {
        }
        field(16; "Non-Cash Benefit"; Boolean)
        {
        }
        field(17; "Minimum Limit"; Decimal)
        {
        }
        field(18; "Maximum Limit"; Decimal)
        {
        }
        field(19; "Reduces Tax"; Boolean)
        {
        }
        field(20; "Overtime Factor"; Decimal)
        {
        }
        field(21; "Employee Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            ////TableRelation = "Loans transactions";
        }
        field(22; Counter; Integer)
        {
            CalcFormula = count("Assignment Matrix" where("Payroll Period" = field("Pay Period Filter"),
                                                           "Employee No" = field("Employee Filter"),
                                                           Code = field(Code)));
            FieldClass = FlowField;
        }
        field(23; NoOfUnits; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."No. of Units" where(Code = field(Code),
                                                                        "Payroll Period" = field("Pay Period Filter"),
                                                                        "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(24; "Low Interest Benefit"; Boolean)
        {
        }
        field(25; "Show Balance"; Boolean)
        {
        }
        field(26; CoinageRounding; Boolean)
        {
        }
        field(27; OverDrawn; Boolean)
        {
        }
        field(28; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."Opening Balance" where(Type = const(Payment),
                                                                           Code = field(Code),
                                                                           "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(29; OverTime; Boolean)
        {
            FieldClass = Normal;
        }
        field(30; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(31; Months; Decimal)
        {
            Description = 'Used to cater for taxation based on annual bracket eg 1,12 months (the default is 1month) FOR NEPAL';
        }
        field(32; "Show on Report"; Boolean)
        {
        }
        field(33; "Time Sheet"; Boolean)
        {
        }
        field(34; IsMandatory; Boolean)
        {
        }
        field(35; "Is HouseAll/NonPensionable"; Boolean)
        {
        }
        field(36; Sorting; Integer)
        {
            AutoIncrement = true;
        }
        field(37; Arrear; Boolean)
        {
        }
        field(38; "Insurance Relief"; Boolean)
        {
        }
        field(39; "Insurance Relief Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Code = field(Code),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Employee No" = field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(40; Rounding; Boolean)
        {
        }
        field(41; "Posting Group"; Code[10])
        {
            TableRelation = "Employee Posting Group".Code;
        }
        field(60; "Customer Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(61; SalaryAdvance; Boolean)
        {
        }
        field(62; "Negative Salary"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Show on Report")
        {
        }
        key(Key3; OverTime)
        {
        }
        key(Key4; "Time Sheet")
        {
        }
        key(Key5; "Posting Group")
        {
        }
    }

    fieldgroups
    {
    }
}

