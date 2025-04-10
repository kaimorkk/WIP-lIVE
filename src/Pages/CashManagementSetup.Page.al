Page 52194382 "Cash Management Setup1"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Cash Management Setup1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Licensing Bank Code"; Rec."Licensing Bank Code")
                {
                    ToolTip = 'Specifies the value of the Licensing Bank Code field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
    }
}

