
table 70196 "Prequalification Score Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Evaluation Voucher ID"; Code[30])
        {
            TableRelation = "Prequalification Score Header".Code;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Rating Template ID"; Code[50])
        {
            TableRelation = "Bid Scoring Template".Code where("Template type" = const("Prequalification Scoring"));
        }
        field(4; "Template Type"; Option)
        {
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review,Prequalification Scoring,EOI Scoring';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review","Prequalification Scoring","EOI Scoring";
        }
        field(5; "Criteria Group"; Code[50])
        {
            TableRelation = "Supplier Rating Requirement"."Criteria Group";
        }
        field(6; "Checklist ID"; Integer)
        {
            TableRelation = "Supplier Rating Requirement"."Checklist ID";
        }
        field(7; "Evaluation Requirement"; Text[250])
        {
        }
        field(8; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text';
            OptionMembers = Number,"Yes/No","Options Text";
        }
        field(9; "Response Value"; Code[60])
        {
            TableRelation = "Bid Score Guide"."Response Value" where("Criteria Group ID" = field("Criteria Group"),
                                                                      "Requirement ID" = field("Checklist ID"));

            trigger OnValidate()
            begin
                Bidscore.Reset;
                Bidscore.SetRange("Template ID", "Rating Template ID");
                Bidscore.SetRange("Requirement ID", "Checklist ID");
                Bidscore.SetRange("Response Value", "Response Value");
                if Bidscore.FindSet then begin
                    "Score %" := Bidscore."Score %";
                    Validate("Score %");

                end;
            end;
        }
        field(10; "Bid Response Actual Qty"; Decimal)
        {

            trigger OnValidate()
            begin
                BidevaluationScoreGuide.Reset;
                BidevaluationScoreGuide.SetRange("Template ID", "Rating Template ID");
                BidevaluationScoreGuide.SetRange("Criteria Group ID", "Criteria Group");
                BidevaluationScoreGuide.SetRange("Requirement ID", "Checklist ID");
                if BidevaluationScoreGuide.FindSet then begin
                    repeat
                        if ("Bid Response Actual Qty" >= BidevaluationScoreGuide."Min Bid Value") and ("Bid Response Actual Qty" <= BidevaluationScoreGuide."Max Bid Value") then begin
                            "Score %" := BidevaluationScoreGuide."Score %";
                            //MESSAGE(

                            Validate("Score %");
                        end;
                    until BidevaluationScoreGuide.Next = 0;
                end;
            end;
        }
        field(11; "Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Score %" > 0 then begin
                    "Weighted Line Score" := "Score %" / 100 * "Assigned Weight %";
                    "Evaluation Results" := "evaluation results"::Pass
                end else begin
                    "Weighted Line Score" := 0;
                    "Evaluation Results" := "evaluation results"::Fail
                end;
            end;
        }
        field(12; "Assigned Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(13; "Weighted Line Score"; Decimal)
        {
        }
        field(14; "Target Qty"; Decimal)
        {
        }
        field(15; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(16; "Target Value"; Decimal)
        {
        }
        field(21; "Evaluation Results"; Option)
        {
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
    }

    keys
    {
        key(Key1; "Evaluation Voucher ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Bidscore: Record "Bid Score Guide";
        BidevaluationScoreGuide: Record "Bid Evaluation Score Guide";
}

