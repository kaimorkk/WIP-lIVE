
table 80080 "Objective Evaluation Result"
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
        field(5; "Objective/Initiative"; Text[255])
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
                PerfomanceRatingScale.Reset;
                PerfomanceRatingScale.SetRange(Code, "Performance Rating Scale");
                if PerfomanceRatingScale.Find('-') then begin
                    "Scale Type" := PerfomanceRatingScale."Scale Type";
                end;
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
                PerformanceRatingRawScore := 0;

                Validate("Performance Rating Scale");
                if "Target Qty" > 0 then begin
                    if ("Desired Perfomance Direction" = "desired perfomance direction"::"Increasing KPI") then begin
                        if "Scale Type" = "scale type"::"Excellent-Poor(5-1)" then begin
                            "Raw Performance Score" := (((((2 * "Target Qty") - "Final/Actual Qty") / (2 * "Target Qty")) * -4) + 5);
                        end;
                        if "Scale Type" = "scale type"::"Excellent-Poor(1-5)" then begin
                            "Raw Performance Score" := (((((2 * "Target Qty") - "Final/Actual Qty") / (2 * "Target Qty")) * 4) + 1);
                        end;
                    end;

                    if ("Desired Perfomance Direction" = "desired perfomance direction"::"Decreasing KPI") then begin
                        if "Scale Type" = "scale type"::"Excellent-Poor(5-1)" then begin
                            "Raw Performance Score" := ((5 + (-4 * ("Final/Actual Qty" / (2 * "Target Qty")))));
                        end;
                        if "Scale Type" = "scale type"::"Excellent-Poor(1-5)" then begin
                            "Raw Performance Score" := ((1 + (4 * ("Final/Actual Qty" / (2 * "Target Qty")))));
                        end;
                    end;
                end;

                PerformanceRatingRawScore := "Raw Performance Score";

                if (PerformanceRatingRawScore < 0) then
                    PerformanceRatingRawScore := 0;

                if (PerformanceRatingRawScore > 5) then
                    PerformanceRatingRawScore := 5;

                PerfomanceScaleLine.Reset;
                PerfomanceScaleLine.SetRange("Performance Scale ID", "Performance Rating Scale");
                if PerfomanceScaleLine.Find('-') then begin
                    repeat
                        if ((PerformanceRatingRawScore >= PerfomanceScaleLine."Lower Limit Criteria Value") and
                           (PerformanceRatingRawScore <= PerfomanceScaleLine."Upper Limit Criteria Value")) then begin
                            "Raw Performance Grade" := PerfomanceScaleLine."Perfomance Grade";

                        end;
                    until PerfomanceScaleLine.Next = 0;
                end;

                Validate("Weight %");
            end;
        }
        field(15; "Raw Performance Score"; Decimal)
        {
        }
        field(16; "Weight %"; Decimal)
        {

            trigger OnValidate()
            begin
                "Final Weighted Line Score" := ("Weight %" / 100) * "Raw Performance Score";
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
        field(22; Remarks; Text[100])
        {
        }
        field(23; Recommendation; Text[100])
        {
        }
        field(24; "2nd Supervisor Review Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                    PerfomanceEvaluation."Validate If 2nd Supervisor"();
                if "2nd Supervisor Review Qty" > 5 then
                    Error('Score should not be above what is set up in Competency Proficiency Scale');
            end;
        }
        field(25; "2nd Supervisor Remarks"; Text[100])
        {
            trigger OnValidate()
            begin
                if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                    PerfomanceEvaluation."Validate If 2nd Supervisor"();
            end;
        }
        field(26; "2nd Supervisor Recommendation"; Text[100])
        {
            trigger OnValidate()
            begin
                if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                    PerfomanceEvaluation."Validate If 2nd Supervisor"();
            end;
        }
    }

    keys
    {
        key(Key1; "Performance Evaluation ID", "Line No", "Scorecard ID")
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
        PerfomanceEvaluation: Record "Perfomance Evaluation";
}

