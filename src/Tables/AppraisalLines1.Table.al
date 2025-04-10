Table 52193934 "Appraisal Lines1"
{

    fields
    {
        field(1;"Employee No";Code[20])
        {
            TableRelation = Employee;
        }
        field(2;"Appraisal Category";Code[20])
        {
        }
        field(3;"Appraisal Period";Code[20])
        {
        }
        field(4;Objective;Text[120])
        {
            NotBlank = true;
        }
        field(5;"No.";Code[20])
        {
            NotBlank = true;
        }
        field(6;Measure;Text[250])
        {
        }
        field(7;"Agreed Target Date";Text[100])
        {
        }
        field(8;Weighting;Integer)
        {
        }
        field(9;"Review Comments/ Achievements";Text[250])
        {
        }
        field(10;"Weighting(%)";Decimal)
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
            OptionCaption = ' ,Objectives,Core Values,Technical Competencies,Behavioural Competencies,Mid-year Appraisal,Annual Appraisal,Training Needs';
            OptionMembers = " ",Objectives,"Core Values","Technical Competencies","Behavioural Competencies","Mid-year Appraisal","Annual Appraisal","Training Needs";

            trigger OnValidate()
            begin
                 if "Appraisal Heading Type"="appraisal heading type"::"Mid-year Appraisal" then
                    "Appraisal Type":='Mid Year'
                 else if "Appraisal Heading Type"="appraisal heading type"::"Annual Appraisal" then
                     "Appraisal Type":='Annual';
            end;
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
            AutoIncrement = true;
        }
        field(21;"Appraisal Type";Text[30])
        {
        }
        field(22;"Strategic Perspective";Option)
        {
            OptionCaption = 'Financial,Stakeholder,Internal Business Process,Learning and Growth';
            OptionMembers = Financial,Stakeholder,"Internal Business Process","Learning and Growth";
        }
        field(23;"Performance Ratings(%)";Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Weighting(%)");
                "Weighted Ratings(%)":=("Performance Ratings(%)"/100)*"Weighting(%)";
            end;
        }
        field(24;"Weighted Ratings(%)";Decimal)
        {
        }
        field(25;"Appraisal Year";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Appraisal No","Line No")
        {
        }
        key(Key2;"Employee No","Appraisal Category","Appraisal Period","Line No")
        {
            Clustered = true;
        }
        key(Key3;"No.")
        {
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
        Appraisalines: Record "Appraisal Lines1";


    procedure GetNextLine() NxtLine: Integer
    var
        AppraisalLine: Record "Appraisal Lines1";
    begin
        AppraisalLine.Reset;
        AppraisalLine.SetRange(AppraisalLine."Appraisal No","Appraisal No");
        if AppraisalLine.Find('+') then
        NxtLine:=AppraisalLine."Line No"+1;
    end;
}

