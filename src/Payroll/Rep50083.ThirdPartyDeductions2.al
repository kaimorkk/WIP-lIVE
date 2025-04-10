report 52193539 "Third Party Deductions2"
{
    ApplicationArea = All;
    Caption = 'Third Party Deductions2';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Third Party Deductions2.rdlc';
    dataset
    {
        dataitem(PRTransactionCodes; "PR Transaction Codes")
        {
            RequestFilterFields = "Period Filter";
            DataItemTableView = where("Transaction Type" = const(Deduction), "Group Code" = filter(<> ''), "Transaction Total" = filter(<> 0));
            CalcFields = "Balance Total", "Transaction Total";
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
            column(TransactionCode; "Transaction Code")
            {
            }
            column(TransactionName; "Transaction Name")
            {
            }
            column(PayCode_PRTransactionCodes; "Pay Code")
            {
            }
            column(TransactionType; "Transaction Type")
            {
            }
            column(GroupCode; "Group Code")
            {
            }
            column(GroupDescription; "Group Description")
            {
            }
            column(GroupCodeTotal; "Group Code Total")
            {
            }
            column(TransactionTotal; "Transaction Total")
            {
            }
            column(BalanceTotal_PRTransactionCodes; "Balance Total")
            {
            }
            column(Commission; Commission1)
            { }
            column(CheqAmount; CheqAmount)
            { }
            column(NO2; NO2)
            { }
            column(PeriodName; PeriodName)
            {

            }
            trigger OnAfterGetRecord()
            begin
                CheqAmount := 0;
                Commission1 := 0;
                DeductAmount1 := 0;
                NO2 := 0;
                CompInfo.get();
                CompInfo.CalcFields(Picture);

                PeriodTrans.Reset();
                PeriodTrans.SetRange("Transaction Code", "Transaction Code");
                // PeriodTrans.SetRange("Period Month", "Period Month");
                // PeriodTrans.SetRange("Period Year", "Period Year");
                PeriodTrans.SetFilter("Payroll Period", GetFilter("Period Filter"));
                if PeriodTrans.FindSet() then begin
                    PeriodTrans.CalcSums(Amount, Balance);
                    if PeriodTrans.Amount = 0 then
                        CurrReport.Skip();
                    if PayPeriods.Get(PeriodTrans."Payroll Period") then
                        PeriodName := PayPeriods."Period Name";

                    NO2 := PeriodTrans.Count;
                    DeductAmount1 := PeriodTrans.Amount;
                    if "Commission Type" = "Commission Type"::"Flat Amount" then
                        Commission1 := Commission * NO2;
                    if "Commission Type" = "Commission Type"::Percentage then
                        Commission1 := Commission / 100 * DeductAmount1;

                    CheqAmount := DeductAmount1 - Commission1;
                end;

            end;

            trigger OnPreDataItem()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        TransCodes: Record "PR Transaction Codes";
        GroupCode: Code[20];
        GroupName: Text[100];
        PeriodTrans: Record "PR Period Transactions";
        PeriodTrans2: Record "PR Period Transactions";
        Commission: Decimal;
        CompInfo: Record "Company Information";
        no, NO2 : Integer;
        GroupTotal, TotBalance, TotComm, TotChq, DeductAmount : Decimal;
        TotGroupTotal, TotTotBalance, TotTotComm, TotTotChq, TotDeductAmount : Decimal;
        DeductAmount1, Commission1, CheqAmount : Decimal;
        PayCode: Text;
        payperiod: Date;
        PeriodName: Text;
        PayPeriods: Record "PR Payroll Periods";
}
