table 50116 "Clearance Form Setup"
{
    Caption = 'Clearance Form Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(2; Section; Enum "Exit Sections")
        {
            Caption = 'Section';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
