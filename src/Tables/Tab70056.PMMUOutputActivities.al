table 70056 "PMMU Output Activities"
{
    Caption = 'PMMU Output Activities';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(4; "Strategy Output Code"; Code[20])
        {
        }
        field(5; Activities; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Entry"; Integer)
        {
        }
        field(7; "Sub Weights"; Decimal)
        {
        }
        field(8; "Achieved Targets"; Decimal)
        {
        }
    }
    keys
    {
        key(PK; "Contract No.", "Entry No.", "Strategy Plan ID", "Strategy Output Code", Entry)
        {
            Clustered = true;
        }
    }
}
