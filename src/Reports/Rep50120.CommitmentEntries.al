report 50120 "Commitment Entries"
{
    ApplicationArea = All;
    Caption = 'Commitment Entries';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/commitmentsEntries.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(ExpenseReq; "Expense Req. Allocation")
        {
            RequestFilterFields = "Global Dimension 1 Code";

            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(Rate_ExpenseReq; Rate)
            {
            }
            column(Total_ExpenseReq; Total)
            {
            }

            column(ExpenseDescription_ExpenseReq; "Expense Description")
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(GlobalDimension1Code_ExpenseReq; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ExpenseReq; "Global Dimension 2 Code")
            {
            }

            column(EmployeeName_ExpenseReq; "Employee Name")
            {
            }
            column(ActivityId_ExpenseReq; "Activity Id")
            {
            }
            column(BudgetCode_ExpenseReq; "Budget Code")
            {
            }
            column(DocumentNo_ExpenseReq; "Document No.")
            {
            }
            column(EmployeeNo_ExpenseReq; "Employee No.")
            {
            }
            column(EmployeeType_ExpenseReq; "Employee Type")
            {
            }
            column(GLAccount_ExpenseReq; "G/L Account")
            {
            }
            column(Destination_ExpenseReq; Destination)
            {
            }
            column(Quantity_ExpenseReq; Quantity)
            {
            }
            column(Supplier_ExpenseReq; Supplier)
            {
            }
            column(Status_ExpenseReq; Status)
            {
            }
            column(Type_ExpenseReq; "Type")
            {
            }

            column(Payee_ExpenseReq; Payee)
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(ShortcutDimension6Code; "Shortcut Dimension 6 Code")
            {
            }
            column(ShortcutDimension7Code; "Shortcut Dimension 7 Code")
            {
            }
            column(ShortcutDimension8Code; "Shortcut Dimension 8 Code")
            {
            }
            dataitem(CommitmentEntries; "Commitment Entries")
            {
                DataItemLink = "EXR No." = field("Document No.");
                RequestFilterFields = "Commitment Date";


                column(CommitmentType_CommitmentEntries; "Commitment Type")
                {
                }
                column(CommitmentDate_CommitmentEntries; "Commitment Date")
                {
                }
                column(Description_CommitmentEntries; Description)
                {
                }
            }

        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;




    var
        CompanyInfo: Record "Company Information";


}
