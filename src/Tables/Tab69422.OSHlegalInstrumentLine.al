
table 69422 "OSH legal Instrument Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Legal Instrument ID"; Code[20])
        {
            TableRelation = "OSH Legal Instrument".Code;
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Legal Instrument ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

