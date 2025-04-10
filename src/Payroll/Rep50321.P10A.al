report 52193609 "P10A."
{
    // version DSL 2020

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/P10A.rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            //  DataItemTableView = SORTING(No. Overtime Day(s) Worked);
            RequestFilterFields = "Period Filter", "Employee Code";
            column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code")
            {
            }
            column(Tot_TaxablePay; TotTaxablePay)
            {
            }
            column(Tot_PAYE; Tot_PAYE)
            {
            }
            column(SelectedYear; SelectedYear)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoVATRegistratioNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(EmployerPIN; EmployerPIN)
            {
            }
            column(PayeAmount; PayeAmount)
            {
            }
            column(TaxablePay; TaxablePay)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(PinNumber; PinNumber)
            {
            }

            trigger OnAfterGetRecord();
            begin

                CLEAR(objEmp);
                objEmp.SETRANGE(objEmp."No.", "Employee Code");
                if objEmp.FIND('-') then begin
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    PinNumber := objEmp."P.I.N";
                end;

                PeriodTrans.RESET;
                PeriodTrans.SETRANGE(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SETFILTER(PeriodTrans."Period Year", FORMAT(SelectedYear));

                TaxablePay := 0;
                PayeAmount := 0;
                if PeriodTrans.FIND('-') then
                    repeat
                        //***************************TXBP Taxable Pay****************** -  BY DENNIS
                        if (PeriodTrans."Transaction Code" = 'TXBP') then begin
                            TaxablePay := TaxablePay + PeriodTrans.Amount;
                        end;

                        //***************************GrpOrder 7, SubGrpOrder 3 = PAYE ****************
                        if PeriodTrans."Transaction Code" = 'PAYE' then begin
                            PayeAmount := PayeAmount + PeriodTrans.Amount;
                        end;
                    until PeriodTrans.NEXT = 0;

                if PayeAmount <= 0 then CurrReport.SKIP;
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
                group(Period)
                {
                    field(Year; SelectedYear)
                    {
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

        if SelectedYear = 0 then ERROR(Text001);

        CompanyInfo.RESET;
        if CompanyInfo.GET then begin
            CompanyInfo.TESTFIELD(CompanyInfo.Name);
            // CompanyInfo.TESTFIELD(CompanyInfo."PIN No");
            CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        end;


        /* HRPRAccess.RESET;
        HRPRAccess.SETRANGE("User ID",USERID);
        HRPRAccess.SETRANGE(HRPRAccess.Authorized,true);
        IF HRPRAccess.FIND('-') THEN
        BEGIN
            IF NOT HRPRAccess."View Employee Card" THEN
                ERROR('%1 You have not been setup to access this Report',USERID );
        END ELSE
        BEGIN
            ERROR('%1 You have not been setup to access this Report',USERID );
        END; */
    end;

    var
        SelectedYear: Integer;
        CompanyInfo: Record "Company Information";
        PeriodTrans: Record "PR Period Transactions";
        Text001: Label 'Please enter Period Year';
        TaxablePay: Decimal;
        Tot_PAYE: Decimal;
        PRPeriodTrans_1: Record "PR Period Transactions";
        PRPeriodTrans_2: Record "PR Period Transactions";
        PRPayrollPeriod: Record "PR Payroll Periods";
        objEmp: Record "Employee";
        EmployeeName: Text[30];
        PinNumber: Text[30];
        EmployerPIN: Text[50];
        EmployerName: Text[100];
        PeriodFilter: Text[30];
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TotTaxablePay: Decimal;
        // HRCodeunit: Codeunit "HR Codeunit";
        HRPRAccess: Record "PR Payroll Access Rights";
}

