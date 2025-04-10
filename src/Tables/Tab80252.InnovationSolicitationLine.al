
table 80252 "Innovation Solicitation Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Innovation Invitation,Idea Response';
            OptionMembers = "Innovation Invitation","Idea Response";
        }
        field(2; "Document No"; Code[30])
        {
            TableRelation = "Innovation Solicitation"."Document No" where("Document Type" = field("Document Type"));
        }
        field(3; "Record Type"; Option)
        {
            OptionMembers = Overview,Objective,"Additional Notes";
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Record Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

