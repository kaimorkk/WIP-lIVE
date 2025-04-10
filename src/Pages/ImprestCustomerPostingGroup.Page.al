Page 52194386 "Imprest Customer Posting Group"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Imprest Customer Posting Gruop";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Imprest Customer Posting Group")
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
        area(factboxes)
        {
            systempart(Control1000000006;Notes)
            {
            }
            systempart(Control1000000007;MyNotes)
            {
            }
            systempart(Control1000000008;Links)
            {
            }
        }
    }

    actions
    {
    }
}

