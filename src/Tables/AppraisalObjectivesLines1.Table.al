Table 52193943 "Appraisal Objectives Lines1"
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
        field(4;Objective;Text[120])
        {
            NotBlank = false;
        }
        field(5;"No.";Code[20])
        {
            NotBlank = false;
        }
        field(6;Measure;Text[250])
        {
        }
        field(7;"Agreed Target Date";Text[100])
        {
        }
        field(8;"Weighting(%)";Decimal)
        {

            trigger OnValidate()
            begin
                 TotalWeightings:=0;

                 Appraisalines.Reset;
                 Appraisalines.SetRange(Appraisalines."Appraisal No","Appraisal No");
                 Appraisalines.SetRange(Appraisalines."Appraisal Heading Type","Appraisal Heading Type");
                 if Appraisalines.Find('-') then
                 begin
                  repeat
                    TotalWeightings:=TotalWeightings + Appraisalines."Weighting(%)";
                  until Appraisalines.Next=0;
                 end;

                  if (TotalWeightings + "Weighting(%)")>100 then
                  Error('You are not allowed to enter Weightings(%) more than a total of 100 for %1',"Appraisal Heading Type");
            end;
        }
        field(9;"Review Comments/ Achievements";Text[250])
        {
        }
        field(10;"Performance Ratings(%)";Decimal)
        {
        }
        field(11;"Job ID";Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";
        }
        field(12;"Line No";Integer)
        {
            AutoIncrement = false;
        }
        field(13;"Appraiser's Comments";Text[150])
        {
        }
        field(14;"Appraisee's comments";Text[150])
        {
        }
        field(15;Description;Text[80])
        {
        }
        field(16;"Appraisal Heading Type";Option)
        {
            OptionCaption = ' ,Objectives,Core Values,Technical Competencies,Behavioural Competencies';
            OptionMembers = " ",Objectives,"Core Values","Technical Competencies","Behavioural Competencies";
        }
        field(17;"Appraisal Header";Text[50])
        {
            TableRelation = "Appraisal Format Header1";
        }
        field(18;Bold;Boolean)
        {
        }
        field(19;"Appraisal No";Code[20])
        {
        }
        field(20;"New No.";Integer)
        {
            AutoIncrement = false;
        }
        field(21;Dropped;Boolean)
        {
        }
        field(22;"Strategic Perspective";Option)
        {
            OptionCaption = 'Financial,Stakeholder,Internal Business Process,Learning and Growth';
            OptionMembers = Financial,Stakeholder,"Internal Business Process","Learning and Growth";
        }
        field(23;"Weighted Ratings(%)";Decimal)
        {
        }
        field(24;Approved;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Appraisal No","Line No")
        {
        }
        key(Key2;"Employee No","Appraisal Type","Line No")
        {
            Clustered = true;
        }
       
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //MESSAGE('%1',GetNextLine);
        "Line No":=GetNextLine;
    end;

    var
        Appraisalines: Record "Appraisal Objectives Lines1";
        TotalWeightings: Decimal;


    procedure GetNextLine() NxtLine: Integer
    var
        AppraisalLine: Record "Appraisal Objectives Lines1";
    begin
        AppraisalLine.Reset;
        AppraisalLine.SetRange(AppraisalLine."Appraisal No","Appraisal No");
        if AppraisalLine.Find('+') then
        NxtLine:=AppraisalLine."Line No"+1000;
    end;
}

