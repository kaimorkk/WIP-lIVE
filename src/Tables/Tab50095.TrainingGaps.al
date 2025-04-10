table 50095 "Training Gaps"
{
    Caption = 'Training Gaps';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Appraisal No"; Code[100])
        {
            Caption = 'Appraisal No';
        }
        field(2; "Course ID"; Code[20])
        {
            Caption = 'Course ID';
            TableRelation = "Training Courses Setup".Code;
            trigger OnValidate()
            var
                Course: Record "Training Courses Setup";
            begin
                if Course.Get("Course ID") then
                    "Course Name" := Course.Descritpion;
            end;
        }
        field(3; "Course Name"; Text[100])
        {
            Caption = 'Course Name';
        }
        field(4; Comment; Text[250])
        {
            Caption = 'Comment';
        }
    }
    keys
    {
        key(PK; "Appraisal No", "Course ID")
        {
            Clustered = true;
        }
    }
}
