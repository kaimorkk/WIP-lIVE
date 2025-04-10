
table 80096 "PIP Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(2; "Due Date Calculation"; DateFormula)
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Performance Rating Scale"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

