//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511123_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511123) { }
//type("System.IO.Path"; System_IO_Path51511123) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193541 "Transfer Journal to GL-old"
{
    UseRequestPage = true;
    RDLCLayout = './Layouts/TransferJournaltoGL-old.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Employee Posting GroupX1"; "Employee Posting GroupX1")
        {
            RequestFilterFields = "Pay Period Filter", "Code";
            column(ReportForNavId_6091; 6091) { } // Autogenerated by ForNav - Do not delete
            column(Employee_Posting_GroupX1_Code; "Employee Posting GroupX1".Code)
            {
            }
            column(Employee_Posting_GroupX1_Pay_Period_Filter; "Employee Posting GroupX1"."Pay Period Filter")
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "Posting Group" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting("No.");
                column(ReportForNavId_7528; 7528) { } // Autogenerated by ForNav - Do not delete
                column(COMPANYNAME; COMPANYNAME)
                {
                }
                column(Employee_Posting_GroupX1__Description; "Employee Posting GroupX1".Description)
                {
                }
                column(Employee_Posting_GroupX1__Code; "Employee Posting GroupX1".Code)
                {
                }
                column(Payroll_Journal_summary_reportCaption; Payroll_Journal_summary_reportCaptionLbl)
                {
                }
                column(Employee_No_; Employee."No.")
                {
                }
                column(Employee_Posting_Group; Employee."Posting Group")
                {
                }
                column(Employee_Pay_Period_Filter; Employee."Department Code")
                {
                }
                trigger OnPreDataItem();
                begin
                    LastFieldNo := FieldNo("No.");
                    LineNumber := LineNumber + 2000;
                end;

                trigger OnAfterGetRecord();
                begin
                    Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");
                    TotalNetPay := TotalNetPay + (Employee."Total Allowances" + Employee."Total Deductions");
                end;

                trigger OnPostDataItem();
                begin
                    TotalCredits := TotalCredits + TotalNetPay;
                end;

            }
            dataitem(EarningsX1; EarningsX1)
            {
                DataItemLink = "Posting Group Filter" = field(Code), "Pay Period Filter" = field("Pay Period Filter");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_7169; 7169) { } // Autogenerated by ForNav - Do not delete
                column(EarningsX1_Description; EarningsX1.Description)
                {
                }
                column(EarningsX1__Total_Amount_; EarningsX1."Total Amount")
                {
                }
                column(EarningsX1_Code; EarningsX1.Code)
                {
                }
                column(EarningsX1_Posting_Group_Filter; EarningsX1."Posting Group Filter")
                {
                }
                column(EarningsX1_Pay_Period_Filter; EarningsX1."Pay Period Filter")
                {
                }
                trigger OnPreDataItem();
                begin
                    LineNumber := LineNumber + 10;
                    EarningsX1.SetRange(EarningsX1."Non-Cash Benefit", false);
                end;

                trigger OnAfterGetRecord();
                begin
                    ActivityRec.Reset;
                    ActivityRec.SetRange(ActivityRec."Dimension Code", 'DEPARTMENT');
                    if ActivityRec.Find('-') then begin
                        repeat
                            Message(ActivityRec.Code);
                            LineNumber := LineNumber + 100;
                            //  EarningsX1.CALCFIELDS("Total Amount");
                            EarningsX1.Reset;
                            EarningsX1.SetRange("Pay Period Filter", DateSpecified, CalcDate('1M', DateSpecified) - 1);
                            EarningsX1.SetRange("Global Dimension 2 Filter", ActivityRec.Code);
                            EarningsX1.CalcFields("Total Amount");
                            TotalDebits := TotalDebits + "Total Amount";
                            if EarningsX1."Total Amount" = 0 then
                                CurrReport.Skip;
                            //***************Transfer to the General Journal***************
                            EarningsX1.TestField(EarningsX1."G/L Account");
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            if PGMapping.Get("Employee Posting GroupX1".Code, EarningsX1.Code, 0) then
                                GenJnline."Account No." := PGMapping."G/L Account";
                            GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                            GenJnline.Description := EarningsX1.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                            GenJnline."Document No." := Payperiodtext;
                            GenJnline."Shortcut Dimension 2 Code" := ActivityRec.Code;
                            //ActivityRec.CALCFIELDS(ActivityRec."Activity Daily Summary");
                            GenJnline.Amount := EarningsX1."Total Amount";
                            //MESSAGE('%1 %2 %3',ActivityRec."Activity Daily Summary",EarningsCopy."Total Days",EarningsX."Total Amount");
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert
                      until ActivityRec.Next = 0;
                    end;
                end;

            }
            dataitem(Employer; DeductionsX1)
            {
                DataItemLink = "Posting Group Filter" = field(Code);
                DataItemTableView = sorting(Code);
                column(ReportForNavId_3441; 3441) { } // Autogenerated by ForNav - Do not delete
                trigger OnPreDataItem();
                begin
                    LineNumber := LineNumber + 100000;
                    Employer.SetRange(Employer."Pay Period Filter", DateSpecified);
                end;

                trigger OnAfterGetRecord();
                begin
                    if PGMapping.Get("Employee Posting GroupX1".Code, Employer.Code, 1) then begin
                        GenJnline.Init;
                        Employer.CalcFields(Employer."Total Amount Employer");
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := 'SALARIES';
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        GenJnline."Account No." := PGMapping."GL Account Employer";
                        GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                        GenJnline.Description := Employer.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        ;
                        GenJnline."Document No." := Payperiodtext;
                        GenJnline.Amount := PayrollRounding(Employer."Total Amount Employer");
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    end;
                end;

            }
            trigger OnPreDataItem();
            begin
                LineNumber := LineNumber + 1002;
            end;

            trigger OnAfterGetRecord();
            begin
                TotalncomeTax := 0;
                TotalBasic := 0;
                //TotalNetPay:=0;
                Totalgross := 0;
                "Employee Posting GroupX1".TestField("Employee Posting GroupX1"."Salary Account");
                "Employee Posting GroupX1".TestField("Employee Posting GroupX1"."Income Tax Account");
                "Employee Posting GroupX1".TestField("Employee Posting GroupX1"."Net Salary Payable");
                "Employee Posting GroupX1".TestField("Employee Posting GroupX1"."SSF Employer Account");
                PayablesAcc := "Employee Posting GroupX1"."Net Salary Payable";
                LineNumber := LineNumber + 10;
            end;

        }
        dataitem(DeductionsX1; DeductionsX1)
        {
            DataItemTableView = sorting(Code) where(Loan = const(false));
            column(ReportForNavId_1209; 1209) { } // Autogenerated by ForNav - Do not delete
            column(DeductionsX1_Description; DeductionsX1.Description)
            {
            }
            column(DeductionsX1__Total_Amount_; DeductionsX1."Total Amount")
            {
            }
            column(DeductionsX1_Code; DeductionsX1.Code)
            {
            }
            trigger OnPreDataItem();
            begin
                LineNumber := LineNumber + 100000;
                DeductionsX1.SetRange(DeductionsX1."Pay Period Filter", DateSpecified);
            end;

            trigger OnAfterGetRecord();
            begin
                LineNumber := LineNumber + 100;
                DeductionsX1.CalcFields(DeductionsX1."Total Amount", DeductionsX1."Total Amount Employer");
                /*IF DeductionsX."Total Amount"=0 THEN
                CurrReport.SKIP;*/
                if ((DeductionsX1."Total Amount" <> 0) and (DeductionsX1."Total Amount Employer" = 0)) then begin
                    TotalCredits := Abs(TotalCredits) + Abs("Total Amount");
                    //*************Transfer DeductionsX************
                    DeductionsX1.TestField(DeductionsX1."G/L Account");
                    if DeductionsX1."Total Amount" = 0 then
                        CurrReport.Skip;
                    GenJnline."Journal Template Name" := 'GENERAL';
                    GenJnline."Journal Batch Name" := 'SALARIES';
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    GenJnline."Account No." := DeductionsX1."G/L Account";
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := DeductionsX1.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    ;
                    GenJnline."Document No." := Payperiodtext;
                    GenJnline.Amount := PayrollRounding(DeductionsX1."Total Amount");
                    if TransferLoans = false then
                        GenJnline.Insert;
                end;
                if DeductionsX1."Total Amount Employer" <> 0 then begin
                    TotalSSF := Abs(DeductionsX1."Total Amount") + Abs(DeductionsX1."Total Amount Employer");
                    GenJnline.Init;
                    GenJnline."Journal Template Name" := 'GENERAL';
                    GenJnline."Journal Batch Name" := 'SALARIES';
                    GenJnline."Line No." := GenJnline."Line No." + 10000;
                    GenJnline."Account No." := DeductionsX1."G/L Account";
                    GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                    GenJnline.Description := DeductionsX1.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                    ;
                    GenJnline."Document No." := Payperiodtext;
                    GenJnline.Amount := -TotalSSF;
                    GenJnline.Insert;
                    TotalDebits := TotalDebits + Abs(DeductionsX1."Total Amount Employer");
                    TotalCredits := TotalCredits + TotalSSF;
                end;
                //END;

            end;

        }
        dataitem(LoansRec; DeductionsX1)
        {
            DataItemTableView = sorting(Code) where(Loan = const(true));
            column(ReportForNavId_7437; 7437) { } // Autogenerated by ForNav - Do not delete
            column(LoansRec_Description; LoansRec.Description)
            {
            }
            column(LoansRec__Total_Amount_; LoansRec."Total Amount")
            {
            }
            column(LoansRec_Code; LoansRec.Code)
            {
            }
            trigger OnPreDataItem();
            begin
                LoansRec.SetRange(LoansRec."Pay Period Filter", DateSpecified);
            end;

            trigger OnAfterGetRecord();
            begin
                LoansRec.CalcFields("Total Amount");
                TotalCredits := Abs(TotalCredits) + Abs("Total Amount");
                AssignmentMat.Reset;
                AssignmentMat.SetRange(AssignmentMat.Type, AssignmentMat.Type::Deduction);
                AssignmentMat.SetRange(AssignmentMat.Code, LoansRec.Code);
                AssignmentMat.SetRange(AssignmentMat."Payroll Period", DateSpecified);
                if AssignmentMat.Find('-') then begin
                    repeat
                        GenJnline.Init;
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := 'SALARIES';
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        GenJnline."Account Type" := GenJnline."account type"::Customer;
                        // LoanApp.Reset;
                        // LoanApp.SetRange(LoanApp."Loan No", AssignmentMat."Reference No");
                        // if LoanApp.Find('+') then
                        //     if EmpAccMap.Get(AssignmentMat."Employee No", LoanApp."Loan Product Type") then
                        //         GenJnline."Account No." := EmpAccMap."Customer A/c";
                        GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                        GenJnline.Description := LoansRec.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        ;
                        GenJnline."Document No." := Payperiodtext;
                        GenJnline.Amount := AssignmentMat.Amount;
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    until AssignmentMat.Next = 0;
                end;
                TotalDebits := TotalDebits + Abs(LoansRec."Total Amount Employer");
                TotalCredits := TotalCredits + LoansRec."Total Amount";
            end;

        }
        dataitem(Summary; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(ReportForNavId_3570; 3570) { } // Autogenerated by ForNav - Do not delete
            column(TotalDebits; TotalDebits)
            {
            }
            column(TotalCredits; TotalCredits)
            {
            }
            column(TotalNetPay; TotalNetPay)
            {
            }
            column(Net_PayCaption; Net_PayCaptionLbl)
            {
            }
            column(Summary_Number; Summary.Number)
            {
            }
            trigger OnAfterGetRecord();
            begin
                GenJnline.Init;
                GenJnline."Journal Template Name" := 'GENERAL';
                GenJnline."Journal Batch Name" := 'SALARIES';
                GenJnline."Line No." := GenJnline."Line No." + 10000;
                GenJnline."Account No." := PayablesAcc;
                GenJnline."Posting Date" := PayrollPeriod."Pay Date";
                GenJnline.Description := 'Salary payable' + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                ;
                GenJnline."Document No." := Payperiodtext;
                GenJnline.Amount := -PayrollRounding(TotalNetPay);
                if GenJnline.Amount <> 0 then
                    GenJnline.Insert;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(ForNavOpenDesigner; ReportForNavOpenDesigner)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Design';
                        Visible = ReportForNavAllowDesign;
                    }
                }
            }
        }

    }

    trigger OnInitReport()
    begin
        //;
        //ReportsForNavInit;

    end;

    trigger OnPostReport()
    begin
        if JnlTemp.Get('GENERAL', 'SALARIES') then
            Found := true
        else begin
            JnlTemp.Init;
            JnlTemp."Journal Template Name" := 'GENERAL';
            JnlTemp.Name := 'SALARIES';
            JnlTemp.Description := 'Salary Journal';
            JnlTemp.Insert;
        end;
        /*IF TotalDebits=TotalCredits THEN
		MESSAGE('%1 has been succesfully transferred to the General Ledger under Batch Salaries',PayrollPeriod.Name)
		ELSE
		ERROR('Could not Balance');*/
        //;
        ////ReportForNav.Post;

    end;

    trigger OnPreReport()
    begin
        Payperiodtext := "Employee Posting GroupX1".GetFilter("Employee Posting GroupX1"."Pay Period Filter");
        Payperiodtext := CopyStr(Payperiodtext, 4, 6);
        GetPeriodFilter := "Employee Posting GroupX1".GetRangeMin("Employee Posting GroupX1"."Pay Period Filter");
        DateSpecified := "Employee Posting GroupX1".GetRangeMin("Employee Posting GroupX1"."Pay Period Filter");
        if PayrollPeriod.Get(DateSpecified) then
            Payday := PayrollPeriod."Pay Date";
        if Payday = 0D then
            Error('Pay Date must be Specified for the Period');
        LineNumber := 0;
        GetCurrentPeriod;
        if PeriodStartDate <> PayrollPeriod."Starting Date" then
            if not Confirm('You are about to Transfer the Payroll summary for the Wrong Period,Continue?', false) then
                CurrReport.Quit;
        AdjustPostingGr;
        //;
        //ReportsForNavPre;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TaxableAmount: Decimal;
        IncomeTax: Decimal;
        NetPay: Decimal;
        RightBracket: Boolean;
        AmountRemaining: Decimal;
        Company: Record "Company Information";
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
        GenJnline: Record "Gen. Journal Line";
        LineNumber: Integer;
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
        AssignmentMat: Record "Assignment Matrix-X1";
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
        Payroll_Journal_summary_reportCaptionLbl: label 'Payroll Journal summary report';
        Net_PayCaptionLbl: label 'Net Pay';

    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX1;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
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
        if AssignmentMat.Find('-') then begin
            repeat
                if EmpRec.Get(AssignmentMat."Employee No") then
                    AssignmentMat."Posting Group Filter" := EmpRec."Posting Group";
                AssignmentMat.Modify;
            until AssignmentMat.Next = 0;
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
        //ReportForNav: DotNet ForNavReport51511123_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511123;
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
