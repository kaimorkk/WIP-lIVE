Report 52193538 "Close Pay period"
{
    //       // Used for previous loan handling
    //         //  IF Loan.GET(PaymentDed.Code,PaymentDed."Employee No") THEN
    //         //    BEGIN

    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("Assignment Matrix-X1"; "Assignment Matrix-X1")
        {
            column(ReportForNavId_5751; 5751)
            {
            }

            trigger OnPostDataItem()
            begin

                if PayperiodStart <> StartingDate then
                    Error('Cannot Close this Pay period Without Closing the preceding ones')
                else begin
                    if PayPeriod.Get(StartingDate) then begin
                        PayPeriod."Close Pay" := true;
                        PayPeriod.Closed := true;
                        PayPeriod."Closed By" := UserId;
                        PayPeriod."Closed on Date" := CurrentDatetime;
                        //PayPeriod.CreateLeaveEntitlment(PayPeriod);
                        PayPeriod.Modify;
                        Message('The period has been closed');
                    end;
                end;

                // Go thru assignment matrix for loans and validate code
                NewPeriod := CalcDate('1M', PayperiodStart);
                // Loan.Reset;
                // if Loan.Find('-') then begin
                //     repeat
                //         AssMatrix.Reset;
                //         AssMatrix.SetRange(AssMatrix."Payroll Period", NewPeriod);
                //         AssMatrix.SetRange(Code, Loan.Code);
                //         if AssMatrix.Find('-') then begin
                //             repeat
                //                 if EmpRec.Get("Assignment Matrix-X1"."Employee No") then begin
                //                     if (EmpRec.Status = EmpRec.Status::Active) then
                //                         AssMatrix.Validate(Code);
                //                     AssMatrix.Modify
                //                 end;
                //             until AssMatrix.Next = 0;
                //         end;
                //     until Loan.Next = 0;
                // end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if not Confirm('Please backup up before closing current period! OK to Proceed?') then
            Error('The period has not been closed');

        PayrollRun.Run;

        DeducePayPeriod;
        ClosePeriodTrans;
        CreateNewEntries(PayperiodStart);
        UpdateSalaryPointers(PayperiodStart);
    end;

    var
        Proceed: Boolean;
        CurrentPeriodEnd: Date;
        DaysAdded: Code[10];
        PayPeriod: Record "Payroll PeriodX1";
        StartingDate: Date;
        PayperiodStart: Date;
        LoansUpdate: Boolean;
        PayHistory: Record "Employee Ledger EntryX1";
        EmpRec: Record Employee;
        TaxableAmount: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        // Loan: Record "Loans transactionsX1";
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        relief: Decimal;
        Outstanding: Decimal;
        CreateRec: Boolean;
        benefits: Record EarningsX1;
        deductions: Record DeductionsX1;
        InterestDiff: Decimal;
        Rounding: Boolean;
        PD: Record "Assignment Matrix-X1";
        Pay: Record EarningsX1;
        Ded: Record DeductionsX1;
        TaxCode: Code[10];
        CfAmount: Decimal;
        TempAmount: Decimal;
        EmpRec1: Record Employee;
        Emprec2: Record Employee;
        NewPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X1";
        PayrollRun: Report "Payroll Run";
        Schedule: Record "Repayment Schedule1";
        Window: Dialog;
        EmployeeName: Text[200];
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        // LoanApplicationForm: Record "Loan Application1";
        Discontinue: Boolean;


    procedure GetCurrentPeriod(var Payperiod: Record "Payroll PeriodX1")
    begin
        CurrentPeriodEnd := Payperiod."Starting Date";
        StartingDate := CurrentPeriodEnd;
        CurrentPeriodEnd := CalcDate('1M', CurrentPeriodEnd - 1);
    end;


    procedure DeducePayPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodX1";
    begin
        PayPeriodRec.Reset;
        PayPeriodRec.SetRange(PayPeriodRec."Close Pay", false);
        if PayPeriodRec.Find('-') then
            PayperiodStart := PayPeriodRec."Starting Date";
    end;


    procedure ClosePeriodTrans()
    var
        EarnDeduct: Record "Assignment Matrix-X1";
    begin
        EarnDeduct.Reset;
        EarnDeduct.SetRange(EarnDeduct."Payroll Period", PayperiodStart);
        if EarnDeduct.Find('-') then
            repeat
                EarnDeduct.Closed := true;
                EarnDeduct."Payroll Period" := PayperiodStart;
                EarnDeduct.Modify;
            until EarnDeduct.Next = 0;
    end;


    procedure CreateNewEntries(var CurrPeriodStat: Date)
    var
        PaymentDed: Record "Assignment Matrix-X1";
        AssignMatrix: Record "Assignment Matrix-X1";
    begin
        /*This function creates new entries for the next Payroll period which are accessible and editable
        by the user of the Payroll. It should ideally create new entries if the EmpRec is ACTIVE*/
        NewPeriod := CalcDate('1M', PayperiodStart);
        Window.Open('Creating Next period entries ##############################1', EmployeeName);
        PaymentDed.Reset;
        PaymentDed.SetRange(PaymentDed."Payroll Period", PayperiodStart);
        PaymentDed.SetRange(PaymentDed."Next Period Entry", true);
        //PaymentDed.SETFILTER(PaymentDed.Amount, '<>%1',0);
        if PaymentDed.Find('-') then begin
            repeat
                CreateRec := true;
                AssignMatrix.Init;
                AssignMatrix."Employee No" := PaymentDed."Employee No";
                AssignMatrix.Type := PaymentDed.Type;
                AssignMatrix.Code := PaymentDed.Code;
                AssignMatrix."Global Dimension 1 code" := PaymentDed."Global Dimension 1 code";
                AssignMatrix."Global Dimension 2 Code" := PaymentDed."Global Dimension 2 Code";
                AssignMatrix."Reference No" := PaymentDed."Reference No";
                AssignMatrix.Retirement := PaymentDed.Retirement;
                AssignMatrix."Payroll Period" := CalcDate('1M', PayperiodStart);
                AssignMatrix.Amount := PaymentDed.Amount;
                AssignMatrix.Description := PaymentDed.Description;
                AssignMatrix.Taxable := PaymentDed.Taxable;
                AssignMatrix."Tax Deductible" := PaymentDed."Tax Deductible";
                AssignMatrix.Frequency := PaymentDed.Frequency;
                AssignMatrix."Pay Period" := PaymentDed."Pay Period";
                AssignMatrix."Non-Cash Benefit" := PaymentDed."Non-Cash Benefit";
                AssignMatrix.Quarters := PaymentDed.Quarters;
                AssignMatrix."No. of Units" := PaymentDed."No. of Units";
                AssignMatrix.Section := PaymentDed.Section;
                AssignMatrix."Basic Pay" := PaymentDed."Basic Pay";
                AssignMatrix."Salary Grade" := PaymentDed."Salary Grade";
                AssignMatrix."Employer Amount" := PaymentDed."Employer Amount";
                AssignMatrix."Global Dimension 1 code" := PaymentDed."Global Dimension 1 code";
                AssignMatrix."Next Period Entry" := PaymentDed."Next Period Entry";
                AssignMatrix."Posting Group Filter" := PaymentDed."Posting Group Filter";
                AssignMatrix."Loan Repay" := PaymentDed."Loan Repay";
                AssignMatrix.DebitAcct := PaymentDed.DebitAcct;
                AssignMatrix.CreditAcct := PaymentDed.CreditAcct;
                AssignMatrix."Basic Salary Code" := PaymentDed."Basic Salary Code";
                AssignMatrix."Normal Earnings" := PaymentDed."Normal Earnings";

                AssignMatrix."Tax Relief" := PaymentDed."Tax Relief";

                if PaymentDed."Global Dimension 1 code" = '' then begin
                    Emprec2.Reset;
                    if Emprec2.Get(PaymentDed."Employee No") then
                        AssignMatrix."Global Dimension 1 code" := Emprec2."Global Dimension 1 Code";
                end;
                //END EMM
                EmpRec.Reset;
                if EmpRec.Get(PaymentDed."Employee No") then begin
                    AssignMatrix."Payroll Group" := EmpRec."Posting Group";
                    Window.Update(1, EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name");

                    if (EmpRec.Status = EmpRec.Status::Active) and (CreateRec = true) then
                        if not AssignMatrix.Get(AssignMatrix."Employee No", AssignMatrix.Type, AssignMatrix.Code, AssignMatrix."Payroll Period", AssignMatrix."Reference No") then
                            AssignMatrix.Insert;
                end;
            until PaymentDed.Next = 0;
        end;

        //Manage loans

        PaymentDed.Reset;
        PaymentDed.SetRange(PaymentDed."Payroll Period", NewPeriod);
        PaymentDed.SetRange(Type, PaymentDed.Type::Deduction);
        if PaymentDed.Find('-') then begin
            repeat
            // LoanApplicationForm.Reset;
            // LoanApplicationForm.SetRange(LoanApplicationForm."Deduction Code", PaymentDed.Code);
            // LoanApplicationForm.SetRange(LoanApplicationForm."Loan No", PaymentDed."Reference No");
            // if LoanApplicationForm.Find('-') then begin
            //     LoanApplicationForm.SetRange(LoanApplicationForm."Date filter", 0D, PayperiodStart);
            //     LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment", LoanApplicationForm."Total Loan");

            //     if LoanApplicationForm."Total Loan" <> 0 then begin
            //         if (LoanApplicationForm."Total Loan" + LoanApplicationForm."Total Repayment") <= 0 then begin
            //             Message('Loan %1 has expired', PaymentDed."Reference No");
            //             PaymentDed.Delete;
            //         end
            //         else begin
            //             if (LoanApplicationForm."Total Loan" + LoanApplicationForm."Total Repayment") < LoanApplicationForm.Repayment then begin

            //                 LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");

            //                 PaymentDed.Amount := -(LoanApplicationForm."Total Loan" + LoanApplicationForm."Total Repayment");
            //                 // PaymentDed."Next Period Entry":=FALSE;
            //                 PaymentDed.Modify;
            //             end;

            //         end;

            //     end else begin
            //         if (LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment") <= 0 then begin
            //             Message('Loan %1 has expired', PaymentDed."Reference No");
            //             PaymentDed.Delete;
            //         end
            //         else begin
            //             if (LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment") < LoanApplicationForm.Repayment then begin

            //                 LoanApplicationForm.CalcFields(LoanApplicationForm."Total Repayment");

            //                 PaymentDed.Amount := -(LoanApplicationForm."Approved Amount" + LoanApplicationForm."Total Repayment");
            //                 // PaymentDed."Next Period Entry":=FALSE;
            //                 PaymentDed.Modify;
            //             end;

            //         end;
            //     end;
            //end;

            until PaymentDed.Next = 0;
        end;

    end;


    procedure Initialize()
    var
        InitEarnDeduct: Record "Assignment Matrix-X1";
    begin

        InitEarnDeduct.SetRange(InitEarnDeduct.Closed, false);

        repeat
            InitEarnDeduct."Payroll Period" := PayperiodStart;
            InitEarnDeduct.Modify;
        until InitEarnDeduct.Next = 0;
    end;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX1;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := AmountRemaining;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100
                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        IncomeTax := -TotalTax;
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
        PaymentDeduction."Payroll Period" := CalcDate('1M', PayperiodStart);
        PaymentDeduction.Amount := ReducedBalance * InterestDiff;
        PaymentDeduction."Non-Cash Benefit" := true;
        PaymentDeduction.Taxable := true;
        //PaymentDeduction."Next Period Entry":=TRUE;
        if allowances.Get(BenefitCode) then
            PaymentDeduction.Description := allowances.Description;
        PaymentDeduction.Insert;
    end;


    procedure CoinageAnalysis(var NetPay: Decimal) NetPay1: Decimal
    var
        Index: Integer;
        Intex: Integer;
        AmountArray: array[15] of Decimal;
        NoOfUnitsArray: array[15] of Integer;
        MinAmount: Decimal;
    begin
    end;


    procedure UpdateSalaryPointers(var PayrollPeriod: Date)
    var
        Emp: Record Employee;
        RollingMonth: Integer;
    begin
        Emp.Reset;
        Emp.SetRange(Emp.Status, Emp.Status::Active);
        if Emp.Find('-') then begin
            repeat

                if Format(Date2dmy(NewPeriod, 2)) = Emp."Incremental Month" then begin

                    if IncStr(Emp.Present) < Emp.Halt then begin
                        //MESSAGE('%1 %2',INCSTR(Emp.Present),Emp.Halt);
                        Emp.Previous := Emp.Present;
                        Emp.Present := IncStr(Emp.Present);
                        Emp.Modify;
                    end;
                end;

            until Emp.Next = 0;
        end;
    end;
}

