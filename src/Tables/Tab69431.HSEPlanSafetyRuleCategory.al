
table 69431 "HSE Plan Safety Rule Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
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
        key(Key1; "Plan ID", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

