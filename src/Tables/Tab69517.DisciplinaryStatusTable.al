
table 69517 "Disciplinary Status Table"
{
    DrillDownPageID = "Disciplinary Status";
    LookupPageID = "Disciplinary Status";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Disciplinary Status"; Code[30])
        {
        }
        field(2; "Deduction Code"; Code[30])
        {
            // TableRelation = DeductionsX.Code;
        }
        field(3; "Deductions Based On"; Code[30])
        {
        }
        field(4; "Computation Method"; Option)
        {
            OptionCaption = 'Percentage,Flat Amount,Formula';
            OptionMembers = Percentage,"Flat Amount",Formula;
        }
        field(5; Percentage; Decimal)
        {
        }
        field(6; Formula; Text[200])
        {
        }
        field(7; Amount; Decimal)
        {
        }
        field(8; Description; Text[250])
        {
        }
        field(9; "Duration(Days)"; DateFormula)
        {
        }
        field(10; Type; Option)
        {
            OptionCaption = ',Employee,Payroll';
            OptionMembers = ,Employee,Payroll;
        }

    }

    keys
    {
        key(Key1; "Disciplinary Status")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

