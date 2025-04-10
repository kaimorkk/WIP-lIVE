
table 80223 "BR Response Section"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Survey Response ID"; Code[30])
        {
        }
        field(2; "Section Code"; Code[30])
        {
        }
        field(3; Description; Code[50])
        {
        }
        field(4; "Section Completion Instruction"; Text[255])
        {
        }
        field(5; "No. of Questions"; Integer)
        {
        }
        field(6; "Total Weight %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Survey Response ID", "Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

