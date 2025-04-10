table 50050 Reasons
{
    Caption = 'Reasons';
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
            Autoincrement = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
