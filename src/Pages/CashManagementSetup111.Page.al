Page 52193700 "Cash Management Setup111"
{
    PageType = Card;
    SourceTable = CMSetup;

    layout
    {
        area(content)
        {
            group("Cash Management Setup")
            {
                field(PaymentVoucherTemplate;"Payment Voucher Template")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestTemplate;"Imprest Template")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestSurrenderTemplate;"Imprest Surrender Template")
                {
                    ApplicationArea = Basic;
                }
                field(PettyCashTemplate;"Petty Cash Template")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptTemplate;"Receipt Template")
                {
                    ApplicationArea = Basic;
                }
                field(PostVAT;"Post VAT")
                {
                    ApplicationArea = Basic;
                }
                field(RoundingType;"Rounding Type")
                {
                    ApplicationArea = Basic;
                }
                field(RoundingPrecision;"Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestLimit;"Imprest Limit")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestDueDate;"Imprest Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Posting Group")
            {
                field(ImprestPostingGroup;"Imprest Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(GeneralBusPostingGroup;"General Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(VATBusPostingGroup;"VAT Bus. Posting Group")
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

