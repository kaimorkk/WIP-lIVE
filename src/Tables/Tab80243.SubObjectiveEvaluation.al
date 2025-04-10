
table 80243 "Sub Objective Evaluation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Evaluation ID"; Code[100])
        {
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Scorecard ID"; Code[50])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"));
        }
        field(4; "Scorecard Line No"; Integer)
        {
        }
        field(5; "Objective/Initiative"; Text[500])
        {
        }
        field(6; "Outcome Perfomance Indicator"; Code[100])
        {
            TableRelation = "Performance Indicator";

            trigger OnValidate()
            begin
                if PerformanceIndicator.Get("Outcome Perfomance Indicator") then begin
                    //"Unit of Measure":=PerformanceIndicator."Unit of Measure";
                end;
            end;
        }
        field(7; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(8; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9; "Performance Rating Scale"; Code[100])
        {
            TableRelation = "Perfomance Rating Scale".Code;

            trigger OnValidate()
            begin
                /*PerfomanceRatingScale.RESET;
                PerfomanceRatingScale.SETRANGE(Code,"Performance Rating Scale");
                IF PerfomanceRatingScale.FIND('-') THEN BEGIN
                  "Scale Type":=PerfomanceRatingScale."Scale Type";
                END;*/

            end;
        }
        field(10; "Scale Type"; Option)
        {
            OptionCaption = 'Excellent-Poor(5-1),Excellent-Poor(1-5)';
            OptionMembers = "Excellent-Poor(5-1)","Excellent-Poor(1-5)";
        }
        field(11; "Target Qty"; Decimal)
        {
        }
        field(12; "Self-Review Qty"; Decimal)
        {
        }
        field(13; "AppraiserReview Qty"; Decimal)
        {
        }
        field(14; "Final/Actual Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                /*PerformanceRatingRawScore:=0;
                
                VALIDATE("Performance Rating Scale");
                IF ("Desired Perfomance Direction"="Desired Perfomance Direction"::"Increasing KPI") THEN BEGIN
                   IF "Scale Type"="Scale Type"::"Excellent-Poor(5-1)" THEN BEGIN
                      "Raw Performance Score":=(((((2*"Target Qty")-"Final/Actual Qty")/(2*"Target Qty"))*-4)+5);
                   END;
                   IF "Scale Type"="Scale Type"::"Excellent-Poor(1-5)" THEN BEGIN
                      "Raw Performance Score":= (((((2*"Target Qty")-"Final/Actual Qty")/(2*"Target Qty"))*4)+1);
                   END;
                END;
                
                IF ("Desired Perfomance Direction"="Desired Perfomance Direction"::"Decreasing KPI") THEN BEGIN
                   IF "Scale Type"="Scale Type"::"Excellent-Poor(5-1)" THEN BEGIN
                      "Raw Performance Score":=((5+(-4*("Final/Actual Qty"/(2*"Target Qty")))));
                   END;
                   IF "Scale Type"="Scale Type"::"Excellent-Poor(1-5)" THEN BEGIN
                     "Raw Performance Score":=((1+(4*("Final/Actual Qty"/(2*"Target Qty")))));
                   END;
                END;
                
                
                PerformanceRatingRawScore:="Raw Performance Score";
                
                IF (PerformanceRatingRawScore<0) THEN
                    PerformanceRatingRawScore:=0;
                
                IF (PerformanceRatingRawScore>5) THEN
                   PerformanceRatingRawScore:=5;
                
                PerfomanceScaleLine.RESET;
                PerfomanceScaleLine.SETRANGE("Performance Scale ID","Performance Rating Scale");
                IF PerfomanceScaleLine.FIND('-') THEN BEGIN
                   REPEAT
                    IF  ((PerformanceRatingRawScore>=PerfomanceScaleLine."Lower Limit Criteria Value") AND
                       (PerformanceRatingRawScore<=PerfomanceScaleLine."Upper Limit Criteria Value")) THEN BEGIN
                         "Raw Performance Grade":=PerfomanceScaleLine."Perfomance Grade";
                         //MESSAGE('Raw Performance Grade %1',"Raw Performance Grade");
                
                    END;
                   UNTIL PerfomanceScaleLine.NEXT=0;
                END;
                
                VALIDATE("Weight %");
                */

            end;
        }
        field(15; "Raw Performance Score"; Decimal)
        {
        }
        field(16; "Weight %"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Final Weighted Line Score":=("Weight %"/100)*"Raw Performance Score";
            end;
        }
        field(17; "Final Weighted Line Score"; Decimal)
        {
        }
        field(18; "Intiative No"; Code[100])
        {
        }
        field(19; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(20; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(21; "Raw Performance Grade"; Code[50])
        {
        }
        field(22; "Key Performance Indicator"; Text[250])
        {
        }
        field(23; Comments; Text[250])
        {
        }
        field(24; "Sub Intiative No"; Code[30])
        {
        }
        field(25; "Sub Intiative Description"; Code[300])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Evaluation ID", "Line No", "Scorecard ID", "Sub Intiative No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        PerfomanceRatingScale: Record "Perfomance Rating Scale";
        PerfomanceScaleLine: Record "Perfomance Scale Line";
        PerformanceRatingRawScore: Decimal;
}

