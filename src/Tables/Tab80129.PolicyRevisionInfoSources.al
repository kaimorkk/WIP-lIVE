
table 80129 "Policy Revision Info Sources"
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
        field(6; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Line No.", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

