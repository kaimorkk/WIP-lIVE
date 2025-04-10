
table 80262 "Innovation Evaluation Goals"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
            TableRelation = "Innovation Evaluation Line"."Document No.";
        }
        field(2; "Invitation ID"; Code[30])
        {
            TableRelation = "Innovation Evaluation Line"."Invitation ID";
        }
        field(3; "Idea ID"; Code[30])
        {
            TableRelation = "Innovation Evaluation Line"."Idea ID";
        }
        field(4; "Record Type"; Option)
        {
            OptionMembers = Overview,Objective,"Additional Notes";
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Invitation ID", "Idea ID", "Record Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

