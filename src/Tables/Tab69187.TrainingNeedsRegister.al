
table 69187 "Training Needs Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Source; Option)
        {
            OptionCaption = 'Appraisal,Government Directive,Other,Career Development';
            OptionMembers = Appraisal,"Government Directive",Other,"Career Development";
        }
        field(4; Comments; Text[200])
        {
        }
        field(5; "No. of Linked Objectives"; Integer)
        {
        }
        field(6; "Training Header No."; Code[30])
        {
        }
        field(7; "Course ID"; Code[10])
        {
            TableRelation = "Training Courses Setup".Code;

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code, "Course ID");
                if TrainingCoursesSetup.FindSet then begin

                    Description := TrainingCoursesSetup.Descritpion;
                end;
            end;
        }
        field(8; "Training Plan No"; Code[20])
        {
        }
        field(9; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(10; "Employee Name"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Plan No", "Course ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TrainingCoursesSetup: Record "Training Courses Setup";
}

