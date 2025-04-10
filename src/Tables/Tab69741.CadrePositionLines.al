
table 69741 "Cadre Position Lines"
{

    fields
    {
        field(1; "Job ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID" /*where ("Cadre Type"=const("Common Cadre"))*/;
        }
        field(2; "Job Title"; Text[100])
        {
            CalcFormula = lookup("Company Positions"."Job Title" where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
        }
        field(6; "Cadre Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Job Grade ID"; Code[30])
        {
            CalcFormula = lookup("Company Positions"."Job Grade ID" where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
            TableRelation = "Salary Scales";
        }
        field(8; "Designation Group"; Code[30])
        {
            CalcFormula = lookup("Company Positions"."Designation Group" where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
            TableRelation = "Designation Groups";
        }
        field(12; Directorate; Code[30])
        {
            CalcFormula = lookup("Company Positions".Directorate where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                "Blocked?" = const(false));
        }
        field(13; Department; Code[30])
        {
            CalcFormula = lookup("Company Positions".Department where("Position ID" = field("Job ID")));
            FieldClass = FlowField;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                "Blocked?" = const(false));
        }
        field(14; "No of Active Employees"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Job ID", "Cadre Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Title")
        {
        }
    }
}

