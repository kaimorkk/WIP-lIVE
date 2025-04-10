Page 52193601 "Micro fin trans Subform"
{
    PageType = List;
    SourceTable = "Micro Fin Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccountNumber;"Account Number")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(GroupCode;"Group Code")
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo;"Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(PenaltyAmount;"Penalty Amount")
                {
                    ApplicationArea = Basic;
                }
                field(InterestAmount;"Interest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipleAmount;"Principle Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedPrincipleAmount;"Expected Principle Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedPenaltyCharge;"Expected Penalty Charge")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedInterest;"Expected Interest")
                {
                    ApplicationArea = Basic;
                }
                field(Savings;Savings)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

