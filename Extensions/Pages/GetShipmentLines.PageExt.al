PageExtension 52193588 pageextension52193588 extends "Get Shipment Lines" 
{
    Caption = 'Get Shipment Lines';
    actions
    {
        modify("&Line")
        {
            Caption = '&Line';
        }
        modify("Show Document")
        {
            Caption = 'Show Document';
        }
        modify(Dimensions)
        {
            Caption = 'Dimensions';
        }
        modify("Item &Tracking Entries")
        {
            Caption = 'Item &Tracking Entries';
        }
    }
}

