
table 69635 "Committee Composition"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Minimum No. of Members"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Committee Type ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

