
table 69724 "Referee Recommendation Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Referee Recommendation";
        }
        field(2; "Reference Category"; Option)
        {
            OptionCaption = 'General Remarks,Roles & Responsibilities,Strengths & Achievements,Weaknesses & Lowlights';
            OptionMembers = "General Remarks","Roles & Responsibilities","Strengths & Achievements","Weaknesses & Lowlights";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Reference Category", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

