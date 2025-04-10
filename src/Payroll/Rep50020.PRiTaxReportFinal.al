report 52193423 "PR iTax Report Final"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR iTax Report Final.rdl';

    dataset
    {
        dataitem("HR Employees"; "Employee")
        {
            DataItemTableView = where(Disabled = filter(false));

            RequestFilterFields = "No.", "Posting Group", "Contract Type";

            // column(CompInfo_PIN; CompInfo."Pin No")
            // {
            // }
            column(EmployeeType_HREmployees; "HR Employees"."Employee Type")
            {
            }
            column(No_; "No.")
            {

            }
            column(Employee_Contract_Type; "Contract Type")
            {
            }
            column(Employement_Type; "Employee Type")
            {
            }
            column(Contract_Type; "Contract Type")
            {
            }
            // column(Citizenship_HREmployees; "HR Employees"."Citizenship Type")
            // {
            // }
            column(FullName_HREmployees; "HR Employees".FullName())
            {
            }
            column(PINNo_HREmployees; "HR Employees"."P.I.N")
            {
            }
            column(BPAY; BPAY)
            {
            }
            column(HouseAllowance; HouseAllowance)
            {
            }
            column(TransportAllowance; TransportAllowance)
            {
            }
            column(LeaveAllowance; LeaveAllowance)
            {
            }
            column(DirectorsFee; DirectorsFee)
            {
            }
            column(OvertimeAllowance; OvertimeAllowance)
            {
            }
            column(Lumpsum; Lumpsum)
            {
            }
            column(OtherAllowances; OtherAllowances)
            {
            }
            column(TotalCashPay; TotalCashPay)
            {
            }
            column(ValueOfCar; ValueOfCar)
            {
            }
            column(OtherNonCash; OtherNonCash)
            {
            }
            column(TotalNonCash; '')
            {
            }
            column(GlobalIncome; 0)
            {
            }
            column(TypeOfHousing; TypeOfHousingText)
            {
            }
            column(RentOfHouse; RentOfHouse)
            {
            }
            column(ComputedRent; ComputedRent)
            {
            }
            column(RentRecovered; RentRecovered)
            {
            }
            column(NetValue; NetValue)
            {
            }
            column(TotalGross; '')
            {
            }
            column(ThirtyPCash; ThirtyPCash)
            {
            }
            column(ActualContr; ActualContr)
            {
            }
            column(PermissibleLimit; PermissibleLimit)
            {
            }
            column(MortgageIntrest; MortgageIntrest)
            {
            }
            column(HOSP; HOSP)
            {
            }
            column(AmountOfBenefit; '')
            {
            }
            column(TaxablePay; '')
            {
            }
            column(TaxPayable; '')
            {
            }
            column(MonthlyRelief; MonthlyRelief)
            {
            }
            column(InsuranceRelief; InsuranceRelief)
            {
            }
            column(PAYE; PAYE)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Init
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
                TypeOfHousing := 0;
                TypeOfHousingText := 'Benefit not given';
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
                InsuranceRelief := 0;
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

                //Other Allowances 2
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
                PRTransCodes.SetFilter(PRTransCodes."Transaction Code", '<>%1', 'ALW-0040');
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
                fn_PeriodTrans;
                PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'ALW-0040');
                if PRPeriodTrans.FIND('-') then begin
                    PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    ValueOfCar += PRPeriodTrans.Amount;
                end;

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
                // TotalGross := GlobalIncome;

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
                // if E1 > E2 then begin
                //     AmountOfBenefit := E2;
                // end else begin
                //     AmountOfBenefit := E1;
                // end;

                // if E3 < AmountOfBenefit then begin
                //     AmountOfBenefit := E3;
                // end;
                // AmountOfBenefit += MortgageIntrest;

                //Taxable Pay
                // fn_PeriodTrans;
                // PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'TXBP');
                // if PRPeriodTrans.FIND('-') then begin
                //     TaxablePay := PRPeriodTrans.Amount;
                // end;

                //Tax Payable
                // fn_PeriodTrans;
                // PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code", 'TXCHRG');
                // if PRPeriodTrans.FIND('-') then begin
                //     TaxPayable := PRPeriodTrans.Amount;
                // end;

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
                    InsuranceRelief := PRPeriodTrans.Amount;
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

    trigger OnPreReport();
    begin
        if PeriodFilter = 0D then ERROR('Please select payroll period');
        fnCompanyInfo;



    end;

    var


        CompInfo: Record "Company Information";
        PRPeriodTrans: Record "PR Period Transactions";
        Hremp: Record "Employee";
        PeriodFilter: Date;
        PRTransCodes: Record "PR Transaction Codes";
        BPAY: Decimal;
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
        TypeOfHousing: Decimal;
        TypeOfHousingText: Text;
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
        InsuranceRelief: Decimal;
        PAYE: Decimal;

    procedure fnCompanyInfo();
    begin
        CompInfo.RESET;
        if CompInfo.GET then
            CompInfo.CALCFIELDS(CompInfo.Picture);
    end;

    local procedure fn_PeriodTrans();
    begin
        PRPeriodTrans.RESET;
        PRPeriodTrans.SETRANGE(PRPeriodTrans."Employee Code", "HR Employees"."No.");
        PRPeriodTrans.SETRANGE(PRPeriodTrans."Payroll Period", PeriodFilter);
    end;
}

