Page 52194389 "Car Wash Card"
{
    PageType = Card;
    SourceTable = "Car Wash";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ItemNo;"Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;"Consumable Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(ServiceProvider;"Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName;"Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceNo;"Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceLSOLPONo;"Service LSO/LPO No.")
                {
                    ApplicationArea = Basic;
                }
                field(ItemClassCode;"Item Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
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

