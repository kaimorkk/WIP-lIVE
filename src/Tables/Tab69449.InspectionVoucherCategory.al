
table 69449 "Inspection Voucher Category"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Inspection Type"; Option)
        {
            OptionMembers = " ","OSH Inspection","Project Supervision";
        }
        field(2; "Template ID"; Code[20])
        {
            TableRelation = "Inspection Voucher"."Drill ID";
        }
        field(3; "Category Code"; Code[20])
        {
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "No. of Compliance Requirements"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Inspection Type", "Template ID", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

