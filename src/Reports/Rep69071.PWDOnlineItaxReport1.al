report 69071 "PWD Online Itax Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PWD Online Itax Report1.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = where(Disabled = filter(true), "Pays tax?" = filter(false));
            RequestFilterFields = "Pay Period Filter", "Posting Group";
            column(PIN; Employee."P.I.N")
            {
            }
            column(Names; Names)
            {
            }
            column(Resident; Resident)
            {
            }
            column(TypeofEmployee; TypeofEmployee)
            {
            }
            column(Basic; BPAY)
            {
            }
            column(HouseAllowance1; HouseAllowance)
            {
            }
            column(TransportAllowance; TransportAllowance)
            {
            }
            column(ExcemptionCert; Employee."Disability No.")
            {
            }
            column(Leavepay; LeaveAllowance)
            {
            }
            column(OvertimeAllowance; OvertimeAllowance)
            {
            }
            column(DirectorsFees; DirectorsFee)
            {
            }
            column(LumpSum; Lumpsum)
            {
            }
            column(OtherAllowance; OtherAllowances)
            {
            }
            column(NonCashBenefit_Employee; OtherNonCash)
            {
            }
            column(CarBenefit; CarBenefit)
            {
            }
            column(NonCashBenefit; TotalNonCash)
            {
            }
            column(TypeofHousing; TypeofHousing)
            {
            }
            column(ActualContribution; ActualContr * -1)
            {
            }
            column(EmployeeContribution_Employee; ActualContr * -1)
            {
            }
            column(MortageInterest; 0)
            {
            }
            column(HomeOwnership; HomeOwnership)
            {
            }
            column(MPR; MonthlyRelief)
            {
            }
            column(InsuranceRelief; InsuranceReliefAmt)
            {
            }
            column(InsuranceReliefAmt; InsuranceReliefAmt)
            { }
            column(PAYE; PAYE)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(OwnerOccupier; Employee."Owner Occupier")
            {
            }

            trigger OnAfterGetRecord()
            begin

                TypeofEmployee := Format(Employee."Employee Type") + ' ' + 'Employee';
                TypeofHousing := 'Benefit not given';
                CarBenefit := 0;
                MortageInterest := '';
                HomeOwnership := '';
                InsuranceRelief := '';
                PersonalRelief := '';
                Employee.CalcFields(Basic, "Other Allowance", "Insurance Relief", "Cumm. PAYE", /* "Non Cash Benefit", */ "House Allowance1", "Transport Allowance");
                Employee.CalcFields("Leave Allowance", "Overtime Allowance", /* "Directors Fees", */ "Actual Contribution", /* "Gross Cash", */ "Retirement Contribution",
                "Owner Occupier", Employee."SSF Employer to Date"/* , Employee.MPR */);//,"Employee Status");
                Names := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                /*IF Employee."Employee Status"<>Employee."Employee Status"::"0" THEN
                  CurrReport.SKIP;*/

                Resident := Format(Employee."Residential Status");

                HrSetup.Get;
                if Employee."Actual Contribution" > HrSetup."Pension Limit Amount" then begin
                    ActualContribution := Format(HrSetup."Pension Limit Amount");
                    InsuranceRelief := Format(Employee."Insurance Relief");
                    // PersonalRelief := Format(Employee.MPR);
                end
                else begin
                    ActualContribution := '';
                end;
                if Employee."Residential Status" = Employee."Residential Status"::"Non-Resident" then begin

                    ActualContribution := '';
                    InsuranceRelief := '';
                    PersonalRelief := '';

                end
                else begin
                    ActualContribution := Format(Employee."Actual Contribution");
                    InsuranceRelief := Format(Employee."Insurance Relief");
                    // PersonalRelief := Format(Employee.MPR);
                end;
                if Employee."Employee Type" = Employee."Employee Type"::Secondary then begin
                    ActualContribution := '';
                    PersonalRelief := '';
                    MortageInterest := '';
                    HomeOwnership := '';

                end else begin
                    ActualContribution := Format(Employee."Actual Contribution");
                    InsuranceRelief := Format(Employee."Insurance Relief");
                    // PersonalRelief := Format(Employee.MPR);
                    MortageInterest := '0';
                    HomeOwnership := Format(Employee."Home Savings");
                end;

                BPAY := 0;
                HouseAllowance := 0;
                TransportAllowance := 0;
                OvertimeAllowance := 0;
                DirectorsFee := 0;
                LeaveAllowance := 0;
                OvertimeAllowance := 0;
                Lumpsum := 0;
                OtherAllowances := 0;
                TotalCashPay := 0;
                ValueOfCar := 0;
                OtherNonCash := 0;
                TotalNonCash := 0;
                GlobalIncome := 0;
                // TypeOfHousing := 0;
                ComputedRent := 0;
                RentRecovered := 0;
                NetValue := 0;
                TotalGross := 0;
                ThirtyPCash := 0;
                ActualContr := 0;
                PermissibleLimit := 0;
                MortgageIntrest := 0;
                AmountOfBenefit := 0;
                TaxablePay := 0;
                TaxPayable := 0;
                MonthlyRelief := 0;
                InsuranceReliefAmt := 0;
                PAYE := 0;


                //Basic Pay
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2', 'BPAY', 'E21');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    BPAY := PRPeriodTrans.Amount;
                end;
                PRPeriodTrans.SetRange(PRPeriodTrans."Basic Salary Arrears", true);
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    BPAY := BPAY + PRPeriodTrans.Amount;
                end;

                //House Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4', 'ALW-0005', 'ALW-0004', 'ALW-0066', 'ALW-0067');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    HouseAllowance := PRPeriodTrans.Amount;
                end;

                //Transport Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4', 'ALW-0014', 'ALW-0013', 'ALW-0068', 'ALW-0069');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    TransportAllowance := PRPeriodTrans.Amount;
                end;

                //Leave Allowance & Arrears
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2|%3', 'ALW-0044', 'ALW-0054', 'ALW-0053');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    LeaveAllowance := PRPeriodTrans.Amount;
                end;

                //Overtime Allowance
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1', 'E35');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    OvertimeAllowance := PRPeriodTrans.Amount;
                end;

                //Directors Fee


                //Lumpsum
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1', 'E018');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Lumpsum := PRPeriodTrans.Amount;
                end;

                //Other Allowances 1
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Type", PRPeriodTrans."Transaction Type"::Income);
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Group Order", 3);
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1', 'GPAY');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    OtherAllowances := PRPeriodTrans.Amount;
                    OtherAllowances := OtherAllowances - (BPAY + HouseAllowance + LeaveAllowance + TransportAllowance)
                end;

                // //Other Allowances 2
                // fn_PeriodTrans;
                // PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8'
                //               , 'E023', 'E024', 'E025', 'E012');
                // if PRPeriodTrans.FIND('-') then begin
                //     PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;

                // //Other Allowances 3
                // fn_PeriodTrans;
                // PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8|%9|%10|%11'
                //               , 'E026', 'E027', 'E028', 'E015', 'E016', 'E020', 'E014', 'E017', 'E021', 'E029', 'E030');
                // if PRPeriodTrans.FIND('-') then begin
                //     PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                //     OtherAllowances += PRPeriodTrans.Amount;
                // end;

                //Other Non Cash
                PRTransCodes.RESET;
                PRTransCodes.SETRANGE(PRTransCodes."Transaction Type", PRTransCodes."Transaction Type"::Benefit);
                if PRTransCodes.FIND('-') then begin
                    repeat
                        fn_PeriodTrans;
                        PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        if PRPeriodTrans.FIND('-') then begin
                            OtherNonCash += PRPeriodTrans.Amount;
                        end;
                    until PRTransCodes.NEXT = 0;
                end;

                //Total Cash Pay
                TotalCashPay := BPAY + HouseAllowance + TransportAllowance + OvertimeAllowance
                              + DirectorsFee + LeaveAllowance + Lumpsum + OtherAllowances + OtherNonCash;


                //Value of Car


                //Total Non Cash
                TotalNonCash := OtherNonCash + ValueOfCar;

                //Globa Income
                GlobalIncome := TotalNonCash + TotalCashPay;

                //Type of Housing

                //Rent of House

                //Computed Rent

                //Rent Recovered

                //Net Value

                //Total Gross
                //TotalGross := GlobalIncome;

                //30% of Cash
                ThirtyPCash := 0.3 * GlobalIncome;

                //Actual Contribution - Include Voluntary Pension & Voluntary NSSF & NSSF
                PRTransCodes.RESET;
                PRTransCodes.SETFILTER(PRTransCodes."Special Trans Deductions", '%1|%2'
                                      , (PRTransCodes."Special Trans Deductions"::"Defined Contribution")
                                      , (PRTransCodes."Special Trans Deductions"::"Voluntary Pension")
                                      );
                if PRTransCodes.FIND('-') then begin
                    repeat
                        fn_PeriodTrans;
                        PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        if PRPeriodTrans.FIND('-') then begin
                            ActualContr += PRPeriodTrans.Amount;
                        end;
                    until PRTransCodes.NEXT = 0;
                end;
                //Add NSSF too
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'NSSF');
                if PRPeriodTrans.FIND('-') then begin
                    ActualContr += PRPeriodTrans.Amount;
                end;

                //Permissible Limit
                PermissibleLimit := 20000;

                //Mortgage Intrest
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'MORG-RL');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    // MortgageIntrest := PRPeriodTrans.Amount;
                end;

                //Amount of Benefit
                E1 := 0.3 * TotalCashPay;
                E2 := ActualContr;
                E3 := 20000;

                //Column G - Get least between e1,E2,e3
                if E1 > E2 then begin
                    AmountOfBenefit := E2;
                end else begin
                    AmountOfBenefit := E1;
                end;

                if E3 < AmountOfBenefit then begin
                    AmountOfBenefit := E3;
                end;
                AmountOfBenefit += MortgageIntrest;

                //Taxable Pay
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'TXBP');
                if PRPeriodTrans.FIND('-') then begin
                    TaxablePay := PRPeriodTrans.Amount;
                end;

                //Tax Payable
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'TXCHRG');
                if PRPeriodTrans.FIND('-') then begin
                    TaxPayable := PRPeriodTrans.Amount;
                end;

                //Monthly Relief
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'PSNR');
                if PRPeriodTrans.FIND('-') then begin
                    MonthlyRelief := PRPeriodTrans.Amount;
                end;

                //Insurance Relief
                fn_PeriodTrans;
                PRPeriodTrans.SETFILTER(PRPeriodTrans."Transaction Code", '%1|%2', 'INSR', 'NHIF-RL');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    InsuranceReliefAmt := PRPeriodTrans.Amount;
                end;

                //PAYE
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'PAYE');
                if PRPeriodTrans.FIND('-') then begin
                    PAYE := PRPeriodTrans.Amount;
                end;


                if TotalCashPay = 0 then CurrReport.SKIP;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PeriodFilter; PeriodFilter)
                    {
                        Caption = 'Period Filter';
                        TableRelation = "PR Payroll Periods";
                        ApplicationArea = All;
                    }
                }
            }
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    local procedure fn_PeriodTrans();
    begin
        PRPeriodTrans.RESET;
        PRPeriodTrans.SETRANGE(PRPeriodTrans."Employee Code", Employee."No.");
        PRPeriodTrans.SETRANGE(PRPeriodTrans."Payroll Period", PeriodFilter);
    end;

    var
        PRTransCodes: Record "PR Transaction Codes";
        Names: Code[250];
        BPAY: Decimal;
        Resident: Text;
        TypeofEmployee: Text;
        CarBenefit: Decimal;
        TypeofHousing: Text;
        ActualContribution: Text;
        HrSetup: Record "Human Resources Setup";
        MortageInterest: Text;
        HomeOwnership: Text;
        CompanyInfo: Record "Company Information";
        PRPeriodTrans: Record "PR Period Transactions";
        InsuranceRelief: Text;
        InsuranceReliefAmt: Decimal;
        PersonalRelief: Text;
        PeriodFilter: Date;
        HouseAllowance: Decimal;
        TransportAllowance: Decimal;
        LeaveAllowance: Decimal;
        OvertimeAllowance: Decimal;
        DirectorsFee: Decimal;
        Lumpsum: Decimal;
        OtherAllowances: Decimal;
        TotalCashPay: Decimal;
        ValueOfCar: Decimal;
        OtherNonCash: Decimal;
        TotalNonCash: Decimal;
        GlobalIncome: Decimal;

        RentOfHouse: Decimal;
        ComputedRent: Decimal;
        RentRecovered: Decimal;
        NetValue: Decimal;
        TotalGross: Decimal;
        ThirtyPCash: Decimal;
        ActualContr: Decimal;
        PermissibleLimit: Decimal;
        MortgageIntrest: Decimal;
        HOSP: Decimal;
        AmountOfBenefit: Decimal;
        E1: Decimal;
        E2: Decimal;
        E3: Decimal;
        TaxablePay: Decimal;
        TaxPayable: Decimal;
        MonthlyRelief: Decimal;

        PAYE: Decimal;

}

