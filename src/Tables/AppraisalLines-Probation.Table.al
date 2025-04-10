Table 52194025 "Appraisal Lines-Probation"
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
            OptionCaption = ' ,Self Assessment,Qualifications and Training,Perfomance Evaluation(Self),Perfomance Evaluation(Appraiser),Appraiser''s Comments,Appraisee''s Comments,Committee Recommendations';
            OptionMembers = " ","Self Assessment","Qualifications and Training","Perfomance Evaluation(Self)","Perfomance Evaluation(Appraiser)","Appraiser's Comments","Appraisee's Comments","Committee Recommendations";

            trigger OnValidate()
            begin
                 if "Appraisal Heading Type"="appraisal heading type"::"Appraiser's Comments" then
                    "Appraisal Type":='Mid Year'
                 else if "Appraisal Heading Type"="appraisal heading type"::"Appraisee's Comments" then
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
                //TESTFIELD("Weighting(%)");
                //"Weighted Ratings(%)":=("Performance Ratings(%)"/100)*"Weighting(%)";
                if "Performance Ratings(%)"<=4.0 then begin
                 "Score Category(Self)":="score category(self)"::Unsatisfactory;
                 "Score Category(Appraiser)":="score category(appraiser)"::UNSATISFACTORY;
                end else if ("Performance Ratings(%)">4.0) and ("Performance Ratings(%)"<=5.0) then begin
                 "Score Category(Self)":="score category(self)"::"Needs Improvement";
                 "Score Category(Appraiser)":="score category(appraiser)"::"BELOW AVERAGE";
                end else if ("Performance Ratings(%)">5.0) and ("Performance Ratings(%)"<=6.5) then begin
                 "Score Category(Self)":="score category(self)"::Good;
                 "Score Category(Appraiser)":="score category(appraiser)"::AVERAGE;
                end else if ("Performance Ratings(%)">6.5) and ("Performance Ratings(%)"<=8.0) then begin
                 "Score Category(Self)":="score category(self)"::"Very Good";
                 "Score Category(Appraiser)":="score category(appraiser)"::"ABOVE AVERAGE";
                end else if ("Performance Ratings(%)">8.0) and ("Performance Ratings(%)"<=10.0) then begin
                 "Score Category(Self)":="score category(self)"::Excellent;
                 "Score Category(Appraiser)":="score category(appraiser)"::OUTSTANDING;
                end;
            end;
        }
        field(24;"Weighted Ratings(%)";Decimal)
        {
        }
        field(25;"Appraisal Year";Code[20])
        {
        }
        field(26;Selection;Option)
        {
            OptionCaption = 'Yes,No';
            OptionMembers = Yes,No;
        }
        field(27;"Score Category(Self)";Option)
        {
            OptionCaption = ' ,Excellent,Very Good,Good,Needs Improvement,Unsatisfactory';
            OptionMembers = " ",Excellent,"Very Good",Good,"Needs Improvement",Unsatisfactory;
        }
        field(28;"Score Category(Appraiser)";Option)
        {
            OptionCaption = ' ,OUTSTANDING,ABOVE AVERAGE,AVERAGE,BELOW AVERAGE,UNSATISFACTORY';
            OptionMembers = " ",OUTSTANDING,"ABOVE AVERAGE","AVERAGE","BELOW AVERAGE",UNSATISFACTORY;
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

