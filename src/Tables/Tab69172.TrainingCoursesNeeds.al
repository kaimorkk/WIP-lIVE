
table 69172 "Training Courses Needs"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Editable = true;
        }
        field(2; "Course Code"; Code[30])
        {
            TableRelation = "Training Courses Setup";
        }
        field(3; "Course Description"; Text[100])
        {
            CalcFormula = lookup("Training Courses Setup".Descritpion where(Code = field("Course Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Training Need Code"; Code[30])
        {
            TableRelation = "Training Needs Lines";
        }
        field(5; "Training Need Description"; Text[100])
        {
            CalcFormula = lookup("Training Needs Lines".Description where(Code = field("Training Need Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Course Code")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Clustered = true;
        //     Enabled = false;
        // }
        // key(Key3;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    var
        mcontent: label 'Status must be new on Training Application No.';
        mcontent2: label '. Please cancel the approval request and try again';
        TrainingNeedsLines: Record "Training Needs Lines";
        TrainingCoursesSetup: Record "Training Courses Setup";
}

