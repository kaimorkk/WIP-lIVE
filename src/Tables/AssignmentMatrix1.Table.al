Table 52193684 "Assignment Matrix1"
{
    DataCaptionFields = "Employee No", Description;
    DrillDownPageID = "Payment & Deductions";
    LookupPageID = "Payment & Deductions";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee No") then begin
                    "Posting Group Filter" := Empl."Posting Group";
                    "Department Code" := Empl."Global Dimension 1 Code";
                    //"Salary Grade":=Empl."Salary Scheme Category";
                    "Basic Pay" := Empl."Basic Pay";
                    "Posting Group Filter" := Empl."Posting Group";
                    if Empl."Posting Group" = '' then
                        Error('Assign  %1  %2 a posting group before assigning any earning or deduction', Empl."First Name", Empl."Last Name");
                    if Empl.Status <> Empl.Status::Active then
                        Error('Can only assign Earnings and deductions to Active Employees Please confirm if ' + //
                        '%1 %2 is an Active Employee', Empl."First Name", Empl."Last Name");
                end;
            end;
        }
        field(2; Type; Option)
        {
            NotBlank = false;
            OptionMembers = Payment,Deduction,"Saving Scheme",Loan;
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const(Payment)) EarningsX1
            else if (Type = const(Deduction)) DeductionsX1;
            //else if (Type=const(Loan)) "Loan Application1"."Loan No" where ("Employee No"=field("Employee No"));

            trigger OnValidate()
            begin
                GetPayPeriod;
                "Payroll Period" := PayStartDate;
                "Pay Period" := PayPeriodText;

                //*********************Allowances Calculation rules etc***************
                if Type = Type::Payment then begin
                    if Payments.Get(Code) then begin
                        "Time Sheet" := Payments."Time Sheet";
                        Description := Payments.Description;
                        "Non-Cash Benefit" := Payments."Non-Cash Benefit";
                        Quarters := Payments.Quarters;
                        //Paydeduct:=Payments."End Date";
                        Taxable := Payments.Taxable;
                        "Tax Deductible" := Payments."Reduces Tax";
                        if Payments."Pay Type" = Payments."pay type"::Recurring then
                            "Next Period Entry" := true;
                        "Basic Salary Code" := Payments."Basic Salary Code";
                        if Payments."Earning Type" = Payments."earning type"::"Normal Earning" then
                            "Normal Earnings" := true
                        else
                            "Normal Earnings" := false;

                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then
                            Amount := Payments."Flat Amount";

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                Empl.CalcFields(Basic);
                                Amount := Payments.Percentage / 100 * Empl.Basic;


                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic after tax" then begin
                            if Empl.Get("Employee No") then begin
                                HRSetup.Get;
                                if HRSetup."Company overtime hours" <> 0 then
                                    Amount := ("No. of Units" * Empl."Hourly Rate" * Payments."Overtime Factor");//HRSetup."Company overtime hours";
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then begin
                                Amount := "No. of Units" * Empl."Daily Rate";//*Payments."Overtime Factor";
                                if Payments."Overtime Factor" <> 0 then
                                    Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor";

                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;

                        //kugun
                        //insurance relief

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Insurance Amount" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                Empl.CalcFields(Empl.Insurance);
                                //MESSAGE('%1',Empl.Insurance);
                                Amount := Abs((Payments.Percentage / 100) * (Empl.Insurance));
                                // MESSAGE('%1',Amount);
                                Amount := PayrollRounding(Amount);//round
                                                                  // MESSAGE('%1',Amount);
                            end;
                        end;


                        //end


                        if Payments."Calculation Method" = Payments."calculation method"::"% of Gross pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                Empl.CalcFields(Basic, Empl."Total Allowances");
                                Amount := ((Payments.Percentage / 100) * (Empl.Basic + Empl."Total Allowances"));
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Taxable income" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl."Taxable Allowance");
                                Amount := ((Payments.Percentage / 100) * (Empl."Basic Pay" + Empl."Taxable Allowance"));
                                Amount := PayrollRounding(Amount);//round
                                                                  //IF "Value of Quarters">Amount THEN
                                                                  // Amount:="Value of Quarters";
                            end;
                        end;
                        if Payments."Reduces Tax" then begin
                            Amount := -Amount;
                            Amount := PayrollRounding(Amount);//round
                        end;

                    end;
                end;

                //*********Deductions****************************************
                if Type = Type::Deduction then begin
                    if Deductions.Get(Code) then begin

                        Description := Deductions.Description;
                        "G/L Account" := Deductions."G/L Account";
                        "Tax Deductible" := Deductions."Tax deductible";
                        Retirement := Deductions."Pension Scheme";
                        Shares := Deductions.Shares;
                        Paye := Deductions."PAYE Code";
                        "Insurance Code" := Deductions."Insurance Code";
                        "Main Deduction Code" := Deductions."Main Deduction Code";
                        if Deductions.Type = Deductions.Type::Recurring then
                            "Next Period Entry" := true;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            Amount := Deductions."Flat Amount";
                            "Employer Amount" := Deductions."Flat Amount Employer";
                        end;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl.Basic);
                                Amount := Deductions.Percentage / 100 * Empl.Basic;
                                Amount := PayrollRounding(Amount);//round
                                "Employer Amount" := Deductions."Percentage Employer" / 100 * Empl.Basic;
                                "Employer Amount" := PayrollRounding("Employer Amount");//round

                                if Deductions."Maximum Amount" <> 0 then begin
                                    if Abs(Amount) > Deductions."Maximum Amount" then
                                        Amount := Deductions."Maximum Amount";
                                    "Employer Amount" := Deductions."Percentage Employer" / 100 * Empl.Basic;
                                    if "Employer Amount" > Deductions."Maximum Amount" then
                                        "Employer Amount" := Deductions."Maximum Amount";

                                    "Employer Amount" := PayrollRounding("Employer Amount");//round
                                                                                            // Added by Lob

                                end;
                            end;
                            //End of addition

                            if Deductions.CoinageRounding = true then begin
                                //     HRSetup.GET();
                                //     Maxlimit:=HRSetup."Pension Limit Amount";
                                Retirement := Deductions.CoinageRounding;
                                if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then
                                    "Employer Amount" := Deductions.Percentage / 100 * Empl."Basic Pay"
                                else
                                    "Employer Amount" := Deductions."Flat Amount";
                                "Employer Amount" := PayrollRounding("Employer Amount");//round
                            end;

                            //end of uganda requirement addition

                            //  IF "Employer Amount" > Deductions."Maximum Amount" THEN
                            //     "Employer Amount":=Deductions."Maximum Amount";
                            Amount := PayrollRounding(Amount);//round
                            "Employer Amount" := PayrollRounding("Employer Amount");//round
                        end;

                        //added for Uganda requirements
                        // added by Lob vega
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.CalcFields(Empl."Total Allowances");
                                Amount := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances"));
                                "Employer Amount" := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances"));
                                Amount := PayrollRounding(Amount);
                                "Employer Amount" := PayrollRounding("Employer Amount");
                            end;
                        end;
                        //added for BM requirements
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay+Hse Allowance" then begin
                            if Empl.Get("Employee No") then begin
                                //SalarySteps.GET(Empl."Salary Steps",SalarySteps.Level::"Level 1",Empl."Salary Scheme Category");
                                //Amount:=((Deductions.Percentage/100)* (Empl."Basic Pay"+SalarySteps."House allowance"));
                                //"Employer Amount":=((Deductions.Percentage/100)*(Empl."Working Days Per Year"+SalarySteps."House allowance"));
                                Amount := PayrollRounding(Amount);
                                "Employer Amount" := PayrollRounding("Employer Amount");
                            end;
                        end;
                        //
                        if Type = Type::Deduction then
                            Amount := -Amount;

                        //*******New Addition*******************
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                            GetPayPeriod;
                            Empl.Reset;
                            Empl.SetRange(Empl."No.", "Employee No");
                            Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                            Empl.CalcFields(Empl."Total Allowances", Empl.Basic);
                            GetBracket(Deductions."Deduction Table", Empl.Basic);
                            //Empl.CALCFIELDS(Empl."Total Allowances",Empl."Gross pay");
                            //GetBracket(Deductions."Deduction Table",Empl."Gross pay");

                            Amount := -TableAmount;
                        end;


                        //*******Upto here

                    end
                end;
                /*
              //*********Special Deductions.....Loans,Staff welfare,Union Dues etc....Keep track*****
               IF (Type=Type::Deduction) THEN BEGIN
                IF Deductions.GET(Code) THEN
                BEGIN
                IF Deductions.Loan=TRUE THEN BEGIN
                IF Loan.GET(Rec.Code,Rec."Employee No") THEN BEGIN
                     Description:=Deductions.Description;
                     "G/L Account":=Deductions."G/L Account";
                    "Tax Deductible":=Deductions."Tax deductible";
                    "Effective Start Date":=Loan."Repayment Begin Date";
                    "Effective End Date":=Loan."Repayment End Date";
                     {****New addition to take care of compound interest***}
                     Loan.CALCFIELDS(Loan."Cumm. Period Repayments1");
                     ReducedBal:=Loan."Loan Amount"-Loan."Cumm. Period Repayments1";
                     InterestAmt:=Loan."Interest Rate"/(100);
                     InterestAmt:=-ReducedBal*InterestAmt;
                     Amount:=-Loan."Period Repayments"+InterestAmt;
                     "Interest Amount":=InterestAmt;
                     "Period Repayment":=Loan."Period Repayments";
                     {****ENDS HERE*****}
                     "Initial Amount":=Loan."Loan Amount";
                     "Outstanding Amount":=Loan."Loan Amount"+Loan."Amount Paid"+Rec.Amount;
                     "Loan Repay":=TRUE;
                     InterestDiff:=((Loan."External Interest Rate"-Loan."Interest Rate")/(12*100));
                  //**LOW INTEREST RATE CALCULATION
                     IF Deductions."Loan Type"=Deductions."Loan Type"::"Low Interest Benefit" THEN
                     BEGIN
                     Benefits.RESET;
                     //Benefits.SETRANGE(Benefits."Low Interest Benefit",TRUE);
                     IF Benefits.FIND('-') THEN
                                CreateLIBenefit("Employee No",Benefits."Tax Band",ReducedBal)
                      ELSE
                      ERROR('Low Interest Rate Benefit has not been defined in the Earnings Setup please');
                   END;

                   END
                 ELSE
                 ERROR('EMPLOYEE %1  HAS NOT TAKEN THIS TYPE OF LOAN -Loan Code-- %2',"Employee No",Deductions.Code );


                END;

                VALIDATE(Amount);
                END;

                END;
               */

                // Added for Loan deductions

                if (Type = Type::Loan) then begin
                    // LoanApp.Reset;
                    // LoanApp.SetRange(LoanApp."Loan No", Code);
                    // LoanApp.SetRange(LoanApp."Employee No", "Employee No");
                    // if LoanApp.Find('-') then begin
                    //     if LoanProductType.Get(LoanApp."Loan Product Type") then
                    //         Description := LoanProductType.Description;
                    //     Amount := -LoanApp.Repayment;
                    //     Validate(Amount);
                    // end;

                end;


                //**********END**************************************************************************

            end;
        }
        field(5; "Effective Start Date"; Date)
        {
        }
        field(6; "Effective End Date"; Date)
        {
        }
        field(7; "Payroll Period"; Date)
        {
            NotBlank = false;
            TableRelation = "Payroll PeriodX1"."Starting Date";
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;

            trigger OnValidate()
            begin

                if PayPeriod.Get("Payroll Period") then
                    "Pay Period" := PayPeriod.Name;
            end;
        }
        field(8; Amount; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin

                if (Type = Type::Payment) then
                    if Payments.Get(Code) then
                        if Payments."Reduces Tax" then begin
                            //Amount:=-Amount;
                        end;

                if (Type = Type::Deduction) then
                    if Amount > 0 then
                        Amount := -Amount;
                TestField(Closed, false);
                //Added
                if "Loan Repay" = true then begin
                    //  if Loan.Get(Rec.Code,Rec."Employee No") then begin
                    //   Loan.CalcFields(Loan."Cumm. Period Repayments");
                    //   "Period Repayment":=Abs(Amount)+"Interest Amount";
                    //   "Initial Amount":=Loan."Loan Amount";
                    //  // MESSAGE('amount %1  Cul repayment %2',Amount,Loan."Cumm. Period Repayments1");
                    //   "Outstanding Amount":=Loan."Loan Amount"-Loan."Cumm. Period Repayments";
                    //  end;
                end;
                Amount := PayrollRounding(Amount);
            end;
        }
        field(9; Description; Text[80])
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(10; Taxable; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(11; "Tax Deductible"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(12; Frequency; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(13; "Pay Period"; Text[30])
        {
        }
        field(14; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(15; "Basic Pay"; Decimal)
        {
        }
        field(16; "Employer Amount"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(17; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(18; "Next Period Entry"; Boolean)
        {
        }
        field(19; "Posting Group Filter"; Code[10])
        {
            TableRelation = "Dimension Value";

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(20; "Initial Amount"; Decimal)
        {
        }
        field(21; "Outstanding Amount"; Decimal)
        {
        }
        field(22; "Loan Repay"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(23; Closed; Boolean)
        {
            Editable = false;
        }
        field(24; "Salary Grade"; Code[10])
        {
        }
        field(25; "Tax Relief"; Boolean)
        {
        }
        field(26; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(27; "Period Repayment"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(28; "Non-Cash Benefit"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(29; Quarters; Boolean)
        {
        }
        field(30; "No. of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                HRSetup.Get;
                if Type = Type::Payment then begin
                    if Payments.Get(Code) then begin
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic after tax" then begin
                            if Empl.Get("Employee No") then
                                if HRSetup."Company overtime hours" <> 0 then
                                    Amount := (Empl."Hourly Rate" * "No. of Units" * Payments."Overtime Factor");
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Empl."Daily Rate";
                            if Payments."Overtime Factor" <> 0 then
                                Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor"

                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Payments."Total Amount";
                        end;


                    end;
                end;

                //*****Deductions
                if Type = Type::Deduction then begin
                    if Deductions.Get(Code) then begin
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Empl."Hourly Rate"
                        end;

                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Daily Rate " then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Empl."Daily Rate"
                        end;

                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            if Empl.Get("Employee No") then
                                Amount := -"No. of Units" * Deductions."Flat Amount";
                        end;

                    end;
                end;
                TestField(Closed, false);
            end;
        }
        field(31; Section; Code[10])
        {
        }
        field(33; Retirement; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(34; CFPay; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(35; BFPay; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(36; "Opening Balance"; Decimal)
        {

            trigger OnValidate()
            begin

                if (Type = Type::Deduction) then
                    if "Opening Balance" > 0 then
                        "Opening Balance" := -"Opening Balance";
                TestField(Closed, false);
            end;
        }
        field(37; DebitAcct; Code[10])
        {
        }
        field(38; CreditAcct; Code[10])
        {
        }
        field(39; Shares; Boolean)
        {
        }
        field(40; "Show on Report"; Boolean)
        {
        }
        field(41; "Earning/Deduction Type"; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(42; "Time Sheet"; Boolean)
        {
        }
        field(43; "Basic Salary Code"; Boolean)
        {
        }
        field(44; "Payroll Group"; Code[20])
        {
            TableRelation = "Employee Posting GroupX1".Code;
        }
        field(45; Paye; Boolean)
        {
        }
        field(46; "Taxable amount"; Decimal)
        {
        }
        field(47; "Less Pension Contribution"; Decimal)
        {
        }
        field(48; "Monthly Personal Relief"; Decimal)
        {
        }
        field(49; "Normal Earnings"; Boolean)
        {
            Editable = false;
        }
        field(50; "Monthly Self Contribution"; Decimal)
        {
        }
        field(51; "Monthly Self Cummulative"; Decimal)
        {
        }
        field(52; "Company Monthly Contribution"; Decimal)
        {
        }
        field(53; "Company Cummulative"; Decimal)
        {
        }
        field(54; "Main Deduction Code"; Code[10])
        {
        }
        field(55; "Opening Balance Company"; Decimal)
        {
        }
        field(56; "Insurance Code"; Boolean)
        {
        }
        field(57; "Reference No"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", Type, "Code", "Payroll Period", "Department Code", "Reference No")
        {
            Clustered = true;
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key2; "Employee No", Taxable, "Tax Deductible", Retirement)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key3; Type, "Code", "Posting Group Filter")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key4; "Non-Cash Benefit")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key5; Quarters)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key6; "Non-Cash Benefit", Taxable)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key7; Type, Retirement)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key8; "Department Code", "Payroll Period", "Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key9; "Employee No", Shares)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key10; Closed, "Code", Type, "Employee No")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key11; "Show on Report")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key12; "Employee No", "Code", "Payroll Period", "Next Period Entry")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key13; "Opening Balance")
        {
        }
        key(Key14; "Department Code", "Payroll Period", Type, "Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key15; "Basic Salary Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key16; Paye)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key17; "Employee No", "Payroll Period", Type, "Non-Cash Benefit", "Normal Earnings")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key18; "Posting Group Filter")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount";
        }
        key(Key19; "Payroll Period", Type, "Code")
        {
            SumIndexFields = Amount;
        }
        key(Key20; Type, "Employee No", "Payroll Period", "Insurance Code")
        {
            SumIndexFields = Amount;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestField(Closed, false);
    end;

    trigger OnModify()
    begin
        TestField(Closed, false);
    end;

    var
        Payments: Record EarningsX1;
        Deductions: Record DeductionsX1;
        Paydeduct: Decimal;
        Empl: Record Employee;
        PayPeriod: Record "Payroll PeriodX1";
        // Loan: Record "Loans transactionsX1";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        TableAmount: Decimal;
        Basic: Decimal;
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        HRSetup: Record "Human Resources Setup";
        Maxlimit: Decimal;
        Benefits: Record BracketsX1;
        InterestDiff: Decimal;
        SalarySteps: Record "Assignment Matrix-X1";
        // LoanProductType: Record "Loan Product Type1";
        // LoanApp: Record "Loan Application1";
        "reference no": Record "Assignment Matrix-X1";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;


    procedure GetBracket(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX1;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin

            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay <= BracketTable."Upper Limit")) then
                    TableAmount := BracketTable.Amount;
            until BracketTable.Next = 0;
        end
        else
            Message('The Brackets have not been defined');
    end;


    procedure CreateLIBenefit(var Employee: Code[10]; var BenefitCode: Code[10]; var ReducedBalance: Decimal)
    var
        PaymentDeduction: Record "Assignment Matrix-X1";
        Payrollmonths: Record "Payroll PeriodX1";
        allowances: Record EarningsX1;
    begin
        PaymentDeduction.Init;
        PaymentDeduction."Employee No" := Employee;
        PaymentDeduction.Code := BenefitCode;
        PaymentDeduction.Type := PaymentDeduction.Type::Payment;
        PaymentDeduction."Payroll Period" := PayStartDate;
        PaymentDeduction.Amount := ReducedBalance * InterestDiff;
        PaymentDeduction."Non-Cash Benefit" := true;
        PaymentDeduction.Taxable := true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
            PaymentDeduction.Description := allowances.Description;
        PaymentDeduction.Insert;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;
}

