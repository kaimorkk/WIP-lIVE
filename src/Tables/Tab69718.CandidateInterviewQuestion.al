
table 69718 "Candidate Interview Question"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Interview Scoresheet Template"; Code[30])
        {
        }
        field(3; "Question Category"; Code[30])
        {
            TableRelation = "Candidate Interview Qn Group"."Question Category";
        }
        field(4; "Question ID"; Code[30])
        {
            TableRelation = "Hr Screening Template Line"."Question Id" where("Template ID" = field("Interview Scoresheet Template"));
        }
        field(5; Description; Text[300])
        {
            Editable = false;
        }
        field(6; "Question Type"; Option)
        {
            OptionCaption = 'Open-Ended,Closed-Ended,Number';
            OptionMembers = "Open-Ended","Closed-Ended",Number;
        }
        field(7; "Close Ended Qn Subtype"; Code[50])
        {
        }
        field(8; Weight; Decimal)
        {
            Editable = false;
        }
        field(9; Rating; Code[30])
        {
        }
        field(10; "Evaluation Comments"; Text[500])
        {
        }
        field(11; "Maximum Raw Score"; Integer)
        {
        }
        field(12; "Weighted Score %"; Decimal)
        {
        }
        field(13; "Score Code"; Code[30])
        {
            TableRelation = "Screening Template Score Guide"."Option Code" where("Template ID" = field("Interview Scoresheet Template"),
                                                                                  "Question ID" = field("Question ID"));

            trigger OnValidate()
            begin
                ScoreGuide.Reset;
                ScoreGuide.SetRange("Option Code", "Score Code");
                ScoreGuide.SetRange("Question ID", "Question ID");
                ScoreGuide.SetRange("Template ID", "Interview Scoresheet Template");
                if ScoreGuide.FindFirst then begin
                    "Weighted Score %" := (ScoreGuide."Default Points" / 100) * Weight;
                end
            end;
        }

        field(14; "Interview Area"; Option)
        {
            OptionCaption = 'Technical Interview,Oral Interview';
            OptionMembers = "Technical Interview","Oral Interview";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Interview Scoresheet Template", "Question Category", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ScoreGuide: Record "Screening Template Score Guide";
}

