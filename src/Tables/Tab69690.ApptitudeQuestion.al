
table 69690 "Apptitude Question"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Question ID"; Code[30])
        {
        }
        field(2; Question; Text[2048])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Document Type"; Option)
        {
            OptionCaption = 'Apptitude,Training Needs Request';
            OptionMembers = Apptitude,"Training Needs Request";
        }
    }

    keys
    {
        key(Key1; "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

