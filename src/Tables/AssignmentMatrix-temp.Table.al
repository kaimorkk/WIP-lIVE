Table 52193551 "Assignment Matrix-temp"
{
    DataCaptionFields = "Employee No", Description;
    // DrillDownPageID = "Trial xxxxxxx";
    // LookupPageID = "Trial xxxxxxx";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            NotBlank = true;
            TableRelation = "Employee Payroll";

            trigger OnValidate()
            begin
                if Empl.Get("Employee No") then begin
                    "Posting Group Filter" := Empl."Posting Group";
                    "Department Code" := Empl."Branch  Code";
                    "Salary Grade" := Empl."Salary Type";
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
            OptionMembers = Payment,Deduction,"Saving Scheme";
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const(Payment)) Earnings where("Pay Type" = field("Earning/Deduction Type"))
            else if (Type = const(Deduction)) DeductionsL where(Type = field("Earning/Deduction Type"));

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
                        Paydeduct := Payments.Percentage;
                        Taxable := Payments.Taxable;
                        "Tax Deductible" := Payments."Reduces Tax";
                        "Effective Start Date" := Payments."Start Date";
                        "Effective End Date" := Payments."End Date";
                        if Payments."Pay Type" = Payments."pay type"::Recurring then
                            "Next Period Entry" := true;
                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then
                            Amount := Payments."Flat Amount";

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Basic pay" then begin
                            if Empl.Get("Employee No") then begin
                                Amount := Payments.Percentage / 100 * Empl."Basic Pay";
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then begin
                                HRSetup.Get;
                                if HRSetup."Company overtime hours" <> 0 then
                                    Amount := ("No. of Units" * Empl."Hourly Rate" * Payments."Overtime Factor");//HRSetup."Company overtime hours";
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Daily Rate" then begin
                            if Empl.Get("Employee No") then begin
                                Amount := "No. of Units" * Empl."Daily Rate";//*Payments."Overtime Factor";
                                if Payments."Overtime Factor" <> 0 then
                                    Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor";

                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;



                        if Payments."Calculation Method" = Payments."calculation method"::"% of Gross pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.CalcFields(Empl."Total Allowances");
                                Amount := ((Payments.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances"));
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Calculation Method" = Payments."calculation method"::"% of Taxable income" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.SetRange("Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl."Taxable Allowance");
                                Amount := ((Payments.Percentage / 100) * (Empl."Basic Pay" + Empl."Taxable Allowance"));
                                Amount := PayrollRounding(Amount);//round
                                                                  //  IF "Value of Quarters">Amount THEN
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
                        Paydeduct := Deductions.Percentage;
                        "Tax Deductible" := Deductions."Tax deductible";
                        "Effective Start Date" := Deductions."Start date";
                        "Effective End Date" := Deductions."End Date";
                        Retirement := Deductions."Pension Scheme";
                        Shares := Deductions.Shares;
                        if Deductions.Type = Deductions.Type::Recurring then
                            "Next Period Entry" := true;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            Amount := -Deductions."Flat Amount";
                            "Employer Amount" := Deductions."Flat Amount Employer";
                        end;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then begin
                            if Empl.Get("Employee No") then begin
                                Amount := Paydeduct / 100 * Empl."Basic Pay";
                                Amount := PayrollRounding(Amount);//round
                            end;
                            /* // Added By Lob
                             IF Deductions."Maximum Amount"<> 0 THEN BEGIN
                             // End of addition
                             IF Amount > Deductions."Maximum Amount" THEN
                                Amount:=Deductions."Maximum Amount";
                             "Employer Amount":=Deductions."Percentage Employer"/100*Empl."Basic Pay";
                             "Employer Amount":=PayrollRounding("Employer Amount");//round
                             // Added by Lob
                             END;
                             //End of addition
                            */
                            if Deductions."Pension Scheme" = true then begin
                                //     HRSetup.GET();
                                //     Maxlimit:=HRSetup."Pension Limit Amount";
                                Retirement := Deductions."Pension Scheme";
                                if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then
                                    "Employer Amount" := Deductions."Percentage Employer" / 100 * Empl."Basic Pay"
                                else
                                    "Employer Amount" := Deductions."Flat Amount Employer";
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
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Gross Pay" then begin
                            if Empl.Get("Employee No") then begin
                                Empl.CalcFields(Empl."Total Allowances");
                                Amount := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + Empl."Total Allowances"));
                                "Employer Amount" := ((Deductions."Percentage Employer" / 100) * (Empl."Basic Pay" + Empl."Total Allowances"));
                                Amount := PayrollRounding(Amount);
                                "Employer Amount" := PayrollRounding("Employer Amount");
                            end;
                        end;
                        //added for BM requirements
                        if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay+Hse Allowance" then begin
                            if Empl.Get("Employee No") then begin
                                SalarySteps.Get(Empl."Salary Steps", SalarySteps.Level::"Level 1", Empl."Salary Scheme Category");
                                Amount := ((Deductions.Percentage / 100) * (Empl."Basic Pay" + SalarySteps."House allowance"));
                                "Employer Amount" := ((Deductions."Percentage Employer" / 100) * (Empl."Basic Pay" + SalarySteps."House allowance"));
                                Amount := PayrollRounding(Amount);
                                "Employer Amount" := PayrollRounding("Employer Amount");
                            end;
                        end;
                        //
                        if Type = Type::Deduction then
                            Amount := -Amount;

                        //*******New Addition*******************
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                            if Empl.Get("Employee No") then
                                GetBracket(Deductions."Deduction Table", Empl."Basic Pay");
                            Rec.Amount := -TableAmount;
                        end;


                        //*******Upto here

                    end
                end;
                //*********Special Deductions.....Loans,Staff welfare,Union Dues etc....Keep track*****
                if (Type = Type::Deduction) then begin
                    if Deductions.Get(Code) then begin
                        if Deductions.Loan = true then begin
                            // if Loan.Get(Rec.Code, Rec."Employee No") then begin
                            //     Description := Deductions.Description;
                            //     Paydeduct := Deductions.Percentage;
                            //     "Tax Deductible" := Deductions."Tax deductible";
                            //     "Effective Start Date" := Loan."Repayment Begin Date";
                            //     "Effective End Date" := Loan."Repayment End Date";
                            //     /*****New addition to take care of compound interest****/
                            //     Loan.CalcFields(Loan."Cumm. Period Repayments1");
                            //     ReducedBal := Loan."Loan Amount" - Loan."Cumm. Period Repayments1";
                            //     InterestAmt := Loan."Interest Rate" / (100);
                            //     InterestAmt := -ReducedBal * InterestAmt;
                            //     Amount := -Loan."Period Repayments" + InterestAmt;
                            //     "Interest Amount" := InterestAmt;
                            //     "Period Repayment" := Loan."Period Repayments";
                            //     /*****ENDS HERE******/
                            //     "Initial Amount" := Loan."Loan Amount";
                            //     "Outstanding Amount" := Loan."Loan Amount" + Loan."Amount Paid" + Rec.Amount;
                            //     "Loan Repay" := true;
                            //     InterestDiff := ((Loan."External Interest Rate" - Loan."Interest Rate") / (12 * 100));
                            //     //**LOW INTEREST RATE CALCULATION
                            //     if Deductions."Loan Type" = Deductions."loan type"::"Low Interest Benefit" then begin
                            //         Benefits.Reset;
                            //         Benefits.SetRange(Benefits."Low Interest Benefit", true);
                            //         if Benefits.Find('-') then
                            //             CreateLIBenefit("Employee No", Benefits.Code, ReducedBal)
                            //         else
                            //             Error('Low Interest Rate Benefit has not been defined in the Earnings Setup please');
                            //     end;

                            // end
                            // else
                            //     Error('EMPLOYEE %1  HAS NOT TAKEN THIS TYPE OF LOAN -Loan Code-- %2', "Employee No", Deductions.Code);
                        end;


                    end;
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
            TableRelation = "Payroll Period"."Starting Date";
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
                            Amount := -Amount;
                        end;

                if (Type = Type::Deduction) then
                    if Amount > 0 then
                        Amount := -Amount;
                TestField(Closed, false);
                //Added
                if "Loan Repay" = true then begin
                    // if Loan.Get(Rec.Code, Rec."Employee No") then begin
                    //     Loan.CalcFields(Loan."Cumm. Period Repayments");
                    //     "Period Repayment" := Abs(Amount) + "Interest Amount";
                    //     "Initial Amount" := Loan."Loan Amount";
                    //     // MESSAGE('amount %1  Cul repayment %2',Amount,Loan."Cumm. Period Repayments1");
                    //     "Outstanding Amount" := Loan."Loan Amount" - Loan."Cumm. Period Repayments";
                    // end;
                end;
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(18; "Next Period Entry"; Boolean)
        {
        }
        field(19; "Posting Group Filter"; Code[10])
        {
            TableRelation = "Employee Posting Group";

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
                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                            if Empl.Get("Employee No") then
                                if HRSetup."Company overtime hours" <> 0 then
                                    //MESSAGE('%1---%2---%3--%4',"No. of Units",Empl."Hourly Rate",Payments."Overtime Factor",HRSetup."Company overtime hours");
                                    Amount := (Empl."Hourly Rate" * "No. of Units" * Payments."Overtime Factor");
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Based on Daily Rate" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Empl."Daily Rate";
                            if Payments."Overtime Factor" <> 0 then
                                Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor"

                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then begin
                            if Empl.Get("Employee No") then
                                Amount := "No. of Units" * Payments."Flat Amount";
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
            TableRelation = Sections;
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
    }

    keys
    {
        key(Key1; "Employee No", Type, "Code", "Payroll Period", "Department Code")
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
        Payments: Record Earnings;
        Deductions: Record DeductionsL;
        Paydeduct: Decimal;
        Empl: Record "Employee Payroll";
        PayPeriod: Record "Payroll Period";
        //Loan: Record "Loans transactions";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        TableAmount: Decimal;
        Basic: Decimal;
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        HRSetup: Record "Human Resources Setup";
        Maxlimit: Decimal;
        Benefits: Record Earnings;
        InterestDiff: Decimal;
        SalarySteps: Record "Salary Steps";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;


    procedure GetBracket(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record Brackets;
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
        PaymentDeduction: Record "Assignment Matrix";
        Payrollmonths: Record "Payroll Period";
        allowances: Record Earnings;
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

