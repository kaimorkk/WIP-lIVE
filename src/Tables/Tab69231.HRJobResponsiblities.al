
table 69231 "HR Job Responsiblities"
{
    // DrillDownPageID = UnknownPage55564;
    //  LookupPageID = UnknownPage55564;

    fields
    {
        field(2; "Job ID"; Code[50])
        {
            TableRelation = "ManPower Planning Lines"."Entry No";
        }
        field(3; "Responsibility Description"; Text[250])
        {
        }
        field(4; Remarks; Text[150])
        {
        }
        field(5; "Responsibility Code"; Code[20])
        {

            trigger OnValidate()
            begin
                HRAppEvalArea.Reset;
                HRAppEvalArea.SetRange(HRAppEvalArea."Assign To", "Responsibility Code");
                if HRAppEvalArea.Find('-') then begin
                    "Responsibility Description" := HRAppEvalArea.Code;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Job ID", "Responsibility Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRAppEvalArea: Record "HR Appraisal Eval Areas";
}

