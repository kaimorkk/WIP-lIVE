report 50005 "Salary Netpay"
{
    Caption = 'Salary - Netpays';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Salary Netpays.rdlc';

    dataset
    {
        dataitem("Payroll Lines"; "Payroll Lines")
        {
            column(Personal_No_; "Personal No.")
            {
            }
            column(Employee_Name; "Employee Name")
            {
            }
            column(Netpay; Netpay)
            {
            }
            column(Gross_Pay; "Gross Pay")
            {
            }
            column(CompLogo; CompInfo.Picture)
            {
            }
            column(Payroll_Period; "Payroll Period")
            {
            }
            column(SNo;SNo)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "No." = field("Personal No.");

                column(EmpBankAccNo; "Bank Account Number")
                {
                }
                column(EmpBankCode; "Employee's Bank")
                {
                }
                column(EmpBankName; "Bank Name")
                {
                }
                column(EmpBranchCode; "Bank Branch")
                {
                }
                column(EmpBranchName; "Bank Branch Name")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                if SVNo = '' then
                    Error('The Payroll Header field is required')
                else
                    "Payroll Lines".SetRange("Payroll Header", SVNo);


                Employee.CalcFields("Bank Name", "Bank Branch Name");
            end;

            trigger OnAfterGetRecord()
            begin
                SNo += 1;
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
                    field(SVNo; SVNo)
                    {
                        Caption = 'No.';
                        NotBlank = true;
                        TableRelation = "Payroll Header";
                    }
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

    trigger OnPreReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        Emp: Record Employee;
        CompInfo: Record "Company Information";
        EmpBankName: Text;
        EmpBranchName: Text;
        EmpBankCode: Code[50];
        EmpBranchCode: Code[50];
        EmpBankAccNo: Code[50];
        SVNo: Code[20];
        SNo: Integer;
}
