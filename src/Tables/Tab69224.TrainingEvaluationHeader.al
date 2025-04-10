
table 69224 "Training Evaluation Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Application Code"; Code[30])
        {
            TableRelation = if ("Document Type" = const(Training)) "Training Requests" where("Employee No." = field("Employee No."))
            else
            if ("Document Type" = const(Induction)) "Induction Lines" where("Employee No." = field("Employee No."));

            trigger OnValidate()
            var
                Induction: Record "Induction Curriculum";
                FeedbackLines: Record "Training Feedback Suggestions";
                Lineno: Integer;
            begin
                Lineno := 0;
                if xRec."Application Code" <> '' then begin
                    //delete any existing lines
                    FeedbackLines.Reset();
                    FeedbackLines.SetRange("Training Application No", xRec."Application Code");
                    if FeedbackLines.FindSet() then begin
                        if Confirm('Changing the application code will overwrite existing feedback suggestions. Do you want to continue?') then
                            FeedbackLines.DeleteAll()
                        else
                            Error('Application code not changed');
                    end;
                end;
                //check if employee attended the training
                if ((Type = Type::Feedback) or (Type = Type::Evaluation)) then begin

                    //EmployeeScedule.Reset;
                    //EmployeeScedule.SetRange("Training Application No.", "Application Code");
                    //EmployeeScedule.SetRange("Employee No.", "Employee No.");
                    //if EmployeeScedule.FindFirst then begin
                    TrainingRequests.Reset;
                    TrainingRequests.SetRange(Code, "Application Code");
                    if TrainingRequests.FindSet then begin
                        "Course Title" := TrainingRequests.Description;
                        "Start DateTime" := TrainingRequests."Start Date";
                        "End DateTime" := TrainingRequests."End Date";
                        Venue := TrainingRequests."Training Venue Region";
                        "No. of Participants" := TrainingRequests."No. of Participants";

                        //end
                    end; //ELSE
                         //ERROR('You are not allowed to evaluate the selected training since you are not part of the attendees');
                end;
                Induction.Reset();
                Induction.SetRange("Induction No.", "Application Code");
                Induction.SetRange(Type, Induction.Type::Activity);
                if Induction.FindSet() then
                    repeat
                        Lineno += 1;
                        FeedbackLines.Init();
                        FeedbackLines."Training Application No" := Rec.No;
                        FeedbackLines."Entry No." := Lineno;
                        FeedbackLines."Category Description" := Induction.Objective;
                        FeedbackLines."Session Name" := Induction.Activity;
                        FeedbackLines.Objective := Induction.Objective;
                        FeedbackLines.Facilitator := Induction."Facilitator Name";
                        FeedbackLines."Training Code" := Induction."Induction No.";
                        FeedbackLines.Insert();
                    until Induction.Next() = 0;
            end;
        }
        field(3; "Course Title"; Text[50])
        {
            NotBlank = false;
        }
        field(4; "Start DateTime"; Date)
        {
            Editable = false;
        }
        field(5; "End DateTime"; Date)
        {
            Editable = false;
        }
        field(6; Venue; Text[30])
        {
            Editable = false;
        }
        field(7; Facilitators; Text[100])
        {
            Editable = true;
        }
        field(8; "Course Justification"; Text[100])
        {
            Editable = false;
        }
        field(9; "Comment on Relevance of Course"; Text[100])
        {
        }
        field(10; "Course Methodology"; Text[100])
        {
        }
        field(11; "No. Series"; Code[10])
        {
        }
        field(12; "No. of Participants"; Integer)
        {
        }
        field(13; Status; Option)
        {
            OptionCaption = 'Open,Submitted,Supervisor';
            OptionMembers = Open,Submitted,Supervisor;
        }
        field(14; "Created By"; Code[30])
        {
        }
        field(15; "Created On"; Date)
        {
        }
        field(16; "Employee No."; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    //Employee.CalcFields(Department,"Job Title");
                    // Department := Employee.Department;
                    "Job Title" := Employee."Job Title";
                end
            end;
        }
        field(17; "Employee Name"; Text[50])
        {
            Editable = false;
        }
        field(18; Type; Option)
        {
            OptionCaption = 'Evaluation,Feedback';
            OptionMembers = Evaluation,Feedback;
        }
        field(19; Department; Text[50])
        {
            Editable = false;
        }
        field(20; "Job Title"; Text[50])
        {
        }
        field(21; "Document Type"; Option)
        {
            OptionMembers = Training,Induction;
        }


    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        case Type of
            Type::Evaluation:
                begin
                    if No = '' then begin
                        HRSetup.Get();
                        HRSetup.TestField(HRSetup."Training Evaluation Nos");
                        NoSeriesMgt.InitSeries(HRSetup."Training Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                    end;
                end;
            Type::Feedback:
                begin
                    if No = '' then begin
                        HRSetup.Get();
                        HRSetup.TestField(HRSetup."Training Feedback Nos.");
                        NoSeriesMgt.InitSeries(HRSetup."Training Feedback Nos.", xRec."No. Series", 0D, No, "No. Series");
                    end;
                end;
        end;
        "Created By" := UserId;
        "Created On" := Today;
        if UserSetup.Get(UserId) then
            Validate("Employee No.", UserSetup."Employee No.");
    end;




    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Course: Record "Training Requests";
        DimVal: Record "Dimension Value";
        HRRec: Record Employee;
        TrainingRequests: Record "Training Requests";
        UserSetup: Record "User Setup";
        EmployeeScedule: Record "Employee Scedule";
        Employee: Record Employee;
}

