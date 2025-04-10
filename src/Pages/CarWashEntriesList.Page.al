Page 52193438 "Car Wash Entries List"
{
    ApplicationArea = Basic;
    CardPageID = "Car Wash Card";
    PageType = Card;
    SourceTable = "Car Wash";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ItemNo; "Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; "Consumable Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(ServiceProvider; "Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName; "Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceNo; "Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceLSOLPONo; "Service LSO/LPO No.")
                {
                    ApplicationArea = Basic;
                }
                field(ItemClassCode; "Item Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
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

