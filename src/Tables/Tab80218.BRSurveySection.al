
table 80218 "BR Survey Section"
{

    fields
    {
        field(1; "Survey ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Business Research Survey"."Document No.";
        }
        field(2; "Section Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Template Section"."Section Code";
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Section Completion Instruction"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Questions"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Question Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Qualitative,Quantitative';
            OptionMembers = " ",Qualitative,Quantitative;
        }
        field(13; "Response Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single Response,Multiple Response';
            OptionMembers = " ","Single Response","Multiple Response";
        }
    }

    keys
    {
        key(Key1; "Survey ID", "Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

