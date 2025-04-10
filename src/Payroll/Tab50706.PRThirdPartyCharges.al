table 52194106 "PR Third Party Charges"
{
    Caption = 'PR Third Party Charges';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Code[50])
        {
            Caption = 'Name';
        }

        field(3; "Charge Per Transaction"; Decimal)
        {
            BlankZero = true;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
