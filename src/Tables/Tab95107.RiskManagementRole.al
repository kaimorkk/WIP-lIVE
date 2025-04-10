
table 95107 "Risk Management Role"
{
    DrillDownPageID = "Risk Management Roles";
    LookupPageID = "Risk Management Roles";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Description = '95107';
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Executive Summary"; Text[250])
        {
        }
        field(4; "Directly Reports To"; Code[50])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
        field(5; "Indirectly Reports To"; Code[50])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
        field(6; "No. of Def Responsibilities"; Integer)
        {
            CalcFormula = count("Risk Management Responsibility" where("Role ID" = field(Code)));
            Description = 'No. of Def Responsibilities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Blocked; Boolean)
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

