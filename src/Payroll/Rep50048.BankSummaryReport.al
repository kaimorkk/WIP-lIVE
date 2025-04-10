report 52193428 "Bank Summary Report"
{
    Caption = 'Bank Summary Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Summary Report.rdl';

    dataset
    {
        dataitem("HR Bank Summary"; "HR Bank Summary")
        {
            DataItemTableView = where("Transaction Code" = const('NPAY'));
            RequestFilterFields = "Payroll Period";
            column(BankCode_HRBankSummary; "Bank Code")
            {
            }
            column(BankName_HRBankSummary; "Bank Name")
            {
            }
            column(Amount_HRBankSummary; Amount)
            {
            }
            column(PrintTime; PrintTime)
            {

            }
            column(NOofOfficers; NoofOfficers)
            {

            }
            column(No_HRBankSummary; "No.")
            {
            }
            trigger OnAfterGetRecord()
            begin
                Banksummary.Reset();
                Banksummary.SetRange(Banksummary."Transaction Code", 'NPAY');
                Banksummary.SetRange(Banksummary."Payroll Period", "HR Bank Summary"."Payroll Period");
                if Banksummary.Find('-') then
                    NoofOfficers := Banksummary.Count;
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

                }
            }
        }
        actions
        {
        }
    }
    trigger OnInitReport()
    begin
        PrintTime := Time;
    end;

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
        NoofOfficers: Integer;
        Banksummary: Record "HR Bank Summary";
}
