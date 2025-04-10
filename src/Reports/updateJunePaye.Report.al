Report 52193634 "update June Paye"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin



                GetPaye.CalculateTaxableAmount(Employee."No.", Month, IncomeTax, TaxableAmount, RetireCont);
                // Create PAYE
                Assignmatrix.SetRange(Assignmatrix."Employee No", Employee."No.");
                Assignmatrix.SetRange(Assignmatrix.Type, Assignmatrix.Type::Deduction);
                Assignmatrix.SetRange(Assignmatrix.Code, '849');
                Assignmatrix.SetRange(Assignmatrix."Payroll Period", Month);
                if Assignmatrix.Find('-') then begin
                    Assignmatrix."June Paye" := -IncomeTax;
                    Assignmatrix."June Taxable Amount" := TaxableAmount;
                    Assignmatrix."June Paye Diff" := Assignmatrix."June Paye" - Assignmatrix.Amount;
                    Assignmatrix.Modify;
                end;



                Window.Update(1, Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll For ##############################1', EmployeeName);
                Month := 20080601D;
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
        GetPayPeriod;
        //PayPeriodtext:="Employee PayrollX".GETFILTER("Pay Period Filter");
        // IF PayPeriodtext='' THEN
        // ERROR('Pay period must be specified for this report');

        //DateSpecified:="Employee PayrollX".GETRANGEMIN("Employee PayrollX"."Pay Period Filter");
        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";
    end;

    var
        Assignmatrix: Record "Assignment Matrix-X1";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        EmpRec: Record Employee;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodX1";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record EarningsX1;
        CfMpr: Decimal;
        Deductions: Record DeductionsX1;
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodX1";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit Payroll5;
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
        ScalePointer: Record "Salary Pointers21";
        SalaryScale: Record "Salary Scales21";
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        HseAllow: Record "House Allowance Matrix21";
        Ded: Record DeductionsX1;
        Assmatrix: Record "Assignment Matrix-X1";
        // LoanType: Record "Loan Product Type1";
        // LoanApplication: Record "Loan Application1";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        Netpay3: Decimal;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX1;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin

        AmountRemaining := TaxableAmount;
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
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
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

