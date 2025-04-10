
table 69699 "Ability Test"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Test ID"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Maximum Duration(Min)"; Integer)
        {
        }
        field(4; "No. of Questions"; Integer)
        {
            CalcFormula = count("Ability Test Question" where("Test ID" = field("Test ID")));
            FieldClass = FlowField;
        }
        field(5; "Created By"; Code[30])
        {
        }
        field(6; "Created On"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Test ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

