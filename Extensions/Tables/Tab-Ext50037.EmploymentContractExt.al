tableextension 50037 "Employment Contract Ext" extends "Employment Contract"
{
    fields
    {
        field(50000; "Has Gratuity"; Boolean)
        {
            Caption = 'Has Gratuity';
            DataClassification = CustomerContent;
        }
        field(50001; "Has Pension"; Boolean)
        {
            Caption = 'Has Pension';
            DataClassification = CustomerContent;
        }

    }
}
