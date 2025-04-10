
table 80256 "Innovation Scoresheet"
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
        field(4; "Innovation Rating Template ID"; Code[30])
        {
            TableRelation = "Innovation Evaluation Line"."Innovation Rating Template ID";
        }
        field(5; "Line No."; Integer)
        {
        }
        field(6; Category; Code[50])
        {
            TableRelation = "Innovation Category".Code;
        }
        field(7; Description; Text[255])
        {
        }
        field(8; "Weighted Score %"; Decimal)
        {
        }
        field(9; "Evaluation Result"; Option)
        {
            OptionCaption = 'POOR,FAIR,GOOD,VERY GOOD,EXCELLENT';
            OptionMembers = POOR,FAIR,GOOD,"VERY GOOD",EXCELLENT;
        }
    }

    keys
    {
        key(Key1; "Document No", "Invitation ID", "Idea ID", "Innovation Rating Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

