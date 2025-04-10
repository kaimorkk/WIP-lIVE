
table 69617 "Terms of Service1"
{
    DrillDownPageID = "Terms of Service";
    LookupPageID = "Terms of Service";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,Probational Extension';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,"Probational Extension";
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Contract Term Period"; DateFormula)
        {
        }
        field(5; "Maximum No. of Terms"; Integer)
        {
        }
        field(6; "Maximum Employment Age (Years)"; Integer)
        {
        }
        field(7; "Linked to Projects"; Boolean)
        {
        }
        field(8; "Pension Benefit"; Boolean)
        {
        }
        field(9; "Service Gratuity Benefit"; Boolean)
        {
        }
        field(10; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Default Terms of Service" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Active Employees"; Integer)
        {
            // CalcFormula = count(Employee where("Current Terms of Service" = field(Code)));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(12; "Minumum Employment Age (Years)"; Integer)
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

