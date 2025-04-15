table 50015 "Execution Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; Period; Code[20])
        {
        }
        field(3; Activity; Text[100])
        {
        }
        field(4; Duration; DateFormula)
        {
        }
        field(5; Output; Text[150])
        {
        }
        field(6; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting));
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

