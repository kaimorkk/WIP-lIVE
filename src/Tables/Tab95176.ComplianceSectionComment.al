
table 95176 "Compliance Section Comment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Framework ID"; Code[20])
        {
        }
        field(2; "Section Type"; Option)
        {
            OptionCaption = ' ,Overview,Implication,Guiding Principle';
            OptionMembers = " ",Overview,Implication,"Guiding Principle";
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Comment No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Framework ID", "Section Type", "Line No.", "Comment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

