
table 80219 "BR Survey Question"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Survey ID"; Code[50])
        {
        }
        field(2; "Section Code"; Code[50])
        {
            TableRelation = "BR Survey Section"."Section Code";
        }
        field(3; "Question ID"; Code[50])
        {
        }
        field(4; Question; Text[255])
        {
        }
        field(5; "Rating Type"; Option)
        {
            OptionCaption = 'Close Ended,Open Ended';
            OptionMembers = "Options Text","Open Text";
        }
        field(6; "Option Text Response Type"; Code[30])
        {
            TableRelation = w.Code;

            trigger OnValidate()
            begin
                BRResponseCode.Reset;
                BRResponseCode.SetRange("Response Type", "Option Text Response Type");
                if BRResponseCode.FindFirst then begin
                    repeat
                        BRTemplateScoreGuide.Init;
                        BRTemplateScoreGuide."Survey ID" := "Survey ID";
                        BRTemplateScoreGuide."Section Code" := "Section Code";
                        BRTemplateScoreGuide."Question ID" := "Question ID";
                        BRTemplateScoreGuide."Line No." := LineNumber;
                        BRTemplateScoreGuide."Rating Type" := "Rating Type";
                        BRTemplateScoreGuide."Response Value" := BRResponseCode."Response Code";
                        BRTemplateScoreGuide."Score %" := BRResponseCode."Score (%)";
                        BRTemplateScoreGuide.Insert;
                    until BRResponseCode.Next = 0;
                end;
            end;
        }
        field(7; "Assigned Weight %"; Decimal)
        {
        }
        field(8; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9; "Branch Logic Question"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Rating Type", "rating type"::"Options Text");
                TestField("Response Type", "response type"::"Single Response");
            end;
        }
        field(10; "No. of Branch Logic Conditions"; Integer)
        {
        }
        field(11; "Parent Question ID"; Code[10])
        {
        }
        field(12; "Question Type"; Option)
        {
            OptionCaption = ' ,Qualitative,Quantitative';
            OptionMembers = " ",Qualitative,Quantitative;
        }
        field(13; "Response Type"; Option)
        {
            OptionCaption = ' ,Single Response,Multiple Response';
            OptionMembers = " ","Single Response","Multiple Response";
        }
        field(14; Mandatory; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Survey ID", "Section Code", "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BRResponseCode: Record "BR Response Code";
        BRTemplateScoreGuide: Record "BR Survey Score Guide";
        LineNumber: Integer;
}

