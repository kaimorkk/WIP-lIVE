table 50115 "Academic Grades"

{
    Caption = 'Academic Grades';
    DataClassification = ToBeClassified;
    LookUpPageId = "Academic Grades";
    DrillDownPageId = "Academic Grades";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Grade';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
