table 50096 "Appraisal Award Recomm"
{
    Caption = 'Award Recommendations';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Appraisal No"; Code[100])
        {
            Caption = 'Appraisal No';
        }
        field(2; "Entry No"; Integer)
        {
            Caption = 'Entry No';

        }
        field(3; "Award type"; Code[20])
        {
            Caption = 'Award type';
            TableRelation = "Appraisal Award Types";
            trigger OnValidate()
            var
                Awards: Record "Appraisal Award Types";
            begin
                if Awards.Get("Award type") then
                    "Awards Name" := Awards.Description;
            end;

        }
        field(4; Comment; Text[500])
        {
            Caption = 'Comment';
        }
        field(5; "Awards Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Appraisal No")
        {
            Clustered = true;
        }
    }
}
