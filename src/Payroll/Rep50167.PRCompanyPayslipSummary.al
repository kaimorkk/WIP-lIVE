report 52193606 "PR Company Payslip Summary"
{
    DefaultLayout = RDLC;
    Caption = 'Organization Payslip Summary';
    RDLCLayout = './Layouts/PRCompanyPayslip.rdl';

    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            RequestFilterFields = "Transaction Type", "Transaction Code";

            column(ReportForNavId_1; 1)
            {
            }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code")
            {
            }
            column(HideStaffCount; HideStaffCount)
            {
            }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name")
            {
            }
            column(TransactionType_PRTransactionCodes; "PR Transaction Codes"."Transaction Type")
            {
            }
            column(Amount; Amount)
            {
            }
            column(PeriodFilter; PeriodFilter)
            {
            }
            column(CompInfoName; CompInfo.Name)
            {
            }
            column(CompInfoAddress; CompInfo.Address)
            {
            }
            column(CompInfoAddress2; CompInfo."Address 2")
            {
            }
            column(CompInfoCity; CompInfo.City)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompInfoEMail; CompInfo."E-Mail")
            {
            }
            column(CompInfoHomePage; CompInfo."Home Page")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(AppliedFilters; AppliedFilters)
            {
            }
            column(Cur_PNAME; Cur_PNAME)
            {
            }
            column(Cur_No_Assigned; Cur_No_Assigned)
            {
            }
            column(Male; Male)
            {

            }
            column(Female; Female)
            {

            }
            column(totalstaff; totalstaff) { }
            column(TotalEarnings; TotalEarnings)
            {
            }
            column(totalStatutories; totalStatutories) { }
            column(TotalDeductions; TotalDeductions)
            {
            }
            column(NetSalaryAmnt; NetSalaryAmnt)
            {
            }
            column(NumberOfStaff; NumberOfStaff)
            {
            }
            column(JudicialOfficer; JudicialOfficer)
            {
            }
            column(JudicialStaff; JudicialStaff)
            {
            }
            column(Casuals; Casuals)
            {
            }
            column(Judges; Judges)
            {
            }
            column(Secondary; Secondary)
            {
            }
            trigger OnAfterGetRecord()
            begin
                //Initialize
                Amount := 0;
                Male := 0;
                Female := 0;
                totalstaff := 0;
                //Selected Period
                if "Transaction Code" = 'GPAY' then
                    CurrReport.Skip();

                fn_SR_PeriodTrans;

                if PRPeriodTrans.FindSet() then begin
                    Cur_No_Assigned := PRPeriodTrans.Count();
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Amount := PRPeriodTrans.Amount;
                    repeat
                        Emp.Get(PRPeriodTrans."Employee Code");
                        if Emp.Gender = Emp.Gender::Male then
                            Male += 1
                        else
                            Female += 1;
                        totalstaff += 1;


                    until PRPeriodTrans.Next() = 0;
                end;
                if Amount = 0 then CurrReport.Skip();
            end;

            trigger OnPreDataItem()
            begin
                Clear(TotalDeductions);
                Clear(TotalEarnings);
                PRTransCodes.Reset();
                PRTransCodes.SetRange("Transaction Type", PRTransCodes."transaction type"::Income);
                if PRTransCodes.FindSet() then begin
                    repeat
                        PRPeriodTrans.Reset;
                        PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                        if PostingGroup <> '' then PRPeriodTrans.SetRange("Posting Group", PostingGroup);
                        if (PRPeriodTrans.FindFirst()) and (PRPeriodTrans."Transaction Code" <> 'GPAY') then begin
                            PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                            TotalEarnings += PRPeriodTrans.Amount;
                        end;
                    until PRTransCodes.Next() = 0;
                end;
                PRTransCodes.Reset();
                PRTransCodes.SetRange("Transaction Type", PRTransCodes."transaction type"::Deduction);
                if PRTransCodes.FindSet() then begin
                    repeat
                        PRPeriodTrans.Reset;
                        PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Type", PRPeriodTrans."Transaction Type"::Deduction);
                        PRPeriodTrans.SetFilter("Group Order", '<>%1', 7);
                        if PostingGroup <> '' then PRPeriodTrans.SetRange("Posting Group", PostingGroup);
                        if PRPeriodTrans.FindFirst() then begin
                            PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                            TotalDeductions += PRPeriodTrans.Amount;
                        end;
                    until PRTransCodes.Next() = 0;
                end;
                prPeriod_Transactions.Reset;
                prPeriod_Transactions.SetRange("Payroll Period", PeriodFilter);
                prPeriod_Transactions.SetFilter("Group Order", '=1|3|4|7|8|9|0');
                //"prPeriod Transactions".SETFILTER("prPeriod Transactions"."Sub Group Order",'=2');
                prPeriod_Transactions.SETFILTER("Posting Group", PostingGroup);
                prPeriod_Transactions.SetCurrentkey("Payroll Period", "Group Order", "Sub Group Order");
                if prPeriod_Transactions.Find('-') then begin
                    repeat
                        if ((prPeriod_Transactions."Group Order" = 7) and
                                  ((prPeriod_Transactions."Sub Group Order" = 3) or (prPeriod_Transactions."Sub Group Order" = 1) or
                                   (prPeriod_Transactions."Sub Group Order" = 2) or (prPeriod_Transactions."Sub Group Order" = 4))) then
                            totalStatutories := totalStatutories + prPeriod_Transactions.Amount;
                    until prPeriod_Transactions.Next = 0;
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                if PostingGroup <> '' then PRPeriodTrans.SetRange("Posting Group", PostingGroup);
                if PRPeriodTrans.FindSet() then begin
                    NumberOfStaff := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::"Judicial Staff");
                if PRPeriodTrans.FindSet() then begin
                    JudicialStaff := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::"Judicial Officer");
                if PRPeriodTrans.FindSet() then begin
                    JudicialOfficer := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Casual);
                if PRPeriodTrans.FindSet() then begin
                    Casuals := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Temporary);
                if PRPeriodTrans.FindSet() then begin
                    Secondary := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Judge);
                if PRPeriodTrans.FindSet() then begin
                    Judges := PRPeriodTrans.Count();
                end;


                NetSalaryAmnt := TotalEarnings - (TotalDeductions + totalStatutories);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Current Period Filter';
                        TableRelation = "PR Payroll Periods";
                    }
                    field(PostingGroup; PostingGroup)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posting Group';
                        TableRelation = "PR Employee Posting Groups".Code;
                    }
                }
            }
        }
        actions
        {
        }
        trigger OnOpenPage()
        begin
            PRPayrollPeriods.Reset();
            PRPayrollPeriods.SetRange(Closed, false);
            if PRPayrollPeriods.FindFirst() then PeriodFilter := PRPayrollPeriods."Date Opened";
        end;
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then CompInfo.CalcFields(Picture);
        PRPayrollPeriods.Reset;
        PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", PeriodFilter);
        if PRPayrollPeriods.FindFirst() then Cur_PNAME := PRPayrollPeriods."Period Name";
        //Save Filters
        if PostingGroup = '' then
            PostingGroupTxt := 'ALL'
        else
            PostingGroupTxt := PostingGroup;
        AppliedFilters := 'Posting Group: ' + PostingGroupTxt + '; Payroll Period: ' + Format(Cur_PNAME) + "PR Transaction Codes".GetFilters;
        //Company Info
        fnCompanyInfo;
    end;

    var
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodFilter: Date;
        HideStaffCount: Boolean;
        Amount: Decimal;
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        PRPayrollPeriods: Record "PR Payroll Periods";

        AppliedFilters: Text;
        Cur_PNAME: Text;
        PostingGroup: Code[20];
        PostingGroupTxt: Text;
        Cur_No_Assigned: Integer;
        Male, Female : Integer;
        Emp: Record Employee;
        PRTransCodes: Record "PR Transaction Codes";
        TotalEarnings: Decimal;
        TotalDeductions: Decimal;
        NetSalaryAmnt: Decimal;
        NumberOfStaff: Integer;
        JudicialStaff: Integer;
        JudicialOfficer: Integer;
        Judges: Integer;
        Casuals: Integer;
        Secondary: Integer;
        totalstaff: integer;
        totalStatutories: Decimal;
        prPeriod_Transactions: Record "pr Period Transactions";




    procedure fnCompanyInfo()
    begin
        CompInfo.Reset;
        if CompInfo.Get then CompInfo.CalcFields(CompInfo.Picture);
    end;

    local procedure fn_SR_PeriodTrans()
    begin
        PRPeriodTrans.Reset;
        PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
        if PostingGroup <> '' then PRPeriodTrans.SetRange("Posting Group", PostingGroup);
    end;
}
