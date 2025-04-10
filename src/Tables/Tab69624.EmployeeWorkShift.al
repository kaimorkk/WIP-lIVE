
table 69624 "Employee Work Shift"
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
        field(3; "Minimum No of Hrs/Wk"; Integer)
        {
            CalcFormula = sum("Work Shift Time"."Minimum Work Hrs/Day" where("Workshift Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
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

