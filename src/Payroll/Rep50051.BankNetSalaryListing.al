report 52193433 "Bank Net Salary Listing"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Net Salary Listing.rdl';

    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('NPAY'));
            RequestFilterFields = "Payroll Period";

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
            column(BankCode; BankCode)
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
            column(IDNumber; IDNumber)
            {
            }
            trigger OnPreDataItem()
            begin
                if BranchCode = '' then
                    Error('Please select a bank');
            end;

            trigger OnAfterGetRecord()
            begin
                PrintDate := today;
                PrintTime := time;
                clear(BeneficiaryName);
                Clear(AccountPhoneNo);
                Clear(BankName);
                Clear(BranchName);
                Prperiod.Reset();
                Prperiod.SetRange(Prperiod."Payroll Period", "PR Period Transactions"."Payroll Period");
                Prperiod.SetRange(Prperiod."Employee Code", "PR Period Transactions"."Employee Code");
                Prperiod.SetRange(Prperiod."Branch Code", '');
                if Prperiod.Find('-') then begin
                    Repeat
                        if HREmp.get("PR Period Transactions"."Employee Code") then begin
                            Prperiod."Branch Code" := HREmp."Bank Branch";
                            Prperiod.Modify();
                        end;
                    until Prperiod.Next() = 0;
                end;
                if HREmp.get("PR Period Transactions"."Employee Code") then begin
                    IDNumber := HREmp."ID Number";
                    HREmp.CalcFields("Bank Name", "Bank Branch Name");
                    BeneficiaryName := UpperCase(HREmp.FullName());
                    AccountPhoneNo := HREmp."Bank Account Number";

                end;
                HRBankSummary.Reset();
                HRBankSummary.SetRange("No.", "PR Period Transactions"."Employee Code");
                HRBankSummary.SetRange("Payroll Period", "PR Period Transactions"."Payroll Period");
                if BranchCode <> '' then
                    HRBankSummary.SetFilter("Bank Code", BranchCode);
                if HRBankSummary.FindFirst() then begin
                    BankName := HRBankSummary."Bank Name";
                    BranchName := HRBankSummary."Branch Name";
                    "Bank Code" := HRBankSummary."Branch Code";
                end else
                    CurrReport.Skip();
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
                    ShowCaption = false;
                    field(BankCode; BranchCode)
                    {
                        ApplicationArea = All;
                        // TableRelation = "Employee Bank AccountX".Code;
                    }
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
        BankCode, BranchCode : Code[10];
        IDNumber: Text;
        Prperiod: Record "PR Period Transactions";

}