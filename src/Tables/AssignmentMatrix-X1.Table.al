Table 52193842 "Assignment Matrix-X1"
{
    DataCaptionFields = "Employee No", Description;
    DrillDownPageID = "Payment & Deductions Non";
    LookupPageID = "Payment & Deductions Non";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Empl.Get("Employee No") then begin
                    if Empl."Posting Group" <> 'BOARD' then begin
                        Empl.TestField("Global Dimension 1 Code");
                        Empl.TestField("Global Dimension 2 Code");
                    end;
                    "Global Dimension 1 code" := Empl."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Empl."Global Dimension 2 Code";
                    "Posting Group Filter" := Empl."Posting Group";
                    // "Global Dimension 1 code":=Empl."Global Dimension 1 Code";
                    //"Salary Grade":=Empl."Salary Scheme Category";
                    "Salary Pointer" := Empl.Present;
                    "Basic Pay" := Empl."Basic Pay";
                    // "Posting Group Filter":=Empl."Posting Group";
                    if Empl."Posting Group" = '' then
                        Error('Assign  %1  %2 a posting group before assigning any earning or deduction', Empl."First Name", Empl."Last Name");
                end;
            end;
        }
        field(2; Type; Option)
        {
            NotBlank = false;
            OptionMembers = Payment,Deduction,"Saving Scheme",Loan,Informational;
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const(Payment)) EarningsX1
            else if (Type = const(Deduction)) DeductionsX1;
            // else if (Type=const(Loan)) "Loan Application1"."Loan No" where ("Employee No"=field("Employee No"));

            trigger OnValidate()
            var
                MarketIntRateRec: Record "Market Intrest Rates";
                MarketIntRate: Decimal;
                InterestRate: Decimal;
                // LoanApplicationRec: Record "Loan Application1";
                // LoanTopupRec: Record "Loan Top-up";
                LoanBalance: Decimal;
                RepSchedule: Record "Repayment Schedule1";
            begin
                TestField("Employee No");
                if Empl.Get("Employee No") then begin
                    if Empl.Status <> Empl.Status::Active then
                        Error('Can only assign Earnings and deductions to Active Employees Please confirm if ' + //
                        '%1 %2 is an Active Employee', Empl."First Name", Empl."Last Name");
                end;

                GetPayPeriod;
                "Payroll Period" := PayStartDate;
                "Pay Period" := PayPeriodText;
                // RESET;
                //*********************Allowances Calculation rules etc***************
                case Type of
                    Type::Payment:
                        begin
                            if Payments.Get(Code) then begin
                                // check if blocked
                                if Payments.Block = true then
                                    Error(' Earning Blocked');
                                "Time Sheet" := Payments."Time Sheet";
                                Description := Payments.Description;
                                if Payments."Earning Type" = Payments."earning type"::"Tax Relief" then
                                    "Tax Relief" := true;

                                "Non-Cash Benefit" := Payments."Non-Cash Benefit";
                                Quarters := Payments.Quarters;
                                //Paydeduct:=Payments."End Date";
                                Taxable := Payments.Taxable;
                                // MESSAGE('Taxable=%1',Taxable);
                                "Tax Deductible" := Payments."Reduces Tax";
                                if Payments."Pay Type" = Payments."pay type"::Recurring then
                                    "Next Period Entry" := true;
                                "Basic Salary Code" := Payments."Basic Salary Code";
                                "Basic Pay Arrears" := Payments."Basic Pay Arrears";
                                if Payments."Earning Type" = Payments."earning type"::"Normal Earning" then
                                    "Normal Earnings" := true
                                else
                                    "Normal Earnings" := false;

                                if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then
                                    Amount := Payments."Flat Amount";


                                if Payments."Calculation Method" = Payments."calculation method"::"% of Basic pay" then begin
                                    if Empl.Get("Employee No") then begin
                                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                        Empl.CalcFields(Basic, Empl."Basic Arrears");
                                        //MESSAGE('Basic=%1 and Basic arrears =%2',Empl.Basic,Empl."Basic Arrears");
                                        Amount := Payments.Percentage / 100 * (Empl.Basic - Empl."Basic Arrears");
                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";

                                        Amount := PayrollRounding(Amount);//round
                                    end;
                                end;

                                // END;


                                if Payments."Calculation Method" = Payments."calculation method"::"% of Basic after tax" then begin
                                    if Empl.Get("Employee No") then begin
                                        HRSetup.Get;
                                        if HRSetup."Company overtime hours" <> 0 then
                                            Amount := ("No. of Units" * Empl."Hourly Rate" * Payments."Overtime Factor");//HRSetup."Company overtime hours";

                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";

                                        Amount := PayrollRounding(Amount);//round
                                    end;
                                end;

                                if Payments."Calculation Method" = Payments."calculation method"::"Based on Hourly Rate" then begin
                                    if Empl.Get("Employee No") then begin
                                        Amount := "No. of Units" * Empl."Daily Rate";//*Payments."Overtime Factor";
                                        if Payments."Overtime Factor" <> 0 then
                                            Amount := "No. of Units" * Empl."Daily Rate" * Payments."Overtime Factor";

                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";


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
                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";


                                        Amount := PayrollRounding(Amount);//round
                                                                          // MESSAGE('%1',Amount);
                                    end;
                                end;

                                //Calculate Fringe Benefit
                                // if Payments."Calculation Method" = Payments."calculation method"::"% of Loan Amount" then begin

                                //     if Payments.Fringe = true then begin
                                //         //Get The Interest Rate;

                                //         LoanBalance := 0;
                                //         LoanProductType.Reset;
                                //         LoanProductType.SetRange(LoanProductType."Fringe Benefit Code", Code);
                                //         if LoanProductType.Find('-') then begin

                                //             MarketIntRateRec.Reset;
                                //             MarketIntRateRec.SetRange("Loan Code", LoanProductType.Code);
                                //             MarketIntRateRec.SetFilter("Start Date", '<=%1', "Payroll Period");
                                //             MarketIntRateRec.SetFilter("End Date", '>=%1', "Payroll Period");
                                //             if MarketIntRateRec.Find('-') then
                                //                 MarketIntRate := MarketIntRateRec.Intrest;
                                //             InterestRate := LoanProductType."Interest Rate";
                                //             InterestRate := PayrollRounding(InterestRate);
                                //             //  MESSAGE('%3\MR=%1\IR=%2',MarketIntRate,InterestRate,LoanProductType.Description);
                                //             //Get the Loan Balance;
                                //             case LoanProductType."Interest Calculation Method" of
                                //                 LoanProductType."interest calculation method"::"Flat Rate":
                                //                     begin
                                //                         case LoanProductType."Calculate On" of
                                //                             LoanProductType."calculate on"::"Closing Balance":
                                //                                 begin
                                //                                     LoanApplicationRec.Reset;
                                //                                     LoanApplicationRec.SetRange(LoanApplicationRec."Date filter", 0D, "Payroll Period");
                                //                                     LoanApplicationRec.SetRange("Deduction Code", LoanProductType."Deduction Code");
                                //                                     LoanApplicationRec.SetRange("Employee No", "Employee No");
                                //                                     LoanApplicationRec.SetFilter("Stop Loan", '<>%1', true);
                                //                                     if LoanApplicationRec.Find('-') then begin
                                //                                         LoanApplicationRec.CalcFields(LoanApplicationRec."Total Repayment", LoanApplicationRec."Total Loan");
                                //                                         if LoanApplicationRec."Total Loan" <> 0 then begin
                                //                                             LoanTopupRec.Reset;
                                //                                             LoanTopupRec.SetCurrentkey("Loan No", "Payroll Period");
                                //                                             LoanTopupRec.SetRange("Loan No", LoanApplicationRec."Loan No");
                                //                                             LoanTopupRec.SetRange("Payroll Period", 0D, "Payroll Period");
                                //                                             LoanTopupRec.CalcSums(Amount);
                                //                                             LoanBalance := LoanTopupRec.Amount + LoanApplicationRec."Total Repayment";
                                //                                         end else
                                //                                             LoanBalance := LoanApplicationRec."Approved Amount" + LoanApplicationRec."Total Repayment";

                                //                                     end;
                                //                                 end;
                                //                             LoanProductType."calculate on"::"Opening Balance":
                                //                                 begin
                                //                                     LoanApplicationRec.Reset;
                                //                                     LoanApplicationRec.SetRange(LoanApplicationRec."Date filter", 0D, CalcDate('-1M', "Payroll Period"));
                                //                                     LoanApplicationRec.SetRange("Deduction Code", LoanProductType."Deduction Code");
                                //                                     LoanApplicationRec.SetRange("Employee No", "Employee No");
                                //                                     LoanApplicationRec.SetFilter("Stop Loan", '<>%1', true);
                                //                                     if LoanApplicationRec.Find('-') then begin
                                //                                         LoanApplicationRec.CalcFields(LoanApplicationRec."Total Repayment", LoanApplicationRec."Total Loan");
                                //                                        if LoanApplicationRec."Total Loan" <> 0 then begin

                                //                                             LoanTopupRec.Reset;
                                //                                             LoanTopupRec.SetCurrentkey("Loan No", "Payroll Period");
                                //                                             LoanTopupRec.SetRange("Loan No", LoanApplicationRec."Loan No");
                                //                                             LoanTopupRec.SetRange("Payroll Period", 0D, "Payroll Period");
                                //                                             LoanTopupRec.CalcSums(Amount);
                                //                                             LoanBalance := LoanTopupRec.Amount + LoanApplicationRec."Total Repayment";
                                //                                             // MESSAGE('TotalLoan=%1\TotalRepayment=%3\LoanBalance=%2',LoanApplicationRec."Total Loan",LoanBalance,LoanApplicationRec."Total Repayment");
                                //                                         end else
                                //                                             LoanBalance := LoanApplicationRec."Approved Amount" + LoanApplicationRec."Total Repayment";
                                //                                         //MESSAGE('ApprovedAmount=%1\LoanBalance=%2',LoanApplicationRec."Approved Amount",LoanBalance);

                                //                                     end;
                                //                                 end;
                                //                         end;
                                //                     end;
                                //                 LoanProductType."interest calculation method"::"Reducing Balance":
                                //                     begin
                                //                         LoanApplicationRec.Reset;
                                //                         LoanApplicationRec.SetRange(LoanApplicationRec."Date filter", 0D, CalcDate('-1M', "Payroll Period"));
                                //                         LoanApplicationRec.SetRange("Deduction Code", LoanProductType."Deduction Code");
                                //                         LoanApplicationRec.SetRange("Employee No", "Employee No");
                                //                         LoanApplicationRec.SetFilter("Stop Loan", '<>%1', true);
                                //                          if LoanApplicationRec.Find('-') then begin
                                //                             RepSchedule.Reset;
                                //                             RepSchedule.SetRange("Loan No", LoanApplicationRec."Loan No");
                                //                             RepSchedule.SetRange("Repayment Date", "Payroll Period");//CALCDATE('-1M',"Payroll Period")
                                //                             if RepSchedule.Find('-') then
                                //                                 LoanBalance := RepSchedule."Remaining Debt" + RepSchedule."Principal Repayment";
                                //                             //  MESSAGE('%1, %2',LoanBalance);
                                //                             // Amount:=((MarketIntRate-InterestRate)/100/12)*LoanBalance;
                                //                         end;
                                //                     end;
                                //             end; //CASE
                                //             Amount := (((MarketIntRate - InterestRate) / 100) / 12) * LoanBalance;
                                //             Amount := PayrollRounding(Amount);
                                //             // MESSAGE('%1\Fringe=%2\Balance=%3',"Employee No", Amount,LoanBalance);

                                //             "Employer Amount" := 0.3 * Amount;
                                //         end;
                                //     end;
                                // end;


                                if Payments."Calculation Method" = Payments."calculation method"::"% of Gross pay" then begin
                                    if Empl.Get("Employee No") then begin
                                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                        Empl.CalcFields(Basic, Empl."Total Allowances");
                                        Amount := ((Payments.Percentage / 100) * (Empl.Basic + Empl."Total Allowances"));

                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";


                                        Amount := PayrollRounding(Amount);//round
                                    end;
                                end;
                                if Payments."Calculation Method" = Payments."calculation method"::"% of Taxable income" then begin
                                    if Empl.Get("Employee No") then begin
                                        Empl.SetRange("Pay Period Filter", PayStartDate);
                                        Empl.CalcFields(Empl."Taxable Allowance");
                                        Amount := ((Payments.Percentage / 100) * (Empl."Basic Pay" + Empl."Taxable Allowance"));

                                        //Check For Limits
                                        if Payments."Minimum Limit" <> 0 then
                                            if Amount < Payments."Minimum Limit" then
                                                Amount := Payments."Minimum Limit";
                                        if Payments."Maximum Limit" <> 0 then
                                            if Amount > Payments."Maximum Limit" then
                                                Amount := Payments."Maximum Limit";

                                        Amount := PayrollRounding(Amount);//round
                                                                          //IF "Value of Quarters">Amount THEN
                                                                          // Amount:="Value of Quarters";
                                    end;
                                end;
                                if Payments."Reduces Tax" then begin
                                    //Amount:=-Amount;
                                    Amount := PayrollRounding(Amount);//round
                                end;

                            end;

                            //    if Payments."Calculation Method"=Payments."calculation method"::"10" then begin
                            //     if Empl.Get("Employee No") then
                            //      begin
                            //        Amount:=Abs((Payments.Percentage/100)* (Cost));
                            //        Amount:=PayrollRounding(Amount);//round
                            //      end;
                            //     end;

                        end;

                    //*********Deductions****************************************
                    // IF Type=Type::Deduction THEN BEGIN
                    Type::Deduction:
                        begin

                            if Deductions.Get(Code) then begin
                                if Deductions.Block = true then
                                    Error('Deduction Blocked');
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
                                    // MESSAGE('%1=%2',Deductions.Description,Amount);
                                    if Deductions."Flat Amount" <> 0 then
                                        Amount := Deductions."Flat Amount"
                                    else
                                        Amount := Amount;
                                    if Deductions."Flat Amount Employer" <> 0 then
                                        "Employer Amount" := Deductions."Flat Amount Employer"
                                    else
                                        "Employer Amount" := "Employer Amount";

                                end;
                                if Deductions."Calculation Method" = Deductions."calculation method"::"% of Basic Pay" then begin
                                    if Empl.Get("Employee No") then begin
                                        Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                        Empl.CalcFields(Empl.Basic);
                                        Amount := Deductions.Percentage / 100 * Empl.Basic;
                                        if (Deductions."PAYE Code" = true) then
                                            "Taxable amount" := Empl.Basic;
                                        // MESSAGE('NO ROUNDING AMOUNT=%1',Amount);
                                        Amount := PayrollRounding(Amount);//round
                                        "Employer Amount" := Deductions."Percentage Employer" / 100 * Empl.Basic;
                                        "Employer Amount" := PayrollRounding("Employer Amount");//round
                                        CheckIfRatesInclusive("Employee No", "Payroll Period", Code, Amount);
                                        //pension amount may exceed the maximum limit but the additional amount is tax
                                        /*
                                        IF Deductions."Maximum Amount"<> 0 THEN BEGIN
                                        IF ABS(Amount) > Deductions."Maximum Amount" THEN
                                         Amount:=Deductions."Maximum Amount";
                                         "Employer Amount":=Deductions."Percentage Employer"/100*Empl.Basic;
                                         //Employer amount should not have maximum pension deduction
                                         {
                                           IF "Employer Amount">Deductions."Maximum Amount" THEN
                                      "Employer Amount":=Deductions."Maximum Amount";
                                         }
                                         */
                                        //end of Employer pension
                                        "Employer Amount" := PayrollRounding("Employer Amount");//round
                                        CheckIfRatesInclusive("Employee No", "Payroll Period", Code, "Employer Amount");
                                        // Added by Lob

                                    end;
                                end;
                                //End of addition

                                //Added by Jacob
                                //Calculate CMFIU PAYE2
                                if Deductions."Calculation Method" = Deductions."calculation method"::"% of Gross Pay" then begin
                                    if Empl.Get("Employee No") then begin
                                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                        Empl.CalcFields(Basic, Empl."Total Allowances");
                                        Amount := ((Deductions.Percentage / 100) * (Empl."Total Allowances"));//Empl.Basic+
                                        Amount := PayrollRounding(Amount);//round
                                        "Taxable amount" := Empl."Total Allowances";//Empl.Basic+//"Employer Amount":=(Deductions."Percentage Employer"/100)*(
                                                                                    //  "Employer Amount":=PayrollRounding("Employer Amount");//round
                                    end;
                                end;
                                //End Calculate CMFIU PAYE2
                                //Added by Jacob


                                //Salary Recovery
                                SalaryRecoveryAmt := 0;
                                if Deductions."Calculation Method" = Deductions."calculation method"::"% of Salary Recovery" then begin
                                    if Empl.Get("Employee No") then begin
                                        Deductions.Reset;
                                        Deductions.SetRange(Deductions."Salary Recovery", true);
                                        if Deductions.Find('-') then begin
                                            SalarySteps.Reset;
                                            SalarySteps.SetRange(SalarySteps.Code, Deductions.Code);
                                            SalarySteps.SetRange(SalarySteps."Employee No", "Employee No");
                                            SalarySteps.SetRange(SalarySteps."Payroll Period", "Payroll Period");
                                            // SalarySteps.SETRANGE(SalarySteps."Employee No",LoanApp."Employee No");
                                            if SalarySteps.Find('-') then
                                                SalaryRecoveryAmt := SalarySteps.Amount;
                                            Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                                            // Empl.CALCFIELDS();
                                            Amount := ((Deductions.Percentage / 100) * SalaryRecoveryAmt);
                                            Amount := PayrollRounding(Amount);//round
                                        end;
                                    end;
                                end;
                                //end of salary recovery



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
                                // used gross pay new requirement for NHIF changed by Linus
                                // MESSAGE('Deduction Table');
                                Amount := -(GetBracket(Deductions, Empl."Total Allowances", "Employee Tier I", "Employee Tier II"));
                                if Deductions."Pension Scheme" then
                                    "Employer Amount" := (GetBracket(Deductions, Empl."Total Allowances", "Employer Tier I", "Employer Tier II"));

                            end;


                            //*******Upto here

                            if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                                GetPayPeriod;
                                Empl.Reset;
                                Empl.SetRange(Empl."No.", "Employee No");
                                Empl.SetRange(Empl."Pay Period Filter", PayStartDate);
                                Empl.CalcFields(Empl."Total Allowances", Empl.Basic);
                                // used gross pay new requirement for NHIF changed by Linus
                                // MESSAGE('Deduction Table');
                                GetNhifBracket(Deductions."Deduction Table", Empl."Total Allowances");
                                Amount := -TableAmount;
                            end;


                            //*******Upto here

                            //END;
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

                    //IF (Type=Type::Loan) THEN BEGIN
                    Type::Loan:
                        begin
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
                if (Type = Type::Payment) then
                    if Amount < 0 then
                        Error('Earning must not be negative');

                if (Type = Type::Deduction) then
                    if (Amount > 0) then
                        Amount := -Amount;

                if (Type = Type::Deduction) then begin
                    if Deductions.Get(Code) then begin
                        if Deductions."Pension Arrears" = true then begin
                            //IF Empl.GET("Employee No") THEN BEGIN
                            // Empl.SETRANGE(Empl."Pay Period Filter",PayStartDate);

                            "Employer Amount" := 2 * Amount;
                            "Employer Amount" := PayrollRounding("Employer Amount");//round
                                                                                    //pension amount may exceed the maximum limit but the additional amount is tax
                                                                                    // END;
                        end;
                    end;
                end;
                // TESTFIELD(Closed,FALSE);
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
                Amount := PayrollRounding(Amount);
                if "Manual Entry" then begin
                    if Empl.Get("Employee No") then begin
                        Empl.SetRange(Empl."Pay Period Filter", "Payroll Period");
                        Empl.CalcFields(Empl."Total Allowances", Empl."Total Deductions");
                        /*
                        IF ((Empl."Total Allowances"+Empl."Total Deductions")+Amount)<0 THEN
                        ERROR('Assigning this deduction for Employee %1 will result in a negative pay, Total allowances=%2 Total deductions=%3'
                        ,"Employee No",Empl."Total Allowances",Empl."Total Deductions");
                         */
                    end;
                end;
                /*
                IF NOT "Manual Entry" THEN
                BEGIN
                IF Empl.GET("Employee No") THEN
                BEGIN
                Empl.SETRANGE(Empl."Pay Period Filter","Payroll Period");
                Empl.CALCFIELDS(Empl."Total Allowances",Empl."Total Deductions");
                IF ((Empl."Total Allowances"+Empl."Total Deductions"))<0 THEN
                MESSAGE('Assigning this deduction for Employee %1 will result in a negative pay, Total allowances=%2 Total deductions=%3'
                ,"Employee No",Empl."Total Allowances",Empl."Total Deductions");
                
                END;
                END;
                */

            end;
        }
        field(9; Description; Text[80])
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(10; Taxable; Boolean)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(11; "Tax Deductible"; Boolean)
        {

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(12; Frequency; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(13; "Pay Period"; Text[30])
        {
        }
        field(14; "G/L Account"; Code[20])
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
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(17; "Global Dimension 1 code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(18; "Next Period Entry"; Boolean)
        {
        }
        field(19; "Posting Group Filter"; Code[20])
        {
            TableRelation = "Dimension Value";

            trigger OnValidate()
            begin
                //TESTFIELD(Closed,FALSE);
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
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(23; Closed; Boolean)
        {
            Editable = false;
        }
        field(24; "Salary Grade"; Code[20])
        {
        }
        field(25; "Tax Relief"; Boolean)
        {
        }
        field(26; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(27; "Period Repayment"; Decimal)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(28; "Non-Cash Benefit"; Boolean)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
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
                //TESTFIELD(Closed,FALSE);
            end;
        }
        field(31; Section; Code[20])
        {
        }
        field(33; Retirement; Boolean)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(34; CFPay; Boolean)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(35; BFPay; Boolean)
        {

            trigger OnValidate()
            begin
                // TESTFIELD(Closed,FALSE);
            end;
        }
        field(36; "Opening Balance"; Decimal)
        {

            trigger OnValidate()
            begin
                /*
                IF (Type=Type::Deduction) THEN
                IF "Opening Balance">0 THEN
                "Opening Balance":=-"Opening Balance";
                 //TESTFIELD(Closed,FALSE);
                 */

            end;
        }
        field(37; DebitAcct; Code[20])
        {
        }
        field(38; CreditAcct; Code[20])
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
        field(54; "Main Deduction Code"; Code[20])
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
        field(58; "Manual Entry"; Boolean)
        {
        }
        field(59; "Salary Pointer"; Code[20])
        {
        }
        field(60; "Employee Voluntary"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := -(Abs(Amount) + "Employee Voluntary");
            end;
        }
        field(61; "Employer Voluntary"; Decimal)
        {
        }
        field(62; "Loan Product Type"; Code[20])
        {
            // //TableRelation = "Loan Product Type1".Code;
        }
        field(63; "June Paye"; Decimal)
        {
        }
        field(64; "June Taxable Amount"; Decimal)
        {
        }
        field(65; "June Paye Diff"; Decimal)
        {
        }
        field(66; "Gratuity PAYE"; Decimal)
        {

            trigger OnValidate()
            begin
                if Paye = true then
                    Modify;
            end;
        }
        field(67; "Basic Pay Arrears"; Boolean)
        {
        }
        field(68; "Policy No./Loan No."; Code[20])
        {
        }
        field(69; "Loan Balance"; Decimal)
        {
        }
        field(70; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(71; "Global Dimension 3 Code"; Code[20])
        {
        }
        field(72; Information; Boolean)
        {
        }
        field(73; Cost; Decimal)
        {

            trigger OnValidate()
            begin
                Validate(Code);
            end;
        }
        field(74; "Employee Tier I"; Decimal)
        {
        }
        field(75; "Employee Tier II"; Decimal)
        {
        }
        field(76; "Employer Tier I"; Decimal)
        {
        }
        field(77; "Employer Tier II"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", Type, "Code", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key2; "Employee No", Taxable, "Tax Deductible", Retirement, "Non-Cash Benefit", "Tax Relief")
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
        key(Key8; "Global Dimension 1 code", "Payroll Period", "Code")
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
        key(Key14; "Global Dimension 1 code", "Payroll Period", Type, "Code")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key15; "Basic Salary Code", "Basic Pay Arrears")
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount;
        }
        key(Key16; Paye)
        {
            SumIndexFields = "Employer Amount", "Interest Amount", "Period Repayment", "No. of Units", "Opening Balance", Amount, "Taxable amount", "Less Pension Contribution";
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
        //TESTFIELD(Closed,FALSE);
        //IF Paye THEN
        //ERROR('You cannot manually delete P.A.Y.E');
    end;

    trigger OnInsert()
    begin
        // TESTFIELD(Closed,FALSE);
    end;

    trigger OnModify()
    begin
        //TESTFIELD(Closed,FALSE);

        if Paye then
            Error('You cannot manually edit or change P.A.Y.E');
        //IF CFPay THEN
        //   ERROR('You cannot manually edit or change Carry Forward pay');

        //IF BFPay THEN
        //   ERROR('You cannot manually edit or change Brought Forward pay');
    end;

    trigger OnRename()
    begin
        //TESTFIELD(Closed,FALSE);
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
        LoanBalance: Decimal;
        TotalRepayment: Decimal;
        SalaryRecoveryAmt: Decimal;
        // LoanTopUps: Record "Loan Top-up";
        TotalTopups: Decimal;
        BasicSalary: Decimal;
        Month: Date;
        Assignmatrix: Record "Assignment Matrix-X1";
        BasicSalaryCode: Code[30];
        CurrExchRate: Record "Currency Exchange Rate";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;


    procedure GetBracket(DeductionsRec: Record DeductionsX1; BasicPay: Decimal; var TierI: Decimal; var TierII: Decimal) TotalAmt: Decimal
    var
        BracketTable: Record BracketsX1;
        BracketSource: Record "Bracket Tablesx1";
        Loop: Boolean;
        PensionableAmt: Decimal;
        TableAmount: Decimal;
        i: Integer;
    begin
        TotalAmt := 0;
        TableAmount := 0;
        i := 0;
        if BracketSource.Get(DeductionsRec."Deduction Table") then;
        BracketTable.SetRange(BracketTable."Table Code", DeductionsRec."Deduction Table");
        BracketTable.SetRange(Institution, DeductionsRec."Institution Code");
        if BracketTable.Find('-') then begin
            case BracketSource.Type of
                BracketSource.Type::Fixed:
                    begin
                        repeat
                            if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay <= BracketTable."Upper Limit")) then
                                TotalAmt := BracketTable.Amount;
                        until BracketTable.Next = 0;
                    end;

                BracketSource.Type::"Graduating Scale":
                    begin
                        PensionableAmt := BasicPay;
                        repeat
                            i := i + 1;
                            if BasicPay <= 0 then
                                Loop := true
                            else begin
                                if BasicPay >= BracketTable."Upper Limit" then begin
                                    TableAmount := (BracketTable."Taxable Amount" * BracketTable.Percentage / 100);
                                    if Deductions."Pension Scheme" then begin
                                        if i = 1 then
                                            TierI := TableAmount
                                        else
                                            TierII := TableAmount;
                                    end;
                                    TotalAmt := TotalAmt + TableAmount;
                                end
                                else begin
                                    PensionableAmt := PensionableAmt - BracketTable."Lower Limit";
                                    TableAmount := PensionableAmt * (BracketTable.Percentage / 100);
                                    Loop := true;
                                    if Deductions."Pension Scheme" then begin
                                        if i = 1 then
                                            TierI := TableAmount
                                        else
                                            TierII := TableAmount;
                                    end;
                                    TotalAmt := TotalAmt + TableAmount;
                                end;
                            end;
                        until (BracketTable.Next = 0) or Loop = true;
                    end;
            end;
        end;

        exit(TotalAmt);
        //ELSE
        //MESSAGE('The Brackets have not been defined');
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


    procedure CheckIfRatesInclusive(EmpNo: Code[20]; PayPeriod: Date; DeductionCode: Code[20]; var DeductibleAmt: Decimal)
    var
        DeductionsRec: Record DeductionsX1;
        BracketTable: Record BracketsX1;
        BracketSource: Record "Bracket Tablesx1";
        AssMatrix: Record "Assignment Matrix-X1";
        i: Integer;
    begin
        if DeductionsRec.Get(DeductionCode) then begin
            if DeductionsRec."Pension Scheme" then begin
                i := 0;
                DeductionsRec.Reset;
                DeductionsRec.SetRange("Calculation Method", DeductionsRec."calculation method"::"Based on Table");
                DeductionsRec.SetRange("Pension Scheme", true);
                if DeductionsRec.Find('-') then begin
                    if BracketSource.Get(DeductionsRec."Deduction Table") then;
                    BracketTable.SetRange(BracketTable."Table Code", DeductionsRec."Deduction Table");
                    if BracketTable.Find('-') then
                        repeat
                            i := i + 1;
                            if BracketTable."Contribution Rates Inclusive" then begin
                                AssMatrix.Reset;
                                AssMatrix.SetRange("Employee No", EmpNo);
                                AssMatrix.SetRange("Payroll Period", PayPeriod);
                                AssMatrix.SetRange(Type, AssMatrix.Type::Deduction);
                                AssMatrix.SetRange(Code, DeductionsRec.Code);
                                if AssMatrix.Find('-') then begin
                                    if i = 1 then
                                        DeductibleAmt := DeductibleAmt - AssMatrix."Employee Tier I"
                                    else
                                        DeductibleAmt := DeductibleAmt - AssMatrix."Employee Tier II";
                                end;
                            end;
                        until
                         BracketTable.Next = 0;
                end;
            end;
        end;
    end;


    procedure GetNhifBracket(TableCode: Code[10]; BasicPay: Decimal)
    var
        BracketTable: Record BracketsX1;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay <= BracketTable."Upper Limit")) then
                    TableAmount := BracketTable.Amount;
            until BracketTable.Next = 0;
        end;
    end;
}

