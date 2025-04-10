
table 80079 "Perfomance Evaluation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[100])
        {

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Performance Appraisal" then begin
                    if "Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                    if "Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                    if "Evaluation Type" = "evaluation type"::"360-Degree/Group Appraisal" then begin
                        if No <> xRec.No then begin
                            SPMSetup.Get;
                            NoSeriesMgt.TestManual(SPMSetup."Performance Evaluation Nos");
                            "No. Series" := '';
                        end;
                    end;
                end;

                if "Document Type" = "document type"::"Performance Appeal" then begin
                    if No <> xRec.No then begin
                        SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Performance Appeals No. Series");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Performance Mgt Plan ID"; Code[100])
        {
            TableRelation = if ("Document Type" = const("Performance Appraisal")) "Performance Management Plan".No;

            trigger OnValidate()
            begin
                PerformanceManagementPlan.Reset;
                PerformanceManagementPlan.SetRange(No, "Performance Mgt Plan ID");
                if PerformanceManagementPlan.Find('-') then begin
                    PerfomanceEvaluationTemplate.Reset;
                    PerfomanceEvaluationTemplate.SetRange(Code, PerformanceManagementPlan."HR Performance Template");
                    if PerfomanceEvaluationTemplate.Find('-') then begin
                        PerfomanceEvaluationTemplate.CalcFields("Total Allocated Weight (%)");
                        if ("Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only") or ("Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score") then
                            "Appraisal Template ID" := PerfomanceEvaluationTemplate."General A_Questionnaire"
                        else
                            "Appraisal Template ID" := PerfomanceEvaluationTemplate."Peer Reviewer FB_Questionnaire";
                        "Competency Template ID" := PerfomanceEvaluationTemplate."Default Competency A_Template";
                        "Performance Rating Scale" := PerfomanceEvaluationTemplate."Performance Rating Scale";
                        "Proficiency Rating Scale" := PerfomanceEvaluationTemplate."Proficiency Rating Scale";

                        PerformanceEvaluationWeight.Reset;
                        PerformanceEvaluationWeight.SetRange("Per_Evaluation Template ID", PerfomanceEvaluationTemplate.Code);
                        if PerformanceEvaluationWeight.Find('-') then begin
                            repeat
                                if PerformanceEvaluationWeight."Key Evaluation Section" = PerformanceEvaluationWeight."key evaluation section"::"Objectives & Outcomes" then begin
                                    "Objective & Outcome Weight %" := PerformanceEvaluationWeight."Total Weight (%)";
                                end;
                                if PerformanceEvaluationWeight."Key Evaluation Section" = PerformanceEvaluationWeight."key evaluation section"::"Competency & Company Values" then begin
                                    "Competency Weight %" := PerformanceEvaluationWeight."Total Weight (%)";
                                end;
                            until PerformanceEvaluationWeight.Next = 0;
                        end;
                        "Total Weight %" := PerfomanceEvaluationTemplate."Total Allocated Weight (%)";
                    end;
                end;
            end;
        }
        field(3; "Performance Task ID"; Code[100])
        {
            TableRelation = "Performance Plan Task"."Task Code" where("Performance Mgt Plan ID" = field("Performance Mgt Plan ID"),
                                                                       "Task Category" = const("Performance Review"),
                                                                       "Review Periods" = filter(<> ' '));

            trigger OnValidate()
            begin
                PerformancePlanTask.Reset;
                PerformancePlanTask.SetRange("Performance Mgt Plan ID", "Performance Mgt Plan ID");
                PerformancePlanTask.SetRange("Task Code", "Performance Task ID");
                if PerformancePlanTask.Find('-') then begin
                    PerformancePlanTask.TestField("Processing Start Date");
                    PerformancePlanTask.TestField("Processing Due Date");
                    PerformancePlanTask.TestField("Review Periods");

                    "Evaluation Start Date" := PerformancePlanTask."Processing Start Date";
                    "Evaluation End Date" := PerformancePlanTask."Processing Due Date";
                    "Review Period" := PerformancePlanTask."Review Periods";
                end;
            end;
        }
        field(4; "Employee No."; Code[100])
        {
            TableRelation = Employee;

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                if Emp.Get("Employee No.") then begin
                    "Employee Name" := Emp.FullName;
                    "Current Designation" := Emp.Position;
                    // "Current Grade" := Emp.Position1;
                    Directorate := Emp."Directorate Code";
                    // UserSetup.Get(Emp.Supervisor);
                    // Emp.TestField("2nd Supervisor");
                    UserSetup.TestField("Employee No.");
                    Department := Emp."Department Code";
                    "Supervisor Staff No." := UserSetup."Employee No.";
                    // UserSetup.Get(Emp."2nd Supervisor");
                    UserSetup.TestField("Employee No.");
                    "2nd Supervisor Staff No." := UserSetup."Employee No.";
                    "Duty Station" := Emp."Current Duty Station";
                    Validate("2nd Supervisor Staff No.");
                end;
            end;
        }
        field(5; "Employee Name"; Text[100])
        {
        }
        field(6; "Current Designation"; Text[200])
        {
        }
        field(7; "Current Grade"; Code[100])
        {
        }
        field(8; "Supervisor Staff No."; Code[50])
        {
            TableRelation = Employee;
            Editable = false;

            trigger OnValidate()
            begin
                if Emp.Get("Supervisor Staff No.") then begin
                    "Supervisor Name" := Emp.FullName;
                end;
            end;
        }
        field(9; "Supervisor Name"; Text[100])
        {
            Editable = false;
        }
        field(10; "Strategy Plan ID"; Code[255])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(11; Description; Text[255])
        {
        }
        field(12; "Document Date"; Date)
        {
        }
        field(13; "Evaluation Start Date"; Date)
        {
        }
        field(14; "Evaluation End Date"; Date)
        {
        }
        field(15; "Appraisal Template ID"; Code[100])
        {
            TableRelation = "Appraisal Questionnaire Temp";
        }
        field(16; "Evaluation Type"; Option)
        {
            OptionCaption = 'Standard Appraisal/Supervisor Score Only,Self-Appraisal with Supervisor Score,360-Degree/Group Appraisal';
            OptionMembers = "Standard Appraisal/Supervisor Score Only","Self-Appraisal with Supervisor Score","360-Degree/Group Appraisal";
        }
        field(17; "Personal Scorecard ID"; Code[100])
        {
            TableRelation = "Perfomance Contract Header".No where("Document Type" = const("Individual Scorecard"),
                                                                   "Responsible Employee No." = field("Employee No."),
                                                                   Status = const(Signed), "Blocked?" = const(false));

            trigger OnValidate()
            begin
                if PerfomanceContractHeader.Get("Personal Scorecard ID") then begin
                    "Annual Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
                end;
            end;
        }
        field(18; "Competency Template ID"; Code[100])
        {
            TableRelation = "Competency Per Template".Code where("Global?" = const(true));
        }
        field(19; "General Assessment Template ID"; Code[100])
        {
        }
        field(20; "360-Degree Assessment Temp ID"; Code[50])
        {
        }
        field(21; "Objective & Outcome Weight %"; Decimal)
        {
        }
        field(22; "Competency Weight %"; Decimal)
        {
        }
        field(23; "Total Weight %"; Decimal)
        {
        }
        field(24; "Performance Rating Scale"; Code[100])
        {
            TableRelation = "Perfomance Rating Scale".Code;
        }
        field(25; "Proficiency Rating Scale"; Code[100])
        {
            TableRelation = "Competency Proficiency Scale".Code;
        }
        field(26; Directorate; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(27; Department; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(28; "Annual Reporting Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(29; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(30; "Blocked?"; Boolean)
        {
        }
        field(31; "Created By"; Code[50])
        {
        }
        field(32; "Created On"; Date)
        {
        }
        field(33; "Last Evaluation Date"; Date)
        {
        }
        field(34; "Document Type"; Option)
        {
            OptionCaption = 'Performance Appraisal,Performance Appeal';
            OptionMembers = "Performance Appraisal","Performance Appeal";
        }
        field(35; "Appealed Performance Eval id"; Code[50])
        {
            TableRelation = "Perfomance Evaluation" where("Document Type" = const("Performance Appraisal"));
        }
        field(36; "No. Series"; Code[10])
        {
        }
        field(37; "Document Status"; Option)
        {
            OptionCaption = 'Draft,Evaluation,Submitted';
            OptionMembers = Draft,Evaluation,Submitted;
        }
        field(38; Closed; Boolean)
        {
        }
        field(39; "Closed By"; Code[30])
        {
        }
        field(40; "Closed On"; Code[30])
        {
        }
        field(41; "Review Period"; Code[50])
        {
        }
        field(42; "Total Final Weighted Score"; Decimal)
        {
            CalcFormula = sum("Objective Evaluation Result"."Final Weighted Line Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(43; "Total Proficiency Score"; Decimal)
        {
            CalcFormula = sum("Proficiency Evaluation Result"."Raw Profiency Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(44; "Total Raw Score"; Decimal)
        {
            CalcFormula = sum("Objective Evaluation Result"."Raw Performance Score" where("Performance Evaluation ID" = field(No)));
            FieldClass = FlowField;
        }
        field(45; "Employee Confirm"; Boolean)
        {
        }
        field(46; "Supervisor Confirm"; Boolean)
        {
        }
        field(47; "2nd Supervisor Remarks"; Text[250])
        {
            trigger OnValidate()
            begin
                "Validate If 2nd Supervisor"();
            end;
        }
        field(48; "2nd Supervisor Staff No."; Code[50])
        {
            TableRelation = Employee;
            Editable = false;

            trigger OnValidate()
            begin
                if Emp.Get("2nd Supervisor Staff No.") then begin
                    "2nd Supervisor Staff Name" := Emp.FullName;
                end;
            end;
        }
        field(49; "2nd Supervisor Staff Name"; Text[100])
        {
            Editable = false;
        }
        field(50; "Objective Weight"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            Caption = 'Technical Score';

            CalcFormula = sum("Objective Evaluation Result"."AppraiserReview Qty" where("Performance Evaluation ID" = field(No)));
        }
        field(51; "Values Weight"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Proficiency Evaluation Result"."AppraiserReview Qty" where("Performance Evaluation ID" = field(No)));
        }
        field(52; "Target Weight"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Objective Evaluation Result"."Target Qty" where("Performance Evaluation ID" = field(No)));
        }
        field(53; "Duty Station"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Recommend Award"; Boolean)
        {
            Fieldclass = Flowfield;
            Calcformula = Exist("Appraisal Award Recomm" where("Appraisal No" = field(No)));
        }
        field(55; "Previous Year Total Score"; Decimal)
        {
            Editable = false;
        }
        field(56; "Previous Year Reporting Code"; Code[50])
        {
            Editable = false;
        }
        field(57; "Current Year Reporting Code"; Code[50])
        {
            Editable = false;
        }
        // Perfomance Scale Line
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Performance Mgt Plan ID", "Performance Task ID")
        {
        }
    }

    fieldgroups
    {
    }

    procedure "Validate If 2nd Supervisor"()
    var
        UserSetup: Record "User Setup";
    begin
        TestField("2nd Supervisor Staff No.");
        UserSetup.Reset;
        UserSetup.SetRange("Employee No.", "2nd Supervisor Staff No.");
        if UserSetup.FindFirst() then
            UserSetup.TestField("User ID", UserId);
    end;

    procedure GetPerformanceGrade(PerformanceScaleID: Code[50]; Score: Decimal) PerformanceRating: Code[100]
    var
        PerfomanceScaleLn: Record "Perfomance Scale Line";
    begin
        PerfomanceScaleLn.Reset;
        PerfomanceScaleLn.SetRange("Performance Scale ID", PerformanceScaleID);
        PerfomanceScaleLn.SetFilter("Lower Limit Target (%)", '<=%1', Score);
        PerfomanceScaleLn.SetFilter("Upper Limit Target (%)", '>=%1', Score);
        if PerfomanceScaleLn.FindFirst() then
            PerformanceRating := PerfomanceScaleLn."Perfomance Grade";
    end;

    procedure CalculateTheAverageScore() AverageScore: Decimal
    begin
        Calcfields(Rec."Objective Weight", Rec."Target Weight", Rec."Values Weight");
        if "Target Weight" > 0 then
            AverageScore := ("Objective Weight" / "Target Weight") * 80;
        AverageScore += "Values Weight";
    end;

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Performance Appraisal" then begin
            if "Evaluation Type" = "evaluation type"::"Standard Appraisal/Supervisor Score Only" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
            if "Evaluation Type" = "evaluation type"::"Self-Appraisal with Supervisor Score" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
            if "Evaluation Type" = "evaluation type"::"360-Degree/Group Appraisal" then begin
                if No = '' then begin
                    SPMSetup.Get;
                    SPMSetup.TestField("Performance Evaluation Nos");
                    NoSeriesMgt.InitSeries(SPMSetup."Performance Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Performance Appeal" then begin
            if No = '' then begin
                SPMSetup.Get;
                SPMSetup.TestField("Performance Appeals No. Series");
                NoSeriesMgt.InitSeries(SPMSetup."Performance Appeals No. Series", xRec."No. Series", 0D, No, "No. Series");
            end;
        end;

        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;

        AnnualReportingCodes.Reset;
        AnnualReportingCodes.SetRange("Current Year", true);
        AnnualReportingCodes.FindFirst();
        "Current Year Reporting Code" := AnnualReportingCodes.Code;

        AnnualReportingCodes.Reset;
        AnnualReportingCodes.SetRange("Previous Year", true);
        AnnualReportingCodes.FindFirst();
        "Previous Year Reporting Code" := AnnualReportingCodes.Code;

        PerfomanceEvaluation.Reset();
        PerfomanceEvaluation.SetRange("Current Year Reporting Code", AnnualReportingCodes.Code);
        PerfomanceEvaluation.SetRange("Document Status", PerfomanceEvaluation."Document Status"::Submitted);
        if PerfomanceEvaluation.FindFirst() then
            "Previous Year Total Score" := PerfomanceEvaluation.CalculateTheAverageScore();

    end;

    procedure MarkSimilarDocumentsAsBlocked()
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        if Rec."Annual Reporting Code" = '' then exit;

        PerfomanceEvaluation.Reset();
        PerfomanceEvaluation.SetRange("Annual Reporting Code", Rec."Annual Reporting Code");
        PerfomanceEvaluation.SetRange("Employee No.", Rec."Employee No.");
        PerfomanceEvaluation.SetRange("Approval Status", Rec."Approval Status"::Released);
        if PerfomanceEvaluation.FindSet then
            repeat
                PerfomanceEvaluation."Blocked?" := true;
                PerfomanceEvaluation.Modify();
            until PerfomanceEvaluation.Next = 0;

    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        ResponsibityC: Record "Responsibility Center";
        PerformancePlanTask: Record "Performance Plan Task";
        PerfomanceEvaluationTemplate: Record "Perfomance Evaluation Template";
        PerformanceManagementPlan: Record "Performance Management Plan";
        PerformanceEvaluationWeight: Record "Performance Evaluation Weight";
        PerfomanceContractHeader: Record "Perfomance Contract Header";

        AnnualReportingCodes: Record "Annual Reporting Codes";

        PerfomanceEvaluation: Record "Perfomance Evaluation";
}

