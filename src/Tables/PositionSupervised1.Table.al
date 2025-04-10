Table 52193770 "Position Supervised1"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobsx1"."Job ID";
        }
        field(2;"Position Supervised";Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobsx1"."Job ID";

            trigger OnValidate()
            begin
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
        Jobs: Record "Company Jobsx1";
}

