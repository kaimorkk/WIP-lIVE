Codeunit 52193434 Payroll
{

    trigger OnRun()
    begin
    end;

    var
        AmountRemaining: Decimal;
        TaxableAmount: Decimal;
        TaxCode: Code[20];
        IncomeTax: Decimal;
        GrossTaxCharged: Decimal;
        relief: Decimal;
        PayPeriod: Record "Payroll Period";
        BeginDate: Date;
        BasicSalary: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        Emp: Record "Employee Payroll";
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        PAYE: Decimal;
        TaxablePay: Decimal;
        EmpRec: Record "Employee Payroll";
        BfMpr: Decimal;
        CfMpr: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        LowInterestBenefits: Decimal;
        Netpay: Decimal;
        Earnings: Record Earnings;
        TerminalDues: Decimal;
        Earn: Record Earnings;
        EmployeeLedger: Record "Employee Ledger Entry1";


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record Brackets;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin

        AmountRemaining := TaxableAmount;
        //AmountRemaining:=ROUND(AmountRemaining,0.01,'<');
        EndTax := false;
        //MESSAGE('%1',TaxCode);
        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if TaxableAmount > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100

                    else begin
                        //Deducted 1 here and got the xact figures just chek incase this may have issues<for NIC>
                        //Only the amount in the last Tax band had issues.
                        //Tax:=(AmountRemaining-1)*TaxTable.Percentage/100; ---For NIC only

                        Tax := (AmountRemaining) * TaxTable.Percentage / 100;
                        Tax := ROUND(Tax, 0.01, '<'); //for stima

                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        Tax := ROUND(Tax, 0.01, '<'); //for stima
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        //TotalTax:=ROUND(TotalTax,1,'<');//Rounded for stima

        TotalTax := TotalTax;
        //TotalTax:=PayrollRounding(TotalTax);
        // TotalTax:=ROUND(TotalTax,0.1,'<') ;
        IncomeTax := -TotalTax;
        //GrossTaxCharged:=(IncomeTax+(-relief));

        /*
          IF NOT "Employee Payroll"."Pays tax?" THEN
          IncomeTax:=0;
          GrossTaxCharged:=0
         */

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

        /*
            HRsetup.GET;
            IF HRsetup."Payroll Rounding Precision"=0 THEN
               ERROR('You must specify the rounding precision under HR setup');
        
          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Nearest THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'=');
        
          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Up THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'>');
        
          IF HRsetup."Payroll Rounding Type"=HRsetup."Payroll Rounding Type"::Down THEN
            PayrollRounding:=ROUND(Amount,HRsetup."Payroll Rounding Precision",'<');
         */

    end;


    procedure CalculateTaxableAmount(var EmployeePayroll: Record "Employee Payroll"; var EmployeeNo: Code[20]; var DateSpecified: Date; var ReliefFxn: Decimal; var TaxablePayNew: Decimal; var InsuranceRelief: Decimal; var TaxchargedNew: Decimal; var FinalTax: Decimal) CalculateTaxableAmount: Decimal
    begin
        CfMpr := 0;
        BasicSalary := 0;
        InsuranceRelief := 0;
        //Get payroll period
        GetPayPeriod;
        if DateSpecified = 0D then
            Error('Pay period must be specified for this report');
        EmployeePayroll.Reset;
        EmployeePayroll.SetRange(EmployeePayroll."No.", EmployeeNo);
        EmployeePayroll.SetRange(EmployeePayroll."Pay Period Filter", DateSpecified);

        if EmployeePayroll.Find('-') then begin

        end;// To be at the end of the report;

        EmployeePayroll.CalcFields("Cumm. Basic Pay");
        EmployeePayroll.CalcFields("Taxable Allowance", "Tax Deductible Amount");
        EmployeePayroll.CalcFields("Total Allowances", "Benefits-Non Cash", "Total Deductions");
        EmployeePayroll.CalcFields("Retirement Contribution", "Total Savings", "Owner Occupier");

        if BeginDate = DateSpecified then
            BasicSalary := EmployeePayroll."Basic Pay"
        else
            BasicSalary := EmployeePayroll."Cumm. Basic Pay";

        //Added by Kimanthi
        //Do not change basic salary to zero used for 707
        /*
         IF EmployeePayroll."Taxable Allowance"<=1 THEN BEGIN
             IF EmployeePayroll."Department Code"<>'Z' THEN
               BasicSalary:=0;
         END;
         */
        //Set here for cases with Terminal dues to set Basic pay to 0
        // Terminal dues calculation
        TerminalDues := 0;
        Earn.Reset;
        Earn.SetRange(Code, '009');
        Earn.SetRange("Pay Period Filter", DateSpecified);
        Earn.SetRange("Employee Filter", EmployeeNo);
        if Earn.Find('-') then
            Earn.CalcFields(Earn."Total Amount");
        TerminalDues := Earn."Total Amount";
        if TerminalDues > 0 then
            BasicSalary := 0;
        //End of Additional by Kimanthi




        TaxableAmount := BasicSalary + EmployeePayroll."Taxable Allowance";

        // added to cater for Owner occupier Specific to NIC
        if EmployeePayroll."Home Ownership Status" = EmployeePayroll."home ownership status"::"Owner Occupier"
         then begin
            if BeginDate = DateSpecified then
                TaxableAmount := TaxableAmount - EmployeePayroll."House Rent"
            else
                TaxableAmount := TaxableAmount - EmployeePayroll."Owner Occupier";
        end;
        // end of addition
        if EmployeePayroll."Housed by Employer" then begin
            case EmployeePayroll.Housing of
                EmployeePayroll.Housing::Ordinary:
                    EmployeePayroll."Total Quarters" := 0.15 * TaxableAmount;
                EmployeePayroll.Housing::Directors:
                    EmployeePayroll."Total Quarters" := 0.15 * TaxableAmount;
                EmployeePayroll.Housing::Agricultural:
                    EmployeePayroll."Total Quarters" := 0.1 * TaxableAmount;
            end;
        end;

        CompRec.Get;
        HseLimit := CompRec."Housing Earned Limit";
        TaxCode := CompRec."Tax Table";

        if ((TaxableAmount > HseLimit) and (EmployeePayroll."Total Quarters" > 0)) then begin
            if EmployeePayroll."Employer Rent" then
                if EmployeePayroll."House Rent" > EmployeePayroll."Total Quarters" then
                    EmployeePayroll."Total Quarters" := EmployeePayroll."House Rent"
                else
                    EmployeePayroll."Total Quarters" := EmployeePayroll."Total Quarters"
            else
                EmployeePayroll."Total Quarters" := EmployeePayroll."Total Quarters" - EmployeePayroll."House Rent";
        end;

        if BeginDate <> DateSpecified then begin
            EmployeePayroll.Reset;
            EmployeePayroll.SetRange("Pay Period Filter", DateSpecified);
            EmployeePayroll.CalcFields("Cumulative Quarters");
            EmployeePayroll."Total Quarters" := EmployeePayroll."Cumulative Quarters";
        end;

        EmployeePayroll."Total Quarters" := ROUND(EmployeePayroll."Total Quarters", 0.01);

        TaxableAmount := TaxableAmount + EmployeePayroll."Total Quarters" + EmployeePayroll."Tax Deductible Amount";
        //Checking for Pension Limit to allow for tax
        retirecontribution := 0;
        ExcessRetirement := 0;

        retirecontribution := -EmployeePayroll."Retirement Contribution";

        //IF "Employee Payroll"."Retirement Contribution" > CompRec."Pension Limit Amount" THEN
        if retirecontribution > CompRec."Pension Limit Amount" then begin
            ExcessRetirement := retirecontribution - CompRec."Pension Limit Amount";

            TaxableAmount := TaxableAmount + ExcessRetirement

        end;

        //END----Checking for pension Limit

        GrossPay := BasicSalary + EmployeePayroll."Total Allowances";

        TotalBenefits := EmployeePayroll."Benefits-Non Cash";
        TaxablePay := BasicSalary + EmployeePayroll."Taxable Allowance";
        RetireCont := EmployeePayroll."Tax Deductible Amount" + ExcessRetirement;
        TotalQuarters := EmployeePayroll."Total Quarters";
        // housing
        if EmployeePayroll."Home Ownership Status" = EmployeePayroll."home ownership status"::"Owner Occupier"
         then begin
            if BeginDate = DateSpecified then
                TotalQuarters := EmployeePayroll."House Rent"
            else
                TotalQuarters := EmployeePayroll."Owner Occupier";
        end;
        //end of housing

        //Low Interest Benefits<Kimanthi>
        if BeginDate = DateSpecified then begin
            TaxableAmount := TaxableAmount + EmployeePayroll."Low Interest Benefits";
            LowInterestBenefits := EmployeePayroll."Low Interest Benefits";
        end else begin
            EmployeeLedger.Reset;
            EmployeeLedger.SetRange(EmployeeLedger.Employee, EmployeeNo);
            EmployeeLedger.SetRange(EmployeeLedger."Payroll Period", DateSpecified);
            if EmployeeLedger.Find('-') then begin
                TaxableAmount := TaxableAmount + EmployeeLedger."Low Interest Benefits";
                if EmployeePayroll."Home Ownership Status" <> EmployeePayroll."home ownership status"::"Owner Occupier" then
                    TaxableAmount := TaxableAmount - EmployeeLedger."Owner Occupier";
            end;
        end;



        //End of Low Interest benefits

        TaxablePayNew := TaxableAmount;

        TaxableAmount := ROUND(TaxableAmount, 0.01, '<');


        GetTaxBracket(TaxableAmount);
        ReliefFxn := EmployeePayroll."Tax Relief Amount";


        TaxchargedNew := IncomeTax;

        CalculateTaxableAmount := (IncomeTax);

        // Calculate insurance relief;
        Earnings.Reset;
        Earnings.SetRange("Insurance Relief", true);
        Earnings.SetRange("Employee Filter", EmployeePayroll."No.");
        Earnings.SetRange("Pay Period Filter", DateSpecified);
        if Earnings.Find('-') then
            Earnings.CalcFields(Earnings."Insurance Relief Amount");
        InsuranceRelief := Earnings."Insurance Relief Amount";

        PAYE := IncomeTax;
        relief := EmployeePayroll."Tax Relief Amount";
        if (Format(DateSpecified, 0, '<month>')) <> '1' then begin
            EmpRec.Reset;
            EmpRec.SetRange(EmpRec."Pay Period Filter", CalcDate('-1M', DateSpecified));
            EmpRec.Get(EmployeePayroll."No.");
            EmpRec.CalcFields(EmpRec.BfMpr);

            IncomeTax := IncomeTax + relief;//+EmpRec.BfMpr;---Deducting twice BfMpr assigned releif
            BfMpr := EmpRec.BfMpr;
        end else begin
            GrossTaxCharged := ROUND(IncomeTax, 1, '=');
            IncomeTax := IncomeTax + relief;
        end;
        IncomeTax := IncomeTax + Abs(InsuranceRelief);
        if not EmployeePayroll."Pays tax?" then begin
            IncomeTax := 0;
            TaxablePay := 0;
            RetireCont := 0;
            TotalQuarters := 0;
            TaxableAmount := 0;
            relief := 0;
            PAYE := 0;
        end;


        FinalTax := ROUND(IncomeTax, 1, '<');

    end;
}

