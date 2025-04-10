
table 70208 "Tender Opening Summary Note"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Register ID"; Code[20])
        {
            TableRelation = "Bid Opening Register".Code;
        }
        field(2; "Agenda Code"; Code[50])
        {
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Item Discussed"; Code[50])
        {
        }
        field(5; "Summary Notes"; Text[250])
        {
        }
        field(6; "Referenced Section of Tender"; Text[250])
        {
            Caption = 'Referenced Section of Tender Document';
            Description = 'Referenced Section of Tender Document';
        }
        field(7; "Referenced Clause of Tender"; Text[100])
        {
            Caption = 'Referenced Clause of Tender Document';
            Description = 'Referenced Clause of Tender Document';
        }
        field(8; "Board Meeting"; Boolean)
        {
        }
        field(9; "E-board Agenda"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Register ID", "Agenda Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

