Page 50027 "Fleet Consumables List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Consumable Card";
    PageType = Card;
    SourceTable = "Fleet Consumables";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ItemNo;"Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Consumable Description';
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
            }
        }
    }

    actions
    {
    }
}

