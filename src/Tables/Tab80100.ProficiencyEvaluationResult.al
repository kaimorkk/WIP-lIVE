
table 80100 "Proficiency Evaluation Result"
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
        field(3; "Competency Template ID"; Code[100])
        {
        }
        field(4; "Competency Code"; Code[30])
        {

            trigger OnValidate()
            begin
                if Competency.Get("Competency Code") then begin
                    "Competency Description" := Competency.Description;
                end;
            end;
        }
        field(5; Description; Text[255])
        {
        }
        field(6; "Outcome Perfomance Indicator"; Code[100])
        {
            TableRelation = "Performance Indicator".KPI;

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
        field(8; "Desired Proficiency Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9; "Profiency Rating Scale"; Code[100])
        {
            TableRelation = "Perfomance Rating Scale".Code;
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

            trigger OnValidate()
            begin
                if "Self-Review Qty" > 5 then
                    Error('Score should not be above what is set up in Competency Proficiency Scale');
            end;
        }
        field(13; "AppraiserReview Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                if "AppraiserReview Qty" > 5 then
                    Error('Score should not be above what is set up in Competency Proficiency Scale');
                "Final/Actual Qty" := "AppraiserReview Qty";
                Validate("Final/Actual Qty");
            end;
        }
        field(14; "Final/Actual Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Self-Review Qty" > 5 then
                    Error('Score should not be above what is set up in Competency Proficiency Scale');

                "Raw Profiency Score" := "Final/Actual Qty";
            end;
        }
        field(15; "Raw Profiency Score"; Decimal)
        {
        }
        field(16; "Weight %"; Decimal)
        {
        }
        field(17; "Final Weighted Line Score"; Decimal)
        {
        }
        field(18; "Intiative No"; Code[100])
        {
        }
        field(19; "Competency Description"; Text[100])
        {
        }
        field(20; "Competency Category"; Option)
        {
            OptionCaption = 'Core/Required,Desired/Added Advantage';
            OptionMembers = "Core/Required","Desired/Added Advantage";
        }
        field(21; Remarks; Text[100])
        {
        }
        field(22; Recommendation; Text[100])
        {
        }
        field(23; "2nd Supervisor Review Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                // if "2nd Supervisor Review Qty" > 5 then
                //     Error('Score should not be above what is set up in Competency Proficiency Scale');
                // if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                //     PerfomanceEvaluation."Validate If 2nd Supervisor"();
            end;
        }
        field(24; "2nd Supervisor Remarks"; Text[100])
        {
            trigger OnValidate()
            begin
                //if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                // PerfomanceEvaluation."Validate If 2nd Supervisor"();
            end;
        }
        field(25; "2nd Supervisor Recommendation"; Text[100])
        {
            trigger OnValidate()
            begin
                // if PerfomanceEvaluation.Get("Performance Evaluation ID") then
                //     PerfomanceEvaluation."Validate If 2nd Supervisor"();
            end;
        }
    }

    keys
    {
        key(Key1; "Performance Evaluation ID", "Line No", "Competency Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        Competency: Record Competency;
        PerfomanceEvaluation: Record "Perfomance Evaluation";
}

