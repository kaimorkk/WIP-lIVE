//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511410_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511410) { }
//type("System.IO.Path"; System_IO_Path51511410) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193708 "Salaries Summary"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/SalariesSummary.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(EarningsX1; EarningsX1)
        {
            DataItemTableView = where("Reduces Tax" = const(false), "G/L Account" = filter(<> ''), "Non-Cash Benefit" = const(false));
            column(ReportForNavId_1000000002; 1000000002) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeCaption; TheCode)
            {
            }
            column(AccountNoText; AccountNoText)
            {
            }
            column(TitleCaption; Title)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(CodeText; CodeText)
            {
            }
            column(DrText; DrText)
            {
            }
            column(CrText; CrText)
            {
            }
            column(AccountNoCaption; AccountNo)
            {
            }
            column(Description; LineDescription)
            {
            }
            column(Debit; TotalAmount)
            {
            }
            column(Credit; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                Company.CalcFields(Picture);
                PeriodText := Format(Datefilter, 0, '<month text> <year4>');
                TotalAmount := 0;
                AssignMatrix.Reset;
                AssignMatrix.SetRange(Code, EarningsX1.Code);
                //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                AssignMatrix.SetRange("Payroll Period", Datefilter);
                AssignMatrix.CalcSums(Amount);
                TheCode := EarningsX1.Code;
                AccountNo := EarningsX1."G/L Account";
                LineDescription := EarningsX1.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>');
                TotalAmount := AssignMatrix.Amount;
                TotalDebits := TotalDebits + AssignMatrix.Amount;
                TotalNetPay := -(TotalDebits + TotalCredits);
            end;

        }
        dataitem(DeductionsX1; DeductionsX1)
        {
            DataItemTableView = where("G/L Account" = filter(<> ''), "Pension Scheme" = const(false), Gratuity = const(false), "Gratuity Arrears" = const(false));
            column(ReportForNavId_1000000019; 1000000019) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeDedCaption; TheCode)
            {
            }
            column(AccountNoDedCaption; AccountNo)
            {
            }
            column(DescriptionDed; LineDescription)
            {
            }
            column(DebitDed; TotalAmount)
            {
            }
            column(CreditDed; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                AssignMatrix.Reset;
                AssignMatrix.SetRange(Code, DeductionsX1.Code);
                //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                AssignMatrix.SetRange("Payroll Period", Datefilter);
                AssignMatrix.CalcSums(Amount);
                TheCode := DeductionsX1.Code;
                AccountNo := DeductionsX1."G/L Account";
                LineDescription := DeductionsX1.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>');
                TotalAmount := AssignMatrix.Amount;
                TotalCredits := TotalCredits + AssignMatrix.Amount;
                TotalNetPay := -(TotalDebits + TotalCredits);
            end;

        }
        dataitem(PensionScheme; DeductionsX1)
        {
            DataItemTableView = where("Pension Scheme" = const(true));
            column(ReportForNavId_1000000004; 1000000004) { } // Autogenerated by ForNav - Do not delete
            column(TheCodePenCaption; TheCode)
            {
            }
            column(AccountNoPenCaption; AccountNo)
            {
            }
            column(DescriptionPen; LineDescription)
            {
            }
            column(DebitPen; TotalAmount)
            {
            }
            column(CreditPen; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, PensionScheme.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, PensionScheme.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums(Amount);
                    TheCode := PensionScheme.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := PensionScheme.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := AssignMatrix.Amount;
                    TotalCredits := TotalCredits + AssignMatrix.Amount;
                end;
                TotalNetPay := -(TotalDebits + TotalCredits);
            end;

        }
        dataitem(GratuityScheme; DeductionsX1)
        {
            DataItemTableView = where(Gratuity = const(true));
            column(ReportForNavId_1000000005; 1000000005) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratCaption; TheCode)
            {
            }
            column(AccountNoGratCaption; AccountNo)
            {
            }
            column(DescriptionGrat; LineDescription)
            {
            }
            column(DebitGrat; TotalAmount)
            {
            }
            column(CreditGrat; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(PGMapping.Code, GratuityScheme.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityScheme.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums(Amount);
                    TheCode := GratuityScheme.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := GratuityScheme.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := AssignMatrix.Amount;
                    TotalCredits := TotalCredits + AssignMatrix.Amount;
                end;
                TotalNetPay := -(TotalDebits + TotalCredits);
            end;

        }
        dataitem(GratuityArrears; DeductionsX1)
        {
            DataItemTableView = where("Gratuity Arrears" = const(true));
            column(ReportForNavId_1000000009; 1000000009) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratArrCaption; TheCode)
            {
            }
            column(AccountNoGratArrCaption; AccountNo)
            {
            }
            column(DescriptionGratArr; LineDescription)
            {
            }
            column(DebitGratArr; TotalAmount)
            {
            }
            column(CreditGratArr; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, GratuityArrears.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityArrears.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums(Amount);
                    TheCode := GratuityArrears.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := GratuityArrears.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := AssignMatrix.Amount;
                    TotalCredits := TotalCredits + AssignMatrix.Amount;
                end;
                // TotalNetPay:=-(TotalDebits+TotalCredits);
            end;

        }
        dataitem(PensionSchemeEmployer; DeductionsX1)
        {
            DataItemTableView = where("Pension Scheme" = const(true));
            column(ReportForNavId_1000000048; 1000000048) { } // Autogenerated by ForNav - Do not delete
            column(TheCodePenEmpCaption; TheCode)
            {
            }
            column(AccountNoPenEmpCaption; AccountNo)
            {
            }
            column(DescriptionPenEmp; LineDescription)
            {
            }
            column(DebitPenEmp; TotalAmount)
            {
            }
            column(CreditPenEmp; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, PensionSchemeEmployer.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, PensionSchemeEmployer.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := PensionSchemeEmployer.Code;
                    AccountNo := PGMapping."GL Account Employer";
                    LineDescription := PensionSchemeEmployer.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := Abs(AssignMatrix."Employer Amount");
                    // MESSAGE('PensionEmployer=%1',TotalAmount);
                    TotalDebits := TotalDebits + Abs(AssignMatrix."Employer Amount");
                end;
                // TotalNetPay:=-(TotalDebits+TotalCredits);
            end;

        }
        dataitem(GratuityEmployer; DeductionsX1)
        {
            DataItemTableView = where(Gratuity = const(true));
            column(ReportForNavId_1000000037; 1000000037) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratEmpCaption; TheCode)
            {
            }
            column(AccountNoGratEmpCaption; AccountNo)
            {
            }
            column(DescriptionGratEmp; LineDescription)
            {
            }
            column(DebitGratEmp; TotalAmount)
            {
            }
            column(CreditGratEmp; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, GratuityEmployer.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityEmployer.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := GratuityEmployer.Code;
                    AccountNo := PGMapping."GL Account Employer";
                    LineDescription := GratuityEmployer.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := Abs(AssignMatrix."Employer Amount");
                    TotalDebits := TotalDebits + Abs(AssignMatrix."Employer Amount");
                end;
                //TotalNetPay:=-(TotalDebits+TotalCredits);
            end;

        }
        dataitem(GratuityArrearsEmployer; DeductionsX1)
        {
            DataItemTableView = where("Gratuity Arrears" = const(true));
            column(ReportForNavId_1000000031; 1000000031) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratArrEmpCaption; TheCode)
            {
            }
            column(AccountNoGratArrEmpCaption; AccountNo)
            {
            }
            column(DescriptionGratArrEmp; LineDescription)
            {
            }
            column(DebitGratArrEmp; TotalAmount)
            {
            }
            column(CreditGratArrEmp; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, GratuityArrearsEmployer.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityArrearsEmployer.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := GratuityArrearsEmployer.Code;
                    AccountNo := PGMapping."GL Account Employer";
                    LineDescription := GratuityArrearsEmployer.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := Abs(AssignMatrix."Employer Amount");
                    TotalDebits := TotalDebits + Abs(AssignMatrix."Employer Amount");
                end;
                // TotalNetPay:=-(TotalDebits+TotalCredits);
                // NetPayAccountNo:='702200';
                // NetDescription:= 'NET PAY' +' '+FORMAT(Datefilter,0,'<month text> <year4>');
            end;

        }
        dataitem(PensionSchemeEmployerCr; DeductionsX1)
        {
            DataItemTableView = where("Pension Scheme" = const(true));
            column(ReportForNavId_1000000079; 1000000079) { } // Autogenerated by ForNav - Do not delete
            column(TheCodePenEmpCrCaption; TheCode)
            {
            }
            column(AccountNoPenEmpCrCaption; AccountNo)
            {
            }
            column(DescriptionPenCrEmp; LineDescription)
            {
            }
            column(DebitPenEmpCr; TotalAmount)
            {
            }
            column(CreditPenEmpCr; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, PensionSchemeEmployerCr.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, PensionSchemeEmployerCr.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := PensionSchemeEmployerCr.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := PensionSchemeEmployerCr.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := -AssignMatrix."Employer Amount";
                    // MESSAGE('PensionEmployerCr=%1',TotalAmount);
                    TotalCredits := TotalCredits - AssignMatrix."Employer Amount";
                end;
                // TotalNetPay:=-(TotalDebits+TotalCredits);
            end;

        }
        dataitem(GratuityEmployerCr; DeductionsX1)
        {
            DataItemTableView = where(Gratuity = const(true));
            column(ReportForNavId_1000000073; 1000000073) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratEmpCrCaption; TheCode)
            {
            }
            column(AccountNoGratEmpCrCaption; AccountNo)
            {
            }
            column(DescriptionGratEmpCr; LineDescription)
            {
            }
            column(DebitGratEmpCr; TotalAmount)
            {
            }
            column(CreditGratEmpCr; -TotalAmount)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, GratuityEmployerCr.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityEmployerCr.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := GratuityEmployerCr.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := GratuityEmployerCr.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := -AssignMatrix."Employer Amount";
                    TotalCredits := TotalCredits - AssignMatrix."Employer Amount";
                end;
                //TotalNetPay:=-(TotalDebits+TotalCredits);
            end;

        }
        dataitem(GratuityArrearsEmployerCr; DeductionsX1)
        {
            DataItemTableView = where("Gratuity Arrears" = const(true));
            column(ReportForNavId_1000000067; 1000000067) { } // Autogenerated by ForNav - Do not delete
            column(TheCodeGratArrEmpCrCaption; TheCode)
            {
            }
            column(AccountNoGratArrEmpCrCaption; AccountNo)
            {
            }
            column(DescriptionGratArrEmpCr; LineDescription)
            {
            }
            column(DebitGratArrEmpCr; TotalAmount)
            {
            }
            column(CreditGratArrEmpCr; -TotalAmount)
            {
            }
            column(GrandTotalCaption; GrandTotal)
            {
            }
            column(TotalDebits; TotalDebits)
            {
            }
            column(TotalCredits; Abs(TotalCredits + TotalNetPay))
            {
            }
            column(TotalNetPay; Abs(TotalNetPay))
            {
            }
            column(NetPayAccountNo; NetPayAccountNo)
            {
            }
            column(NetDescription; NetDescription)
            {
            }
            trigger OnAfterGetRecord();
            begin
                TotalAmount := 0;
                PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                PGMapping.SetRange(Code, GratuityArrearsEmployerCr.Code);
                if PGMapping.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(Code, GratuityArrearsEmployerCr.Code);
                    //AssignMatrix.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
                    AssignMatrix.SetRange("Payroll Period", Datefilter);
                    AssignMatrix.CalcSums("Employer Amount");
                    TheCode := GratuityArrearsEmployerCr.Code;
                    AccountNo := PGMapping."G/L Account";
                    LineDescription := GratuityArrearsEmployerCr.Description + ' Employer ' + Format(Datefilter, 0, '<month text> <year4>');
                    TotalAmount := -AssignMatrix."Employer Amount";
                    TotalCredits := TotalCredits - AssignMatrix."Employer Amount";
                end;
                // TotalNetPay:=-(TotalDebits+TotalCredits);
                NetPayAccountNo := '702200';
                NetDescription := 'NET PAY' + ' ' + Format(Datefilter, 0, '<month text> <year4>');
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                field("Payroll Period"; Datefilter)
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        PayrollPeriod.Reset;
                        if Page.RunModal(51511259, PayrollPeriod) = Action::LookupOK then
                            Datefilter := PayrollPeriod."Starting Date";
                    end;
                }
                field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                {
                    ApplicationArea = Basic;
                    Caption = 'Design';
                    Visible = ReportForNavAllowDesign;
                }
            }
        }

    }

    trigger OnInitReport()
    begin
        //EVALUATE(Datefilter,'10012013');
        //;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        //;
        ////ReportForNav.Post;
    end;

    trigger OnPreReport()
    begin
        GenJnline.Reset;
        GenJnline.SetRange("Journal Template Name", 'GENERAL');
        GenJnline.SetRange("Journal Batch Name", 'SALARIES');
        GenJnline.DeleteAll;
        //TotalDebits:=0;
        Company.CalcFields(Picture);
        PeriodText := Format(Datefilter, 0, '<month text> <year4>');
        TotalDebits := 0;
        TotalCredits := 0;
        TotalNetPay := 0;
        //TotalAmount:=
        //;
        //ReportsForNavPre;
    end;

    var
        Earn: Record EarningsX1;
        Datefilter: Date;
        GenJnline: Record "Gen. Journal Line";
        LineNumber: Integer;
        AmountRemaining: Decimal;
        Company: Record "Company Information";
        IncomeTax: Decimal;
        NetPay: Decimal;
        RightBracket: Boolean;
        Companyz: Code[10];
        "Posting Date": Date;
        BatchName: Text[30];
        DocumentNo: Code[10];
        Description: Text[30];
        Amount: Decimal;
        "G/LAccount": Code[10];
        TotalncomeTax: Decimal;
        GrossPay: Decimal;
        Totalgross: Decimal;
        TotalNetPay: Decimal;
        Payday: Date;
        TotalBasic: Decimal;
        PayrollPeriod: Record "Payroll PeriodX1";
        PostingGroup: Record "Employee Posting GroupX1";
        TaxAccount: Code[10];
        SalariesAcc: Code[10];
        PayablesAcc: Code[10];
        First: Code[10];
        Last: Code[10];
        EmployeeTemp: Record Employee temporary;
        TotalDebits: Decimal;
        TotalCredits: Decimal;
        AssignMatrix: Record "Assignment Matrix-X1";
        JnlTemp: Record "Gen. Journal Batch";
        Found: Boolean;
        TotalSSF: Decimal;
        PeriodStartDate: Date;
        EmpRec: Record Employee;
        DateSpecified: Date;
        Payperiodtext: Text[30];
        TransferLoans: Boolean;
        TaxCode: Code[10];
        BasicSalary: Decimal;
        PAYE: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        GetPeriodFilter: Date;
        ActivityRec: Record "Dimension Value";
        EarningsCopy: Record EarningsX1;
        // LoanApp: Record "Loan Application1";
        EmpAccMap: Record "Employee Account Mapping1";
        PGMapping: Record "Employee PGroups1";
        Deduction: Record DeductionsX1;
        AccountNo: Code[30];
        TotalAmount: Decimal;
        LineDescription: Text[250];
        TheCode: Code[10];
        Title: label 'Salaries Journal';
        DrText: label 'Dr Amount';
        CrText: label 'Cr Amount';
        GrandTotal: label 'Grand Total';
        CodeText: label 'Code';
        AccountNoText: label 'Account No.';
        PeriodText: Text[50];
        NetPayAccountNo: Code[30];
        NetDescription: Text[250];

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX1;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
        Employee: Record Employee;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := AmountRemaining;
        AmountRemaining := PayrollRounding(AmountRemaining);
        EndTax := false;
        TaxTable.SetRange("Table Code", TaxCode);
        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if (TaxableAmount) > TaxTable."Upper Limit" then
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

    procedure GetPayPeriod(var PayPeriods: Record "Payroll PeriodX1")
    begin
        PayrollPeriod := PayPeriods;
    end;

    procedure GetCurrentPeriod()
    var
        PayPeriodRec: Record "Payroll PeriodX1";
    begin
        PayPeriodRec.SetRange(PayPeriodRec.Closed, false);
        if PayPeriodRec.Find('-') then
            PeriodStartDate := PayPeriodRec."Starting Date";
    end;

    procedure AdjustPostingGr()
    begin
        if AssignMatrix.Find('-') then begin
            repeat
                if EmpRec.Get(AssignMatrix."Employee No") then
                    AssignMatrix."Posting Group Filter" := EmpRec."Posting Group";
                AssignMatrix.Modify;
            until AssignMatrix.Next = 0;
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

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        //[WithEvents]
        //ReportForNav: DotNet ForNavReport51511410_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511410;
        ReportForNavObject: Variant;
    begin
        addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_7_3_0_2559\ForNav.Reports.7.3.0.2559.dll';
        if not File.Exists(addInFileName) then begin
            tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.7.3.0.2559.dll';
            if not File.Exists(tempAddInFileName) then
                Error('Please install the ForNAV DLL version 7.3.0.2559 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
        end;
        ReportForNavObject := //ReportForNav.GetLatest(CurrReport.OBJECTID, CurrReport.Language, SerialNumber, UserId, CompanyName);
        ReportForNav := ReportForNavObject;
        //ReportForNav.Init();
    end;

    //local procedure ReportsForNavPre();
    // begin
    ////ReportForNav.OpenDesigner := ReportForNavOpenDesigner;
    //if not //ReportForNav.Pre() then CurrReport.Quit();
    //end;*/

    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
