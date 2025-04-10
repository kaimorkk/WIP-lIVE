
table 69180 "Category Rating Scale"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Category Code"; Code[30])
        {
            TableRelation = "Rating Category Setup";
        }
        field(3; "Category Description"; Text[50])
        {
            CalcFormula = lookup("Rating Category Setup".Description where(Code = field("Category Code")));
            FieldClass = FlowField;
        }
        field(4; "Rating Code"; Code[30])
        {
            TableRelation = "Rating Scale Setup";

            trigger OnValidate()
            begin
                RatingScaleSetup.Reset;
                RatingScaleSetup.SetRange(Code, "Rating Code");
                if RatingScaleSetup.FindSet then begin
                    "Rating Description" := RatingScaleSetup."Rating Scale";
                end
            end;
        }
        field(5; "Rating Description"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Rating Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Category Description", "Rating Description")
        {
        }
    }

    var
        RatingScaleSetup: Record "Rating Scale Setup";
}

