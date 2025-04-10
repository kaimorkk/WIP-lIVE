
table 69735 "Vacancy Declaration"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vacancy No."; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Declaration Statement"; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Vacancy No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

