PageExtension 52193531 pageextension52193531 extends "Certificates of Supply" 
{
    layout
    {
        modify("Vehicle Registration No.")
        {
            Visible = false;
        }
        moveafter("Customer/Vendor Name";"Shipment Method")
    }
}

