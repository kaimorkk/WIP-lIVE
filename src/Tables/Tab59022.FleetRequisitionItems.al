
table 59022 "Fleet Requisition Items"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Ticket No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Requisition Number"; Code[30])
        {
        }
        field(3; "Item Type"; Code[30])
        {
            TableRelation = "Item Category".Code;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; Quantity; Decimal)
        {
        }
        field(6; Purpose; Text[200])
        {
        }
        field(7; Returnable; Boolean)
        {
        }
        field(8; "Item Return Date"; Date)
        {
        }
        field(9; "Serial Number"; Code[20])
        {
        }
        field(10; "Remarks/Comments"; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Ticket No", "Requisition Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

