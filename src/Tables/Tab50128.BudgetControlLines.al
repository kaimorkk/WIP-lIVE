table 50128 "Budget Control Lines"
{
    Caption = 'Budget Control Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Header No"; Code[20])
        {
            Caption = 'Header No';
        }
        field(2; "Line No"; Code[20])
        {
            Caption = 'Line No';
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Current Budget"; Decimal)
        {
            Caption = 'Current Budget';
        }
        field(5; "Current Balance"; Decimal)
        {
            Caption = 'Current Balance';
        }
        field(6; "Cut Percentage"; Decimal)
        {
            Caption = 'Cut Percentage';
            trigger OnValidate()
            begin
                "New Budget Balance" := Round("Current Budget" - ("Current Budget" * "Cut Percentage" / 100), 1);
                "Quarter After Cut" := Round("Quarter budget" - ("Quarter budget" * "Cut Percentage" / 100), 1);
            end;
        }
        field(7; "Quarter budget"; Decimal)
        {
            Caption = 'Qtr budget';
        }
        field(8; "Quarter Access Percent"; Decimal)
        {
            Caption = 'Qtr Access Percent';
            trigger OnValidate()
            begin
                "Quarter Access Amount" := Round("New Budget Balance" * "Quarter Access Percent" / 100, 1);
            end;
        }
        field(9; "New Budget Balance"; Decimal)
        {
            Caption = 'New Budget Balance';
        }
        field(10; "Quarter Access Amount"; Decimal)
        {
            Caption = 'Qtr Access Amount';
        }
        field(11; "Quarter After Cut"; Decimal)
        {
            Caption = 'Qtr Amount After Cut';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Header No", "Line No")
        {
            Clustered = true;
        }
    }
}
