
table 69404 "Evacuation Event Procedure"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Evacuation Event ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

