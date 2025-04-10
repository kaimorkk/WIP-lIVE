
table 80228 "PC Perspective"
{
    DrillDownPageID = "Strategy Framework Perspective";
    LookupPageID = "Strategy Framework Perspective";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Document No"; Code[100])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "No of Activities"; Integer)
        {
            CalcFormula = count("PC Objective" where("Framework Perspective" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Total Weight"; Decimal)
        {
            CalcFormula = sum("PC Objective"."Assigned Weight (%)" where("Framework Perspective" = field(Code)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code", "Document No")
        {
            Clustered = true;
        }
        key(Key2; "Document No")
        {
        }
    }

    fieldgroups
    {
    }
}

