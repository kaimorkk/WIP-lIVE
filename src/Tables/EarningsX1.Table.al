Table 52193838 EarningsX1
{
    DataCaptionFields = "Code",Description;
    DrillDownPageID = "Earnings Listing";
    LookupPageID = "Earnings Listing";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Pay Type";Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(4;"Start Date";Date)
        {
        }
        field(5;"End Date";Date)
        {
        }
        field(6;Taxable;Boolean)
        {
        }
        field(7;"Calculation Method";Option)
        {
            OptionMembers = "Flat amount","% of Basic pay","% of Gross pay","% of Insurance Amount","% of Taxable income","% of Basic after tax","Based on Hourly Rate","Based on Daily Rate","% of Salary Recovery","% of Loan Amount";
        }
        field(8;"Flat Amount";Decimal)
        {
        }
        field(9;Percentage;Decimal)
        {
            DecimalPlaces = 2:4;
        }
        field(10;"G/L Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11;"Total Amount";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where (Type=const(Payment),
                                                                   Code=field(Code),
                                                                   "Posting Group Filter"=field("Posting Group Filter"),
                                                                   "Payroll Period"=field("Pay Period Filter"),
                                                                   "Employee No"=field("Employee Filter"),
                                                                   "Global Dimension 1 code"=field("Global Dimension 1 Filter"),
                                                                   "Global Dimension 1 code"=field("Global Dimension 2 Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"Date Filter";Date)
        {
        }
        field(13;"Posting Group Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX1";
        }
        field(14;"Pay Period Filter";Date)
        {
            ClosingDates = false;
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX1";
        }
        field(15;Quarters;Boolean)
        {
        }
        field(16;"Non-Cash Benefit";Boolean)
        {
        }
        field(17;"Minimum Limit";Decimal)
        {
        }
        field(18;"Maximum Limit";Decimal)
        {
        }
        field(19;"Reduces Tax";Boolean)
        {
        }
        field(20;"Overtime Factor";Decimal)
        {
        }
        field(21;"Employee Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX1";
        }
        field(22;Counter;Integer)
        {
            CalcFormula = count("Assignment Matrix-X1" where ("Payroll Period"=field("Pay Period Filter"),
                                                              "Employee No"=field("Employee Filter"),
                                                              Code=field(Code)));
            FieldClass = FlowField;
        }
        field(23;NoOfUnits;Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1"."No. of Units" where (Code=field(Code),
                                                                           "Payroll Period"=field("Pay Period Filter"),
                                                                           "Employee No"=field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(24;"Low Interest Benefit";Boolean)
        {
        }
        field(25;"Show Balance";Boolean)
        {
        }
        field(26;CoinageRounding;Boolean)
        {
        }
        field(27;OverDrawn;Boolean)
        {
        }
        field(28;"Opening Balance";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1"."Opening Balance" where (Type=const(Payment),
                                                                              Code=field(Code),
                                                                              "Employee No"=field("Employee Filter")));
            FieldClass = FlowField;
        }
        field(29;OverTime;Boolean)
        {
            FieldClass = Normal;
        }
        field(30;"Global Dimension 1 Filter";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(31;Months;Decimal)
        {
            Description = 'Used to cater for taxation based on annual bracket eg 1,12 months (the default is 1month) FOR NEPAL';
        }
        field(32;"Show on Report";Boolean)
        {
        }
        field(33;"Time Sheet";Boolean)
        {
        }
        field(34;"Total Days";Decimal)
        {
            FieldClass = Normal;
        }
        field(35;"Total Hrs";Decimal)
        {
            FieldClass = Normal;
        }
        field(36;Weekend;Boolean)
        {
        }
        field(37;Weekday;Boolean)
        {
        }
        field(38;"Basic Salary Code";Boolean)
        {
        }
        field(39;"Default Enterprise";Code[10])
        {
        }
        field(40;"Default Activity";Code[10])
        {
        }
        field(41;"ProRata Leave";Boolean)
        {
        }
        field(42;"Earning Type";Option)
        {
            OptionMembers = "Normal Earning","Owner Occupier","Home Savings","Low Interest","Tax Relief","Insurance Relief";
        }
        field(43;"Applies to All";Boolean)
        {
        }
        field(44;"Show on Master Roll";Boolean)
        {
        }
        field(45;"House Allowance Code";Boolean)
        {
        }
        field(46;"Responsibility Allowance Code";Boolean)
        {
        }
        field(47;"Commuter Allowance Code";Boolean)
        {
        }
        field(48;Block;Boolean)
        {
        }
        field(49;"Basic Pay Arrears";Boolean)
        {
        }
        field(50;"Market Rate";Decimal)
        {
            DecimalPlaces = 2:5;
        }
        field(51;"Company Rate";Decimal)
        {
            DecimalPlaces = 2:5;
        }
        field(52;Fringe;Boolean)
        {
        }
        field(53;"Salary Recovery";Boolean)
        {
            Description = 'For PAYE Manual calculation';
        }
        field(54;"Loan Code";Code[20])
        {
        }
        field(55;"Global Dimension 2 Filter";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
        key(Key2;"Show on Report")
        {
        }
        key(Key3;OverTime)
        {
        }
        key(Key4;"Time Sheet")
        {
        }
        key(Key5;"Earning Type")
        {
        }
        key(Key6;"House Allowance Code")
        {
        }
        key(Key7;"Responsibility Allowance Code")
        {
        }
        key(Key8;"Commuter Allowance Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        AssignmentMat.Reset;
        AssignmentMat.SetRange(AssignmentMat.Type,AssignmentMat.Type::Payment);
        AssignmentMat.SetRange(AssignmentMat.Code,Code);
        if AssignmentMat.Find('+') then
        Error('You cannot delete this earning because it has entries');
    end;

    var
        AssignmentMat: Record "Assignment Matrix-X1";
}

