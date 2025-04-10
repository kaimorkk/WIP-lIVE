
table 69414 "OSH Rule Template Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
            TableRelation = "OSH Rule Template"."Template ID";
        }
        field(2; "Category Code"; Code[20])
        {
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "No. of Rules & Regulations"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

