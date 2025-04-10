
table 69194 "Training Needs Header1"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    // if Employee."Employment Date" > CalcDate('-2Y', WorkDate()) then
                    //     Error('You cannot apply for training if you have not been employed for 2 years or more');

                    // Evaluation.Reset();
                    // Evaluation.SetRange("Employee No.", "Employee No");
                    // Evaluation.SetFilter("End DateTime", '<>%1', 0D);
                    // if Evaluation.FindLast() then
                    //     if (CalcDate('2Y', Evaluation."End DateTime") > WorkDate()) then
                    //         Error('You cannot apply for another training before two years have elapsed from your previous training');
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    // Employee.CalcFields("Department Name");
                    Department := Employee."Department Name";
                    "Date of First Appointment" := Employee."Employment Date";
                    "Duty Station" := Employee."Current Duty Station";
                    CompanyPositions.Reset;
                    CompanyPositions.SetRange("Position ID", Employee."Current Position ID");
                    if CompanyPositions.FindFirst then begin
                        "Job Title" := CompanyPositions."Job Title";
                    end;
                    "Employment Date" := Employee."Employment Date";
                    "Appointment Date" := Employee."End Of Probation Date";
                    "Job Grade" := Employee."Salary Scale";
                    Disabled := Employee.Disabled;
                end
            end;
        }
        field(3; "Employee Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Job Title"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Date of First Appointment"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Training Plan No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header".No;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Employment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Appointment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Duty Station"; Code[30])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(20; "Course ID"; Code[10])
        {
            TableRelation = "Training Courses Setup".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code, "Course ID");
                if TrainingCoursesSetup.FindSet then begin

                    "Course Description" := TrainingCoursesSetup.Descritpion;
                end;
            end;
        }
        field(21; "Course Description"; Text[100])
        {
            Editable = false;
        }
        field(22; Source; Option)
        {
            OptionCaption = 'Appraisal,Government Directive,Other,Career Development';
            OptionMembers = Appraisal,"Government Directive",Other,"Career Development";
        }
        field(23; Comments; Text[200])
        {
        }
        field(24; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Financial Year"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(26; "Job Grade"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin



        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Request Nos");
            NoSeriesMgt.InitSeries(HRSetup."Training Request Nos", xRec."No Series", 0D, Code, "No Series");
        end;

        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        GLSetup.Get();
        GLSetup.TestField("Current Budget");
        "Financial Year" := GLSetup."Current Budget";
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            "Employee No" := UserSetup."Employee No.";
            Validate("Employee No");
            "Employee Name" := UserSetup."Employee Name";
        end;
        Questions.Reset();
        Questions.SetRange("Document Type", Questions."Document Type"::"Training Needs Request");
        if Questions.FindSet() then
            repeat
                TNAQuestions.Init();
                TNAQuestions."Training No" := Rec.Code;
                TNAQuestions."Question ID" := Questions."Question ID";
                TNAQuestions.Question := Questions.Question;
                TNAQuestions.Insert();

            until Questions.Next() = 0;


    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        CompanyPositions: Record "Company Positions";
        Questions: Record "Apptitude Question";
        TNAQuestions: Record "TNA Questions";
        Requests: Record "Training Needs Header";
        Evaluation: Record "Training Evaluation Header";
        TrainingCoursesSetup: Record "Training Courses Setup";
        GLSetup: Record "Cash Management Setup";

}

