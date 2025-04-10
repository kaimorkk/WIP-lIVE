
table 80112 "Policy Objective"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "No. of Policy Strategies"; Integer)
        {
            CalcFormula = count("Policy Objective Strategy" where("Policy ID" = field("Policy ID"),
                                                                   Code = field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

