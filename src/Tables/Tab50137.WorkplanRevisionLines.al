table 50137 "Workplan Revision Lines"
{
    Caption = 'Workplan Revision Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Workplan No"; Code[20])
        {
            Caption = 'Workplan No';
        }
        field(3; "Budget Item"; Code[20])
        {
            Caption = 'Budget Item';
        }
        field(4; "Approved Amount"; Decimal)
        {
            Caption = 'Approved Amount';
        }
        field(5; "Supplementary Ceiling"; Decimal)
        {
            Caption = 'Supplementary Ceiling';
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; No, "Workplan No", "Budget Item")
        {
            Clustered = true;
        }
    }
}
