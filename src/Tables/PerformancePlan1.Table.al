Table 52193923 "Performance Plan1"
{

    fields
    {
        field(1;"Employee No";Code[20])
        {
            TableRelation = Employee;
        }
        field(2;"Appraisal Type";Code[20])
        {
        }
        field(3;"Appraisal Period";Code[20])
        {
        }
        field(4;"Key Responsibility";Text[120])
        {
            NotBlank = true;
            TableRelation = "Job Responsiblities1".Responsibility where ("Job ID"=field("Job ID"));
        }
        field(5;"No.";Code[20])
        {
            NotBlank = true;
        }
        field(6;"Key Indicators";Text[250])
        {
        }
        field(7;"Agreed Target Date";Text[100])
        {
        }
        field(8;Weighting;Integer)
        {
        }
        field(9;"Results Achieved Comments";Text[250])
        {
        }
        field(10;"Score/Points";Decimal)
        {
        }
        field(11;"Job ID";Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";
        }
    }

    keys
    {
        key(Key1;"Employee No","Appraisal Type","Appraisal Period","Key Responsibility","No.","Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

