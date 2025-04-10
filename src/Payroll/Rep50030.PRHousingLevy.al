report 52193425 "PR Housing Levy"
{
    Caption = 'PR Housing Levy';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Housing Levy.rdl';
    dataset
    {
        dataitem("HR-Employee"; "Employee")
        {
            RequestFilterFields = "No.", Status;
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
            column(CompInfo_PIN; CompInfo."PIN No.")
            {
            }
            column(No_HREmployees; "HR-Employee"."No.")
            {
            }
            column(FirstName_HREmployees; "HR-Employee"."First Name")
            {
            }
            column(MiddleName_HREmployees; "HR-Employee"."Middle Name")
            {
            }
            column(LastName_HREmployees; "HR-Employee"."Last Name")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(Grade; "Current Job Grade")
            {
            }
            column(PAYENumber_HREmployees; "HR-Employee"."P.I.N")
            {
            }
            column(DateOfBirth_HREmployees; "HR-Employee"."Date Of Birth")
            {
            }
            column(NHIFNo_HREmployees; "HR-Employee"."N.H.I.F No")
            {
            }
            column(IDNumber_HREmployees; "HR-Employee"."ID Number")
            {
            }
            column(NSSFNo_HREmployees; "HR-Employee"."Social Security No.")
            {
            }
            column(StdAmount; StdAmount)
            {
            }
            column(YearBirth; YearBirth)
            {
            }
            column(GPAY; GPAY)
            {
            }
            column(VolAmount; VolAmount)
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }
            column(HLEVYGPAY; HLEVYGPAY)
            {

            }

            trigger OnAfterGetRecord();
            begin

                StdAmount := 0;
                VolAmount := 0;
                GPAY := 0;
                VitalSetup3.Get();
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "HR-Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", VitalSetup3."Housing Levy");
                if PRPeriodTrans.FINDFIRST() then begin
                    StdAmount := PRPeriodTrans.Amount;
                end;

                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "HR-Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'GPAY');
                if PRPeriodTrans.FINDFIRST() then begin
                    GPAY := PRPeriodTrans.Amount;
                    TotalEmployees += 1;
                end;


                //Voluntary Amount
                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "HR-Employee"."No.");
                PRPeriodTrans.Setfilter(PRPeriodTrans."Transaction Code", '%1', VitalSetup3."Housing Levy");
                if PRPeriodTrans.FindFirst() then begin
                    VolAmount := PRPeriodTrans.Amount;
                end;

                PRPeriodTrans.RESET;
                PRPeriodTrans.SETRANGE("Payroll Period", SelectedPeriod);
                PRPeriodTrans.SETRANGE("Employee Code", "HR-Employee"."No.");
                PRPeriodTrans.SETRANGE("Transaction Code", 'HLEVYGPAY');
                if PRPeriodTrans.FindFirst() then begin
                    HLEVYGPAY := PRPeriodTrans.Amount;
                end;



                if GPAY = 0 then CurrReport.Skip();
            end;

            trigger OnPreDataItem();
            begin
                TotalEmployees := 0;
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
                group("Filter Options")
                {
                    field(SelectedPeriod; SelectedPeriod)
                    {
                        Caption = 'Selected Period';
                        TableRelation = "PR Payroll Periods"."Date Opened";
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


        CompInfo.RESET;
        CompInfo.GET;

        CompInfo.CALCFIELDS(Picture);

        if SelectedPeriod = 0D then ERROR('Please select payroll period');

        PRPayrollPeriods.RESET;
        PRPayrollPeriods.SETRANGE("Date Opened", SelectedPeriod);
        if PRPayrollPeriods.FINDFIRST() then PeriodName := UPPERCASE(PRPayrollPeriods."Period Name");
    end;

    var
        CompInfo: Record "Company Information";
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodName: Text;
        StdAmount: Decimal;
        YearBirth: Text;
        GPAY: Decimal;
        VolAmount, HLEVYGPAY : Decimal;
        TotalEmployees: Decimal;
        VitalSetup3: Record "PR Vital Setup Info";
}

