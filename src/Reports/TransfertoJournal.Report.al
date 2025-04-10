//dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
//{
//assembly("ForNav.Reports.7.3.0.2559")
// {
//   type(ForNav.Report_7_3_0_2559; ForNavReport51511408_v7_3_0_2559) { }
//}
//assembly("mscorlib")
//  {
//    Version = '4.0.0.0';
//    type("System.IO.Stream"; SystemIOStream51511408) { }
//type("System.IO.Path"; System_IO_Path51511408) { }
//   }
//} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 52193706 "Transfer to Journal"
{
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/TransfertoJournal.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = where("Global Dimension No." = const(2));
            column(ReportForNavId_1000000000; 1000000000) { } // Autogenerated by ForNav - Do not delete
            trigger OnAfterGetRecord();
            begin
                TotalDebits := 0;
                TotalCredits := 0;
                PayrollPeriod.Reset;
                PayrollPeriod.SetRange("Starting Date", Datefilter);
                if PayrollPeriod.Find('-') then begin
                    PayrollPeriod.TestField("Pay Date");
                    Payday := PayrollPeriod."Pay Date"
                end;
                Earn.Reset;
                Earn.SetRange("Reduces Tax", false);
                Earn.SetFilter("G/L Account", '<>%1', '');
                Earn.SetRange("Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(Code, Earn.Code);
                        AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                        AssignMatrix.SetRange("Payroll Period", Datefilter);
                        AssignMatrix.CalcSums(Amount);
                        //  EarningsX1.TESTFIELD(EarningsX1."G/L Account");
                        GenJnline.Init;
                        LineNumber := LineNumber + 10;
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := 'SALARIES';
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        //  IF PGMapping.GET("Employee Posting GroupX1".Code,EarningsX1.Code,0) THEN
                        GenJnline."Account No." := Earn."G/L Account";
                        GenJnline."Posting Date" := Payday;
                        GenJnline.Description := Earn.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                        GenJnline."Document No." := Format(Datefilter);
                        GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                        GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                        GenJnline.Amount := AssignMatrix.Amount;
                        GenJnline.Validate("Shortcut Dimension 2 Code");
                        GenJnline.Validate("Shortcut Dimension 1 Code");
                        //GenJnline.VALIDATE("Account No.");
                        // GenJnline.VALIDATE(Amount);
                        TotalDebits := TotalDebits + AssignMatrix.Amount;
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    until Earn.Next = 0;
                end;
                Earn.Reset;
                Earn.SetRange("Non-Cash Benefit", true);
                Earn.SetRange(Fringe, true);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(Code, Earn.Code);
                        AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                        AssignMatrix.SetRange("Payroll Period", Datefilter);
                        AssignMatrix.CalcSums("Employer Amount");
                        //  EarningsX1.TESTFIELD(EarningsX1."G/L Account");
                        GenJnline.Init;
                        LineNumber := LineNumber + 10;
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := 'SALARIES';
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        //  IF PGMapping.GET("Employee Posting GroupX1".Code,EarningsX1.Code,0) THEN
                        GenJnline."Account No." := Earn."G/L Account";
                        GenJnline."Posting Date" := Payday;
                        GenJnline.Description := Earn.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                        GenJnline."Document No." := Format(Datefilter);
                        GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                        GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                        GenJnline.Amount := AssignMatrix."Employer Amount";
                        GenJnline.Validate("Shortcut Dimension 2 Code");
                        GenJnline.Validate("Shortcut Dimension 1 Code");
                        //GenJnline.VALIDATE("Account No.");
                        // GenJnline.VALIDATE(Amount);
                        TotalDebits := TotalDebits + AssignMatrix.Amount;
                        Message(Format(AssignMatrix."Employer Amount"));
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert;
                    until Earn.Next = 0;
                end;
                Deduction.Reset;
                Deduction.SetFilter("G/L Account", '<>%1', '');
                if Deduction.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(Code, Deduction.Code);
                        AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                        AssignMatrix.SetRange("Payroll Period", Datefilter);
                        AssignMatrix.CalcSums(Amount);
                        //MESSAGE('%1',AssignMatrix.Amount);
                        GenJnline.Init;
                        LineNumber := LineNumber + 10;
                        GenJnline."Journal Template Name" := 'GENERAL';
                        GenJnline."Journal Batch Name" := 'SALARIES';
                        GenJnline."Line No." := GenJnline."Line No." + 10000;
                        GenJnline."Account No." := Deduction."G/L Account";
                        GenJnline."Posting Date" := Payday;
                        GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                        GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                        GenJnline.Description := Deduction.Description + ' ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                        GenJnline."Document No." := Format(Datefilter);
                        GenJnline.Amount := AssignMatrix.Amount;
                        GenJnline.Validate("Shortcut Dimension 2 Code");
                        GenJnline.Validate("Shortcut Dimension 1 Code");
                        // GenJnline.VALIDATE("Account No.");
                        //  GenJnline.VALIDATE(Amount);
                        TotalCredits := TotalCredits + AssignMatrix.Amount;
                        if GenJnline.Amount <> 0 then
                            GenJnline.Insert
                    until Deduction.Next = 0;
                end;
                Deduction.Reset;
                Deduction.SetRange("Pension Scheme", true);
                if Deduction.Find('-') then begin
                    repeat
                        PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                        PGMapping.SetRange(Code, Deduction.Code);
                        if PGMapping.Find('-') then begin
                            AssignMatrix.Reset;
                            AssignMatrix.SetRange(Code, Deduction.Code);
                            AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                            AssignMatrix.SetRange("Payroll Period", Datefilter);
                            AssignMatrix.CalcSums("Employer Amount");
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."G/L Account";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            // GenJnline.VALIDATE("Account No.");
                            // GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."GL Account Employer";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := -AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            //  GenJnline.VALIDATE("Account No.");
                            //  GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                        end;
                    until Deduction.Next = 0;
                end;
                Deduction.Reset;
                Deduction.SetRange(Gratuity, true);
                if Deduction.Find('-') then begin
                    repeat
                        PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                        PGMapping.SetRange(Code, Deduction.Code);
                        if PGMapping.Find('-') then begin
                            AssignMatrix.Reset;
                            AssignMatrix.SetRange(Code, Deduction.Code);
                            AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                            AssignMatrix.SetRange("Payroll Period", Datefilter);
                            AssignMatrix.CalcSums("Employer Amount");
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."G/L Account";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := -AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            // GenJnline.VALIDATE("Account No.");
                            // GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."GL Account Employer";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := -AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            //  GenJnline.VALIDATE("Account No.");
                            //  GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                        end;
                    until Deduction.Next = 0;
                end;
                Deduction.Reset;
                Deduction.SetRange("Gratuity Arrears", true);
                if Deduction.Find('-') then begin
                    repeat
                        PGMapping.SetRange(Type, PGMapping.Type::Deduction);
                        PGMapping.SetRange(Code, Deduction.Code);
                        if PGMapping.Find('-') then begin
                            AssignMatrix.Reset;
                            AssignMatrix.SetRange(Code, Deduction.Code);
                            AssignMatrix.SetRange("Global Dimension 2 Code", "Dimension Value".Code);
                            AssignMatrix.SetRange("Payroll Period", Datefilter);
                            AssignMatrix.CalcSums("Employer Amount");
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."G/L Account";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            //  GenJnline.VALIDATE("Account No.");
                            //GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                            GenJnline.Init;
                            LineNumber := LineNumber + 10;
                            GenJnline."Journal Template Name" := 'GENERAL';
                            GenJnline."Journal Batch Name" := 'SALARIES';
                            GenJnline."Line No." := GenJnline."Line No." + 10000;
                            GenJnline."Account No." := PGMapping."GL Account Employer";
                            GenJnline."Posting Date" := Payday;
                            GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                            GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                            GenJnline.Description := Deduction.Description + ' ' + 'Employer ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                            GenJnline."Document No." := Format(Datefilter);
                            GenJnline.Amount := -AssignMatrix."Employer Amount";
                            GenJnline.Validate("Shortcut Dimension 2 Code");
                            GenJnline.Validate("Shortcut Dimension 1 Code");
                            //  GenJnline.VALIDATE("Account No.");
                            //  GenJnline.VALIDATE(Amount);
                            if GenJnline.Amount <> 0 then
                                GenJnline.Insert;
                        end;
                    until Deduction.Next = 0;
                end;
                /*//PostingGroup.RESET;
				//IF PostingGroup.FIND('-') THEN BEGIN
				//REPEAT
				TotalNetPay:=0;
				EmpRec.RESET;
				EmpRec.SETRANGE("Pay Period Filter",Datefilter);
				//EmpRec.SETRANGE("Posting Group",'iNTERN');
				EmpRec.SETRANGE("Global Dimension 2 Code","Dimension Value".Code);
				EmpRec.SETRANGE(Status,EmpRec.Status::Active);
				IF EmpRec.FIND('-') THEN BEGIN
				   REPEAT
					EmpRec.CALCFIELDS(EmpRec."Total Allowances",EmpRec."Total Deductions");
					TotalNetPay:=TotalNetPay+(EmpRec."Total Allowances"+EmpRec."Total Deductions");
					UNTIL EmpRec.NEXT=0;
				  END;
					GenJnline.INIT;
					LineNumber:=LineNumber+10;
					GenJnline."Journal Template Name":='GENERAL';
					GenJnline."Journal Batch Name":='SALARIES';
					GenJnline."Line No.":=GenJnline."Line No."+10000;
					GenJnline."Account No.":='702200';
					GenJnline."Posting Date":=Payday;
					GenJnline."Shortcut Dimension 1 Code":=PADSTR("Dimension Value".Code,1);
					GenJnline.Description:= 'Net Pay' +' '+FORMAT(Datefilter,0,'<month text> <year4>')+' '+"Dimension Value".Name;
					GenJnline."Shortcut Dimension 2 Code":="Dimension Value".Code;
					GenJnline."Document No.":=FORMAT(Datefilter);
					GenJnline.Amount:=-TotalNetPay;
					GenJnline.VALIDATE("Shortcut Dimension 2 Code");
					GenJnline.VALIDATE("Shortcut Dimension 1 Code");
				   // GenJnline.VALIDATE("Account No.");
				   // GenJnline.VALIDATE(Amount);
				IF GenJnline.Amount<>0 THEN
				GenJnline.INSERT
				*/
                //UNTIL PostingGroup.NEXT=0;
                //END;
                GenJnline.Init;
                LineNumber := LineNumber + 10;
                GenJnline."Journal Template Name" := 'GENERAL';
                GenJnline."Journal Batch Name" := 'SALARIES';
                GenJnline."Line No." := GenJnline."Line No." + 10000;
                GenJnline."Account No." := '702200';
                GenJnline."Posting Date" := Payday;
                GenJnline."Shortcut Dimension 1 Code" := PadStr("Dimension Value".Code, 1);
                GenJnline.Description := 'Net Pay' + ' ' + Format(Datefilter, 0, '<month text> <year4>') + ' ' + "Dimension Value".Name;
                GenJnline."Shortcut Dimension 2 Code" := "Dimension Value".Code;
                GenJnline."Document No." := Format(Datefilter);
                GenJnline.Amount := -(TotalDebits + TotalCredits);
                GenJnline.Validate("Shortcut Dimension 2 Code");
                GenJnline.Validate("Shortcut Dimension 1 Code");
                if GenJnline.Amount <> 0 then
                    GenJnline.Insert

            end;

            trigger OnPostDataItem();
            begin
                /* // MESSAGE('%1',TotalDebits+TotalCredits);
                   GenJnline.INIT;
                   LineNumber:=LineNumber+10;
                   GenJnline."Journal Template Name":='GENERAL';
                   GenJnline."Journal Batch Name":='SALARIES';
                   GenJnline."Line No.":=GenJnline."Line No."+10000;
                   GenJnline."Account No.":='702200';
                   GenJnline."Posting Date":=Payday;
                   GenJnline."Shortcut Dimension 1 Code":=PADSTR("Dimension Value".Code,1);
                   GenJnline.Description:= 'Net Pay' +' '+FORMAT(Datefilter,0,'<month text> <year4>')+' '+"Dimension Value".Name;
                   GenJnline."Shortcut Dimension 2 Code":="Dimension Value".Code;
                   GenJnline."Document No.":=FORMAT(Datefilter);
                   GenJnline.Amount:=-(TotalDebits+TotalCredits);
                   GenJnline.VALIDATE("Shortcut Dimension 2 Code");
                   GenJnline.VALIDATE("Shortcut Dimension 1 Code");
                   IF GenJnline.Amount<>0 THEN
                   GenJnline.INSERT
                   */

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
        //ReportForNav: DotNet ForNavReport51511408_v7_3_0_2559;
        ReportForNavOpenDesigner: Boolean;

        ReportForNavAllowDesign: Boolean;

    /*local procedure ReportsForNavInit();
    var
        ApplicationSystemConstants: Codeunit "Application System Constants";
        addInFileName: Text;
        tempAddInFileName: Text;
        path: DotNet System_IO_Path51511408;
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
