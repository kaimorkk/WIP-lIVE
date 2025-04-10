table 50766 "Adoption Leave Setup"
{
    Caption = 'Adoption Leave Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Min Age"; Decimal)
        {
            Caption = 'Min Age';
        }
        field(3; "Max Age"; Decimal)
        {
            Caption = 'Max Age';
        }
        field(4; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
        }
        field(5; Days; Integer)
        {
            Caption = 'Days';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
