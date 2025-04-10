Page 52193742 "Micro Finance setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Micro Finance Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ReceiptsJournalTemplate;"Receipts Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentsJournalTemplate;"Payments Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field(LoanJournalTemplate;"Loan Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerPostingGroup;"Customer Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(MinGroupMembers;"Min Group Members")
                {
                    ApplicationArea = Basic;
                }
                field(MaxGroupMembers;"Max Group Members")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Numbering)
            {
                field(MfTransNos;"Mf-Trans Nos")
                {
                    ApplicationArea = Basic;
                }
                field(MicroFinanceLoanNos;"Micro Finance Loan Nos")
                {
                    ApplicationArea = Basic;
                }
                field(WithdrawalNo;"Withdrawal No.")
                {
                    ApplicationArea = Basic;
                }
                field(GroupApplicationNo;"Group Application No")
                {
                    ApplicationArea = Basic;
                }
                field(GroupNo;"Group No")
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

