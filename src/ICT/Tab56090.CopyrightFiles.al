
table 56090 "Copyright Files"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; fileId; Integer)
        {
            AutoIncrement = true;
        }
        field(2; CopyrightNo; Code[10])
        {
            TableRelation = "Copyright Registration Table"."No.";
        }
        field(3; fileName; Text[50])
        {
        }
        field(4; dateUploaded; Date)
        {
        }
    }

    keys
    {
        key(Key1; fileId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

