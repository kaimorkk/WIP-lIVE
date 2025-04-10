
table 69681 "Pre-Screen Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            TableRelation = "Pre-Screen Template";
        }
        field(2; "Question Id"; Integer)
        {
        }
        field(3; Description; Text[400])
        {
        }
        field(4; "Question Type"; Option)
        {
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(5; "Close Ended Qn Type"; Code[30])
        {
            TableRelation = "Close Ended Qn Type";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Question Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

