
table 69186 "Training Evaluations"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Training Evaluation No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Training Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rating Category Setup".Code where(Type = filter(Evaluation),
                                                                "Rating Category" = field(Type));

            trigger OnValidate()
            begin
                if RatingCategorySetup.Get("Training Category") then begin
                    "Category Description" := RatingCategorySetup.Description;
                end
            end;
        }
        field(5; "Category Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Rating Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Category Rating Scale"."Rating Code" where("Category Code" = field("Training Category"));
            TableRelation = "Rating Scale Setup";
            trigger OnValidate()
            var
                Scale: Record "Rating Scale Setup";
            begin
                if Scale.Get("Rating Code") then
                    "Rating Description" := Scale."Rating Scale";
                // CategoryRatingScale.Reset;
                // CategoryRatingScale.SetRange("Category Code", "Training Category");
                // CategoryRatingScale.SetRange("Rating Code", "Rating Code");
                // if CategoryRatingScale.FindFirst then begin
                //     "Rating Description" := CategoryRatingScale."Rating Description";
                // end
            end;
        }
        field(7; "Rating Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Supervisor,Self';
            OptionMembers = Supervisor,Self;
        }
    }

    keys
    {
        key(Key1; "Training Evaluation No", "Training Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RatingCategorySetup: Record "Rating Category Setup";
        CategoryRatingScale: Record "Category Rating Scale";
}

