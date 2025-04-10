
table 80234 "BR Template Line Branch Logic"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
        {
            TableRelation = "Business Research Template"."Template ID";
        }
        field(2; "Section ID"; Code[100])
        {
            TableRelation = "BR Template Section"."Section Code" where("Template ID" = field("Template ID"));
        }
        field(3; "Question ID"; Code[10])
        {
        }
        field(5; "Rating Type"; Option)
        {
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";

            trigger OnValidate()
            begin
                TestField("Rating Type", "rating type"::"Open Text");
            end;
        }
        field(6; "Option Text Response Type"; Code[50])
        {
            TableRelation = if ("Rating Type" = const("Options Text")) w.Code;

            trigger OnValidate()
            begin
                /*BRResponseCode.RESET;
                BRResponseCode.SETRANGE("Response Type","Option Text Response Type");
                IF BRResponseCode.FINDFIRST THEN BEGIN
                   REPEAT
                     MESSAGE('Testing');
                     BRTemplateScoreGuide.INIT;
                     BRTemplateScoreGuide."Template ID":="Template ID";
                     BRTemplateScoreGuide."Section ID":="Section ID";
                     BRTemplateScoreGuide."Question ID":="Question ID";
                     BRTemplateScoreGuide."Line No.":=LineNumber;
                     BRTemplateScoreGuide."Rating Type":="Rating Type";
                     BRTemplateScoreGuide."Response Value":=BRResponseCode."Response Code";
                     BRTemplateScoreGuide."Score %":=BRResponseCode."Score (%)";
                     BRTemplateScoreGuide.INSERT;
                   UNTIL BRResponseCode.NEXT=0;
                END;*/

            end;
        }
        field(7; "Response Value"; Code[30])
        {

            trigger OnValidate()
            begin
                /*IF "Rating Type"="Rating Type"::"Options Text" THEN BEGIN
                    IF NOT ("Response Value"='YES') OR ("Response Value"='NO') THEN BEGIN
                       ERROR('Allowed Response is YES/NO');
                    END;
                END;*/

            end;
        }
        field(8; "Next question ID"; Code[30])
        {
        }
        field(9; Question; Text[255])
        {
        }
        field(11; "Parent Question ID"; Code[10])
        {
            TableRelation = "BR Template Line"."Question ID" where("Template ID" = field("Template ID"),
                                                                    "Section ID" = field("Section ID"),
                                                                    "Question ID" = field("Parent Question ID"));
        }
        field(12; "Parent Response"; Code[50])
        {
            TableRelation = "BR Template Score Guide"."Response Value" where("Template ID" = field("Template ID"),
                                                                              "Section ID" = field("Section ID"),
                                                                              "Question ID" = field("Parent Question ID"));
        }
    }

    keys
    {
        key(Key1; "Template ID", "Section ID", "Question ID", "Parent Question ID", "Parent Response")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

