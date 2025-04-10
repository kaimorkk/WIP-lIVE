report 52193527 "Third Party Deductions Individ"
{
    Caption = 'Third Party Deductions Individual';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Third Party Deductions Individual.rdlc';

    dataset
    {
        dataitem(PRPeriodTransactions; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Type" = const(Deduction), "Group Text" = filter('DEDUCTIONS'));
            RequestFilterFields = "Payroll Period";
            column(TransactionCode; "Transaction Code")
            {
            }
            column(TransactionName; "Transaction Name")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Balance; Balance)
            {
            }
            column(GroupName; GroupName)
            { }
            column(GroupCode; GroupCode)
            { }
            column(Commission; Commission)
            { }
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
            column(PayrollPeriod_PRPeriodTransactions; Format("Payroll Period", 0, '<Month Text> <Year4>'))
            {
            }
            column(EmployeeCode_PRPeriodTransactions; "Employee Code")
            {
            }
            column(EmpName; EmpName)
            {
            }
            column(no; no)
            { }
            column(CheqAmount; CheqAmount)
            { }
            column(PayCode; PayCode)
            { }
            trigger OnAfterGetRecord()
            begin
                CompInfo.get();
                CompInfo.CalcFields(Picture);
                TransCodes.Reset();
                TransCodes.SetRange("Group Code", GroupCode);
                TransCodes.SetRange("Transaction Code", "Transaction Code");
                if TransCodes.IsEmpty then
                    CurrReport.Skip();

                TransCodes.Reset();
                TransCodes.Get("Transaction Code");
                GroupCode := TransCodes."Group Code";
                GroupName := TransCodes."Group Description";
                PayCode := TransCodes."Pay Code";
                TransCodes.Reset();
                TransCodes.SetRange("Transaction Code", "Transaction Code");
                // TransCodes.SetRange("Employee Code", "Employee Code");
                // TransCodes.SetRange("Period Month", "Period Month");
                // TransCodes.SetRange("Period Year", "Period Year");
                // TransCodes.SetRange("Group Text", 'COMMISSION');

                if TransCodes.FindFirst() then
                    Commission := TransCodes.Commission;
                DeductAmount := Amount;
                //no := PeriodTrans.Count;
                TransCodes.Reset();
                TransCodes.SetRange("Transaction Code", "Transaction Code");
                TransCodes.SetFilter(Commission, '>%1', 0);
                if TransCodes.Find('-') then begin
                    if TransCodes."Commission Type" = TransCodes."Commission Type"::"Flat Amount" then
                        Commission := TransCodes.Commission * no;
                    if TransCodes."Commission Type" = TransCodes."Commission Type"::Percentage then
                        Commission := TransCodes.Commission / 100 * DeductAmount;

                end;
                CheqAmount := DeductAmount - Commission;
                if Emp.Get("Employee Code") then
                    EmpName := Emp.FullName();

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(GroupCode; GroupCode)
                    {
                        TableRelation = "PR Trans Codes Groups";
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
        TransCodes: Record "PR Transaction Codes";
        GroupCode: Code[20];
        GroupName: Text[100];
        PeriodTrans: Record "PR Period Transactions";
        Commission: Decimal;
        CompInfo: Record "Company Information";
        EmpName: Text[100];
        Emp: Record Employee;
        no: Integer;
        DeductAmount: Decimal;
        CheqAmount: Decimal;
        PayCode: Text;
}

