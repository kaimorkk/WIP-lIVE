table 50145 "Strategy Output"
{
    Caption = 'Strategy Output';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Strategy ID"; Code[50])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Strategy Output Code"; Code[20])
        {
        }
        field(5; Outputs; Text[100])
        {
        }
        field(6; "Output Indicators"; Text[100])
        {
        }

    }
    keys
    {
        key(PK; "Strategic Plan ID", "Strategy ID", "Line No.", "Strategy Output Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Strategy Output Code", Outputs, "Output Indicators") { }
    }
}
