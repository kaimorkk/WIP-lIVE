
table 69185 "Training Needs Requests"
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
            TableRelation = "Training Courses Setup".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code, "Course ID");
                if TrainingCoursesSetup.FindSet then begin

                    Description := TrainingCoursesSetup.Descritpion;
                end;
            end;
        }
        field(8; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Job Title"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Duty Station"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Financial Year"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(14; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Header No.")
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

