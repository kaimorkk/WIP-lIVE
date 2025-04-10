report 52193611 "Loan Repayment Schedule"
{
    Caption = 'Loan Repayment Schedule';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(LoanRepaymentSchedule; "Loan Repayment Schedule1")
        {
            RequestFilterFields = "Employee No.", "Loan No.";
            column(strEmpName; strEmpName)
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

            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(EmployeeNo; "Employee No.")
            {
            }
            column(InstalmentNo; "Instalment No")
            {
            }


            column(LoanNo; "Loan No.")
            {
            }
            column(MonthlyInterest; "Monthly Interest")
            {
            }
            column(MonthlyRepayment; "Monthly Repayment")
            {
            }
            column(PrincipalRepayment; "Principal Repayment")
            {
            }
            column(RemainingDebt; "Balance C/F")
            {
            }

            column(Repayment_Date; "Repayment Date")
            {

            }

            column(Interest_Rate; "Interest Rate")
            {

            }

            trigger OnAfterGetRecord()
            begin
                Clear(StrEmpName);

                HREmp.Reset();
                HREmp.Get("Employee No.");
                StrEmpName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
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
        CompInfo: Record "Company Information";
        HREmp: Record "Employee";

        StrEmpName: text;

    trigger OnPreReport()
    begin
        CompInfo.Reset();

        CompInfo.get();

        CompInfo.CalcFields(Picture);
    end;
}
