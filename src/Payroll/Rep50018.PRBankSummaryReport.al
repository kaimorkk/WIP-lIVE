report 52193426 "PR Bank Summary Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Bank Summary Report.rdl';

    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('NPAY'));
            RequestFilterFields = "Payroll Period", "Bank Code", "Branch Code";

            column(BeneficiaryName; BeneficiaryName)
            {
            }
            column(AccountPhoneNo; AccountPhoneNo)
            {
            }
            column(BICSORTCode; BICSORTCode)
            {
            }
            column(Amount; Amount)
            {
            }
            column(BankName; BankName)
            {
            }
            column(BranchName; BranchName)
            {
            }
            column(BankCode_PRPeriodTransactions; "Bank Code")
            {
            }
            column(BranchCode_PRPeriodTransactions; "Branch Code")
            {
            }

            column(Reerence; Reerence)
            {
            }
            column(DebitFromAccount; DebitFromAccount)
            {
            }
            column(OriginatorPhysicalLocation; OriginatorPhysicalLocation)
            {
            }
            column(Payroll_Period; "Payroll Period")
            {
            }
            column(PrintDate; PrintDate)
            {
            }
            column(PrintTime; PrintTime)
            {
            }
            column(EmployeeCode_PRPeriodTransactions; "Employee Code")
            {
            }
            trigger OnPreDataItem()
            begin
                // PrPeriod.Reset();
                // PrPeriod.SetRange("Branch Code", '');
                // if PrPeriod.Find('-') then begin
                //     repeat
                //         if HREmp.get(PrPeriod."Employee Code") then begin
                //             HREmp.CalcFields("Bank Name", "Bank Branch Name");
                //             // PrPeriod."Bank Code" := HREmp."Employee's Bank";
                //             PrPeriod."Branch Code" := HREmp."Bank Branch";
                //             PrPeriod.Modify(false);
                //         end;
                //     until PrPeriod.Next() = 0;
                // end;
                // PrPeriod.Reset();
                // PrPeriod.SetRange("Bank Code", '');
                // if PrPeriod.Find('-') then begin
                //     repeat
                //         if HREmp.get(PrPeriod."Employee Code") then begin
                //             HREmp.CalcFields("Bank Name", "Bank Branch Name");
                //             PrPeriod."Bank Code" := HREmp."Employee's Bank";
                //             //PrPeriod."Branch Code" := HREmp."Bank Branch";
                //             PrPeriod.Modify(false);
                //         end;
                //     until PrPeriod.Next() = 0;
                // end;
            end;

            trigger OnAfterGetRecord()
            begin
                PrintDate := today;
                PrintTime := time;
                clear(BeneficiaryName);
                Clear(AccountPhoneNo);
                Clear(BankName);
                Clear(BranchName);
                if HREmp.get("PR Period Transactions"."Employee Code") then begin
                    HREmp.CalcFields("Bank Name", "Bank Branch Name");
                    BeneficiaryName := UpperCase(HREmp.FullName());
                    AccountPhoneNo := HREmp."Bank Account Number";

                end;
                HRBankSummary.Reset();
                HRBankSummary.SetRange("No.", "PR Period Transactions"."Employee Code");
                HRBankSummary.SetRange("Payroll Period", "PR Period Transactions"."Payroll Period");

                HRBankSummary.SetFilter("Bank Code", "PR Period Transactions".GetFilter("Bank Code"));
                HRBankSummary.SetFilter("Branch Code", "PR Period Transactions".GetFilter("Branch Code"));
                if HRBankSummary.FindFirst() then begin
                    BankName := HRBankSummary."Bank Name";
                    BranchName := HRBankSummary."Branch Name";
                    // "Bank Code" := HRBankSummary."Bank Code";
                    // "Branch Code" := HRBankSummary."Branch Code";
                end
                else begin
                    if HREmp.get("PR Period Transactions"."Employee Code") then
                        HREmp.CalcFields("Bank Name", "Bank Branch Name");
                    BankName := HREmp."Bank Name";
                    BranchName := HREmp."Bank Branch Name";

                end;
                // CurrReport.Skip();
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
                group(Control3)
                {
                    // field(BankCode; BankCode)
                    // {
                    //     ApplicationArea = all;
                    //     TableRelation = "Employee Bank AccountX".Code;
                    //     trigger onvalidate()
                    //     begin

                    //     end;
                    // }
                    // field("Branch Code"; "Branch Code")
                    // {
                    //     ApplicationArea = all;
                    //     TableRelation = "PR Bank Branches"."Branch Code";
                    // }
                }
            }
        }
        actions
        {
        }
    }
    var
        BeneficiaryName: Text;
        AccountPhoneNo: Text;
        HREmp: Record Employee;
        BICSORTCode: Text;
        BankName: Text;
        BranchName: Text;
        Reerence: Text;
        DebitFromAccount: Text;
        OriginatorPhysicalLocation: Text;
        PrintDate: date;
        PrintTime: time;
        HRBankSummary: Record "HR Bank Summary";
        PrPeriod: Record "PR Period Transactions";
    // BankCode: Code[10];
    // "Branch Code": Code[20];
}
