Table 52193766 "Job Recruitment stages1"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobsx1";
        }
        field(2;"Recruitment Stage";Integer)
        {
            NotBlank = true;
            TableRelation = "Recruitment Stages1";

            trigger OnValidate()
            begin
                   if RecruitStage.Get("Recruitment Stage") then
                   Description:=RecruitStage.Description;
            end;
        }
        field(3;Description;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"Job ID","Recruitment Stage")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RecruitStage: Record "Recruitment Stages1";
}

