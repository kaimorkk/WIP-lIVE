
table 80248 "Innovation Template Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            TableRelation = "Innovation Rating Template"."Template ID";
        }
        field(2; Category; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "No. of Checklists"; Integer)
        {
        }
        field(5; "Total Weighted Score %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", Category)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

