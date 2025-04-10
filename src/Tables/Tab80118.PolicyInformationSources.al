
table 80118 "Policy Information Sources"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Source Type"; Option)
        {
            OptionCaption = ' ,Intranet,Organization Website,Other Website,3rd Party Sources';
            OptionMembers = " ",Intranet,"Organization Website","Other Website","3rd Party Sources";
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "URL Link"; Code[255])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

