
table 69692 "Apptitude Qn Marking Scheme"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Question ID"; Code[30])
        {
            TableRelation = "Apptitude Question";
        }
        field(2; "Correct Choice ID"; Code[30])
        {
            TableRelation = "Apptitude Question Choice";
        }
        field(3; Explanation; Blob)
        {
        }
    }

    keys
    {
        key(Key1; "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

