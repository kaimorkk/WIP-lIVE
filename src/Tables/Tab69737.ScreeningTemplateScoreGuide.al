
table 69737 "Screening Template Score Guide"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template Type"; Option)
        {
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Template ID"; Code[30])
        {
        }
        field(3; "Question Category"; Code[30])
        {
        }
        field(4; "Question ID"; Code[30])
        {
        }
        field(5; "Default Rating Scale"; Code[30])
        {
        }
        field(6; "Option Code"; Code[30])
        {
            TableRelation = "Closed Qn Response Option"."Option Code";

            trigger OnValidate()
            begin
                ClosedQnResponseOption.Reset;
                ClosedQnResponseOption.SetRange("Option Code", "Option Code");
                if ClosedQnResponseOption.FindFirst then begin
                    Description := ClosedQnResponseOption.Description;
                    "Default Points" := ClosedQnResponseOption."Default Points";
                end
            end;
        }
        field(7; Description; Text[300])
        {
        }
        field(8; "Default Points"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Template Type", "Template ID", "Question Category", "Question ID", "Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ClosedQnResponseOption: Record "Closed Qn Response Option";
}

