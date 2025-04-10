table 50135 "Supplementary Lines"
{
    Caption = 'Supplementary Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Line No"; Code[20])
        {
            Caption = 'Line No';
        }
        field(3; "Approved Amount"; Decimal)
        {
            Caption = 'Approved Amount';
        }
        field(4; "Adjustment Percentage"; Decimal)
        {
            Caption = 'Adjustment Factor';

            trigger OnValidate()
            begin
                if ("Adjustment Percentage" < 0) then
                    Error('Adjustment factor cannot be less than 0');
                "New Supplementary Ceiling" := "Approved Amount" * "Adjustment Percentage";
            end;
        }
        field(5; "New Supplementary Ceiling"; Decimal)
        {
            Caption = 'New Supplementary Ceiling';
            trigger OnValidate()
            begin
                if ("New Supplementary Ceiling" < 0) then
                    Error('New Supplementary Ceiling cannot be less than 0');
                "Adjustment Percentage" := "New Supplementary Ceiling" / "Approved Amount";
            end;
        }
        field(6; "Applies To All"; Boolean)
        {
            Caption = 'Applies To All';
        }
        field(7; Name; Text[100])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; No, "Line No")
        {
            Clustered = true;
        }
    }
}
