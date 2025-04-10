
table 69179 "Rating Category Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Feedback,Evaluation';
            OptionMembers = Feedback,Evaluation;
        }
        field(4; "Rating Category"; Option)
        {
            OptionCaption = 'Supervisor,Self';
            OptionMembers = Supervisor,Self;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description)
        {
        }
    }
}

