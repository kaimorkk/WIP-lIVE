Page 52193745 "Class Codes"
{
    PageType = List;
    SourceTable = "Class Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ClassCode;"Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(ClassName;"Class Name")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalFee;"Withdrawal Fee")
                {
                    ApplicationArea = Basic;
                }
                field(OverdraftInterest;"Overdraft Interest")
                {
                    ApplicationArea = Basic;
                }
                field(LoanInterestRate;"Loan Interest Rate")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryCharge;"Salary Charge")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeBookRequisitionFee;"Cheque Book Requisition Fee")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000011;Notes)
            {
            }
            systempart(Control1000000010;MyNotes)
            {
            }
            systempart(Control1000000009;Links)
            {
            }
        }
    }

    actions
    {
    }
}

