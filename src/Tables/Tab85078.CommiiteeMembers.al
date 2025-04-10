
table 85078 "Commiitee Members"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Member Role"; Option)
        {
            OptionCaption = 'Chairperson,Member,Secretary';
            OptionMembers = Chairperson,Member,Secretary;
        }
        field(4; "Member Name"; Text[100])
        {
        }
        field(5; Email; Text[50])
        {
        }
        field(6; "Phone No."; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

