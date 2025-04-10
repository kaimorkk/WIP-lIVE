table 50100 "Integration logs"
{
    Caption = 'Integration logs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(3; "Status Message"; Text[2048])
        {
            Caption = 'Status Message';
        }
        field(4; Fetched; Boolean)
        {
            Caption = 'Fetched';
        }
        field(5; Success; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; PRN; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Source; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers =" ",CTS,Paylogs;
        }
        field(8; Replay; Boolean)
        {
            DataClassification = ToBeClassified;
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
