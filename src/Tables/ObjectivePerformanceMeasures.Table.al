Table 52194019 "Objective Performance Measures"
{

    fields
    {
        field(1;MeasureID;Integer)
        {
        }
        field(2;ObjectiveID;Integer)
        {
        }
        field(3;"Measure Description";Text[100])
        {
        }
        field(4;Targets;Text[100])
        {
        }
        field(5;Initiatives;Text[100])
        {
        }
        field(6;"Review Comments";Text[100])
        {
        }
        field(7;"Weighting(%)";Decimal)
        {
        }
        field(8;"Performance Ratings";Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Weighting(%)");
                "Weighted Ratings":=("Performance Ratings"/100)*"Weighting(%)";
            end;
        }
        field(9;"Weighted Ratings";Decimal)
        {
        }
        field(10;"Appraisal No";Code[20])
        {
        }
        field(11;Approved;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;MeasureID,ObjectiveID,"Appraisal No")
        {
            Clustered = true;
            SumIndexFields = "Weighting(%)","Performance Ratings","Weighted Ratings";
        }
    }

    fieldgroups
    {
    }
}

