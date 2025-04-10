tableextension 50007 "VAT Product Posting Group" extends "VAT Product Posting Group"
{
    fields
    {
        field(50000; "Witholding Tax"; Boolean)
        {
            Caption = 'Witholding Tax';
            DataClassification = ToBeClassified;
        }
        field(50001; Rate; Code[10])
        {
            Caption = 'Rate';
            DataClassification = ToBeClassified;
        }
    }
}
