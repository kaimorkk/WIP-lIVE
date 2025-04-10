Table 52193622 "Terms of Service"
{
    DrillDownPageID = "Terms of Service Listx";
    LookupPageID = "Terms of Service Listx";

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; Terms; Text[100])
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Member No"; Code[30])
        {
            //TableRelation = "Member Applications"."No.";
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
            CalcFormula = count("Company Positions" where("Default Terms of Service" = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Active Employees"; Integer)
        {
            // CalcFormula = count(Employee where("Current Terms of Service" = field(No)));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(12; "Minumum Employment Age (Years)"; Integer)
        {
        }
        field(13; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,Probational Extension';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,"Probational Extension";
        }
        field(14; "Contract Term Period"; DateFormula)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; No, Terms, Description)
        {
        }
    }
}

