
table 69612 "Recruitment Reason Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "No. of Vacancies"; Integer)
        {
            CalcFormula = count(Vacancy where("Primary Recruitment Reason" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

