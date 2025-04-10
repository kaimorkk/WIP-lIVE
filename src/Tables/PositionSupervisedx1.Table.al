Table 52193885 "Position Supervisedx1"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";

            trigger OnValidate()
            begin
                //IF Jobs.GET("Job ID") THEN
                //Description:=Jobs."Job Description";
            end;
        }
        field(2;"Position Supervised";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1"."Job ID";

            trigger OnValidate()
            begin
                Jobs.Reset;
                if Jobs.Get("Position Supervised") then
                Description:=Jobs."Job Description";
            end;
        }
        field(3;Description;Text[250])
        {
        }
        field(4;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Job ID","Position Supervised")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Jobs: Record "Company Jobs1";
}

