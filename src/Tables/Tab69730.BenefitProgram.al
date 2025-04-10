
table 69730 "Benefit Program"
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
        field(3; "Benefit Category"; Option)
        {
            OptionCaption = 'Other Incentives,Social Security,Health Care,Retirement Plans,Insurance Plans,Mortgage,Other Staff Loans,Staff Housing,Staff Leave,Learning and Skill Development,Recreational';
            OptionMembers = "Other Incentives","Social Security","Health Care","Retirement Plans","Insurance Plans",Mortgage,"Other Staff Loans","Staff Housing","Staff Leave","Learning and Skill Development",Recreational;
        }
        field(4; "No. of Benefit Packages"; Integer)
        {
            CalcFormula = count("Benefit Package" where("Benefit Program ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "No. of Benefit Plans"; Integer)
        {
            CalcFormula = count("Benefit Package");
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

