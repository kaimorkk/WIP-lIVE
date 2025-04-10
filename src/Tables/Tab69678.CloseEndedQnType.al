
table 69678 "Close Ended Qn Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Type ID"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "No. of Default Responses"; Integer)
        {
            CalcFormula = count("Closed Qn Response Option" where("Type ID" = field("Type ID")));
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

