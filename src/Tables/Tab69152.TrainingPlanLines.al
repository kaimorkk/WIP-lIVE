
table 69152 "Training Plan Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Task No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Training Plan Code"; Code[30])
        {
            TableRelation = "Training Plan Header";
        }
        field(3; "Course Title"; Code[30])
        {
            TableRelation = "Training Courses Setup".Code;
            trigger OnValidate()

            begin

                TrainingCoursesSetup.Get("Course Title");
                Reason := TrainingCoursesSetup."Skill Description";
                "Course Duration" := format(TrainingCoursesSetup."Course Duration");
                //insert objectives from the needs that each course addresses
                //loop training needs
                TrainingCoursesNeeds.Reset;
                TrainingCoursesNeeds.SetRange("Course Code", Rec."Course Title");
                if TrainingCoursesNeeds.FindSet then begin
                    repeat
                        TrainingLinesObjectives.Reset;
                        TrainingLinesObjectives.SetRange(Code, TrainingCoursesNeeds."Training Need Code");
                        if TrainingLinesObjectives.FindSet then begin
                            repeat

                                //insert the objectives
                                TrainingLinesObjectives1.Reset;
                                if TrainingLinesObjectives1.FindLast then begin
                                    EntryNo := TrainingLinesObjectives1."Entry No";
                                end;

                                TrainingLinesObjectives1.Init;
                                TrainingLinesObjectives1."Entry No" := EntryNo + 1;
                                TrainingLinesObjectives1.Code := Format(Rec."Task No");
                                TrainingLinesObjectives1.Type := TrainingLinesObjectives1.Type::Plan;
                                TrainingLinesObjectives1."Objective Id" := TrainingLinesObjectives."Objective Id";
                                TrainingLinesObjectives1.Objective := TrainingLinesObjectives.Objective;
                                TrainingLinesObjectives1.Insert;

                            until TrainingLinesObjectives.Next = 0;
                        end;
                    until TrainingCoursesNeeds.Next = 0;
                end
            end;
        }
        field(4; "Planned No. of Staff"; Integer)
        {
            CalcFormula = count("Training Plan Staff Lines" where("Training Plan Code" = field("Training Plan Code"),
                                "Task No" = field("Task No"),
                                "Year Code" = field("Year Code"),
                              "Course Title" = field("Course Title")));
            FieldClass = FlowField;
        }
        field(5; "Course Description"; Text[100])
        {
            CalcFormula = lookup("Training Courses Setup".Descritpion where(Code = field("Course Title")));
            FieldClass = FlowField;
        }
        field(6; "Target Group"; Text[50])
        {
            CalcFormula = lookup("Resource Group".Name where("No." = field("Target Group Code")));
            FieldClass = FlowField;
        }
        field(7; "Field"; Text[50])
        {
            TableRelation = "Training Needs Lines";
        }
        field(8; "Professional Association"; Text[50])
        {
        }
        field(9; Global; Boolean)
        {
        }
        field(10; "Target Group Code"; Code[30])
        {
            TableRelation = "Resource Group";
        }
        field(11; "Estimated Cost"; Decimal)
        {
            // CalcFormula = sum("Planning Line Entry"."Planned Budget" where("Course ID" = field("Course Title"),
            //                                                                 "Training Plan Id" = field("Training Plan Code")));
            // FieldClass = FlowField;
        }
        field(12; "Actual No. of Staff"; Integer)
        {
        }
        field(13; "Actual Spent"; Decimal)
        {
            trigger OnValidate()
            begin
                "Estimated Cost" := "Actual Spent" * "Planned No. of Staff";
            end;
        }
        field(22; "Course Duration"; Text[50])
        {
        }
        field(24; "Proposed Course Provider"; Text[200])
        {
            TableRelation = Vendor /*where(Trainer = filter(true))*/;

            trigger OnValidate()
            begin
                KPAreas.Reset;
                //KPAreas.SETRANGE(KPAreas."Employee No","Employee No");
                //KPAreas.SETRANGE(KPAreas.Period,Period);
                KPAreas.SetRange(KPAreas."No.", "Proposed Course Provider");
                if KPAreas.Find('-') then
                    "Proposed Course Provider Name" := KPAreas.Name
            end;
        }
        field(25; "Proposed Course Provider Name"; Text[200])
        {
        }
        field(26; Reason; Text[50])
        {
        }
        field(27; JSTC; Text[250])
        {
        }
        field(28; CRJ; Text[250])
        {
        }
        field(29; Remark; Text[250])
        {
        }
        field(30; "Start Date"; Date)
        {
        }
        field(31; "End Date"; Date)
        {
        }
        field(32; "Job Grade"; Code[50])
        {
            TableRelation = "Salary Scales";
            ValidateTableRelation = false;
        }
        field(33; Status; Option)
        {
            OptionMembers = Approved,Rejected;
            OptionCaption = 'Approved,Rejected';
            Editable = false;
        }
        field(34; "Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "No. of Submitted Requests"; Integer)
        {
            CalcFormula = count("Training Needs Requests" where("Course ID" = field("Course Title"), "Financial Year" = field("Year Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Course Title", "Training Plan Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
        TrainingNeedCategories: Record "Training Need Categories";
        KPAreas: Record Vendor;
        TrainingCoursesSetup: Record "Training Courses Setup";
        TrainingNeedsLines: Record "Training Needs Lines";
        TrainingLinesObjectives: Record "Training Lines Objectives";
        TrainingCoursesNeeds: Record "Training Courses Needs";
        TrainingLinesObjectives1: Record "Training Lines Objectives";
        EntryNo: Integer;
}

