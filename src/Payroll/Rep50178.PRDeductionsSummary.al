report 52193742 "PR Deductions Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Deductions Summary.rdlc';

    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Type" = filter(Deduction));
            RequestFilterFields = "Employee Code", "Transaction Code", "Payroll Period";

            column(Transaction_Code; "Transaction Code")
            {
            }
            column(Transaction_Name; "Transaction Name")
            {
            }
            column(Transaction_Type; "Transaction Type")
            {
            }
            column(Payroll_Period; "Payroll Period")
            {
            }
            column(Employee_Code; "Employee Code")
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(Amount; Amount)
            {
            }
            column(Original_Amount; "Original Amount")
            {
            }
            column(Balance; Balance)
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
            column(Cur_PNAME; Cur_PNAME)
            {
            }

            trigger OnAfterGetRecord()
            var
                Emp: Record Employee;
            begin
                Emp.Reset();
                Emp.SetRange("No.", "Employee Code");
                if Emp.FindFirst() then
                    EmpName := Emp.FullName();

                PRPayrollPeriods.Reset;
                PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", "PR Period Transactions"."Payroll Period");
                if PRPayrollPeriods.FindFirst() then
                    Cur_PNAME := PRPayrollPeriods."Period Name"
            end;

            trigger OnPreDataItem()
            var
                Err001: Label 'The Payroll Period is required.';
            begin
                if "PR Period Transactions".GetFilter("Payroll Period") = '' then
                    Error(Err001)
            end;
        }
        // dataitem("PR Trans Codes Groups"; "PR Trans Codes Groups")
        // {
        //     column(GroupCode; "Group Code")
        //     {
        //     }
        //     column(GroupDescription; "Group Description")
        //     {
        //     }

        //     column(CurrAmount; CurrAmount)
        //     {

        //     }
        //     column(PeriodFilter; PeriodFilter)
        //     {
        //     }
        //     trigger OnPreDataItem()
        //     begin

        //     end;

        //     trigger OnAfterGetRecord()
        //     begin
        //         Clear(CurrAmount);

        //         PRTransCode.Reset();
        //         PRTransCode.SetRange("Group Code", "PR Trans Codes Groups"."Group Code");
        //         if PRTransCode.FindSet(false, false) then begin
        //             repeat
        //                 PRPeriodTransactions.Reset();
        //                 PRPeriodTransactions.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", "Reference No");
        //                 PRPeriodTransactions.SetRange("Transaction Code", PRTransCode."Transaction Code");
        //                 PRPeriodTransactions.SetRange("Payroll Period", PeriodFilter);
        //                 if PRPeriodTransactions.FindSet(false, false) then begin
        //                     PRPeriodTransactions.CalcSums(Amount);
        //                     CurrAmount += PRPeriodTransactions.Amount;
        //                 end;
        //             until PRTransCode.Next() = 0;
        //         end;
        //     end;
        // }

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

                    // field(PeriodFilter; PeriodFilter)
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Period Filter';
                    //     TableRelation = "PR Payroll Periods";
                    // }
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
    trigger OnPreReport()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then CompInfo.CalcFields(Picture);
    end;



    var
        PRPeriodTransactions: Record "PR Period Transactions";
        Cur_PNAME: text;
        PRTransCode: Record "PR Transaction Codes";
        PeriodFilter: Date;
        CurrAmount: Decimal;
        CompInfo: Record "Company Information";
        PRPayrollPeriods: Record "PR Payroll Periods";
        EmpName: Text;
}
