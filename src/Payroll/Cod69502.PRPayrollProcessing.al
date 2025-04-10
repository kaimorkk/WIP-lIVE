codeunit 69502 "PR Payroll Processing"
{
    // ++Note
    // Tax on Excess Pension Not Clear /Not indicated anywhere
    // Low Interest Benefits
    // VOQ


    trigger OnRun()
    begin

    end;

    var
        Text020: label 'Because of circular references, the program cannot calculate a formula.';
        Text012: label 'You have entered an illegal value or a nonexistent row number.';
        Text013: label 'You have entered an illegal value or a nonexistent column number.';
        Text017: label 'The error occurred when the program tried to calculate: %1\';
        Text018: label 'Acc. Sched. Line: Row No. = %1, Line No. = %2, Totaling = %3\';
        Text019: label 'Acc. Sched. Column: Column No. = %4, Line No. = %5, Formula  = %6';
        Text023: label 'Formulas ending with a percent sign require %2 %1 on a line before it.';
        VitalSetup: Record "PR Vital Setup Info";
        CSHeader: Code[20];
        VitalSetup3: Record "PR Vital Setup Info";

        currNHIFRelief: Decimal;

        curReliefPersonal: Decimal;
        GlobalCasualChecker: Boolean;

        curReliefInsurance: Decimal;
        curReliefMorgage: Decimal;
        curMaximumRelief: Decimal;
        currMinRelief: Decimal;
        curNssfEmployee: Decimal;
        curNssf_Employer_Factor: Decimal;
        intNHIF_BasedOn: Option Gross,Basic,"Taxable Pay";
        intNSSF_BasedOn: Option Gross,Basic;
        curDisabledLimit: Decimal;
        curMaxPensionContrib: Decimal;
        curRateTaxExPension: Decimal;
        curOOIMaxMonthlyContrb: Decimal;
        curOOIDecemberDedc: Decimal;
        curLoanMarketRate: Decimal;
        curLoanCorpRate: Decimal;
        curReliefPension: Decimal;
        TaxAccount: Code[50];
        salariesAcc: Code[50];
        PayablesAcc: Code[50];
        NSSFEMPyer: Code[50];
        PensionEMPyer: Code[50];
        NSSFEMPyee: Code[50];
        NHIFEMPyer: Code[50];
        NHIFEMPyee: Code[50];
        NSSFRate: Decimal;
        NSSFUEL: Decimal;
        NSSFLEL: Decimal;
        ImplementNewNSSF: Boolean;
        HREmployee: Record "Employee";
        CoopParameters: Option "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF;
        PostingGroup: Record "PR Employee Posting Groups";
        AccSchedMgt: Codeunit AccSchedManagement;
        HREmp2: Record "Employee";
        PRTransCode: Record "PR Transaction Codes";
        HREmployes: Record "Employee";
        Cust2: Record Customer;
        curTransSubledger: Option " ",Customer,Vendor;
        curTransSubledgerAccount: Code[50];
        PRSalCard: Record "PR Salary Card";

        PRSalCard_Disability: Record "PR Salary Card";
        HRBankSummary: Record "HR Bank Summary";
        PRSalCard_2: Record "PR Salary Card";
        EmployeeInterestRate: Decimal;
        curMorgageRelief: Decimal;
        PRTransCode_2: Record "PR Transaction Codes";

        PREmpTrans_INT: Record "PR Employee Transactions";
        PREmpTrans_2: Record "PR Employee Transactions";
        BenifitAmount: Decimal;
        HREmpBankAC: Record "HR Employee Bank Accounts";
        HREmp: Record "Employee";
        PRTransCodeForm: Record "PR Transaction Codes Formula";
        curDefinedContrib_2: Decimal;
        PRTransCode_3: Record "PR Transaction Codes";
        EmployeeHousingLevy: Decimal;
        EmployerHousingLevy: Decimal;
        ImplementHousingLevy: Boolean;
        EmployeeHousingPerc: Decimal;
        EmployerHousingPerc: Decimal;
        HLevyEMPyer: Code[50];
        HLevyEMPyee: Code[50];
        curHLevyAmount: Decimal;
        HLevyException: Decimal;
        EmployeePensionArrears: Decimal;
        EmployerPensionArrears: Decimal;

    procedure GetCSHeader(CSHdr: Code[20])
    begin
        CSHeader := CSHdr;
    end;

    procedure GetEmployeePensionArrears(EmpNo: Text) Arrears: Decimal
    var
        PREmpTrans: record "PR Employee Transactions";
        Transcode: record "PR Transaction Codes";
        payperiod: Record "Pr Payroll Periods";
        pension: decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";

    begin
        Arrears := 0;

        payperiod.reset();
        payperiod.setrange(payperiod.closed, false);
        if payperiod.find('-') then;
        VitalSetup.get();
        pension := fnGetSpecialTransAmount(EmpNo, payperiod."Period Month", payperiod."Period Year",
            Specialtranstype::"Defined Contribution", false);
        PREmpTrans_2.Reset();
        PREmpTrans_2.SetRange(PREmpTrans_2."Basic Salary Arrears", true);
        PREmpTrans_2.SetRange(PREmpTrans_2."Employee Code", EmpNo);
        PREmpTrans_2.SetRange(PREmpTrans_2."Payroll Period", payperiod."Date Opened");
        if PREmpTrans_2.find('-') then begin
            PREmpTrans_2.CalcSums(Amount);
            Arrears := PREmpTrans_2.Amount * VitalSetup."Pension Arrears Employee" / 100;
        end;
        if pension = 0 then Arrears := 0;
    end;

    procedure GetEmployerPensionArrears(EmpNo: Text) Arrears: Decimal
    var
        PREmpTrans: record "PR Employee Transactions";
        Transcode: record "PR Transaction Codes";
        payperiod: Record "Pr Payroll Periods";
        pension: decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";

    begin
        Arrears := 0;
        payperiod.reset();
        payperiod.setrange(payperiod.closed, false);
        if payperiod.find('-') then;
        pension := fnGetSpecialTransAmount(EmpNo, payperiod."Period Month", payperiod."Period Year",
            Specialtranstype::"Defined Contribution", false);
        PREmpTrans.Reset();
        PREmpTrans.SetRange(PREmpTrans."Employee Code", EmpNo);
        PREmpTrans.SetRange(PREmpTrans."Payroll Period", payperiod."Date Opened");
        if PREmpTrans.find('-') then begin
            repeat
                if Transcode.get(PREmpTrans."Transaction Code") then
                    PREmpTrans."Not Included Third" := Transcode."Not Included Third";
                PREmpTrans."Basic Salary Arrears" := Transcode."Basic Salary Arrears";
                PREmpTrans."Transaction Type2" := Transcode."Transaction Type";
                PREmpTrans.modify;
            until PREmpTrans.Next() = 0;
        end;
        VitalSetup.get();
        PREmpTrans_2.Reset();
        PREmpTrans_2.SetRange(PREmpTrans_2."Basic Salary Arrears", true);
        PREmpTrans_2.SetRange(PREmpTrans_2."Employee Code", EmpNo);
        PREmpTrans_2.SetRange(PREmpTrans_2."Payroll Period", payperiod."Date Opened");
        if PREmpTrans_2.find('-') then begin
            PREmpTrans_2.CalcSums(Amount);
            Arrears := PREmpTrans_2.Amount * VitalSetup."Pension Arrear Employer" / 100;
        end;
        if pension = 0 then Arrears := 0;
    end;

    procedure fnBasicPayProrated(strEmpCode: Code[50]; Month: Integer; Year: Integer; BasicSalary: Decimal; DaysWorked: Integer; DaysInMonth: Integer) ProratedAmt: Decimal
    begin
        //ProratedAmt := ROUND((DaysWorked / DaysInMonth) * BasicSalary, 0.05);
        // ProratedAmt := ((DaysWorked + 1) / 30) * BasicSalary;
        ProratedAmt := ((DaysWorked) / 30) * BasicSalary;
    end;

    procedure fnCalcLoanInterest(strEmpCode: Code[50]; strTransCode: Code[50]; InterestRate: Decimal; RecoveryMethod: Option Reducing,"Straight line",Amortized; LoanAmount: Decimal; Balance: Decimal; CurrPeriod: Date) LnInterest: Decimal
    var
        curLoanInt: Decimal;
        intMonth: Integer;
        intYear: Integer;
        EmpTrans: Record "PR Employee Transactions";
    begin
        intMonth := Date2dmy(CurrPeriod, 2);
        intYear := Date2dmy(CurrPeriod, 3);

        curLoanInt := 0;
        if InterestRate > 0 then begin
            if RecoveryMethod = Recoverymethod::"Straight line" then //Straight Line Method [1]
                curLoanInt := (InterestRate / 1200) * LoanAmount;

            if RecoveryMethod = Recoverymethod::Reducing then //Reducing Balance [0]

                 curLoanInt := ((InterestRate / 12) / 100) * Balance;

            if RecoveryMethod = Recoverymethod::Amortized then //Amortized [2]
                curLoanInt := (InterestRate / 100) * Balance;

        end else
            curLoanInt := 0;

        //Return the Amount
        LnInterest := curLoanInt;
    end;

    procedure fnClosePayrollPeriod(dtOpenPeriod: Date) Closed: Boolean
    var
        dtNewPeriod: Date;
        intNewMonth: Integer;
        intNewWeeK: Integer;
        intNewYear: Integer;
        prEmployeeTransactions: Record "PR Employee Transactions";
        prPeriodTransactions: Record "PR Period Transactions";
        intWeek: Integer;
        intMonth: Integer;
        intYear: Integer;
        prTransactionCodes: Record "PR Transaction Codes";
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        prEmployeeTrans: Record "PR Employee Transactions";
        EmpTrans: Record "PR Employee Transactions";
        prPayrollPeriods: Record "PR Payroll Periods";
        prNewPayrollPeriods: Record "PR Payroll Periods";
        CreateTrans: Boolean;
        curTransName: text;
        CurInsuranceCert: Enum "Has Insurance Certificate";
        HrEmp: Record Employee;

    begin
        //MESSAGE('Also include function to reset No. of days worked');
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2dmy(dtNewPeriod, 2);
        //intNewWeeK := Date2dwy(dtNewPeriod, 2);
        intNewYear := Date2dmy(dtNewPeriod, 3);

        //intWeek := Date2dwy(dtOpenPeriod, 2);
        intMonth := Date2dmy(dtOpenPeriod, 2);
        intYear := Date2dmy(dtOpenPeriod, 3);
        HrEmp.reset();
        HrEmp.setrange(HrEmp.Status, HrEmp.Status::Active);
        HrEmp.setfilter(HrEmp."Date Of Leaving", '<>%1', 0D);
        if HrEmp.Find('-') then begin
            repeat
                if (HrEmp."Date Of Leaving" < dtNewPeriod) then begin
                    HrEmp.Status := HrEmp.Status::Inactive;
                    HrEmp.modify();
                end;
            until HrEmp.Next = 0;
        end;

        prEmployeeTransactions.Reset;
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Suspended, false);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", dtOpenPeriod);
        if prEmployeeTransactions.FindFirst() then begin
            repeat
                if (prEmployeeTransactions."End Date" > dtOpenPeriod) or (prEmployeeTransactions."End Date" = 0D) then begin
                    //Check Employees that have been paid gratuity and clear them
                    prTransactionCodes.Reset;
                    prTransactionCodes.SetRange("Transaction Category", prTransactionCodes."Transaction Category"::Gratuity);
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    if prTransactionCodes.FindFirst() then
                        if HREmployee.Get(prEmployeeTransactions."Employee Code") then begin
                            HREmployee."Exit Status" := HREmployee."Exit Status"::Exited;
                            HREmployee.Modify();
                        end;
                    //Added
                    Clear(curTransAmount);
                    Clear(curTransBalance);
                    Clear(CurInsuranceCert);
                    Clear(curTransName);

                    CurInsuranceCert := prEmployeeTransactions."Has Insurance Certificate";
                    curTransName := prEmployeeTransactions."Transaction Name";

                    //Added

                    prTransactionCodes.Reset;
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    if prTransactionCodes.FindFirst() then begin
                        //with prTransactionCodes do begin
                        case prTransactionCodes."Balance Type" of
                            prTransactionCodes."balance type"::None:
                                begin
                                    curTransAmount := prEmployeeTransactions.Amount;
                                    //curTransBalance := prEmployeeTransactions.Balance ;
                                end;
                            prTransactionCodes."balance type"::Increasing:
                                begin
                                    curTransAmount := prEmployeeTransactions.Amount;
                                    curTransBalance := prEmployeeTransactions.Balance + prEmployeeTransactions.Amount;
                                    //****
                                    //Added  to Include Subledger and Subledger Account for the next period
                                    if prEmployeeTransactions.Subledger <> prEmployeeTransactions.Subledger::" " then begin
                                        curTransSubledger := prEmployeeTransactions.Subledger;
                                        curTransSubledgerAccount := prEmployeeTransactions."Subledger Account";
                                    end;
                                    //****

                                end;
                            prTransactionCodes."balance type"::Reducing:
                                begin
                                    curTransAmount := prEmployeeTransactions.Amount;
                                    if prEmployeeTransactions.Balance <= prEmployeeTransactions.Amount then begin
                                        curTransAmount := prEmployeeTransactions.Balance;
                                        curTransBalance := 0;
                                    end else begin
                                        curTransBalance := prEmployeeTransactions.Balance - prEmployeeTransactions.Amount;
                                    end;
                                    if curTransBalance < 0 then begin
                                        curTransAmount := 0;
                                        curTransBalance := 0;
                                    end;
                                end;
                        end;
                        //end;
                    end;

                    //For those transactions with Start and End Date Specified
                    if (prEmployeeTransactions."Start Date" <> 0D) and (prEmployeeTransactions."End Date" <> 0D) then begin
                        if prEmployeeTransactions."End Date" < dtNewPeriod then begin
                            curTransAmount := 0;
                            curTransBalance := 0;
                        end;
                    end;
                    //End Transactions with Start and End Date

                    if (prTransactionCodes.Frequency = prTransactionCodes.Frequency::Fixed) and
                       (prEmployeeTransactions."Stop for Next Period" = false) then //DENNO ADDED THIS TO CHECK FREQUENCY AND STOP IF MARKED
                     begin
                        if (curTransAmount <> 0) then  //Update the employee transaction table
                         begin
                            if ((prTransactionCodes."Balance Type" = prTransactionCodes."balance type"::Reducing) and (curTransBalance <> 0)) or
                             (prTransactionCodes."Balance Type" <> prTransactionCodes."balance type"::Reducing) then
                                prEmployeeTransactions.Balance := curTransBalance;
                            prEmployeeTransactions.Modify;


                            //Insert record for the next period
                            //with prEmployeeTrans do begin
                            EmpTrans.Init;
                            EmpTrans."Employee Code" := prEmployeeTransactions."Employee Code";
                            EmpTrans."Transaction Code" := prEmployeeTransactions."Transaction Code";

                            EmpTrans."Transaction Name" := curTransName; //Modified

                            EmpTrans.Amount := curTransAmount;
                            EmpTrans.Balance := curTransBalance;
                            EmpTrans."Amortized Loan Total Repay Amt" := prEmployeeTransactions."Amortized Loan Total Repay Amt";
                            EmpTrans."Original Amount" := prEmployeeTransactions."Original Amount";
                            EmpTrans."Reference No" := prEmployeeTransactions."Reference No";
                            EmpTrans."Period Month" := intNewMonth;
                            EmpTrans."Period Year" := intNewYear;
                            EmpTrans."Payroll Period" := dtNewPeriod;


                            EmpTrans."Has Insurance Certificate" := CurInsuranceCert; //Modified

                            EmpTrans."Exempt from Interest" := prEmployeeTransactions."Exempt from Interest";
                            EmpTrans."Loan Interest Rate" := prEmployeeTransactions."Loan Interest Rate";
                            EmpTrans."Reference No" := prEmployeeTransactions."Reference No";
                            EmpTrans."Total Installments" := prEmployeeTransactions."Total Installments";
                            EmpTrans."Loan Application Date" := prEmployeeTransactions."Loan Application Date";
                            EmpTrans."Amount Borrowed" := prEmployeeTransactions."Amount Borrowed";

                            if curTransSubledger <> Curtranssubledger::" " then begin
                                EmpTrans.Subledger := curTransSubledger;
                                EmpTrans."Subledger Account" := curTransSubledgerAccount;
                            end;
                            //****
                            if prTransactionCodes."Skip Transfer in Next Period" = false then
                                EmpTrans.Insert;
                            //end;
                        end;
                    end;
                end;
            until prEmployeeTransactions.Next = 0;
        end;

        //Update the Period as Closed
        prPayrollPeriods.Reset;
        prPayrollPeriods.SetRange(prPayrollPeriods."Period Month", intMonth);
        prPayrollPeriods.SetRange(prPayrollPeriods."Period Year", intYear);
        prPayrollPeriods.SetRange(prPayrollPeriods.Closed, false);
        if prPayrollPeriods.FindFirst() then begin
            prPayrollPeriods.Closed := true;
            prPayrollPeriods."Date Closed" := Today;
            prPayrollPeriods."Closed By" := UserId;
            prPayrollPeriods."Allow View Payslip?" := true;
            prPayrollPeriods.Modify;
        end;


        //Error('Manually Stopped');
        //Enter a New Period

        prNewPayrollPeriods.Init();
        prNewPayrollPeriods."Period Month" := intNewMonth;
        prNewPayrollPeriods."Period Year" := intNewYear;
        prNewPayrollPeriods."Period Name" := Format(dtNewPeriod, 0, '<Month Text>') + ' ' + Format(intNewYear);
        prNewPayrollPeriods."Date Opened" := dtNewPeriod;
        prNewPayrollPeriods."Opened By" := UserId;
        prNewPayrollPeriods.Closed := false;
        prNewPayrollPeriods.Insert(true);


        //Effect the transactions for the P9
        fnP9PeriodClosure(intMonth, intYear, dtOpenPeriod);

        //Take all the Negative pay (Net) for the current month & treat it as a deduction in the new period
        fnGetNegativePay(intMonth, intYear, dtOpenPeriod);


        /*
        //Reset no. of days worked for casuals
        PRSalCard.RESET;
        PRSalCard.SETRANGE(PRSalCard."Employee Contract Type",'CASUALS');
        IF PRSalCard.FINDFirst() THEN
        BEGIN
            REPEAT
                PRSalCard."No. of Days Worked":=0;
                PRSalCard.MODIFY;
            UNTIL PRSalCard.NEXT = 0;
        END;
        */

    end;

    procedure fnDaysInMonth(dtDate: Date) DaysInMonth: Integer
    var
        Day: Integer;
        SysDate: Record Date;
        Expr1: Text[30];
        FirstDay: Date;
        LastDate: Date;
        TodayDate: Date;
    begin
        TodayDate := dtDate;

        Day := Date2dmy(TodayDate, 1);
        Expr1 := Format(-Day) + 'D+1D';
        FirstDay := CalcDate(Expr1, TodayDate);
        LastDate := CalcDate('1M-1D', FirstDay);

        SysDate.Reset;
        SysDate.SetRange(SysDate."Period Type", SysDate."period type"::Date);
        SysDate.SetRange(SysDate."Period Start", FirstDay, LastDate);
        SysDate.SetFilter(SysDate."Period No.", '1..7');
        if SysDate.FindFirst() then
            DaysInMonth := SysDate.Count;
    end;

    procedure fnDaysWorked(dtDate: Date; IsTermination: Boolean) DaysWorked: Integer
    var
        Day: Integer;
        SysDate: Record Date;
        Expr1: Text[30];
        FirstDay: Date;
        LastDate: Date;
        TodayDate: Date;

    begin
        TodayDate := dtDate;

        Day := Date2dmy(TodayDate, 1);
        Expr1 := Format(-Day) + 'D+1D';
        FirstDay := CalcDate(Expr1, TodayDate);
        LastDate := CalcDate('1M-1D', FirstDay);

        SysDate.Reset;
        SysDate.SetRange(SysDate."Period Type", SysDate."period type"::Date);
        if not IsTermination then
            SysDate.SetRange(SysDate."Period Start", dtDate, LastDate)
        else
            SysDate.SetRange(SysDate."Period Start", FirstDay, dtDate);
        SysDate.SetFilter(SysDate."Period No.", '1..7');
        if SysDate.FindFirst() then
            DaysWorked := SysDate.Count;
    end;

    procedure fnDisplayFrmlValues(EmpCode: Code[30]; intMonth: Integer; intYear: Integer; Formula: Text[50]) curTransAmount: Decimal
    var
        pureformula: Text[50];
    begin
        pureformula := fnPureFormula(EmpCode, intMonth, intYear, Formula);
        curTransAmount := fnFormulaResult(pureformula); //Get the calculated amount
        curTransAmount := curTransAmount;
    end;

    procedure fnFormulaResult(strFormula: Text[250]) Results: Decimal
    var
        AccSchedLine: Record "Acc. Schedule Line";
        ColumnLayout: Record "Column Layout";
        CalcAddCurr: Boolean;
    //AccSchedMgt: Codeunit AccSchedManagement_CU; //New Changes
    //HRCodeunit: Codeunit "HR Codeunit";
    begin
        Results := AccSchedMgt.EvaluateExpression(true, strFormula, AccSchedLine, ColumnLayout, CalcAddCurr);

    end;

    procedure fnGetEmployeeNHIF(curBaseAmount: Decimal) NHIF: Decimal
    var
        prNHIF: Record "PR NHIF";
        PrSetup: Record "PR Vital Setup Info";
    begin
        prNHIF.Reset;
        prNHIF.SetCurrentkey(prNHIF."Tier Code");
        prNHIF.Findset(false, false);
        begin
            repeat
                if ((curBaseAmount >= prNHIF."Lower Limit") and (curBaseAmount <= prNHIF."Upper Limit")) then
                    NHIF := prNHIF.Amount;
            until prNHIF.Next = 0;
        end;
        PrSetup.Get();
        if PrSetup."SHIF Percentage" > 0 then begin
            NHIF := curBaseAmount * PrSetup."SHIF Percentage" / 100;
        end
    end;

    procedure fnGetEmployeeNSSF(curBaseAmount: Decimal) NSSF: Decimal
    var
        prNSSF: Record "PR NSSF";
    begin
        if ImplementNewNSSF then begin
            if (curBaseAmount <= NSSFLEL) then
                NSSF := ROUND((curBaseAmount * (NSSFRate / 100)), 1)
            else
                if (curBaseAmount > NSSFLEL) and (curBaseAmount <= NSSFUEL)
           then
                    NSSF := ROUND(((curBaseAmount - NSSFLEL) * (NSSFRate / 100)) + (NSSFLEL * (NSSFRate / 100)), 1)
                else
                    NSSF := ROUND(((NSSFUEL - NSSFLEL) * (NSSFRate / 100)) + (NSSFLEL * (NSSFRate / 100)), 1);
        end else begin
            prNSSF.Reset;
            prNSSF.SetCurrentkey(prNSSF.Tier);
            prNSSF.findset(false, false);
            begin
                repeat
                    if ((curBaseAmount >= prNSSF."Lower Limit") and (curBaseAmount <= prNSSF."Upper Limit")) then
                        NSSF := prNSSF."Tier 1 Employer Contribution" + prNSSF."Tier 2 Employer Contribution";
                until prNSSF.Next = 0;
            end;

        end;
    end;





    procedure fnGetEmployeePaye(curTaxablePay: Decimal) PAYE: Decimal
    var
        prPAYE: Record "PR PAYE";
        curTempAmount: Decimal;
        KeepCount: Integer;
    begin
        KeepCount := 0;

        prPAYE.Reset;
        prPAYE.FindSet(false, false);
        begin
            if curTaxablePay < prPAYE."PAYE Tier" then exit;
            repeat
                KeepCount += 1;

                curTempAmount := curTaxablePay;

                if curTaxablePay = 0 then exit;
                if KeepCount = prPAYE.Count then   //this is the last record or loop
                    curTaxablePay := curTempAmount
                else
                    if curTempAmount >= prPAYE."PAYE Tier" then
                        curTempAmount := prPAYE."PAYE Tier"
                    else
                        curTempAmount := curTempAmount;

                PAYE := PAYE + (curTempAmount * (prPAYE.Rate / 100));

                curTaxablePay := curTaxablePay - curTempAmount;

            until prPAYE.Next = 0;
        end;
    end;

    procedure fnGetEmployerTier1NSSF(curBaseAmount: Decimal) NSSF: Decimal
    var
        prNSSF: Record "PR NSSF";
    begin
        if ImplementNewNSSF then begin
            if (curBaseAmount <= NSSFLEL) then
                NSSF := ROUND((curBaseAmount * (NSSFRate / 100)), 1)
            else
                NSSF := ROUND((NSSFLEL * (NSSFRate / 100)), 1);

        end else begin
            prNSSF.Reset;
            prNSSF.SetCurrentkey(prNSSF.Tier);
            prNSSF.findset(false, false);
            begin
                repeat
                    if ((curBaseAmount >= prNSSF."Lower Limit") and (curBaseAmount <= prNSSF."Upper Limit")) then
                        NSSF := prNSSF."Tier 1 Employer Contribution";

                until prNSSF.Next = 0;
            end;

        end;
    end;

    procedure fnGetEmployerTier2NSSF(curBaseAmount: Decimal) NSSF: Decimal
    var
        prNSSF: Record "PR NSSF";
    begin
        if ImplementNewNSSF then begin
            if (curBaseAmount <= NSSFLEL) then
                exit
            else
                if (curBaseAmount > NSSFLEL) and (curBaseAmount <= NSSFUEL)
           then
                    NSSF := ROUND(((curBaseAmount - NSSFLEL) * (NSSFRate / 100)), 1)
                else
                    NSSF := ROUND(((NSSFUEL - NSSFLEL) * (NSSFRate / 100)), 1);
        end else begin
            prNSSF.Reset;
            prNSSF.SetCurrentkey(prNSSF.Tier);
            prNSSF.findset(false, false);
            begin
                repeat
                    if ((curBaseAmount >= prNSSF."Lower Limit") and (curBaseAmount <= prNSSF."Upper Limit")) then
                        NSSF := prNSSF."Tier 2 Employer Contribution";

                until prNSSF.Next = 0;
            end;

        end;
    end;

    procedure fnGetJournalDet(strEmpCode: Code[50])
    var
        SalaryCard: Record "PR Salary Card";
        HREmp: Record "Employee";
    begin
        //Get Payroll Posting Accounts
        //IF SalaryCard.GET(strEmpCode) THEN BEGIN
        if HREmp.Get(strEmpCode) then begin
            PostingGroup.Get(HREmp."Posting Group");
            begin
                //Comment This for the Time Being
                PostingGroup.TestField("Salary Account");
                PostingGroup.TestField("Income Tax Account");
                PostingGroup.TestField("Net Salary Payable");
                PostingGroup.TestField("SSF Employer Account");
                PostingGroup.TestField("Pension Employer Acc");
                PostingGroup.TestField("Housing Levy Employee Account");
                PostingGroup.TestField("Housing Levy Employer Account");

                TaxAccount := PostingGroup."Income Tax Account";
                salariesAcc := PostingGroup."Salary Account";
                PayablesAcc := PostingGroup."Net Salary Payable";
                NSSFEMPyer := PostingGroup."SSF Employer Account";
                NSSFEMPyee := PostingGroup."SSF Employee Account";
                NHIFEMPyee := PostingGroup."NHIF Employee Account";
                PensionEMPyer := PostingGroup."Pension Employer Acc";
                HLevyEMPyee := PostingGroup."Housing Levy Employee Account";
                HLevyEMPyer := PostingGroup."Housing Levy Employer Account";
            end;
        end;
        //End Get Payroll Posting Accounts
    end;

    procedure fnGetNegativePay(intMonth: Integer; intYear: Integer; dtOpenPeriod: Date)
    var
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployeeTransactions: Record "PR Employee Transactions";
        intNewMonth: Integer;
        intNewYear: Integer;
        dtNewPeriod: Date;
    begin
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2dmy(dtNewPeriod, 2);
        intNewYear := Date2dmy(dtNewPeriod, 3);

        prPeriodTransactions.Reset;
        prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
        prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
        prPeriodTransactions.SetRange(prPeriodTransactions."Group Order", 9);
        prPeriodTransactions.SetFilter(prPeriodTransactions.Amount, '<0');

        if prPeriodTransactions.FindFirst() then begin
            repeat

                prEmployeeTransactions.Init();
                ;
                prEmployeeTransactions."Employee Code" := prPeriodTransactions."Employee Code";
                prEmployeeTransactions."Transaction Code" := 'NEGP';
                prEmployeeTransactions."Transaction Name" := 'Negative Pay';
                prEmployeeTransactions.Amount := prPeriodTransactions.Amount;
                prEmployeeTransactions.Balance := 0;
                prEmployeeTransactions."Original Amount" := 0;
                prEmployeeTransactions."Period Month" := intNewMonth;
                prEmployeeTransactions."Period Year" := intNewYear;
                prEmployeeTransactions."Payroll Period" := dtNewPeriod;
                prEmployeeTransactions.Insert;

            until prPeriodTransactions.Next = 0;
        end;
    end;

    procedure fnGetOpenPeriod() dtOpenPeriod: Date
    var
        "prPayroll Periods": Record "PR Payroll Periods";
        intMonth: Integer;
        intYear: Integer;
    begin
        "prPayroll Periods".Reset;
        "prPayroll Periods".SetRange("prPayroll Periods".Closed, false);

        if "prPayroll Periods".FindFirst() then begin
            dtOpenPeriod := "prPayroll Periods"."Date Opened";
            intMonth := Date2dmy(dtOpenPeriod, 2); //GET THE MONTH
            intYear := Date2dmy(dtOpenPeriod, 3);  //GET THE YEAR
        end
        else begin
            Error('There is no open payroll period');
        end
    end;

    procedure fnGetSpecialTransAmount(strEmpCode: Code[50]; intMonth: Integer; intYear: Integer; intSpecTransID: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief"; blnCompDedc: Boolean) SpecialTransAmount: Decimal
    var
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        MortgageInterest: Decimal;
        MortgageRelief: Decimal;
    begin
        SpecialTransAmount := 0;
        prTransactionCodes.Reset;
        prTransactionCodes.SetRange(prTransactionCodes."Special Trans Deductions", intSpecTransID);
        if prTransactionCodes.FindFirst() then begin
            repeat
                prEmployeeTransactions.Reset;
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Code", prTransactionCodes."Transaction Code");
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
                prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added  to not process Stopped Transactions
                if prEmployeeTransactions.FindFirst() then begin

                    //Ignore,Defined Contribution,Home Ownership Savings Plan,Life Insurance,
                    //Owner Occupier Interest,Prescribed Benefit,Salary Arrears,Staff Loan,Value of Quarters
                    case intSpecTransID of
                        Intspectransid::"Defined Contribution":
                            if prTransactionCodes."Is Formula" then begin
                                strExtractedFrml := '';
                                strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                                SpecialTransAmount := SpecialTransAmount + (fnFormulaResult(strExtractedFrml)); //Get the calculated amount for the Special Transaction
                            end else
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;

                        Intspectransid::"Life Insurance": //You have to specify on Employee Transactions whether staff has brought his her certificate
                            begin
                                prEmployeeTransactions.TestField("Has Insurance Certificate");
                                if prEmployeeTransactions."Has Insurance Certificate" = prEmployeeTransactions."Has Insurance Certificate"::Yes then begin
                                    SpecialTransAmount := SpecialTransAmount + ((curReliefInsurance / 100) * prEmployeeTransactions.Amount);
                                end;
                            end;


                        Intspectransid::"Owner Occupier Interest":
                            SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;


                        Intspectransid::"Home Ownership Savings Plan":
                            begin
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;
                                //Modified Dann
                                if SpecialTransAmount > 4000 then SpecialTransAmount := 4000;
                            end;
                        Intspectransid::"Voluntary Pension":
                            begin
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;
                                if SpecialTransAmount >= curMaxPensionContrib then begin
                                    //If Pension is > 20 then less NSSF
                                    SpecialTransAmount := curMaxPensionContrib - curDefinedContrib_2;
                                end;
                            end;


                        Intspectransid::Mortgage:
                            begin
                                SpecialTransAmount := SpecialTransAmount + curReliefMorgage;

                                if SpecialTransAmount > curReliefMorgage then begin
                                    SpecialTransAmount := curReliefMorgage
                                end;
                            end;

                        //Dann
                        Intspectransid::"Mortgage Relief":
                            begin
                                //Intrest = 6%/12 * Curr Balance
                                MortgageInterest := (0.06 / 12) * prEmployeeTransactions.Balance;

                                if MortgageInterest < curReliefMorgage then begin
                                    MortgageRelief := 0.3 * MortgageInterest;
                                end;

                                if MortgageInterest > curReliefMorgage then begin
                                    MortgageRelief := 0.3 * curReliefMorgage;
                                end;

                                SpecialTransAmount := MortgageRelief

                            end;
                    //Dann

                    end;
                end;
            until prTransactionCodes.Next = 0;
        end;
    end;

    procedure fnGetTransAmount(strEmpCode: Code[50]; strTransCode: Code[50]; intMonth: Integer; intYear: Integer) TransAmount: Decimal
    var
        prEmployeeTransactions: Record "PR Employee Transactions";
        prPeriodTransactions: Record "PR Period Transactions";
        prSalCard: Record "PR Salary Card";
    begin
        prEmployeeTransactions.Reset;
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Code", strTransCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added  to not process Stopped Transactions
        if prEmployeeTransactions.FindFirst then
            TransAmount := prEmployeeTransactions.Amount;

        if TransAmount = 0 then begin
            prPeriodTransactions.Reset;
            prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", strEmpCode);
            prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Code", strTransCode);
            prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
            prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
            if prPeriodTransactions.FindFirst then
                TransAmount := prPeriodTransactions.Amount;
        end;

        if TransAmount = 0 then begin
            if strTransCode = 'BPAY' then begin
                prSalCard.Reset;
                prSalCard.SetRange(prSalCard."Employee Code", strEmpCode);

                if prSalCard.FindFirst then
                    TransAmount := prSalCard."Basic Pay";
            end;
        end;
    end;

    procedure fnInitialize()
    var
        strTableName: Text[50];
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        strTransDescription: Text[50];
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        curSalaryArrears: Decimal;
        curPayeArrears: Decimal;
        curGrossPay: Decimal;
        curTotAllowances: Decimal;
        curExcessPension: Decimal;
        curNSSF: Decimal;
        curDefinedContrib: Decimal;
        curPensionStaff: Decimal;
        curNonTaxable: Decimal;
        curGrossTaxable: Decimal;
        curBenefits: Decimal;
        curValueOfQuarters: Decimal;
        curUnusedRelief: Decimal;
        curInsuranceReliefAmount: Decimal;
        curMorgageReliefAmount: Decimal;
        curTaxablePay: Decimal;
        curTaxCharged: Decimal;
        curPAYE: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        intYear: Integer;
        intMonth: Integer;
        LeapYear: Boolean;
        CountDaysofMonth: Integer;
        DaysWorked: Integer;
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        SpecialTransType: Option Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Morgage;
        TransactionType: Option Income,Deduction;
        curPensionCompany: Decimal;
        curTaxOnExcessPension: Decimal;
        //prUnusedRelief: Record UnknownRecord70134784;
        curNhif_Base_Amount: Decimal;
        curNHIF: Decimal;
        curTotalDeductions: Decimal;
        curNetRnd_Effect: Decimal;
        curNetPay: Decimal;
        curTotCompanyDed: Decimal;
        curOOI: Decimal;
        curHOSP: Decimal;
        curLoanInt: Decimal;
        strTransCode: Text[250];
        fnCalcFringeBenefit: Decimal;
        prEmployerDeductions: Record "PR Employer Deductions";
        JournalPostingType: Option " ","G/L Account",Customer,Vendor;
        JournalAcc: Code[50];
        Customer: Record Customer;
        JournalPostAs: Option " ",Debit,Credit;
        "`": Integer;
    begin

        //Initialize Global Setup Items
        VitalSetup.FindFirst;

        // <<< 26th-April-2020
        //VitalSetup.TestField("Minimum Taxable Pay");
        //>>>
        curReliefPersonal := VitalSetup."Tax Relief";
        curReliefInsurance := VitalSetup."Insurance Relief";
        curReliefMorgage := VitalSetup."Mortgage Relief"; //Same as HOSP
        curMaximumRelief := VitalSetup."Max Relief" + VitalSetup."Tax Relief";
        curNssfEmployee := VitalSetup."NSSF Employee";
        curNssf_Employer_Factor := VitalSetup."NSSF Employer Factor";
        intNHIF_BasedOn := VitalSetup."NHIF Based on";
        intNSSF_BasedOn := VitalSetup."NSSF Based on";
        curMaxPensionContrib := VitalSetup."Max Pension Contribution";
        curRateTaxExPension := VitalSetup."Tax On Excess Pension";
        curOOIMaxMonthlyContrb := VitalSetup."OOI Deduction";
        curOOIDecemberDedc := VitalSetup."OOI December";
        curLoanMarketRate := VitalSetup."Loan Market Rate";
        curLoanCorpRate := VitalSetup."Loan Corporate Rate";
        currMinRelief := VitalSetup."Minimum Relief Amount";
        curDisabledLimit := VitalSetup."Disbled Tax Limit";
        NSSFRate := VitalSetup."NSSF Rate";
        NSSFLEL := VitalSetup."NSSF Lower Earning Limit(LEL)";
        NSSFUEL := VitalSetup."NSSF Upper Earning Limit(UEL)";
        ImplementNewNSSF := VitalSetup."Implement New NSSF";

    end;

    procedure fnP9PeriodClosure(intMonth: Integer; intYear: Integer; dtCurPeriod: Date)
    var
        P9EmployeeCode: Code[50];
        P9BasicPay: Decimal;
        P9Allowances: Decimal;
        P9Benefits: Decimal;
        P9ValueOfQuarters: Decimal;
        P9DefinedContribution: Decimal;
        P9OwnerOccupierInterest: Decimal;
        P9GrossPay: Decimal;
        P9TaxablePay: Decimal;
        P9TaxCharged: Decimal;
        P9InsuranceRelief: Decimal;
        P9TaxRelief: Decimal;
        P9Paye: Decimal;
        P9NSSF: Decimal;
        P9NHIF: Decimal;
        P9Deductions: Decimal;
        P9NetPay: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployee: Record "Employee";
    begin
        P9BasicPay := 0;
        P9Allowances := 0;
        P9Benefits := 0;
        P9ValueOfQuarters := 0;
        P9DefinedContribution := 0;
        P9OwnerOccupierInterest := 0;
        P9GrossPay := 0;
        P9TaxablePay := 0;
        P9TaxCharged := 0;
        P9InsuranceRelief := 0;
        P9TaxRelief := 0;
        P9Paye := 0;
        P9NSSF := 0;
        P9NHIF := 0;
        P9Deductions := 0;
        P9NetPay := 0;

        Clear(prEmployee);
        //prEmployee.Reset();
        prEmployee.SetRange(prEmployee.Status, prEmployee.Status::Active);
        //prEmployee.SetRange(Status, prEmployee.Status::Active);
        //prEmployee.SETFILTER(prEmployee."Employee Contract Type",'<>%1','CASUALS'); //Remove
        if prEmployee.FindFirst() then begin
            repeat

                P9BasicPay := 0;
                P9Allowances := 0;
                P9Benefits := 0;
                P9ValueOfQuarters := 0;
                P9DefinedContribution := 0;
                P9OwnerOccupierInterest := 0;
                P9GrossPay := 0;
                P9TaxablePay := 0;
                P9TaxCharged := 0;
                P9InsuranceRelief := 0;
                P9TaxRelief := 0;
                P9Paye := 0;
                P9NSSF := 0;
                P9NHIF := 0;
                P9Deductions := 0;
                P9NetPay := 0;

                prPeriodTransactions.Reset;
                prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", prEmployee."No.");
                prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
                prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
                if prPeriodTransactions.FindFirst() then begin
                    repeat

                        case prPeriodTransactions."Group Order" of
                            1: //Basic pay & Arrears
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then P9BasicPay := prPeriodTransactions.Amount; //Basic Pay
                                    if prPeriodTransactions."Sub Group Order" = 2 then P9BasicPay := P9BasicPay + prPeriodTransactions.Amount; //Basic Pay Arrears
                                end;
                            3:  //Allowances
                                begin
                                    P9Allowances := P9Allowances + prPeriodTransactions.Amount
                                end;
                            4: //Gross Pay
                                begin
                                    P9GrossPay := prPeriodTransactions.Amount
                                end;
                            6: //Taxation
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then P9DefinedContribution := prPeriodTransactions.Amount; //Defined Contribution
                                    if prPeriodTransactions."Sub Group Order" = 9 then P9TaxRelief := prPeriodTransactions.Amount; //Tax Relief
                                    if prPeriodTransactions."Sub Group Order" = 8 then P9InsuranceRelief := prPeriodTransactions.Amount; //Insurance Relief
                                    if prPeriodTransactions."Sub Group Order" = 6 then P9TaxablePay := prPeriodTransactions.Amount; //Taxable Pay
                                    if prPeriodTransactions."Sub Group Order" = 7 then P9TaxCharged := prPeriodTransactions.Amount; //Tax Charged
                                end;
                            7: //Statutories
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then P9NSSF := prPeriodTransactions.Amount; //Nssf
                                    if prPeriodTransactions."Sub Group Order" = 2 then P9NHIF := prPeriodTransactions.Amount; //Nhif
                                    if prPeriodTransactions."Sub Group Order" = 3 then P9Paye := prPeriodTransactions.Amount; //paye
                                    if prPeriodTransactions."Sub Group Order" = 4 then P9Paye := P9Paye + prPeriodTransactions.Amount; //Paye Arrears
                                end;
                            8://Deductions
                                begin
                                    P9Deductions := P9Deductions + prPeriodTransactions.Amount;
                                end;
                            9: //NetPay
                                begin
                                    P9NetPay := prPeriodTransactions.Amount;
                                end;
                        end;

                    until prPeriodTransactions.Next = 0;
                end;
                //Update the P9 Details
                if P9NetPay <> 0 then
                    fnUpdateP9Table(prEmployee."No.", P9BasicPay, P9Allowances, P9Benefits, P9ValueOfQuarters, P9DefinedContribution,
                        P9OwnerOccupierInterest, P9GrossPay, P9TaxablePay, P9TaxCharged, P9InsuranceRelief, P9TaxRelief, P9Paye, P9NSSF,
                        P9NHIF, P9Deductions, P9NetPay, dtCurPeriod);

            until prEmployee.Next = 0;
        end;
    end;
    //IanCasper
    procedure fnCheckIncrement(dtOpenPeriod: Date; strEmpCode: Code[50])
    var
        HREmp: Record Employee;
        Pointer: Record "Salary Pointers";
        Pointer2: Record "Salary Pointers";
        Arrangement: Integer;

    begin
        HREmp.Get(strEmpCode);
        if HREmp.Status = HREmp.Status::Active then begin
            if HREmp."Increment Date" <> 0D then
                if (Date2DMY(dtOpenPeriod, 2) = Date2DMY(HREmp."Increment Date", 2)) and (Date2DMY(dtOpenPeriod, 3) <> Date2DMY(HREmp."Employment Date", 3)) then begin
                    if HREmp."Last Increment Date" = 0D then begin
                        if Pointer.Get(HREmp."Salary Scale", HREmp.Present) then begin
                            Evaluate(Arrangement, Pointer."Salary Pointer");
                            Arrangement += 1;
                            Pointer2.Reset();
                            Pointer2.SetRange("Salary Scale", HREmp."Salary Scale");
                            Pointer2.SetRange("Salary Pointer", Format(Arrangement));
                            if Pointer2.FindFirst() then begin
                                HREmp.Validate(Present, Pointer2."Salary Pointer");
                                HREmp."Last Increment Date" := dtOpenPeriod;
                                HREmp.modify();
                            end;
                        end;
                    end else

                        if Date2DMY(HREmp."Last Increment Date", 3) <> Date2DMY(dtOpenPeriod, 3) then Begin
                            if Pointer.Get(HREmp."Salary Scale", HREmp.Present) then begin
                                Evaluate(Arrangement, Pointer."Salary Pointer");
                                Arrangement += 1;
                                Pointer2.Reset();
                                Pointer2.SetRange("Salary Scale", HREmp."Salary Scale");
                                Pointer2.SetRange("Salary Pointer", Format(Arrangement));
                                if Pointer2.FindFirst() then begin
                                    HREmp.Validate(Present, Pointer2."Salary Pointer");
                                    HREmp."Last Increment Date" := dtOpenPeriod;
                                    HREmp.modify();
                                end;
                            end;
                        End;
                end;
        end;
    end;


    procedure fnProcesspayroll(strEmpCode: Code[50]; dtDOE: Date; curBasicPay: Decimal; blnPaysPaye: Boolean; blnPaysNssf: Boolean; blnPaysNhif: Boolean; SelectedPeriod: Date; dtOpenPeriod: Date; Membership: Text[30]; ReferenceNo: Text[30]; dtTermination: Date; blnGetsPAYERelief: Boolean; Dept: Code[50]; blnInsuranceCertificate: Boolean; IsCasual: Boolean)
    var
        strTableName: Text[50];
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        strTransDescription: Text[50];
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        curSalaryArrears: Decimal;
        curPayeArrears: Decimal;
        curGrossPay: Decimal;
        curTotAllowances: Decimal;
        curExcessPension: Decimal;
        curNSSF: Decimal;
        NSSFArray: array[2] of Decimal;
        NSSF1: Decimal;
        NSSF2: Decimal;
        curDefinedContrib: Decimal;
        curPensionStaff: Decimal;
        curNonTaxable: Decimal;
        curGrossTaxable: Decimal;
        curBenefits: Decimal;
        curValueOfQuarters: Decimal;
        curUnusedRelief: Decimal;
        curInsuranceReliefAmount: Decimal;
        curMorgageReliefAmount: Decimal;
        curTaxablePay: Decimal;
        curTaxCharged: Decimal;
        curPAYE: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        intYear: Integer;
        intMonth: Integer;
        LeapYear: Boolean;
        CountDaysofMonth: Integer;
        DaysWorked: Integer;
        //prSalaryArrears: Record UnknownRecord70134782;
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
        TransactionType: Option Income,Deduction;
        curPensionCompany: Decimal;
        curTaxOnExcessPension: Decimal;
        //prUnusedRelief: Record UnknownRecord70134784;
        curNhif_Base_Amount: Decimal;
        curNHIF: Decimal;
        curTotalDeductions: Decimal;
        curNetRnd_Effect: Decimal;
        curNetPay: Decimal;
        curTotCompanyDed: Decimal;
        curOOI: Decimal;
        curHOSP: Decimal;
        curLoanInt: Decimal;
        strTransCode: Text[250];
        fnCalcFringeBenefit: Decimal;
        prEmployerDeductions: Record "PR Employer Deductions";
        salCard: Record "PR Salary Card";
        curBPAYBal: Decimal;
        curPensionReliefAmount: Decimal;
        curIncludeinNet: Decimal;
        JournalPostAs: Option ,Debit,Credit;
        JournalPostingType: Enum "Gen. Journal Account Type";
        JournalAc: Code[50];
        curIncludeGross: Decimal;
        IsCashbenefit: Decimal;
        curNssf_Base_Amount: Decimal;
        PRPeriodTrans: Record "PR Period Transactions";
        HREmp: Record "Employee";
        Pointer: Record "Salary Pointers";
        Pointer2: Record "Salary Pointers";
        Arrangement: Integer;
        Employee: Record Employee;
        PRVitalSetup: Record "PR Vital Setup Info";
    //ScheduleLines: Record "Casual Pay Schedule Lines";
    //CasualEmp: Record "Casual Employee";
    begin
        PRVitalSetup.Get();
        dtOpenPeriod := fnGetOpenPeriod();
        //Check Salary Increment
        fnCheckIncrement(dtOpenPeriod, strEmpCode);

        //Check and Insert Training Levy
        //CalculateTrainingLevy(dtOpenPeriod, strEmpCode);

        //Initialize
        fnInitialize;
        EmployeePensionArrears := 0;
        EmployeePensionArrears := GetEmployeePensionArrears(strEmpCode);
        EmployerPensionArrears := 0;
        EmployerPensionArrears := GetEmployerPensionArrears(strEmpCode);
        // if CasualEmp.Get(strEmpCode) then
        //     IsCasual := true;
        //Update the casual checker for use by other functions
        GlobalCasualChecker := IsCasual;

        //Get Payroll Posting Accountss
        fnGetJournalDet(strEmpCode);
        HLevyException := 0;
        NSSF1 := 0;
        NSSF2 := 0;


        //check if the period selected=current period. If not, do NOT run this function
        if SelectedPeriod <> dtOpenPeriod then exit;
        intMonth := Date2dmy(SelectedPeriod, 2);
        intYear := Date2dmy(SelectedPeriod, 3);

        //Delete all Records from the prPeriod Transactions for Reprocessing
        prPeriodTransactions.Reset;
        prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", strEmpCode);
        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", dtOpenPeriod);
        if prPeriodTransactions.FindSet() then
            prPeriodTransactions.DeleteAll;

        //Delete all Records from prEmployer Deductions
        prEmployerDeductions.Reset;
        prEmployerDeductions.SetRange(prEmployerDeductions."Employee Code", strEmpCode);
        prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", dtOpenPeriod);
        if prEmployerDeductions.FindSet() then
            prEmployerDeductions.DeleteAll;

        //Delete all records from HRBankSummary
        HRBankSummary.Reset;
        HRBankSummary.SetRange(HRBankSummary."Payroll Period", dtOpenPeriod);
        HRBankSummary.SetRange(HRBankSummary."No.", strEmpCode);
        if HRBankSummary.FindSet() then HRBankSummary.DeleteAll;



        //IF curBasicPay >0 THEN
        begin


            //Get the Basic Salary (prorate basc pay if needed) //Termination Remaining
            if VitalSetup."Enable Payroll Proration" = true then
                if not IsCasual then begin
                    if dtDOE <> 0D then begin
                        if (Date2dmy(dtDOE, 1) <> 1) and (Date2dmy(dtDOE, 2) = Date2dmy(dtOpenPeriod, 2)) and (Date2dmy(dtDOE, 3) = Date2dmy(dtOpenPeriod, 3)) then begin
                            CountDaysofMonth := fnDaysInMonth(dtDOE);
                            DaysWorked := fnDaysWorked(dtDOE, false);

                            curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth);
                        end;
                    end;
                    HREmp.Get(strEmpCode);
                    if (HREmp."Re-Employment Date" <> 0D) then
                        if (Date2dmy(HREmp."Re-Employment Date", 1) <> 1) and (Date2dmy(HREmp."Re-Employment Date", 2) = Date2dmy(dtOpenPeriod, 2)) and (Date2dmy(HREmp."Re-Employment Date", 3) = Date2dmy(dtOpenPeriod, 3))
                        then begin
                            CountDaysofMonth := fnDaysInMonth(HREmp."Re-Employment Date");
                            DaysWorked := fnDaysWorked(HREmp."Re-Employment Date", false);
                            curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth);

                        end;

                    if (dtTermination <> 0D) and not IsCasual then begin
                        //and (Date2dmy(dtDOE, 3) = Date2dmy(dtOpenPeriod, 3))
                        if (Date2dmy(dtTermination, 2) = Date2dmy(dtOpenPeriod, 2)) then begin
                            CountDaysofMonth := fnDaysInMonth(dtTermination);
                            DaysWorked := fnDaysWorked(dtTermination, true);

                            curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth);

                        end;
                    end;
                    //Prorate Basic Pay on    {What if someone leaves within the same month they are employed}
                    if dtTermination <> 0D then begin
                        dtTermination := CalcDate('-1D', dtTermination);
                        if dtDOE <> 0D then begin
                            if (Date2dmy(dtTermination, 2) = Date2dmy(dtOpenPeriod, 2)) and (Date2dmy(dtTermination, 3) = Date2dmy(dtOpenPeriod, 3)) then begin
                                CountDaysofMonth := fnDaysInMonth(dtTermination);
                                DaysWorked := fnDaysWorked(dtTermination, true);
                                curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth);
                            end;
                        end;
                    end;
                end;
            //basic pay balance
            curBPAYBal := 0;
            salCard.Reset;
            salCard.SetRange(salCard."Employee Code", strEmpCode);
            //salCard.CALCFIELDS(salCard."Cumm BasicPay");
            if salCard.FindFirst() then begin
                curBPAYBal := curBasicPay;
            end;
            if HREmp.get(strEmpCode) then begin
                if HREmp."On Suspension" = true then
                    curBPAYBal := curBasicPay / 3;
                if HREmp."On Interdiction" = true then
                    curBPAYBal := curBasicPay * 0.5;
                if HREmp.Absence > 0 then
                    curBPAYBal := 0;
            end;
            if HREmp."Employee Status 2" = HREmp."Employee Status 2"::Interdiction then
                curBasicPay := fnInterdiction(strEmpCode, curBasicPay, intMonth, intYear, SelectedPeriod, Dept)
            else begin
                if IsCasual then begin
                    curBPAYBal := curBasicPay;
                    // CasualEmp.Get(strEmpCode);
                end;
                curTransAmount := curBasicPay;
                strTransDescription := 'BASIC PAY';
                TGroup := 'BASIC SALARY';
                TGroupOrder := 1;
                TSubGroupOrder := 1;

                fnUpdatePeriodTrans(strEmpCode, 'BPAY', TGroup, TGroupOrder,
                                   TSubGroupOrder, strTransDescription, curTransAmount, curBPAYBal,
                                   intMonth, intYear, Membership, ReferenceNo, SelectedPeriod, Dept,
                                   salariesAcc, Journalpostas::Debit, Journalpostingtype::"G/L Account", ''
                                   , Coopparameters::none);

                /*
                 //Salary Arrears
                 prSalaryArrears.Reset;
                 prSalaryArrears.SetRange(prSalaryArrears."Employee Code",strEmpCode);
                 prSalaryArrears.SetRange(prSalaryArrears."Period Month",intMonth);
                 prSalaryArrears.SetRange(prSalaryArrears."Period Year",intYear);
                 if prSalaryArrears.FindFirst() then begin
                 repeat
                      curSalaryArrears := prSalaryArrears."Salary Arrears";
                      curPayeArrears := prSalaryArrears."PAYE Arrears";

                      //Insert [Salary Arrears] into period trans [ARREARS]
                      curTransAmount := curSalaryArrears;
                      strTransDescription := 'Salary Arrears';
                      TGroup := 'ARREARS'; TGroupOrder := 1; TSubGroupOrder := 2;
                      fnUpdatePeriodTrans(strEmpCode, prSalaryArrears."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                        strTransDescription, curTransAmount, 0, intMonth, intYear,Membership,ReferenceNo,SelectedPeriod,Dept,
                        salariesAcc,Journalpostas::Debit,Journalpostingtype::"G/L Account",'',Coopparameters::none);

                      //Insert [PAYE Arrears] into period trans [PYAR]
                      curTransAmount:= curPayeArrears;

                      strTransDescription := 'P.A.Y.E Arrears';
                      TGroup := 'STATUTORIES'; TGroupOrder := 7; TSubGroupOrder := 4;
                      fnUpdatePeriodTrans(strEmpCode, 'PYAR', TGroup, TGroupOrder, TSubGroupOrder,
                         strTransDescription, curTransAmount, 0, intMonth, intYear,Membership,ReferenceNo,SelectedPeriod,Dept
                         ,salariesAcc,Journalpostas::Debit,Journalpostingtype::"G/L Account",'',Coopparameters::none)

                 until prSalaryArrears.Next=0;
                 end;
                */

                //Get Earnings
                prEmployeeTransactions.Reset;
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
                // prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
                //prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", selectedperiod);
                prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
                if prEmployeeTransactions.FindFirst() then begin
                    curTotAllowances := 0;
                    repeat
                        prTransactionCodes.Reset;
                        prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                        prTransactionCodes.SetFilter(prTransactionCodes."Transaction Type", '<>%1', prTransactionCodes."transaction type"::Deduction);
                        if prTransactionCodes.FindFirst() then begin

                            curTransAmount := 0;
                            curTransBalance := 0;
                            strTransDescription := '';
                            strExtractedFrml := '';
                            curIncludeinNet := 0;
                            if prTransactionCodes."Is Formula" then begin
                                strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                                curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                                                                     //error('%1',curTransAmount);

                            end else begin
                                curTransAmount := prEmployeeTransactions.Amount;
                                curTransAmount := curTransAmount;
                            end;

                            if prTransactionCodes."Balance Type" = prTransactionCodes."balance type"::None then //[0=None, 1=Increasing, 2=Reducing]
                                curTransBalance := 0;
                            if prTransactionCodes."Balance Type" = prTransactionCodes."balance type"::Increasing then
                                curTransBalance := prEmployeeTransactions.Balance + curTransAmount;
                            if prTransactionCodes."Balance Type" = prTransactionCodes."balance type"::Reducing then
                                curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                            if prTransactionCodes."Include in Net" = true then begin
                                curIncludeinNet := curTransAmount;
                            end;

                            //Hous
                            if prTransactionCodes."Exempt Housing Levy" = true then HLevyException := HLevyException + curTransAmount;


                            //Prorate Allowances Here
                            //Get the Basic Salary (prorate basc pay if needed) //Termination Remaining
                            if (dtDOE <> 0D) and (prTransactionCodes."Disable Proration") then begin
                                IF (DATE2DMY(dtDOE, 2) = DATE2DMY(dtOpenPeriod, 2)) AND (DATE2DMY(dtDOE, 3) = DATE2DMY(dtOpenPeriod, 3)) THEN BEGIN
                                    CountDaysofMonth := fnDaysInMonth(dtDOE);
                                    DaysWorked := fnDaysWorked(dtDOE, FALSE);
                                    curTransAmount := fnBasicPayProrated(strEmpCode, intMonth, intYear, curTransAmount, DaysWorked, CountDaysofMonth);
                                END;
                            end;

                            HREmp.Get(strEmpCode);
                            if (HREmp."Re-Employment Date" <> 0D) then
                                if (Date2dmy(HREmp."Re-Employment Date", 2) = Date2dmy(dtOpenPeriod, 2)) and (Date2dmy(HREmp."Re-Employment Date", 3) = Date2dmy(dtOpenPeriod, 3)) and (prTransactionCodes."Disable Proration")
                                then begin
                                    CountDaysofMonth := fnDaysInMonth(HREmp."Re-Employment Date");
                                    DaysWorked := fnDaysWorked(HREmp."Re-Employment Date", false);
                                    curTransAmount := fnBasicPayProrated(strEmpCode, intMonth, intYear, curTransAmount, DaysWorked, CountDaysofMonth);
                                end;
                            //Prorate Basic Pay on    {What if someone leaves within the same month they are employed}
                            IF (dtTermination <> 0D) and (prTransactionCodes."Disable Proration") THEN BEGIN

                                IF (DATE2DMY(dtTermination, 2) = DATE2DMY(dtOpenPeriod, 2)) AND (DATE2DMY(dtTermination, 3) = DATE2DMY(dtOpenPeriod, 3)) THEN BEGIN
                                    CountDaysofMonth := fnDaysInMonth(dtTermination);
                                    DaysWorked := fnDaysWorked(dtTermination, TRUE);
                                    curTransAmount := fnBasicPayProrated(strEmpCode, intMonth, intYear, curTransAmount, DaysWorked, CountDaysofMonth);
                                END;

                            END;
                            // Prorate Allowances Here

                            //Add Non Taxable Here
                            if (not prTransactionCodes.Taxable) and (prTransactionCodes."Special Trans Deductions" =
                            prTransactionCodes."special trans deductions"::None) then
                                curNonTaxable := curNonTaxable + curTransAmount;

                            //Added to ensure special transaction that are not taxable are not inlcuded in list of Allowances
                            if (not prTransactionCodes.Taxable) and (prTransactionCodes."Special Trans Deductions" <>
                            prTransactionCodes."special trans deductions"::None) then
                                curTransAmount := 0;

                            curTotAllowances := curTotAllowances + curTransAmount; //Sum-up all the allowances
                            curTransAmount := curTransAmount;
                            curTransBalance := curTransBalance;
                            strTransDescription := prTransactionCodes."Transaction Name";
                            //jnlcode:=prTransactionCodes."GL Account";
                            TGroup := 'ALLOWANCE';
                            TGroupOrder := 3;
                            TSubGroupOrder := 0;
                            //MESSAGE(FORMAT(JournalAc));


                            //Get the posting Details
                            JournalPostingType := Journalpostingtype::"G/L Account";
                            JournalAc := '';
                            if prTransactionCodes.Subledger <> prTransactionCodes.Subledger::" " then begin
                                //FOR CUSTOMER
                                //***********************************

                                if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Employee then begin

                                    JournalAc := strEmpCode;
                                    JournalPostingType := Journalpostingtype::Employee;

                                end;

                                //FOR VENDOR
                                //***********************************
                                //           (

                            end else begin
                                //JournalAc:=jnlcode;
                                JournalPostingType := Journalpostingtype::"G/L Account";
                                JournalAc := prTransactionCodes."GL Account";

                            end;

                            if prTransactionCodes."Transaction Type" = prTransactionCodes."Transaction Type"::Benefit then begin
                                //Benefits are not included in Gross Calculations
                                curIncludeGross += -curTransAmount;
                                if prTransactionCodes.Taxable then begin
                                    if prTransactionCodes."Tax Exempt Amount" = 0 then
                                        curBenefits += curTransAmount
                                    else
                                        if prTransactionCodes."Tax Exempt Amount" < curTransAmount then
                                            curBenefits += curTransAmount * 3 / 10

                                end;
                            end;

                            //End posting Details

                            fnUpdatePeriodTrans
                            (
                                               strEmpCode, prTransactionCodes."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                                               strTransDescription, curTransAmount, curTransBalance, intMonth, intYear, '',
                                               prEmployeeTransactions."Reference No", SelectedPeriod, Dept, JournalAc, Journalpostas::Debit, JournalPostingType, '',
                                               prTransactionCodes."coop parameters"
                            );



                        end;
                    until prEmployeeTransactions.Next = 0;
                end;
            end;
            //Calc GrossPay = (BasicSalary + Allowances + SalaryArrears) [Group Order = 4]
            curGrossPay := (curBasicPay + curTotAllowances + curSalaryArrears + curIncludeGross);
            curTransAmount := curGrossPay; //0.01,'>' curGrossPay;
            curNetPay := curNetPay;

            strTransDescription := 'GROSS PAY';
            TGroup := 'GROSS PAY';
            TGroupOrder := 4;
            TSubGroupOrder := 0;
            fnUpdatePeriodTrans(strEmpCode, 'GPAY', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0, intMonth,
             intYear, '', '', SelectedPeriod, Dept, '', Journalpostas::Debit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            //************************************************************************************************************************************
            /*
                      //Get the NSSF amount
                      IF blnPaysNssf THEN
                        curNSSF := curNssfEmployee;
                      curTransAmount := curNSSF;
                      strTransDescription := 'N.S.S.F';
                      TGroup := 'STATUTORIES'; TGroupOrder := 7; TSubGroupOrder := 1;
                      fnUpdatePeriodTrans (strEmpCode, 'NSSF', TGroup, TGroupOrder, TSubGroupOrder,
                      strTransDescription, curTransAmount, 0, intMonth, intYear,'','',SelectedPeriod,Dept,
                      NSSFEMPyee,JournalPostAs::Credit,JournalPostingType::"G/L Account",'',CoopParameters::NSSF);
            

            */
            //************************************************************************************************************************************
            //NEW NSSF CODE HERE
            //Get the N.S.S.F amount for the month GBT
            curNssf_Base_Amount := 0;
            if intNSSF_BasedOn = Intnssf_basedon::Gross then //>NSSF calculation can be based on:
                curNssf_Base_Amount := curGrossPay;
            if intNSSF_BasedOn = Intnssf_basedon::Basic then
                curNssf_Base_Amount := curBasicPay;
            HREmp.get(strEmpCode);
            //Get the NSSF Tier 1 amount
            if blnPaysNssf and (HREmp.Status = HREmp.Status::Active) then begin
                NSSF1 := fnGetEmployerTier1NSSF(curNssf_Base_Amount);
                NSSF2 := fnGetEmployerTier2NSSF(curNssf_Base_Amount);

                curTransAmount := NSSF1 + NSSF2;
                strTransDescription := 'N.S.S.F';
                TGroup := 'STATUTORIES';
                TGroupOrder := 7;
                TSubGroupOrder := 1;
                if curTransAmount > 0 then
                    fnUpdatePeriodTrans(strEmpCode, 'NSSF', TGroup, TGroupOrder, TSubGroupOrder,
                    strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, NSSFEMPyee,
                    Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::NSSF);
            end;
            //Update Employer deductions
            if blnPaysNssf and (HREmp.Status = HREmp.Status::Active) then begin
                curNSSF := fnGetEmployerTier1NSSF(curNssf_Base_Amount);
                NSSF2 := fnGetEmployerTier2NSSF(curNssf_Base_Amount);
                curTransAmount := curNSSF + NSSF2;
                HREmp.Get(strEmpCode);
                if (curTransAmount > 0) and (HREmp.Status = HREmp.Status::Active) then
                    fnUpdateEmployerDeductions(strEmpCode, 'NSSF',
                     'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                      '', prEmployeeTransactions."Reference No", SelectedPeriod);
            end;
            //Get the NSSF Tier 2 amount
            // if blnPaysNssf then begin
            //     NSSF2 := fnGetEmployerTier2NSSF(curNssf_Base_Amount);
            //     curTransAmount := NSSF2;
            //     strTransDescription := 'N.S.S.F Tier 2';
            //     TGroup := 'STATUTORIES';
            //     TGroupOrder := 7;
            //     TSubGroupOrder := 1;
            //     fnUpdatePeriodTrans(strEmpCode, 'NSSF Tier 2', TGroup, TGroupOrder, TSubGroupOrder,
            //     strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, NSSFEMPyee,
            //     Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::NSSF);
            // end;
            // //Update Employer deductions
            // if blnPaysNssf then begin
            //     curNSSF := fnGetEmployerTier2NSSF(curNssf_Base_Amount);
            //     curTransAmount := curNSSF;
            //     fnUpdateEmployerDeductions(strEmpCode, 'NSSF Tier 2',
            //      'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
            //       '', prEmployeeTransactions."Reference No", SelectedPeriod);
            // end;

            curNSSF := NSSF1 + NSSF2;
            //New Housing Levy
            VitalSetup3.get;
            EmployeeHousingLevy := 0;
            ImplementHousingLevy := VitalSetup3."Implement Housing Levy";
            // if IsCasual then
            //     ImplementHousingLevy := false;
            if ImplementHousingLevy then begin
                VitalSetup3.testfield(VitalSetup3."Housing Levy");
                prTransactionCodes.Reset();
                prTransactionCodes.Get(VitalSetup3."Housing Levy");

                EmployerHousingPerc := prTransactionCodes."Employer Rate";
                EmployeeHousingPerc := prTransactionCodes."Formula %";
                curHLevyAmount := curGrossPay - HLevyException;
                //Employee Housing Levy
                if EmployeeHousingPerc <> 0 then
                    EmployeeHousingLevy := ROUND(curHLevyAmount * (EmployeeHousingPerc / 100), 1);
                curTransAmount := EmployeeHousingLevy;
                strTransDescription := prTransactionCodes."Transaction Name";
                TGroup := 'STATUTORIES';
                TGroupOrder := 7;
                TSubGroupOrder := 4;
                if curTransAmount > 0 then
                    fnUpdatePeriodTrans(strEmpCode, prTransactionCodes."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                    strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, HLevyEMPyee,
                    Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

                //Gross pay chargable Housing Levy
                strTransDescription := 'HLEVYGPAY';
                TGroup := 'GROSS PAY';
                TGroupOrder := 20;
                TSubGroupOrder := 0;
                fnUpdatePeriodTrans(strEmpCode, 'HLEVYGPAY', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curHLevyAmount, 0, intMonth,
                 intYear, '', '', SelectedPeriod, Dept, '', Journalpostas::Debit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

                //Employer Housing Levy
                if (EmployerHousingPerc <> 0) and (dtTermination = 0D) then
                    EmployerHousingLevy := ROUND(curHLevyAmount * (EmployerHousingPerc / 100), 1);
                curTransAmount := EmployerHousingLevy;
                HREmp.Get(strEmpCode);
                if (curTransAmount > 0) and (HREmp.Status = HREmp.Status::Active) then
                    fnUpdateEmployerDeductions(strEmpCode, prTransactionCodes."Transaction Code",
                     'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                      '', prEmployeeTransactions."Reference No", SelectedPeriod);

            end;

            // //Get the Defined contribution to post based on the Max Def contrb allowed
            // curDefinedContrib := NSSF2 + NSSF1;
            // curNSSF := curDefinedContrib;
            // curTransAmount := curDefinedContrib;
            // curDefinedContrib_2 := curDefinedContrib;
            // strTransDescription := 'Employee NSSF';
            // TGroup := 'TAX CALCULATIONS';
            // TGroupOrder := 6;
            // TSubGroupOrder := 1;
            // fnUpdatePeriodTrans(strEmpCode, 'DEFCON', TGroup, TGroupOrder, TSubGroupOrder,
            //  strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
            //  '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            //Get the Gross taxable amount
            //>GrossTaxable = Gross + Benefits + nValueofQuarters  ******Confirm CurValueofQuaters
            curGrossTaxable := curGrossPay + curBenefits + curValueOfQuarters;

            //>If GrossTaxable = 0 Then TheDefinedToPost = 0
            if curGrossTaxable = 0 then curDefinedContrib := 0;

            //Personal Relief
            // if get relief is ticked  - DENNO ADDED

            //Added for auto relief calculation

            if (curGrossPay - curNSSF - curNHIF) <= VitalSetup."Minimum Taxable Pay" then // <<< 26th-April-2020 Reduction in Paye>>>
            begin
                blnGetsPAYERelief := false;
            end else begin
                blnGetsPAYERelief := true;
                //If employee is marked on salary card as not entitle to personal relief  -- a)
                PRSalCard_2.Reset;
                if PRSalCard_2.Get(strEmpCode) then begin
                    if PRSalCard_2."De-Activate Personal Relief?" then blnGetsPAYERelief := false;
                end;
            end;

            //<<< Overwride a) above

            if (curGrossPay - curNSSF) <= VitalSetup."Minimum Taxable Pay" then begin
                blnGetsPAYERelief := false;
            end;
            // >>>

            if blnGetsPAYERelief then begin
                curReliefPersonal := curReliefPersonal + curUnusedRelief; //*****Get curUnusedRelief
                curTransAmount := curReliefPersonal;
                strTransDescription := 'Personal Relief';
                TGroup := 'TAX CALCULATIONS';
                TGroupOrder := 6;
                TSubGroupOrder := 9;
                fnUpdatePeriodTrans(strEmpCode, 'PSNR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                 curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                 '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
            end
            else
                curReliefPersonal := 0;

            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //>Pension Contribution [self] relief
            EmployeePensionArrears := 0;
            EmployeePensionArrears := GetEmployeePensionArrears(strEmpCode);
            curPensionStaff := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
            Specialtranstype::"Defined Contribution", false);//Self contrib Pension is 1 on [Special Transaction]
            if HREmp.Get(strEmpCode) then
                // if HREmp."Employee Status 2" = HREmp."Employee Status 2"::Interdiction then
                //     curPensionStaff := curPensionStaff / 2;
            curPensionStaff := curPensionStaff + NSSF2 + NSSF1 + EmployeePensionArrears;
            if curPensionStaff > 0 then begin
                if (curPensionStaff) > curMaxPensionContrib then
                    curTransAmount := curMaxPensionContrib
                else
                    curTransAmount := curPensionStaff;
                strTransDescription := 'Pension Relief';
                TGroup := 'TAX CALCULATIONS';
                TGroupOrder := 6;
                TSubGroupOrder := 2;
                fnUpdatePeriodTrans(strEmpCode, 'PNSR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none)
            end;

            //New NHIF Relief Update <<<
            curNhif_Base_Amount := 0;
            curNHIF := 0;
            currNHIFRelief := 0;

            if VitalSetup."Implement NHIF Relief" then begin
                VitalSetup.TESTFIELD("NHIF Relief Percentage");
                if PRSalCard_2.Get(strEmpCode) then begin

                end;
                if blnPaysNhif and blnPaysPaye then begin


                    if intNHIF_BasedOn = intNHIF_BasedOn::Gross then curNhif_Base_Amount := curGrossPay;
                    if intNHIF_BasedOn = intNHIF_BasedOn::Basic then curNhif_Base_Amount := curBasicPay;

                    curNHIF := fnGetEmployeeNHIF(curNhif_Base_Amount);
                    currNHIFRelief := curNHIF * (VitalSetup."NHIF Relief Percentage" / 100);

                    // MESSAGE('NHIF is %1 and the relief is %2', currNHIFRelief, curNHIF);

                    curNhif_Base_Amount := 0;
                    curNHIF := 0;
                    if PRSalCard_2.Get(strEmpCode) then begin
                        if not PRSalCard_2."Has Insurance Relief" then
                            currNHIFRelief := 0;
                    end;
                    if currNHIFRelief > 0 then begin
                        curTransAmount := ROUND(currNHIFRelief, 0.05);
                        strTransDescription := 'SHIF Relief';
                        TGroup := 'TAX CALCULATIONS';
                        TGroupOrder := 6;
                        TSubGroupOrder := 8;

                        fnUpdatePeriodTrans(strEmpCode, 'NHIF-RL', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                        curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                        '', JournalPostAs::Credit, Journalpostingtype::"G/L Account", '', CoopParameters::none);
                    end;
                end;
            end;

            //>>> NHIF Relief Update




            //if he PAYS paye only*******************I
            // if blnPaysPaye and blnGetsPAYERelief then begin
            if blnGetsPAYERelief then begin
                //Get Insurance Relief
                curInsuranceReliefAmount := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                Specialtranstype::"Life Insurance", false); //Insurance is 3 on [Special Transaction]

                //********************************************************************************************************************************************************
                //Added  - for employees who have brought the Insurance certificate, they are entitled to Insurance relief, Otherwise NO
                //Place a check mark on the Salary Card to YES
                // and (blnInsuranceCertificate) 
                if (curInsuranceReliefAmount > 0) then begin
                    curTransAmount := curInsuranceReliefAmount;
                    strTransDescription := 'Insurance Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 8;

                    //Added  to limit maximum insurance reliedf ro 5,000
                    if curTransAmount > VitalSetup."Max Relief" then curTransAmount := VitalSetup."Max Relief";

                    fnUpdatePeriodTrans(strEmpCode, 'INSR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                end;

                //Get Pension Relief
                curPensionReliefAmount := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                Specialtranstype::"Voluntary Pension", false); //Insurance is 3 on [Special Transaction]
                if curPensionReliefAmount > 0 then begin
                    curTransAmount := curPensionReliefAmount;
                    strTransDescription := 'Voluntary NSSF / Pension Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 8;
                    fnUpdatePeriodTrans(strEmpCode, 'IPR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

                end;

                //>OOI
                curOOI := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                Specialtranstype::"Owner Occupier Interest", false); //Morgage is LAST on [Special Transaction]
                if curOOI > 0 then begin
                    if curOOI <= curOOIMaxMonthlyContrb then
                        curTransAmount := curOOI
                    else
                        curTransAmount := curOOIMaxMonthlyContrb;

                    strTransDescription := 'Owner Occupier';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 2;
                    fnUpdatePeriodTrans(strEmpCode, 'OOI', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                end;

                //HOSP
                curHOSP := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                Specialtranstype::"Home Ownership Savings Plan", false); //Home Ownership Savings Plan
                if curHOSP > 0 then begin
                    if curHOSP <= curReliefMorgage then
                        curTransAmount := curHOSP
                    else
                        curTransAmount := curReliefMorgage;

                    strTransDescription := 'Home Ownership Savings Plan';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 4;
                    fnUpdatePeriodTrans(strEmpCode, 'HOSP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                end;

                //Dann
                //Mortage Relief
                curMorgageRelief := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                Specialtranstype::"Mortgage Relief", false);
                if curMorgageRelief > 0 then begin
                    curTransAmount := curMorgageRelief;
                    curMorgageRelief := curMorgageRelief;
                    strTransDescription := 'Mortgage Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 9;
                    fnUpdatePeriodTrans(strEmpCode, 'MORG-RL', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none)

                end;



                //Enter NonTaxable Amount
                if curNonTaxable > 0 then begin
                    strTransDescription := 'Other Non-Taxable Benefits';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 5;
                    fnUpdatePeriodTrans(strEmpCode, 'NONTAX', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curNonTaxable, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                end;

            end;

            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            /*
            //>Company pension, Excess pension, Tax on excess pension
            curPensionCompany := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear, SpecialTransType::"Defined Contribution",
            TRUE); //Self contrib Pension is 1 on [Special Transaction]
            IF curPensionCompany > 0 THEN BEGIN
                curTransAmount := curPensionCompany;
                strTransDescription := 'Pension (Company)';
                //Update the Employer deductions table

                curExcessPension:= curPensionCompany - curMaxPensionContrib;
                IF curExcessPension > 0 THEN BEGIN
                    curTransAmount := curExcessPension;
                    strTransDescription := 'Excess Pension';
                    TGroup := 'STATUTORIES'; TGroupOrder := 7; TSubGroupOrder := 5;
                    fnUpdatePeriodTrans (strEmpCode, 'EXCP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0,
                     intMonth,intYear,'','',SelectedPeriod,Dept,costc);

                    curTaxOnExcessPension := (curRateTaxExPension / 100) * curExcessPension;
                    curTransAmount := curTaxOnExcessPension;
                    strTransDescription := 'Tax on ExPension';
                    TGroup := 'STATUTORIES'; TGroupOrder := 7; TSubGroupOrder := 6;
                    fnUpdatePeriodTrans (strEmpCode, 'TXEP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0,
                     intMonth,intYear,'','',SelectedPeriod,Dept,costc);
                END;
            END;
             */

            //Get the Taxable amount for calculation of PAYE
            //>prTaxablePay = (GrossTaxable - SalaryArrears) - (TheDefinedToPost + curSelfPensionContrb + MorgageRelief)


            // BenifitAmount := 0;

            // PRTransCode_2.Reset;
            // PRTransCode_2.SetRange(PRTransCode_2."Transaction Type", PRTransCode_2."transaction type"::Benefit);
            // if PRTransCode_2.FindFirst() then begin
            //     PREmpTrans_2.Reset;
            //     PREmpTrans_2.SetRange(PREmpTrans_2."Transaction Code", PRTransCode_2."Transaction Code");
            //     PREmpTrans_2.SetRange(PREmpTrans_2."Employee Code", strEmpCode);
            //     PREmpTrans_2.SetRange(PREmpTrans_2."Payroll Period", SelectedPeriod);
            //     if PREmpTrans_2.FindFirst() then begin
            //         if PRTransCode_2.Taxable then 
            //         BenifitAmount := (PREmpTrans_2.Amount * 30 / 100);
            //         //Insert in to PR Period Trans
            //         strTransDescription := PRTransCode_2."Transaction Name";
            //         curTransAmount := PREmpTrans_2.Amount;
            //         PREmpTrans_2.Amount := ROUND(PREmpTrans_2.Amount, 0.05);
            //         TGroup := 'TAX CALCULATIONS';
            //         TGroupOrder := 6;
            //         TSubGroupOrder := 1;
            //         fnUpdatePeriodTrans(strEmpCode, PRTransCode_2."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
            //         strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
            //         '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            //         //Initialize
            //         curTransAmount := 0;
            //         curTransBalance := 0;
            //         strTransDescription := '';
            //     end;
            // end;


            //Add HOSP and MORTGAGE KIM{}
            prEmployeeTransactions.Reset;
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added  to not process Stopped Transactions
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Type2", prEmployeeTransactions."Transaction Type2"::Deduction);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.NonTaxable, true);
            if prEmployeeTransactions.FindSet() then
                repeat
                    prTransactionCodes.Get(prEmployeeTransactions."Transaction Code");
                    if prTransactionCodes."Deduction Limit" <> 0 then begin
                        if prTransactionCodes."Deduction Limit" > prEmployeeTransactions.Amount then
                            curNonTaxable += prEmployeeTransactions.Amount
                        else
                            curNonTaxable += prTransactionCodes."Deduction Limit";
                    end
                    else
                        curNonTaxable += prEmployeeTransactions.Amount;
                until prEmployeeTransactions.Next() = 0;
            //Added Wesa 
            if CurNHIF = 0 then
                curNHIF := fnGetEmployeeNHIF(curGrossPay);
            if EmployeeHousingLevy = 0 then
                EmployeeHousingLevy := ROUND(curHLevyAmount * (EmployeeHousingPerc / 100), 1);
            EmployeePensionArrears := 0;
            EmployeePensionArrears := GetEmployeePensionArrears(strEmpCode);
            curPensionStaff := curPensionStaff + curDefinedContrib + EmployeePensionArrears;
            //if strEmpCode = 'EKM11111' then message('curPensionStaff is %1 for EMP00013', curPensionStaff);
            if curPensionStaff > curMaxPensionContrib then begin
                curTaxablePay := curGrossTaxable - (curSalaryArrears + curMaxPensionContrib + curOOI + curHOSP + curNonTaxable
                                 + curPensionReliefAmount + curNHIF + EmployeeHousingLevy) + BenifitAmount;
            end else begin
                //Added Wesa 
                curPensionStaff := curPensionStaff - curDefinedContrib - EmployeePensionArrears;
                curTaxablePay := curGrossTaxable - (curSalaryArrears + curDefinedContrib + curPensionStaff + EmployeePensionArrears + curOOI + curHOSP + curNonTaxable
                               + curPensionReliefAmount + curNHIF + EmployeeHousingLevy) + BenifitAmount;
            end;
            if IsCasual then begin
                // if CasualEmp.Get(strEmpCode) then
                //     if CasualEmp.Disabled then begin
                //         if curDisabledLimit >= curTaxablePay then
                //             curTaxablePay := 0
                //         else
                //             curTaxablePay := curTaxablePay - curDisabledLimit;
                //     end;

            end else begin
                PRSalCard_Disability.reset;
                PRSalCard_Disability.SetRange("Employee Code", strEmpCode);
                if PRSalCard_Disability.FindFirst() then begin
                    if PRSalCard_Disability."PWD Certificate?" = true then begin
                        if curDisabledLimit >= curTaxablePay then
                            curTaxablePay := 0
                        else
                            curTaxablePay := curTaxablePay - curDisabledLimit;

                    end;
                end;
            end;
            curTaxablePay := curTaxablePay;
            curTransAmount := curTaxablePay;
            curTaxablePay := curTaxablePay;
            strTransDescription := 'Taxable Pay';
            TGroup := 'TAX CALCULATIONS';
            TGroupOrder := 6;
            TSubGroupOrder := 6;
            fnUpdatePeriodTrans(strEmpCode, 'TXBP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
             curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
             '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            //
            //  //Get the Tax charged for the month
            // //Added for auto relief calculation
            // IF  (curGrossPay-curNSSF)  <= currMinRelief THEN
            // BEGIN
            //     blnPaysPaye:=FALSE;
            // END ELSE
            // BEGIN
            //     blnPaysPaye:=TRUE;
            // END;
            //


            if blnPaysPaye then begin
                //Added:: Dann.... Special tax for disabled employee
                //HREmp2.Reset;
                if HREmp2.Get(strEmpCode) and not IsCasual then begin
                    if HREmp2."Disability Description" <> '' then begin
                        blnPaysPaye := false;
                    end else begin
                        //Added:: Dann - Special Tax for Secondary Staff
                        HREmp2.RESET;
                        if HREmp2.Get(strEmpCode) then begin
                            if HREmp2."Employee Type" = HREmp2."employee type"::Secondary then begin
                                curTaxCharged := curTaxablePay * PRVitalSetup."Seconded Emp PAYE";
                                curTransAmount := curTaxCharged;
                                curTransAmount := curTaxCharged;
                                strTransDescription := 'Tax Charged';
                                TGroup := 'TAX CALCULATIONS';
                                TGroupOrder := 6;
                                TSubGroupOrder := 7;
                                fnUpdatePeriodTrans(strEmpCode, 'TXCHRG', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                                curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                                '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                            end else begin
                                //Error('Taxable Pay for [ %1 ] is [ %2 ]', strEmpCode, curTaxablePay);
                                //Tax for Normal staff
                                curTaxCharged := fnGetEmployeePaye(curTaxablePay);
                                curTransAmount := Round(curTaxCharged, 0.05); //ROUND PAYE UP TO NEAREST WHOLE NO
                                strTransDescription := 'Tax Charged';
                                TGroup := 'TAX CALCULATIONS';
                                TGroupOrder := 6;
                                TSubGroupOrder := 7;
                                fnUpdatePeriodTrans(strEmpCode, 'TXCHRG', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                                curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                                '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                            end;
                        end;
                    end;
                end;
                if IsCasual then begin
                    curTaxCharged := fnGetEmployeePaye(curTaxablePay);
                    curTransAmount := curTaxCharged; //ROUND PAYE UP TO NEAREST WHOLE NO
                    strTransDescription := 'Tax Charged';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 7;
                    fnUpdatePeriodTrans(strEmpCode, 'TXCHRG', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
                end;
            end;

            //Get the Net PAYE amount to post for the month
            if VitalSetup."Enable Relief On PAYE Only" then begin
                if (curReliefPersonal + curInsuranceReliefAmount) > curMaximumRelief then begin
                    curPAYE := curTaxCharged - curMaximumRelief;
                end else begin
                    //******************************************************************************************************************************************
                    //Added : Only for Employees who have brought their insurance Certificate are entitled to Insurance Relief Otherwise NO
                    //Place a check mark on the Salary Card to YES
                    if (blnInsuranceCertificate) then begin
                        curPAYE := curTaxCharged - (curReliefPersonal + curInsuranceReliefAmount + curMorgageRelief + currNHIFRelief);
                    end else begin
                        curPAYE := curTaxCharged - (curReliefPersonal + curMorgageRelief + currNHIFRelief);
                    end;
                    //******************************************************************************************************************************************
                end;
            end else begin
                if (curReliefPersonal + curInsuranceReliefAmount + currNHIFRelief) > curMaximumRelief then begin
                    curPAYE := curTaxCharged - curMaximumRelief;
                end else begin
                    //******************************************************************************************************************************************
                    //Added : Only for Employees who have brought their insurance Certificate are entitled to Insurance Relief Otherwise NO
                    //Place a check mark on the Salary Card to YES
                    if curTaxCharged < currNHIFRelief then begin
                        currNHIFRelief := 0;
                        if (blnInsuranceCertificate) then begin
                            curPAYE := curTaxCharged - (curReliefPersonal + curInsuranceReliefAmount + curMorgageRelief + currNHIFRelief);
                        end else begin
                            curPAYE := curTaxCharged - (curReliefPersonal + curMorgageRelief + currNHIFRelief);
                        end;
                    end;
                    //******************************************************************************************************************************************
                end;
            end;

            if curPAYE < 0 then curPAYE := 0;

            //Added for auto PAYE calculation
            //   IF  (curGrossPay-curNSSF)  <= currMinRelief THEN
            //   BEGIN
            //       blnPaysPaye:=FALSE;
            //   END ELSE
            //   BEGIN
            //       blnPaysPaye:=TRUE;
            //   END;


            if not blnPaysPaye then curPAYE := 0; //Get statutory Exemption for the staff. If exempted from tax, set PAYE=0
            curTransAmount := curPAYE;
            if curPAYE < 0 then curTransAmount := 0;
            curPAYE := curPAYE;
            strTransDescription := 'P.A.Y.E';
            TGroup := 'STATUTORIES';
            TGroupOrder := 7;
            TSubGroupOrder := 3;

            fnUpdatePeriodTrans(strEmpCode, 'PAYE', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
            curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
            TaxAccount, Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            /*          //Store the unused relief for the current month
                     //>If Paye<0 then "Insert into tblprUNUSEDRELIEF
                     if curPAYE < 0 then begin
                     prUnusedRelief.Reset;
                     prUnusedRelief.SetRange(prUnusedRelief."Employee Code",strEmpCode);
                     prUnusedRelief.SetRange(prUnusedRelief."Period Month",intMonth);
                     prUnusedRelief.SetRange(prUnusedRelief."Period Year",intYear);
                     if prUnusedRelief.FindFirst() then
                        prUnusedRelief.Delete;

                     prUnusedRelief.Reset;
                     with prUnusedRelief do begin
                         Init;
                         "Employee Code" := strEmpCode;
                         "Unused Relief" := curPAYE;
                         "Period Month" := intMonth;
                         "Period Year" := intYear;
                         Insert;
                     end;
                    end; */

            //Deductions: get all deductions for the month
            //Loans: calc loan deduction amount, interest, fringe benefit (employer deduction), loan balance
            //>Balance = (Openning Bal + Deduction)...//Increasing balance
            //>Balance = (Openning Bal - Deduction)...//Reducing balance
            //>NB: some transactions (e.g Sacco shares) can be made by cheque or cash. Allow user to edit the outstanding balance

            //Get the N.H.I.F amount for the month GBT
            curNhif_Base_Amount := 0;

            if intNHIF_BasedOn = Intnhif_basedon::Gross then //>NHIF calculation can be based on:
                curNhif_Base_Amount := curGrossPay;
            if intNHIF_BasedOn = Intnhif_basedon::Basic then
                curNhif_Base_Amount := curBasicPay;
            if intNHIF_BasedOn = Intnhif_basedon::"Taxable Pay" then
                curNhif_Base_Amount := curTaxablePay;

            if blnPaysNhif then begin
                curNHIF := fnGetEmployeeNHIF(curNhif_Base_Amount);
                curTransAmount := curNHIF;
                strTransDescription := 'S.H.I.F';
                TGroup := 'STATUTORIES';
                TGroupOrder := 7;
                TSubGroupOrder := 2;
                fnUpdatePeriodTrans(strEmpCode, 'NHIF', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                 curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                 NHIFEMPyee, Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);
            end;


            prEmployeeTransactions.Reset;
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added  to not process Stopped Transactions
            if prEmployeeTransactions.FindFirst() then begin
                curTotalDeductions := 0;
                repeat
                    prTransactionCodes.Reset;
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Type", prTransactionCodes."transaction type"::Deduction);
                    prTransactionCodes.SetFilter("coop parameters", '<>%1', prTransactionCodes."coop parameters"::"loan Interest");
                    if prTransactionCodes.FindFirst() then begin
                        curTransAmount := 0;
                        curTransBalance := 0;
                        strTransDescription := '';
                        strExtractedFrml := '';



                        if prTransactionCodes."Is Formula" then begin
                            strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                            curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                        end else begin
                            if prTransactionCodes."Calculation Method" = prTransactionCodes."Calculation Method"::"Gross Pay" then
                                curTransAmount := curGrossPay * prTransactionCodes."Formula %" / 100
                            else
                                if prTransactionCodes."Calculation Method" = prTransactionCodes."Calculation Method"::"Taxable Pay" then
                                    curTransAmount := curTaxablePay * prTransactionCodes."Formula %" / 100
                                else
                                    curTransAmount := prEmployeeTransactions.Amount;

                            // prEmployeeTransactions.Amount := prEmployeeTransactions.Amount;
                        end;

                        // Dann - Customized for AFFA (Each Directorate has its own Formalua for Pension
                        if prTransactionCodes."Is Formula Per Directorate" then begin
                            //Get directorate of staff
                            if HREmp.Get(strEmpCode) then begin
                                HREmp.TestField(HREmp."Global Dimension 1 Code");

                                //Get Formulae from PR Trans Code Formulae
                                PRTransCodeForm.Reset;
                                PRTransCodeForm.SetRange(PRTransCodeForm."Global Dimension 1 Code", HREmp."Global Dimension 1 Code");
                                if PRTransCodeForm.FindFirst() then begin
                                    PRTransCodeForm.TestField(PRTransCodeForm."Employee Formulae");
                                    strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, PRTransCodeForm."Employee Formulae");
                                    curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                end else begin
                                    //                     ERROR('Formulae Per Directorate for Transaction Code[ %1 ] is not specified for Directorate %2',
                                    //                           strTransCode,HREmp."Global Dimension 1 Code");
                                end;
                            end;
                        end;
                        // Dann - End Customized for AFFA

                        //**************************If "deduct Premium" is not ticked and the type is insurance- Dennis*****
                        if (prTransactionCodes."Special Trans Deductions" = prTransactionCodes."special trans deductions"::"Life Insurance")
                          and (prTransactionCodes."Deduct Premium" = false) then begin
                            curTransAmount := 0;
                        end;

                        //**************************If "deduct Premium" is not ticked and the type is mortgage- Dennis*****
                        if (prTransactionCodes."Special Trans Deductions" = prTransactionCodes."special trans deductions"::Mortgage)
                         and (prTransactionCodes."Deduct Mortgage" = false) then begin
                            curTransAmount := 0;
                        end;


                        //**************************If "deduct Premium" is not ticked and the type is mortgage- Dennis*****
                        if (prTransactionCodes."Special Trans Deductions" = prTransactionCodes."special trans deductions"::"Voluntary Pension")
                         and (prTransactionCodes.Welfare = false) then begin
                            curTransAmount := 0;
                        end;

                        //Get the posting Details  -- Deductions for Salary Advance
                        JournalPostingType := Journalpostingtype::"G/L Account";
                        JournalAc := '';
                        if prTransactionCodes.Subledger <> prTransactionCodes.Subledger::" " then begin
                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Employee then begin

                                JournalAc := Employee."No.";
                                JournalPostingType := Journalpostingtype::Employee;

                            end;

                            //FOR VENDOR
                            //***********************************
                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Vendor then begin
                                if HREmp.Get(strEmpCode) then begin
                                    JournalAc := prEmployeeTransactions."Subledger Account";
                                    JournalPostingType := Journalpostingtype::Vendor;
                                end;
                            end;
                        end else begin
                            JournalAc := prTransactionCodes."GL Account";
                            JournalPostingType := Journalpostingtype::"G/L Account";
                        end;

                        //End posting Details


                        //Loan Calculation is Amortized do Calculations here -Monthly Principal and Interest Keeps on Changing
                        if (prTransactionCodes."Special Trans Deductions" = prTransactionCodes."special trans deductions"::"Sacco Loan") and
                           (prTransactionCodes."Repayment Method" = prTransactionCodes."repayment method"::Reducing) then begin
                            curTransAmount := 0;
                            curLoanInt := 0;

                            prTransactionCodes.TestField("Intrest Transaction Code");
                            prTransactionCodes.TestField("Interest Rate");

                            //if not prEmployeeTransactions."Exempt from Interest" then prEmployeeTransactions.TestField(prEmployeeTransactions."Loan Interest Rate");
                            //niko hapa
                            clear(curLoanInt);

                            curLoanInt := fnCalcLoanInterest(strEmpCode, prTransactionCodes."Intrest Transaction Code",
                            prTransactionCodes."Interest Rate", prTransactionCodes."Repayment Method",
                               prEmployeeTransactions."Original Amount", prEmployeeTransactions.Balance, SelectedPeriod);
                            //Post the Interest
                            if (curLoanInt <> 0) then begin
                                //curTransAmount := curLoanInt;
                                curTotalDeductions := curTotalDeductions + curLoanInt; //Sum-up all the deductions
                                curTransBalance := 0;
                                strTransCode := prTransactionCodes."Intrest Transaction Code";
                                strTransDescription := prEmployeeTransactions."Transaction Name" + ' - Interest';
                                TGroup := 'DEDUCTIONS';
                                TGroupOrder := 8;
                                TSubGroupOrder := 1;

                                fnUpdatePeriodTrans(strEmpCode, strTransCode, TGroup, TGroupOrder, TSubGroupOrder,
                                  strTransDescription, curLoanInt, curTransBalance, intMonth, intYear,
                                  '', prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                                  JournalAc, Journalpostas::Credit, JournalPostingType, prEmployeeTransactions."Loan Number",
                                  Coopparameters::"loan Interest")
                            end;

                            //Added DW - Create intrest transaction code in PR Employee Transactions
                            PREmpTrans_INT.Reset();
                            PREmpTrans_INT.Init();
                            PREmpTrans_INT."Employee Code" := strEmpCode;
                            PREmpTrans_INT."Transaction Code" := prTransactionCodes."Intrest Transaction Code";
                            PREmpTrans_INT.Validate("Transaction Code");
                            PREmpTrans_INT."Period Month" := Date2DMY(SelectedPeriod, 2);
                            PREmpTrans_INT."Period Year" := Date2DMY(SelectedPeriod, 3);
                            PREmpTrans_INT."Payroll Period" := SelectedPeriod;
                            PREmpTrans_INT.Amount := curLoanInt;
                            if not PREmpTrans_INT.Insert() then PREmpTrans_INT.Modify();

                            //Added DW



                            //Get the Principal Amt
                            //curTransAmount:=prEmployeeTransactions."Amortized Loan Total Repay Amt"-curLoanInt;
                            //Modify PREmployeeTransaction Table
                            //prEmployeeTransactions.Amount:=curTransAmount;
                            //prEmployeeTransactions.MODIFY;
                        end;
                        //Loan Calculation Amortized

                        case prTransactionCodes."Balance Type" of //[0=None, 1=Increasing, 2=Reducing]
                            prTransactionCodes."balance type"::None:
                                begin
                                    curTransBalance := 0;
                                    curTransAmount := prEmployeeTransactions.Amount;
                                end;
                            prTransactionCodes."balance type"::Increasing:
                                begin
                                    //Added Dann
                                    if prTransactionCodes."Special Trans Deductions" <> prTransactionCodes."special trans deductions"::"Defined Contribution"
                                    then begin
                                        curTransAmount := prEmployeeTransactions.Amount;
                                        // if HREmp.Get(strEmpCode) then
                                        //     if HREmp."Employee Status 2" = HREmp."Employee Status 2"::Interdiction then
                                        //         curTransAmount := curTransAmount / 2;
                                    end;
                                    //Added Dann
                                    curTransBalance := prEmployeeTransactions.Balance + curTransAmount;
                                end;
                            prTransactionCodes."balance type"::Reducing:
                                begin
                                    //curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                                    if prEmployeeTransactions.Balance < prEmployeeTransactions.Amount then begin
                                        curTransAmount := prEmployeeTransactions.Balance;
                                        curTransBalance := 0;
                                    end else begin
                                        //Added Dann
                                        curTransAmount := prEmployeeTransactions.Amount;
                                        //Added Dann

                                        curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                                    end;
                                    if curTransBalance < 0 then begin
                                        curTransAmount := 0;
                                        curTransBalance := 0;
                                    end;
                                end
                        end;

                        curTotalDeductions := curTotalDeductions + curTransAmount; //Sum-up all the deductions
                        curTransAmount := curTransAmount;
                        curTransBalance := curTransBalance;
                        strTransDescription := prTransactionCodes."Transaction Name";

                        TGroup := 'DEDUCTIONS';
                        TGroupOrder := 8;
                        TSubGroupOrder := 0;
                        fnUpdatePeriodTrans(strEmpCode, prEmployeeTransactions."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                         strTransDescription, curTransAmount, curTransBalance, intMonth,
                         intYear, '', prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                         JournalAc, Journalpostas::Credit, JournalPostingType, prEmployeeTransactions."Loan Number",
                         prTransactionCodes."coop parameters");
                        ///Insert Commission
                        /// 
                        // if prTransactionCodes.Commission <> 0 then begin

                        //     curTransAmount := curTransAmount * prTransactionCodes.Commission / 100;
                        //     curTransBalance := curTransBalance;
                        //     strTransDescription := prTransactionCodes."Transaction Name";

                        //     TGroup := 'COMMISSION';
                        //     TGroupOrder := 8;
                        //     TSubGroupOrder := 12;
                        //     fnUpdatePeriodTrans(strEmpCode, prEmployeeTransactions."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                        //                              strTransDescription, curTransAmount, curTransBalance, intMonth,
                        //                              intYear, '', prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                        //                              JournalAc, Journalpostas::Credit, JournalPostingType, prEmployeeTransactions."Loan Number",
                        //                              prTransactionCodes."coop parameters");
                        // end;
                        //Fringe Benefits and Low interest Benefits
                        if prTransactionCodes."Fringe Benefit" = true then begin
                            if prTransactionCodes."Interest Rate" < curLoanMarketRate then begin
                                fnCalcFringeBenefit := (((curLoanMarketRate - prTransactionCodes."Interest Rate") * curLoanCorpRate) / 1200)
                                 * prEmployeeTransactions.Balance;
                            end;
                        end else begin
                            fnCalcFringeBenefit := 0;
                        end;
                        HREmp.Get(strEmpCode);
                        if (fnCalcFringeBenefit > 0) and (HREmp.Status = HREmp.Status::Active) then begin
                            fnUpdateEmployerDeductions(strEmpCode, prEmployeeTransactions."Transaction Code" + '-FRG',
                             'EMP', TGroupOrder, TSubGroupOrder, 'Fringe Benefit Tax', fnCalcFringeBenefit, 0, intMonth, intYear,
                              '', prEmployeeTransactions."Reference No", SelectedPeriod)

                        end;
                        //End Fringe Benefits

                        //Create Employer Deduction
                        //Modified Dann  - Each Directorate has its own formula for Pension
                        if (prTransactionCodes."Special Trans Deductions" = prTransactionCodes."special trans deductions"::"Defined Contribution") then begin
                            if prTransactionCodes."Is Formula Per Directorate" then begin
                                //Get Directorate of Staff
                                if HREmp.Get(strEmpCode) then begin
                                    HREmp.TestField(HREmp."Global Dimension 1 Code");

                                    //Get Formulae from PR Trans Code Formulae
                                    PRTransCodeForm.Reset;
                                    PRTransCodeForm.SetRange(PRTransCodeForm."Global Dimension 1 Code", HREmp."Global Dimension 1 Code");
                                    if PRTransCodeForm.FindFirst() then begin
                                        if PRTransCodeForm."Include In Employer Deductions" then begin
                                            PRTransCodeForm.TestField(PRTransCodeForm."Employer Formulae");
                                        end;

                                        strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, PRTransCodeForm."Employer Formulae");
                                        curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                        HREmp.Get(strEmpCode);
                                        if (curTransAmount > 0) and (HREmp.Status = HREmp.Status::Active) then begin
                                            fnUpdateEmployerDeductions(strEmpCode, prEmployeeTransactions."Transaction Code",
                                           'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                                            '', prEmployeeTransactions."Reference No", SelectedPeriod);
                                        end;
                                    end;
                                end;
                            end else begin
                                if HREmp.Get(strEmpCode) then
                                    //basic pay balance
                                    curBPAYBal := 0;
                                salCard.Reset;
                                salCard.SetRange(salCard."Employee Code", strEmpCode);
                                //salCard.CALCFIELDS(salCard."Cumm BasicPay");
                                if salCard.FindFirst() then begin
                                    curBPAYBal := salCard."Basic Pay";
                                    curBasicPay := salCard."Basic Pay";
                                end;
                                if HREmp.get(strEmpCode) then begin
                                    if HREmp."On Suspension" = true then
                                        curBPAYBal := Round(curBasicPay / 3, 0.01);
                                    if HREmp."On Interdiction" = true then
                                        curBPAYBal := Round(curBasicPay * 0.5, 0.01);
                                    if HREmp.Absence > 0 then
                                        curBPAYBal := 0;
                                end;
                                PostingGroup.Get(HREmp."Posting Group");
                                IF PostingGroup."Employee Category Type" <> PostingGroup."Employee Category Type"::Judge then begin
                                    strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes."Is Formula for employer");
                                    curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                    if prTransactionCodes."Employer Rate" <> 0 then begin
                                        case prTransactionCodes."Calculation Method" of

                                            prTransactionCodes."Calculation Method"::"Basic Pay":
                                                curTransAmount := curBPAYBal * prTransactionCodes."Employer Rate" / 100;
                                            prTransactionCodes."Calculation Method"::Flat:
                                                curTransAmount := prTransactionCodes."Employer Rate";
                                            prTransactionCodes."Calculation Method"::"Gross Pay":
                                                curTransAmount := curGrossPay * prTransactionCodes."Employer Rate" / 100;
                                            prTransactionCodes."Calculation Method"::"Taxable Pay":
                                                curTransAmount := curTaxablePay * prTransactionCodes."Employer Rate" / 100;
                                            prTransactionCodes."Calculation Method"::Formula:
                                                curTransAmount := prEmployeeTransactions.Amount;
                                        end;
                                        if (prTransactionCodes."Employer Limit" <> 0) and (prTransactionCodes."Employer Limit" < curTransAmount) then
                                            curTransAmount := prTransactionCodes."Employer Limit";
                                        if (HREmp.Get(strEmpCode) and (prTransactionCodes."Calculation Method" = prTransactionCodes."Calculation Method"::"Basic Pay"))
                                        then
                                            if HREmp."Employee Status 2" = HREmp."Employee Status 2"::Interdiction then
                                                if salCard.Get(strEmpCode) then
                                                    curTransAmount := Round(salCard."Basic Pay" / 2, 0.01) * prTransactionCodes."Employer Rate" / 100;
                                        EmployerPensionArrears := 0;
                                        EmployerPensionArrears := GetEmployerPensionArrears(strEmpCode);
                                        if PRVitalSetup."Pension Arrears Employer Code" = prTransactionCodes."Transaction Code" then
                                            curTransAmount := GetEmployerPensionArrears(strEmpCode);
                                    end;
                                    if (curTransAmount > 0) and (HREmp.Status = HREmp.Status::Active) then begin
                                        fnUpdateEmployerDeductions(strEmpCode, prEmployeeTransactions."Transaction Code",
                                       'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                                        '', prEmployeeTransactions."Reference No", SelectedPeriod);
                                    end;
                                    // if EmployerPensionArrears > 0 then begin
                                    //     if PRVitalSetup."Pension Arrears Employer Code" <> '' then
                                    //         fnUpdateEmployerDeductions(strEmpCode, PRVitalSetup."Pension Arrears Employer Code",
                                    //                                               'EMP', TGroupOrder, TSubGroupOrder, '', EmployerPensionArrears, 0, intMonth, intYear,
                                    //                                                '', prEmployeeTransactions."Reference No", SelectedPeriod);
                                    // end;
                                end;
                            end;
                            //Modified Dan - Each Directorate has its own formula for Pension

                            //         //Update Balance on PR Period Transaction Table with Pension Contributed from Employer
                            //          PRPeriodTrans.RESET;
                            //          PRPeriodTrans.SETRANGE(PRPeriodTrans."Employee Code",strEmpCode);
                            //          PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code",prEmployeeTransactions."Transaction Code");
                            //          PRPeriodTrans.SETRANGE(PRPeriodTrans."Payroll Period",SelectedPeriod);
                            //          IF PRPeriodTrans.FINDFirst() THEN
                            //          BEGIN
                            //             IF PRPeriodTrans.Balance <> 0 THEN PRPeriodTrans.Balance += curTransAmount;
                            //             PRPeriodTrans.MODIFY;
                            //          END;
                            //         //Added Dann

                        end;
                    end;

                until prEmployeeTransactions.Next = 0;
                //GET TOTAL DEDUCTIONS
                //Total Deductions to Include PAYE, NSSF, NHIF - Added DW


                //END GET TOTAL DEDUCTIONS
            end;
            HREmp.Get(strEmpCode);
            if (salCard.Get(strEmpCode)) then
                if salCard."Pays NITA" and (HREmp.Status = HREmp.Status::Active) then begin
                    prTransactionCodes.Get(PRVitalSetup.NITA);
                    curTransAmount := prTransactionCodes."Employer Rate";
                    TGroup := 'DEDUCTIONS';
                    TGroupOrder := 8;
                    TSubGroupOrder := 0;
                    HREmp.Get(strEmpCode);
                    if (curTransAmount > 0) and (HREmp.Status = HREmp.Status::Active) then
                        fnUpdateEmployerDeductions(strEmpCode, PRVitalSetup.NITA,
                       'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                        '', '', SelectedPeriod);
                end;


            curTotalDeductions := curTotalDeductions + curNSSF + curNHIF + curPAYE + curPayeArrears + EmployeeHousingLevy;

            curTransBalance := 0;
            strTransCode := 'TOT-DED';
            strTransDescription := 'TOTAL DEDUCTIONS';
            TGroup := 'DEDUCTIONS';
            TGroupOrder := 8;
            TSubGroupOrder := 9;
            fnUpdatePeriodTrans(strEmpCode, strTransCode, TGroup, TGroupOrder, TSubGroupOrder,
              strTransDescription, curTotalDeductions, curTransBalance, intMonth, intYear,
              '', prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
              '', Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);



            //Net Pay: calculate the Net pay for the month in the following manner:
            //>Nett = Gross - (xNssfAmount + curMyNhifAmt + PAYE + PayeArrears + prTotDeductions)
            //...Tot Deductions also include (SumLoan + SumInterest)
            //curNetPay := curGrossPay - (curNSSF + curNHIF + curPAYE + curPayeArrears + curTotalDeductions+EmployeeHousingLevy);//-curIncludeinNet;
            curNetPay := curGrossPay - curTotalDeductions;                                                                                   //curNetPay := curGrossPay - (curPayeArrears + curTotalDeductions);//-curIncludeinNet;
                                                                                                                                             //curNetPay:=curNetPay+curIncludeinNet;
                                                                                                                                             //>Nett = Nett - curExcessPension
                                                                                                                                             //...Excess pension is only used for tax. Staff is not paid the amount hence substract it
            curNetPay := curNetPay; //- curExcessPension

            //>Nett = Nett - cSumEmployerDeductions
            //...Employer Deductions are used for reporting as cost to company BUT dont affect Net pay
            curNetPay := curNetPay - curTotCompanyDed; //******Get Company Deduction*****
            // if curNetPay <= 0 then
            //     Error('The netpay for %1 is %2, which is not allowed.', strEmpCode, curNetPay);
            curNetRnd_Effect := curNetPay - curNetPay;
            curNetPay := curNetPay;//john //Check here//0.01,'>'
            curTransAmount := curNetPay;
            // MESSAGE(FORMAT(curNetPay));
            strTransDescription := 'NET PAY';
            TGroup := 'NET PAY';
            TGroupOrder := 9;
            TSubGroupOrder := 0;

            // IF curNetPay < 0 THEN MESSAGE('Net Pay for Employee No. %1 is %2',strEmpCode, curNetPay);

            fnUpdatePeriodTrans(strEmpCode, 'NPAY', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
            curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
            PayablesAcc, Journalpostas::Credit, Journalpostingtype::"G/L Account", '', Coopparameters::none);

            //  //*************************************************************************************************************
            //  //Added: . To Update PR Staff Bank Transactions with Net Pay Amounts that are transfered to Individual Banks

            //  fnUpdateStaffBankTrans(strEmpCode, 'NPAY',,curTransAmount,
            //                        intMonth, intYear,SelectedPeriod,Dept);


            //  //*************************************************************************************************************

            fnUpdateLeaveAllowanceTaken(strEmpCode, SelectedPeriod);
        end;

    end;

    procedure fnPureFormula(strEmpCode: Code[50]; intMonth: Integer; intYear: Integer; strFormula: Text[250]) Formula: Text[250]
    var
        Where: Text[30];
        Which: Text[30];
        i: Integer;
        TransCode: Code[50];
        Char: Text[1];
        FirstBracket: Integer;
        StartCopy: Boolean;
        FinalFormula: Text[250];
        TransCodeAmount: Decimal;
        AccSchedLine: Record "Acc. Schedule Line";
        ColumnLayout: Record "Column Layout";
        CalcAddCurr: Boolean;
        AccSchedMgt: Codeunit AccSchedManagement;
    begin
        TransCode := '';
        for i := 1 to StrLen(strFormula) do begin
            Char := CopyStr(strFormula, i, 1);
            if Char = '[' then StartCopy := true;

            if StartCopy then TransCode := TransCode + Char;
            //Copy Characters as long as is not within []
            if not StartCopy then
                FinalFormula := FinalFormula + Char;
            if Char = ']' then begin
                StartCopy := false;
                //Get Transcode
                Where := '=';
                Which := '[]';
                TransCode := DelChr(TransCode, Where, Which);
                //Get TransCodeAmount
                TransCodeAmount := fnGetTransAmount(strEmpCode, TransCode, intMonth, intYear);
                //Reset Transcode
                TransCode := '';
                //Get Final Formula
                FinalFormula := FinalFormula + Format(TransCodeAmount);
                //End Get Transcode
            end;
        end;
        Formula := FinalFormula;
    end;

    procedure fnPureFormula2(strFormula: Text[250]) Formula: Text[250]
    var
        Where: Text[30];
        Which: Text[30];
        i: Integer;
        TransCode: Code[50];
        Char: Text[1];
        FirstBracket: Integer;
        StartCopy: Boolean;
        FinalFormula: Text[250];
        TransCodeAmount: Decimal;
        AccSchedLine: Record "Acc. Schedule Line";
        ColumnLayout: Record "Column Layout";
        CalcAddCurr: Boolean;
        AccSchedMgt: Codeunit AccSchedManagement;
    begin
        TransCode := '';
        for i := 1 to StrLen(strFormula) do begin
            Char := CopyStr(strFormula, i, 1);
            if Char = '[' then StartCopy := true;

            if StartCopy then TransCode := TransCode + Char;
            //Copy Characters as long as is not within []
            if not StartCopy then
                FinalFormula := FinalFormula + Char;
            if Char = ']' then begin
                StartCopy := false;
                //Get Transcode
                Where := '=';
                Which := '[]';
                TransCode := DelChr(TransCode, Where, Which);
                //Get TransCodeAmount
                // TransCodeAmount := fnGetTransAmount(strEmpCode, TransCode, intMonth, intYear);
                //Reset Transcode
                TransCode := '';
                //Get Final Formula
                FinalFormula := FinalFormula;
                //End Get Transcode
            end;
        end;
        Formula := FinalFormula;
    end;


    procedure fnUpdateEmployeeTrans(EmpCode: Code[50]; TransCode: Code[50]; Amount: Decimal; Month: Integer; Year: Integer; PayrollPeriod: Date)
    var
        prEmployeeTrans: Record "PR Employee Transactions";
    begin
        prEmployeeTrans.Reset;
        prEmployeeTrans.SetRange(prEmployeeTrans."Employee Code", EmpCode);
        prEmployeeTrans.SetRange(prEmployeeTrans."Transaction Code", TransCode);
        prEmployeeTrans.SetRange(prEmployeeTrans."Payroll Period", PayrollPeriod);
        prEmployeeTrans.SetRange(prEmployeeTrans."Period Month", Month);
        prEmployeeTrans.SetRange(prEmployeeTrans."Period Year", Year);
        if prEmployeeTrans.FindFirst() then begin

            //Commented due to proration

            //if HREmp.Get(EmpCode) then
            // prEmployeeTrans.Amount := Amount;
            // prEmployeeTrans.Modify;
        end;
    end;

    procedure fnUpdateEmployerDeductions(EmpCode: Code[50]; TCode: Code[50]; TGroup: Code[50]; GroupOrder: Integer; SubGroupOrder: Integer; Description: Text[50]; curAmount: Decimal; curBalance: Decimal; Month: Integer; Year: Integer; mMembership: Text[30]; ReferenceNo: Text[30]; dtOpenPeriod: Date)
    var
        prEmployerDeductions: Record "PR Employer Deductions";
    begin

        if curAmount = 0 then exit;

        prEmployerDeductions.Init;
        prEmployerDeductions."Employee Code" := EmpCode;
        prEmployerDeductions."Transaction Code" := TCode;
        prEmployerDeductions.Validate("Transaction Code");
        prEmployerDeductions.Amount := curAmount;
        prEmployerDeductions."Period Month" := Month;
        prEmployerDeductions."Period Year" := Year;
        prEmployerDeductions."Payroll Period" := dtOpenPeriod;
        //Insert Dim and Contract Type for each Trans Being Updated
        if HREmp2.Get(EmpCode) then begin
            prEmployerDeductions."Global Dimension 1 Code" := HREmp2."Global Dimension 1 Code";
            prEmployerDeductions."Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
            prEmployerDeductions."Contract Type" := HREmp2."Contract Type";
            prEmployerDeductions."Posting Group" := HREmp2."Posting Group";
            prEmployerDeductions."Previous Payment System" := HREmp2."Previous Payment System";
        end;
        //Insert Transaction Type (Either "Income or Deduction") for each Trans Being Updated
        prEmployerDeductions.Insert;
    end;

    procedure fnUpdateP9Table(P9EmployeeCode: Code[50]; P9BasicPay: Decimal; P9Allowances: Decimal; P9Benefits: Decimal; P9ValueOfQuarters: Decimal; P9DefinedContribution: Decimal; P9OwnerOccupierInterest: Decimal; P9GrossPay: Decimal; P9TaxablePay: Decimal; P9TaxCharged: Decimal; P9InsuranceRelief: Decimal; P9TaxRelief: Decimal; P9Paye: Decimal; P9NSSF: Decimal; P9NHIF: Decimal; P9Deductions: Decimal; P9NetPay: Decimal; dtCurrPeriod: Date)
    var
        prEmployeeP9Info: Record "PR Employee P9 Info";
        intYear: Integer;
        intMonth: Integer;
    begin
        intMonth := Date2dmy(dtCurrPeriod, 2);
        intYear := Date2dmy(dtCurrPeriod, 3);

        prEmployeeP9Info.Reset;
        prEmployeeP9Info.setrange(prEmployeeP9Info."Employee Code", P9EmployeeCode);
        prEmployeeP9Info.setrange(prEmployeeP9Info."Payroll Period", dtCurrPeriod);
        if prEmployeeP9Info.find('-') then
            prEmployeeP9Info.DeleteAll();

        prEmployeeP9Info.Init;
        prEmployeeP9Info."Employee Code" := P9EmployeeCode;
        prEmployeeP9Info."Basic Pay" := P9BasicPay;
        prEmployeeP9Info.Allowances := P9Allowances;
        prEmployeeP9Info.Benefits := P9Benefits;
        prEmployeeP9Info."Value Of Quarters" := P9ValueOfQuarters;
        prEmployeeP9Info."Defined Contribution" := P9DefinedContribution;
        prEmployeeP9Info."Owner Occupier Interest" := P9OwnerOccupierInterest;
        prEmployeeP9Info."Gross Pay" := P9GrossPay;
        prEmployeeP9Info."Taxable Pay" := P9TaxablePay;
        prEmployeeP9Info."Tax Charged" := P9TaxCharged;
        prEmployeeP9Info."Insurance Relief" := P9InsuranceRelief;
        prEmployeeP9Info."Tax Relief" := P9TaxRelief;
        prEmployeeP9Info.PAYE := P9Paye;
        prEmployeeP9Info.NSSF := P9NSSF;
        prEmployeeP9Info.NHIF := P9NHIF;
        prEmployeeP9Info.Deductions := P9Deductions;
        prEmployeeP9Info."Net Pay" := P9NetPay;
        prEmployeeP9Info."Period Month" := intMonth;
        prEmployeeP9Info."Period Year" := intYear;
        prEmployeeP9Info."Payroll Period" := dtCurrPeriod;
        prEmployeeP9Info.Insert;
    end;

    procedure fnUpdatePeriodTrans(EmpCode: Code[50]; TCode: Code[50]; TGroup: Code[50]; GroupOrder: Integer; SubGroupOrder: Integer; Description: Text[50]; curAmount: Decimal; curBalance: Decimal; Month: Integer; Year: Integer; mMembership: Text[30]; ReferenceNo: Text[100]; dtOpenPeriod: Date; Department: Code[50]; JournalAC: Code[50]; PostAs: Option " ",Debit,Credit; JournalACType: Enum "Gen. Journal Account Type"; LoanNo: Code[10]; CoopParam: Option "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension)
    var
        PRPeriodTransactions: Record "PR Period Transactions";
        curNetPay_2: Decimal;
        HREmp_3: Record "Employee";
        AllowInsert: Boolean;
        PRTransCode: Record "PR Transaction Codes";
    begin
        if curAmount = 0 then exit;
        //******************************************************************************************************************************************
        /* Added Dann. for Multiple bank A/Cs                                                                                                       */
        //******************************************************************************************************************************************
        AllowInsert := true;
        if HREmp_3.get(EmpCode) then begin
            if PRTransCode.get(TCode) then begin
                if ((HREmp_3."On Suspension" = true) or (HREmp_3."On Interdiction" = true)) and (PRTransCode.isHouseAllowance = false) and ((TCode <> 'NPAY') or (TCode = 'BPAY') or (TCode = 'NSSF') or (TCode = 'NHIF')) then begin
                    AllowInsert := false;
                end;
            end;

        end;
        if TCode = 'NPAY' then begin
            HREmp_3.Reset;
            HREmp_3.SetRange(HREmp_3."No.", EmpCode);
            if HREmp_3.FindFirst() then begin
                repeat

                    HREmp_3.TestField(HREmp_3."Employee's Bank");
                    HREmp_3.TestField(HREmp_3."Bank Branch");
                    HREmp_3.TestField(HREmp_3."Bank Account Number");
                    //HREmp_3.TestField(HREmp_3."Bank and Branch Code");

                    HRBankSummary.Reset;
                    HRBankSummary.Init;
                    HREmp_3.CalcFields("Bank Name", "Bank Branch Name");
                    HRBankSummary."Line No." := GetLastEntryNo;
                    HRBankSummary."Bank Code" := HREmp_3."Employee's Bank";
                    HRBankSummary."Branch Code" := HREmp_3."Bank Branch No.";
                    HRBankSummary."Bank and Branch Code" := HREmp_3."Employee's Bank" + ' ' + HREmp_3."Bank Branch No.";
                    HRBankSummary."Staff Bank Name" := HREmp_3.FullName();
                    HRBankSummary."Payroll Period" := dtOpenPeriod;
                    HRBankSummary.Amount := curAmount;
                    HRBankSummary."Transaction Code" := 'NPAY';
                    HRBankSummary."No." := EmpCode;
                    HRBankSummary."Directorate Code" := HREmp_3."Directorate Code";
                    HRBankSummary."Job Title2" := HREmp_3."Job Title2";
                    HRBankSummary."Salary Scale" := HREmp_3."Salary Scale";
                    HRBankSummary."Salary Notch" := HREmp_3.Present;
                    HRBankSummary."Organisation Unit Name" := HREmp_3."Organisation Unit Name";
                    HRBankSummary."Employment Date" := HREmp_3."Employment Date";
                    HRBankSummary."Current Duty Station" := HREmp_3."Current Duty Station";
                    HRBankSummary."Implementing Unit Name" := HREmp_3."Implementing Unit Name";
                    HRBankSummary."Last Promotion Date" := HREmp_3."End Of Probation Date";
                    HRBankSummary."Employee Category Type" := HREmp_3."Employee Category Type";
                    HRBankSummary."Bank Name" := HREmp_3."Bank Name";
                    HRBankSummary."Branch Name" := HREmp_3."Bank Branch Name";
                    HRBankSummary."A/C Number" := HREmp_3."Bank Account Number";
                    if HREmp_3.Get(EmpCode) then begin
                        HRBankSummary."Posting Group" := HREmp_3."Posting Group";
                    end;


                    if HRBankSummary.Amount > 0 then HRBankSummary.Insert;

                until HREmp_3.Next = 0;
            end else begin
                //ERROR('No Bank A/C has been specified for [Employee No %1]',EmpCode);
            end;
        end;
        //******************************************************************************************************************************************
        //******************************************************************************************************************************************




        PRPeriodTransactions.Init;
        PRPeriodTransactions."Employee Code" := EmpCode;
        PRPeriodTransactions.Validate("Employee Code");
        PRPeriodTransactions."Transaction Code" := TCode;
        PRPeriodTransactions."Group Text" := TGroup;
        PRPeriodTransactions."Transaction Name" := Description;
        PRPeriodTransactions.Amount := curAmount;
        curAmount := curAmount;
        PRPeriodTransactions.Balance := curBalance;
        PRPeriodTransactions."Original Amount" := PRPeriodTransactions.Balance;
        PRPeriodTransactions."Group Order" := GroupOrder;
        PRPeriodTransactions."Sub Group Order" := SubGroupOrder;
        PRPeriodTransactions."Reference No" := ReferenceNo;
        PRPeriodTransactions."Period Month" := Month;
        PRPeriodTransactions."Period Year" := Year;
        PRPeriodTransactions."Payroll Period" := dtOpenPeriod;
        PRPeriodTransactions."Global DImension 1 Code" := Department;
        PRPeriodTransactions."Journal Account Type" := JournalACType;
        PRPeriodTransactions."Post As" := PostAs;
        PRPeriodTransactions."Journal Account Code" := JournalAC;
        PRPeriodTransactions."Loan Number" := LoanNo;
        PRPeriodTransactions."coop parameters" := CoopParam;
        //
        //Insert Dim and Contract Type for each Trans Being Updated
        if HREmp2.Get(EmpCode) then begin

            HREmp2.TestField("Posting Group");

            PRPeriodTransactions."Global Dimension 1 Code" := HREmp2."Global Dimension 1 Code";
            PRPeriodTransactions."Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
            PRPeriodTransactions."Contract Type" := HREmp2."Contract Type";
            PRPeriodTransactions."Posting Group" := HREmp2."Posting Group";
            PRPeriodTransactions."Employee Type" := HREmp2."Employee Type";
            PRPeriodTransactions."Previous Payment System" := HREmp2."Previous Payment System";
        end;
        //Insert Transaction Type (Either "Income or Deduction") for each Trans Being Updated
        PRTransCode.Reset;
        PRTransCode.SetRange(PRTransCode."Transaction Code", TCode);
        if PRTransCode.FindFirst() then begin
            PRPeriodTransactions."Transaction Type" := PRTransCode."Transaction Type";
        end;

        PRPeriodTransactions.Insert;
        //Update the prEmployee Transactions  with the Amount

        fnUpdateEmployeeTrans(PRPeriodTransactions."Employee Code", PRPeriodTransactions."Transaction Code", PRPeriodTransactions.Amount, PRPeriodTransactions."Period Month", PRPeriodTransactions."Period Year", PRPeriodTransactions."Payroll Period");


    end;


    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        HRBankSummary_2: Record "HR Bank Summary";
    begin
        HRBankSummary_2.Reset;
        if HRBankSummary_2.FindLast then begin
            LastLineNum := HRBankSummary_2."Line No." + 1;
        end else begin
            LastLineNum := 1;
        end;
    end;

    procedure fnClearCurrentPeriod(SelectedPeriod: Date; dtOpenPeriod: Date; EmpNo: code[20]; EmpType: Enum "Employee Type")
    var
        prPeriodTransactions: Record "PR Period Transactions";

        PRPeriodTrans: Record "PR Period Transactions";
        prBankSummary: Record "HR Bank Summary";
        PrEmployer: Record "PR Employer Deductions";
    begin

        dtOpenPeriod := fnGetOpenPeriod();
        //check if the period selected=current period. If not, do NOT run this function
        if SelectedPeriod <> dtOpenPeriod then exit;

        //Delete all Records from the prPeriod Transactions for Reprocessing
        prPeriodTransactions.Reset;
        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", dtOpenPeriod);
        // prPeriodTransactions.SetRange("Employee Type", EmpType);
        if EmpNo <> '' then prPeriodTransactions.SetRange("Employee Code", EmpNo);
        if prPeriodTransactions.FindFirst() then
            prPeriodTransactions.DeleteAll;

        prBankSummary.Reset;
        prBankSummary.SetRange(prBankSummary."Payroll Period", dtOpenPeriod);
        //  prBankSummary.SetRange("Employee Type", EmpType);
        if EmpNo <> '' then prBankSummary.SetRange(prBankSummary."No.", EmpNo);
        if prBankSummary.FindFirst() then
            prBankSummary.DeleteAll;

        PrEmployer.Reset();
        PrEmployer.setrange(PrEmployer."Payroll Period", dtOpenPeriod);
        PrEmployer.setrange(PrEmployer."Employee Code", EmpNo);
        if PrEmployer.FindSet() then
            PrEmployer.DeleteAll();
    end;

    procedure CalculateGratuity(Emp: Record Employee)
    var
        SalPointer: record "Salary Pointers";
        SalScale: record "Salary Scales";
        SalaryCard: record "PR Salary Card";
        EmpEarnings: record "PR Employee Transactions";
        PayrollSetup: record "PR Vital Setup Info";
        ScaleBenefits2: Record "Scale Benefits";
        BasicSalary: decimal;
        PRPayrollPeriods: Record "PR Payroll Periods";
        SalaryPointers: record "Salary Pointers";
        GrossPay: Decimal;
        EmpEarning2: record "PR Employee Transactions";
        PrTrans: Record "PR Transaction Codes";
        objEmpTrans: record "PR Employee Transactions";
        TotalBasic: Decimal;
    begin
        PrTrans.Reset();
        PrTrans.SetRange("Transaction Category", PrTrans."Transaction Category"::Gratuity);
        if PrTrans.FindFirst() then begin

            EmpEarning2.Reset();
            EmpEarning2.SetRange(EmpEarning2."Employee Code", Emp."No.");
            EmpEarning2.SetRange("Transaction Code", PrTrans."Transaction Code");
            if EmpEarning2.FindFirst() then begin
                // if PRPayrollPeriods.Get(EmpEarning2."Payroll Period") then
                //     if PRPayrollPeriods.Closed then
                Error('You have already paid gratuity to this employee on ' + format(EmpEarning2."Payroll Period"))
                // else
                //     EmpEarning2.Delete();
            end;



            PRPayrollPeriods.Reset;
            PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
            PRPayrollPeriods.FindFirst();
            EmpEarning2.Reset();
            EmpEarning2.SetRange(EmpEarning2."Employee Code", Emp."No.");
            EmpEarning2.SetRange("Payroll Period", PRPayrollPeriods."Date Opened");
            if EmpEarning2.Find('-') then begin
                EmpEarning2.DeleteAll();
                if SalaryCard.get(Emp."No.") then begin
                    SalaryCard."Basic Pay" := 0;
                    SalaryCard."Pays NSSF" := false;
                    SalaryCard."Pays NHIF" := false;
                    SalaryCard."Pays NITA" := false;
                    SalaryCard.Modify();
                end;
            end;
            objEmpTrans.Reset;
            objEmpTrans.SetRange(objEmpTrans."Employee Code", Emp."No.");
            //objEmpTrans.SetRange(objEmpTrans."Payroll Period", objEmpTransPCA."Payroll Period");
            objEmpTrans.SetRange(objEmpTrans."Transaction Code", 'BPAY');
            // objEmpTrans.SetRange(objEmpTrans."Payroll Code", mPayrollCode);
            if objEmpTrans.Find('-') then
                objEmpTrans.CalcSums(Amount);
            TotalBasic := objEmpTrans.Amount;
            EmpEarnings.Init;
            EmpEarnings."Employee Code" := Emp."No.";
            EmpEarnings."Transaction Code" := PrTrans."Transaction Code";
            //EmpEarnings.Validate("Transaction Code");
            EmpEarnings.Amount := TotalBasic * 0.31;
            EmpEarnings."Payroll Period" := PRPayrollPeriods."Date Opened";
            EmpEarnings."Period Month" := PRPayrollPeriods."Period Month";
            EmpEarnings."Period Year" := PRPayrollPeriods."Period Year";
            EmpEarnings.Insert();
        end;
    end;

    procedure ExceedsThirdRule(EmpNo: Text; NewDeduction: Decimal) Exceeds: Boolean
    var
        Bpay: Decimal;
        TotalEarnings: Decimal;
        TotalDeduction: Decimal;
        TotalStatutories: Decimal;
        SalaryCard: Record "PR Salary Card";
        PRPayrollPeriods: Record "PR Payroll Periods";
        EmpEarning2: record "PR Employee Transactions";
        NSSF: Decimal;
        NetPay: Decimal;
        Pension: Decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
        TransactionType: Option Income,Deduction;
        curInsuranceReliefAmount: Decimal;
        HrEmp: Record Employee;
    begin
        Exceeds := false;
        PRPayrollPeriods.Reset;
        PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
        PRPayrollPeriods.FindFirst();
        if SalaryCard.Get(EmpNo) then
            if SalaryCard."Basic Pay" > 0 then begin
                Bpay := SalaryCard."Basic Pay";
                if HrEmp.get(EmpNo) then
                    if HrEmp."Employee Status 2" = HrEmp."Employee Status 2"::Interdiction then
                        Bpay := SalaryCard."Basic Pay" / 2;

                EmpEarning2.Reset();
                EmpEarning2.SetRange(EmpEarning2."Employee Code", EmpNo);
                EmpEarning2.SetRange("Payroll Period", PRPayrollPeriods."Date Opened");
                EmpEarning2.Setfilter("Transaction Type", '%1|%2', EmpEarning2."Transaction Type"::Income, EmpEarning2."Transaction Type2"::Benefit);
                EmpEarning2.SetRange("Not Included Third", false);
                if EmpEarning2.FindSet() then begin
                    EmpEarning2.CalcSums(Amount);
                    TotalEarnings := EmpEarning2.Amount;
                end;
                EmpEarning2.Reset();
                EmpEarning2.SetRange(EmpEarning2."Employee Code", EmpNo);
                EmpEarning2.SetRange("Payroll Period", PRPayrollPeriods."Date Opened");
                EmpEarning2.SetRange("Transaction Type", EmpEarning2."Transaction Type"::Deduction);
                if EmpEarning2.FindSet() then begin
                    EmpEarning2.CalcSums(Amount);
                    TotalDeduction := EmpEarning2.Amount;
                end;
                TotalStatutories := fnGetEmployeeNHIF(TotalEarnings + Bpay);
                NSSF := fnGetEmployeeNSSF(TotalEarnings + Bpay);
                Pension := fnGetSpecialTransAmount(EmpNo, PRPayrollPeriods."Period Month", PRPayrollPeriods."Period Year",
                Specialtranstype::"Defined Contribution", false);
                TotalStatutories := TotalStatutories + fnGetEmployeeNSSF(TotalEarnings + Bpay);
                TotalStatutories := TotalStatutories + fnGetEmployeePaye(TotalEarnings + Bpay - NSSF - Pension);
                VitalSetup.Get();
                curReliefPersonal := VitalSetup."Tax Relief";
                curMaximumRelief := VitalSetup."Max Relief" + VitalSetup."Tax Relief";
                currNHIFRelief := fnGetEmployeeNHIF(TotalEarnings + Bpay) * (VitalSetup."NHIF Relief Percentage" / 100);
                curInsuranceReliefAmount := fnGetSpecialTransAmount(EmpNo, PRPayrollPeriods."Period Month", PRPayrollPeriods."Period Year",
                 Specialtranstype::"Life Insurance", false);
                if (curReliefPersonal + curInsuranceReliefAmount) > curMaximumRelief then
                    NetPay := TotalEarnings + Bpay + curMaximumRelief + currNHIFRelief - TotalStatutories - TotalDeduction - NewDeduction
                else
                    NetPay := TotalEarnings + Bpay + curReliefPersonal + curInsuranceReliefAmount + currNHIFRelief - TotalStatutories - TotalDeduction - NewDeduction;
                if NetPay < Bpay / 3 then Exceeds := true;

            end;
    end;

    procedure AmountExceedsThirdRule(EmpNo: Text; NewDeduction: Decimal) AmountExceeds: Decimal
    var
        Bpay: Decimal;
        TotalEarnings: Decimal;
        TotalDeduction: Decimal;
        TotalStatutories: Decimal;
        SalaryCard: Record "PR Salary Card";
        PRPayrollPeriods: Record "PR Payroll Periods";
        EmpEarning2: record "PR Employee Transactions";
        NSSF: Decimal;
        NetPay: Decimal;
        Pension: Decimal;
        SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
        TransactionType: Option Income,Deduction;
        curInsuranceReliefAmount: Decimal;
    begin
        AmountExceeds := 0;
        PRPayrollPeriods.Reset;
        PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
        PRPayrollPeriods.FindFirst();
        if SalaryCard.Get(EmpNo) then
            if SalaryCard."Basic Pay" > 0 then begin
                Bpay := SalaryCard."Basic Pay";
                EmpEarning2.Reset();
                EmpEarning2.SetRange(EmpEarning2."Employee Code", EmpNo);
                EmpEarning2.SetRange("Payroll Period", PRPayrollPeriods."Date Opened");
                EmpEarning2.SetRange("Transaction Type", EmpEarning2."Transaction Type"::Income);
                EmpEarning2.SetRange("Not Included Third", false);
                if EmpEarning2.FindSet() then begin
                    EmpEarning2.CalcSums(Amount);
                    TotalEarnings := EmpEarning2.Amount;
                end;
                EmpEarning2.Reset();
                EmpEarning2.SetRange(EmpEarning2."Employee Code", EmpNo);
                EmpEarning2.SetRange("Payroll Period", PRPayrollPeriods."Date Opened");
                EmpEarning2.SetRange("Transaction Type", EmpEarning2."Transaction Type"::Deduction);
                if EmpEarning2.FindSet() then begin
                    EmpEarning2.CalcSums(Amount);
                    TotalDeduction := EmpEarning2.Amount;
                end;
                TotalStatutories := fnGetEmployeeNHIF(TotalEarnings + Bpay);
                NSSF := fnGetEmployeeNSSF(TotalEarnings + Bpay);
                Pension := fnGetSpecialTransAmount(EmpNo, PRPayrollPeriods."Period Month", PRPayrollPeriods."Period Year",
                Specialtranstype::"Defined Contribution", false);
                TotalStatutories := TotalStatutories + fnGetEmployeeNSSF(TotalEarnings + Bpay);
                TotalStatutories := TotalStatutories + fnGetEmployeePaye(TotalEarnings + Bpay - NSSF - Pension);
                VitalSetup.Get();
                curReliefPersonal := VitalSetup."Tax Relief";
                curMaximumRelief := VitalSetup."Max Relief" + VitalSetup."Tax Relief";
                currNHIFRelief := fnGetEmployeeNHIF(TotalEarnings + Bpay) * (VitalSetup."NHIF Relief Percentage" / 100);
                curInsuranceReliefAmount := fnGetSpecialTransAmount(EmpNo, PRPayrollPeriods."Period Month", PRPayrollPeriods."Period Year",
                 Specialtranstype::"Life Insurance", false);
                if (curReliefPersonal + curInsuranceReliefAmount) > curMaximumRelief then
                    NetPay := TotalEarnings + Bpay + curMaximumRelief + currNHIFRelief - TotalStatutories - TotalDeduction - NewDeduction
                else
                    NetPay := TotalEarnings + Bpay + curReliefPersonal + curInsuranceReliefAmount + currNHIFRelief - TotalStatutories - TotalDeduction - NewDeduction;
                if NetPay < Bpay / 3 then AmountExceeds := Bpay / 3 - NetPay;

            end;
    end;
    /////When on interdiction only post half basic and house allowance
    procedure fnInterdiction(EmpCode: Code[20]; BPay: Decimal; intMonth: Integer; intYear: Integer; SelectedPeriod: Date; Dept: Code[20]): Decimal
    var
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        strTransDescription: Text[50];
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        JournalAc: Code[50];
        JournalPostAs: Option ,Debit,Credit;
        JournalPostingType: Enum "Gen. Journal Account Type";
        prTransactionCodes: Record "PR Transaction Codes";
        prEmployeeTransactions: Record "PR Employee Transactions";
        TotAmt: Decimal;
    begin
        VitalSetup.Get();
        TotAmt := 0;
        curTransAmount := BPay * 0.5;
        strTransDescription := 'BASIC PAY';
        TGroup := 'BASIC SALARY';
        TGroupOrder := 1;
        TSubGroupOrder := 1;
        fnUpdatePeriodTrans(EmpCode, 'BPAY', TGroup, TGroupOrder,
                                  TSubGroupOrder, strTransDescription, curTransAmount, curTransAmount,
                                  intMonth, intYear, '', '', SelectedPeriod, Dept,
                                  salariesAcc, Journalpostas::Debit, Journalpostingtype::"G/L Account", ''
                                  , Coopparameters::none);

        TotAmt := curTransAmount;

        prTransactionCodes.Get('BPAY');
        prEmployeeTransactions.Reset;
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", EmpCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", selectedperiod);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
        prEmployeeTransactions.SetRange("Transaction Code", prTransactionCodes."Arrears Code");
        if prEmployeeTransactions.FindFirst() then begin

            prTransactionCodes.Reset();
            prTransactionCodes.Get(prEmployeeTransactions."Transaction Code");
            curTransAmount := prEmployeeTransactions.Amount;
            TGroup := 'BASIC PAY';
            TGroupOrder := 1;
            TSubGroupOrder := 1;
            curTransBalance := 0;
            strTransDescription := prTransactionCodes."Transaction Name";
            JournalPostingType := Journalpostingtype::"G/L Account";
            JournalAc := prTransactionCodes."GL Account";
            fnUpdatePeriodTrans
                                    (
                                                       EmpCode, prTransactionCodes."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                                                       strTransDescription, curTransAmount, curTransBalance, intMonth, intYear, '',
                                                       prEmployeeTransactions."Reference No", SelectedPeriod, Dept, JournalAc, Journalpostas::Debit, JournalPostingType, '',
                                                       prTransactionCodes."coop parameters"
                                    );
            TotAmt += curTransAmount;
        end;


        VitalSetup.TestField("Housing Employee Code");
        prTransactionCodes.Get(VitalSetup."Housing Employee Code");
        prEmployeeTransactions.Reset;
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", EmpCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", selectedperiod);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
        prEmployeeTransactions.SetRange("Transaction Code", VitalSetup."Housing Employee Code");
        if prEmployeeTransactions.FindFirst() then begin

            curTransAmount := prEmployeeTransactions.Amount;
            TGroup := 'ALLOWANCE';
            TGroupOrder := 3;
            TSubGroupOrder := 0;
            curTransBalance := 0;
            strTransDescription := prTransactionCodes."Transaction Name";
            JournalPostingType := Journalpostingtype::"G/L Account";
            JournalAc := prTransactionCodes."GL Account";
            fnUpdatePeriodTrans
                                    (
                                                       EmpCode, VitalSetup."Housing Employee Code", TGroup, TGroupOrder, TSubGroupOrder,
                                                       strTransDescription, curTransAmount, curTransBalance, intMonth, intYear, '',
                                                       prEmployeeTransactions."Reference No", SelectedPeriod, Dept, JournalAc, Journalpostas::Debit, JournalPostingType, '',
                                                       prTransactionCodes."coop parameters"
                                    );
            TotAmt += curTransAmount;
        end;
        prEmployeeTransactions.Reset;
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", EmpCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", selectedperiod);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
        prEmployeeTransactions.SetRange("Transaction Code", prTransactionCodes."Arrears Code");
        if prEmployeeTransactions.FindFirst() then begin
            prTransactionCodes.Reset();
            prTransactionCodes.Get(prEmployeeTransactions."Transaction Code");
            curTransAmount := prEmployeeTransactions.Amount;
            TGroup := 'ALLOWANCE';
            TGroupOrder := 3;
            TSubGroupOrder := 0;
            curTransBalance := 0;
            strTransDescription := prTransactionCodes."Transaction Name";
            JournalPostingType := Journalpostingtype::"G/L Account";
            JournalAc := prTransactionCodes."GL Account";
            fnUpdatePeriodTrans
                                    (
                                                       EmpCode, prTransactionCodes."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                                                       strTransDescription, curTransAmount, curTransBalance, intMonth, intYear, '',
                                                       prEmployeeTransactions."Reference No", SelectedPeriod, Dept, JournalAc, Journalpostas::Debit, JournalPostingType, '',
                                                       prTransactionCodes."coop parameters"
                                    );
            TotAmt += curTransAmount;
        end;
        exit(TotAmt);
    end;

    procedure fnUpdateLeaveAllowanceTaken(EmpCode: Code[20]; selectedPeriod: Date)
    var
        Emp: Record Employee;
        PRPeriod: Record "PR Payroll Periods";
        PREmpTrans: Record "PR Employee Transactions";
        TransCodes: Record "PR Transaction Codes";
        LeaveAllowances: Integer;
    begin
        LeaveAllowances := 0;
        TransCodes.Reset();
        TransCodes.SetRange("Transaction Type", TransCodes."Transaction Type"::Income);
        TransCodes.SetRange("Is Leave Allowance", true);
        TransCodes.SetRange("Special Trans Incomes", TransCodes."Special Trans Incomes"::"Leave Allowance");
        if TransCodes.FindSet() then begin
            repeat
                PREmpTrans.Reset();
                PREmpTrans.SetRange(PREmpTrans."Employee Code", EmpCode);
                PREmpTrans.SetRange(PREmpTrans."Transaction Code", TransCodes."Transaction Code");
                PREmpTrans.SetRange(PREmpTrans."Payroll Period", selectedPeriod);
                if PREmpTrans.Find() then
                    LeaveAllowances := LeaveAllowances + 1
            until TransCodes.Next = 0;
        end;

        if LeaveAllowances >= 1 then begin
            if Emp.Get(EmpCode) then begin
                PRPeriod.Reset();
                PRPeriod.SetRange(prPeriod."Date Opened", selectedPeriod);
                if PRPeriod.FindFirst() then begin
                    Emp."Leave Allowance Taken" := true;
                    Emp."Leave Allowance Period" := PRPeriod."Date Opened";
                    Emp."Leave Allowance Year" := PRPeriod."Period Year";
                    Emp.Modify();
                end;
            end;
        end;
    end;
}

