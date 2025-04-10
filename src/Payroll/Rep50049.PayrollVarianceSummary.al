report 52193429 "Payroll Variance Summary"
{
    Caption = 'Payroll Variance Summary';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Variance Summary.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Payroll Header"; "Payroll Header")
        {

            column(Payroll_Period; "Payroll Period")
            {

            }

            column(CompInfLogo; CompInf.Picture)
            {

            }
            column(CompInfName; CompInf.Name)
            {

            }
            column(Amount; Amount)
            {

            }

            column(CurrentAmount; CurrentAmount)
            {

            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Staff; Staff)
            { }
            column(PRevStaff; PRevStaff)
            { }
            column(PensionArrears_PayrollHeader; "Pension Arrears")
            {
            }
            column(PrevArrears; PrevArrears)
            { }
            column(GrossPay_PayrollHeader; CUrrGpay)
            {
            }
            column(PrevGpay; PrevGpay)
            { }
            column(Deductions; Deductions)
            { }
            column(PrevDeductions; PrevDeductions)
            { }
            column(NetPay_PayrollHeader; NPAY)
            {
            }
            column(PrevNet; PrevNet)
            { }
            column(TopUp; TopUp)
            { }
            column(PrevTopUp; PrevTopUp)
            { }
            column(Other; Other)
            { }
            column(PrevOther; PrevOther)
            { }

            column(PenEmployee; PenEmployee)
            { }
            column(PrevPenEmployee; PrevPenEmployee)
            { }
            column(HLevyEmp; HLevyEmp)
            { }
            column(PrevHLevyEmp; PrevHLevyEmp)
            { }
            column(NSSFEmp; NSSFEmp)
            { }
            column(PrevNSSFEmp; PrevNSSFEmp)
            { }
            column(CurrMonth; CurrPeriod)
            { }
            column(PrevMonth; PrevPeriod)
            { }
            column(Year; Year)
            { }
            column(LessRecoveries; LessRecoveries)
            { }
            column(PrevRecoveries; PrevRecoveries)
            { }
            column(Arrears; Arrears)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_PhoneNo; CompInfo."Phone No.")
            {
            }

            dataitem("PR Employer Deductions"; "PR Employer Deductions")
            {
                DataItemLink = "Payroll Period" = field("Payroll Period");
                column(Amount_PREmployerDeductions; Amount)
                {
                }
                column(HLevy; HLevy)
                { }
                column(PrevHLevy; PrevHLevy)
                { }
                column(PenEmployer; PenEmployer)
                { }
                column(PrevPenEmployer; PrevPenEmployer)
                { }
                column(NSSF; NSSF)
                { }
                column(PrevNSSF; PrevNSSF)
                { }
                column(NITA; NITA)
                { }
                column(PrevNITA; PrevNITA)
                { }
                column(TotalVAmount; TotalVAmount)
                {

                }
                column(PrevTotalVAmount; PrevTotalVAmount)
                {

                }
                column(TotalPayments; TotalPayments)
                {

                }
                column(PrevTotalPayments; PrevTotalPayments)
                {

                }

                trigger OnAfterGetRecord()
                begin

                    case "Transaction Code" of
                        PRSetup.NITA:
                            begin
                                if "Payroll Period" = CurrPeriod then
                                    NITA += Amount
                                else
                                    PrevNITA += Amount;
                            end;
                        PRSetup."Housing Levy":
                            begin
                                if "Payroll Period" = CurrPeriod then
                                    HLevy += Amount
                                else
                                    PrevHLevy += Amount;
                            end;
                        PRSetup."PrPension Employer Code":
                            begin
                                if "Payroll Period" = CurrPeriod then
                                    PenEmployer += Amount
                                else
                                    PrevPenEmployer += Amount;
                            end;
                        'NSSF TIER 1':
                            begin
                                if "Payroll Period" = CurrPeriod then
                                    NSSF += Amount
                                else
                                    PrevNSSF += Amount;
                            end;
                        'NSSF TIER 2':
                            begin
                                if "Payroll Period" = CurrPeriod then
                                    NSSF += Amount
                                else
                                    PrevNSSF += Amount;
                            end;



                    end;
                    ////Totaling
                    if "Payroll Period" = CurrPeriod then begin
                        TotalVAmount := CUrrGpay + TopUp + Other + Arrears + PenEmployer + HLevy + NSSF + NITA;
                        TotalPayments := TotalVAmount - LessRecoveries;
                    end else begin
                        PrevTotalVAmount := PrevGpay + PrevTopUp + PrevOther + PrevArrears + PrevPenEmployer + PrevHLevy + PrevNSSF + PrevNITA;
                        PrevTotalPayments := TotalVAmount - PrevRecoveries;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    CompInf.get();
                    CompInf.CalcFields(Picture);
                    PRSetup.Get();
                    SetFilter("Transaction Code", '=%1|%2|%3|%4|%5', PRSetup.NITA, PRSetup."Housing Levy", PRSetup."PrPension Employer Code", 'NSSF', 'NSSF TIER 1');
                end;

            }
            trigger OnAfterGetRecord()
            begin
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 6930);
                ApprovalEntries.SetRange("Document No.", "No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until ApprovalEntries.Next = 0;

                end;
                ///****End Approvals
                ////****Current Period
                PRSetup.Get();

                CalcFields("Gross Pay", "Net Pay", "Total Deductions");

                // end;
                if "Payroll Period" = CurrPeriod then begin
                    CUrrGpay := "Gross Pay";
                    Deductions := "Total Deductions";
                    Arrears := "Pension Arrears";
                end else begin
                    PrevGpay := "Gross Pay";
                    PrevArrears := "Pension Arrears";
                    PrevDeductions := "Total Deductions";
                end;
                PRPeriodTransactions.Reset();
                PRPeriodTransactions.SetRange("Payroll Period", "Payroll Period");
                PRPeriodTransactions.SetRange("Transaction Code", 'NPAY');
                if PRPeriodTransactions.FindSet() then begin
                    PRPeriodTransactions.CalcSums(Amount);
                    if PRPeriodTransactions."Payroll Period" = CurrPeriod then begin
                        NPAY := PRPeriodTransactions.Amount;
                        Year := Date2DMY("Payroll Period", 3);
                        CurrMonth := FORMAT("Payroll Period", 0, '<Month Text>');
                        Staff := PRPeriodTransactions.Count;
                    end else begin
                        PrevNet := PRPeriodTransactions.Amount;
                        PRevStaff := PRPeriodTransactions.Count;
                    end;

                end;
                PRPeriodTransactions.Reset();
                PRPeriodTransactions.SetRange("Payroll Period", "Payroll Period");
                PRPeriodTransactions.SetRange("Transaction Code", PRSetup."PrPension Employee Code");
                if PRPeriodTransactions.FindSet() then begin
                    PRPeriodTransactions.CalcSums(Amount);
                    if PRPeriodTransactions."Payroll Period" = CurrPeriod then begin
                        PenEmployee := PRPeriodTransactions.Amount;
                    end else begin
                        PrevPenEmployee := PRPeriodTransactions.Amount;
                    end;
                end;
                PRPeriodTransactions.Reset();
                PRPeriodTransactions.SetRange("Payroll Period", "Payroll Period");
                PRPeriodTransactions.SetRange("Transaction Code", PRSetup."Housing Levy");
                if PRPeriodTransactions.FindSet() then begin
                    PRPeriodTransactions.CalcSums(Amount);
                    if PRPeriodTransactions."Payroll Period" = CurrPeriod then begin
                        HLevyEmp := PRPeriodTransactions.Amount;
                    end else begin
                        PrevHLevyEmp := PRPeriodTransactions.Amount;
                    end;
                end;
                PRPeriodTransactions.Reset();
                PRPeriodTransactions.SetRange("Payroll Period", "Payroll Period");
                PRPeriodTransactions.SetFilter("Transaction Code", '=%1|%2', 'NSSF TIER 1', 'NSSF TIER 2');
                if PRPeriodTransactions.FindSet() then begin
                    PRPeriodTransactions.CalcSums(Amount);
                    if PRPeriodTransactions."Payroll Period" = CurrPeriod then begin
                        PenEmployee := PRPeriodTransactions.Amount;
                    end else begin
                        PrevPenEmployee := PRPeriodTransactions.Amount;
                    end;
                end;


            end;

            trigger OnPreDataItem()
            begin
                SetFilter("Payroll Period", '=%1|%2', CurrPeriod, PrevPeriod);


                CompInf.get;
                CompInf.CalcFields(Picture);
                if "Payroll Header".getfilter("Payroll Period") = '' then
                    error('Please select the Current Payroll period');
                if PrevPeriod = 0D then
                    error('Please select the Prev. Payroll period');
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
                group(GroupName)
                {
                    field(CurrPeriod; CurrPeriod)
                    {
                        Caption = 'Current Period';
                        TableRelation = "PR Payroll Periods";
                        ApplicationArea = All;
                    }
                    field(PrevPeriod; PrevPeriod)
                    {
                        Caption = 'Previous Period';
                        TableRelation = "PR Payroll Periods" where(Closed = const(true));
                        ApplicationArea = All;
                    }


                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }


    var
        CompInf: Record "Company Information";
        prTrans: Record "pr Period Transactions";
        NPAY, Amount, CurrentAmount, PrevArrears, Arrears, PrevGpay, CUrrGpay : Decimal;
        Deductions, PrevDeductions : Decimal;
        PrevNet: Decimal;
        EmpName: Text;
        TopUp, PrevTopUp, Other, PrevOther, HLevy, PrevHLevy, PenEmployer, PrevPenEmployer, NSSF, PrevNSSF, NITA, PrevNITA : Decimal;
        PenEmployee, PrevPenEmployee, HLevyEmp, PrevHLevyEmp, NSSFEmp, PrevNSSFEmp : Decimal;
        CurrMonth, PrevMonth : Text[15];
        Year: Integer;
        SkipRoundingFrequencyOldSytem: Boolean;
        LessRecoveries, PrevRecoveries : Decimal;
        TotalPayments, PrevTotalPayments, TotalVAmount, PrevTotalVAmount : Decimal;
        HREmp: Record "Employee";
        //Approvals Start
        PrPayPeriod: record "PR Payroll Periods";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        PRevStaff, Staff, i : Integer;
        PrevPeriod, CurrPeriod : Date;
        PRPeriodTransactions: Record "PR Period Transactions";
        PREmployerContributions: Record "PR Employer Deductions";
        PRSetup: Record "PR Vital Setup Info";
        CompInfo: Record "Company Information";

}
