
table 69420 "Inspection Template Line"
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
            TableRelation = "Inspection Template"."Template ID";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Category Code"; Code[20])
        {
            TableRelation = "Inspection Template Category"."Category Code";
        }
        field(6; "Requirement Type"; Option)
        {
            OptionMembers = " ",Mandatory,Optional;
        }
        field(7; "Response Type"; Code[20])
        {
            TableRelation = "Inspection Response Type".Code;
        }
    }

    keys
    {
        key(Key1; "Inspection Type", "Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

