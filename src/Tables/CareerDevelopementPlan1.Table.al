Table 52193924 "Career Developement Plan1"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then
                    "Job ID" := Employee.Position;
            end;
        }
        field(2; "Appraisal Type"; Code[20])
        {
            ////TableRelation = Table69144.Field1;
        }
        field(3; "Appraisal Period"; Code[20])
        {
            NotBlank = true;
            ////TableRelation = Table69145.Field1;
        }
        field(4; "Job ID"; Code[20])
        {
            // //TableRelation = Table69105.Field1;
        }
        field(5; Type; Option)
        {
            OptionMembers = "Major Strenghts","Areas for Development","Training Needs","On Job Activities","Job Rotation";
        }
        field(6; Description; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const("Major Strenghts")) "Job Requirementx1"."Qualification Code" where("Qualification Type" = const(Experience),
                                                                                                               "Qualification Type" = const("Personal Attributes"),
                                                                                                               "Job Id" = field("Job ID"))
            else if (Type = const("Areas for Development")) "Job Requirementx1"."Qualification Code" where("Job Id" = field("Job ID"))
            else if (Type = const("Training Needs")) "Training Needs1".Code;

            trigger OnValidate()
            begin
                if Type = Type::"Training Needs" then begin
                    TrainingReq.Init;
                    TrainingReq."Employee No" := xRec."Employee No";
                    TrainingReq."Course Title" := Description;
                    TrainingReq.Validate(TrainingReq."Course Title");
                    TrainingReq."Need Source" := TrainingReq."need source"::Appraisal;
                    TrainingReq.Insert(true);
                end;
            end;
        }
        field(7; Remarks; Text[250])
        {
        }
        field(8; "Remarks Appraisee"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Appraisal Type", "Appraisal Period", "Job ID", Type, Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        TrainingReq: Record "Training Request1";
}

