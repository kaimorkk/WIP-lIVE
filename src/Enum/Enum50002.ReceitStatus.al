enum 50009 ReceiptStatus
{
    Extensible = true;

    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }
    value(2; "Pending Prepayment")
    {
        Caption = 'Pending Prepayment';
    }
    value(3; Released)
    {
        Caption = 'Released';
    }
    value(6; Closed)
    {
        Caption = 'Closed';
    }
}