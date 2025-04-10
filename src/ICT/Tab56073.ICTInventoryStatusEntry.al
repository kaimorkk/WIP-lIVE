
table 56073 "ICT Inventory Status Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "ICT Inventory No"; Code[50])
        {
            TableRelation = "ICT Inventory".Code;
        }
        field(2; Status; Code[50])
        {
        }
        field(3; "Conducted By"; Code[50])
        {
        }
        field(4; Date; Date)
        {
        }
        field(5; Time; Time)
        {
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Final Year"; Code[30])
        {
        }
        field(8; Remarks; Text[1000])
        {
        }
        field(9; Current; Boolean)
        {
        }
        field(10; Closed; Boolean)
        {
        }
        field(11; "Closed On"; DateTime)
        {
        }
        field(12; "Closed By"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "ICT Inventory No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

