
table 69717 "Candidate Interview Qn Group"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Interview Scoresheet Template"; Code[30])
        {
        }
        field(3; "Question Category"; Code[30])
        {
        }
        field(4; Description; Text[300])
        {
        }
        field(5; "Total Weight"; Decimal)
        {
            CalcFormula = sum("Candidate Interview Question".Weight where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(6; "No. of Questions"; Integer)
        {
            CalcFormula = count("Candidate Interview Question" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Interview Scoresheet Template", "Question Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

