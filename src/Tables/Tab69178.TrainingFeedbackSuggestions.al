
table 69178 "Training Feedback Suggestions"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Training Application No"; Code[30])
        {
        }
        field(3; Comments; Text[250])
        {
        }
        field(4; "Training Category"; Code[30])
        {
            TableRelation = "Rating Category Setup".Code;
            trigger OnValidate()
            var
                RatingS: Record "Rating Category Setup";
            begin
                if RatingS.Get("Training Category") then begin
                    "Category Description" := RatingS.Description;
                end;
            end;
        }
        field(5; "Category Description"; Text[100])
        {

        }
        field(6; "Facilitator Punctuality"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));

            // trigger OnValidate()
            // begin
            //     CategoryRatingScale.Reset;
            //     //CategoryRatingScale.SETRANGE("Category Code",CategoryRatingScale."Category Code");
            //     CategoryRatingScale.SetRange("Rating Code",Rating);
            //     if CategoryRatingScale.FindSet then begin
            //       "Rating Description":=CategoryRatingScale."Category Description";
            //       end;
            // end;
        }
        field(8; "Session Name"; Text[200])
        {
        }
        field(9; Facilitator; Text[100])
        {
        }
        field(10; MyField; Blob)
        {
        }
        field(11; "Facilitator Rating"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(12; "Training Userfullness"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(13; "Training Time Allocation"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(14; "Training Materials"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(15; Interactivity; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(16; "Presentation Quality"; Code[30])
        {
            TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
        }
        field(17; "Training Code"; Code[20])
        {
        }
        field(18; Objective; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CategoryRatingScale: Record "Category Rating Scale";
}

