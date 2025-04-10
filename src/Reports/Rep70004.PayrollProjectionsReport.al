report 70004 "Payroll Projections Report"
{
    Caption = 'Payroll Projections Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Projections Report.rdlc';
    dataset
    {
        dataitem(PayrollProjectionsBuffer; "Payroll Projections Buffer")
        {
            column(EmployeeNo; "Employee No")
            {
            }
            column(TransactionCode; "Transaction Code")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(FinancialYear; "Financial Year")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Grade_PayrollProjectionsBuffer; Grade)
            {
            }
            column(CodeName; CodeName)
            {
            }
            column(Title; Title)
            {
            }
            column(Approved; Approved)
            {
            }
            column(InPost; InPost)
            {
            }
            trigger OnAfterGetRecord()
            begin
                if TransCodes.Get("Transaction Code") then
                    CodeName := TransCodes."Transaction Name";
                Establishment.Reset();
                Establishment.SetRange("Job ID", "Job ID");
                if Establishment.FindFirst() then begin
                    Establishment.CalcFields("Approved No.", "Actual Active");
                    Approved := Establishment."Approved No.";
                    InPost := Establishment."Actual Active";
                    Title := Establishment."Job Title";

                end;
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
        //Employee: Record Employee;
        TransCodes: Record "PR Transaction Codes";
        CodeName: Text[100];
        Projections: Record "Payroll Projections Buffer";
        Establishment: Record "Establishment Plan Position";
        Title: Text[250];
        Approved, InPost : Integer;
}
