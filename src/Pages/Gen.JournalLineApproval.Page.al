Page 50101 "Gen. Journal Line Approval"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Gen. Journal Line Approval";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(JournalTemplateName;"Journal Template Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LineNo;"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType;"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(VAT;"VAT %")
                {
                    ApplicationArea = Basic;
                }
                field(BalAccountType;"Bal. Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(BalAccountNo;"Bal. Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(DebitAmount;"Debit Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CreditAmount;"Credit Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AmountLCY;"Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLCY;"Balance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyFactor;"Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field(SalesPurchLCY;"Sales/Purch. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(ProfitLCY;"Profit (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(InvDiscountLCY;"Inv. Discount (LCY)")
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

