
codeunit 80000 "Strategic Planning"
{

    trigger OnRun()
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        ReviewPeriods: Record "Review Periods";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                WPlanLines."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                WPlanLines.No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;


    procedure fnPostObjectiveEntry(ObjectiveOutcome: Record "Objective Evaluation Result")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        PerformanceEvaluation: Record "Perfomance Evaluation";
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
        StrategicPlan: Code[50];
        EntryType: Option Planned,Actual;
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, ObjectiveOutcome."Intiative No");
        if StrategicInt.Find('-') then begin
            StrategicPlan := StrategicInt."Strategic Plan ID";
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        PerformanceEvaluation.Reset;
        PerformanceEvaluation.SetRange(No, ObjectiveOutcome."Performance Evaluation ID");
        if PerformanceEvaluation.FindFirst then begin
            ReviewPeriods.Reset;
            ReviewPeriods.SetRange(Code, PerformanceEvaluation."Review Period");
            if ReviewPeriods.FindFirst then begin
                QCount := 0;
                case ReviewPeriods."Review Type" of
                    ReviewPeriods."review type"::Quartely:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                               ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                               ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty", 0,
                               ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                            end;
                        end;
                    ReviewPeriods."review type"::"Semi-Quartely":
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end;
                    ReviewPeriods."review type"::Annually:
                        begin
                            ReviewQuarterlyPeriods.Reset;
                            ReviewQuarterlyPeriods.SetRange("Review Period Code", ReviewPeriods.Code);
                            if ReviewQuarterlyPeriods.Find('-') then begin
                                repeat
                                    FnInsertEntry(StrategicPlan, ThemeID, ObjectiveID, StrategicPlan, ObjectiveOutcome."Intiative No", ObjectiveOutcome."Objective/Initiative", Entrytype::Actual,
                                    ReviewQuarterlyPeriods."Year Code", ReviewQuarterlyPeriods.Code, ReviewQuarterlyPeriods."Reporting Start Date", ObjectiveOutcome."Primary Directorate",
                                    ObjectiveOutcome."Primary Department", ObjectiveOutcome."AppraiserReview Qty" / ReviewPeriods."No of Quarters", 0,
                                    ObjectiveOutcome."Performance Evaluation ID", Sourcetype::"Perfomance Contract");
                                until ReviewQuarterlyPeriods.Next = 0;
                            end;

                        end else
                                Error('Review Type Category must be selected for Review Period %1', ReviewPeriods.Code);
                end;
            end;
        end;

    end;


    procedure FnGenerateBatchAppraisals(PerformancePlanTask: Record "Performance Plan Task"; StrategicID: Code[10])
    var
        Employee: Record Employee;
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PerformanceManagementPlan: Record "Performance Management Plan";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AnnualReportingCode: Code[30];
        PerfomanceEvaluationNo: Code[30];
    begin
        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        //Employee.SETRANGE("Primary Bank %",TRUE);
        if Employee.Find('-') then begin
            repeat
                SPMSetup.Get;
                PerfomanceEvaluation.Init;
                PerfomanceEvaluation."Document Type" := PerfomanceEvaluation."document type"::"Performance Appraisal";
                PerformanceManagementPlan.Reset;
                PerformanceManagementPlan.SetRange(No, PerformancePlanTask."Performance Mgt Plan ID");
                if PerformanceManagementPlan.Find('-') then begin
                    // PerformanceManagementPlan.TESTFIELD("Evaluation Type");
                    PerformanceManagementPlan.TestField("Strategy Plan ID");
                    PerformanceManagementPlan.TestField("Annual Reporting Code");
                    StrategicID := PerformanceManagementPlan."Strategy Plan ID";
                    AnnualReportingCode := PerformanceManagementPlan."Annual Reporting Code";
                    PerfomanceEvaluation."Evaluation Type" := PerformanceManagementPlan."Evaluation Type";
                end;
                PerfomanceEvaluation.No := '';
                PerfomanceEvaluation."Performance Mgt Plan ID" := PerformancePlanTask."Performance Mgt Plan ID";
                PerfomanceEvaluation."Strategy Plan ID" := StrategicID;
                PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
                PerfomanceEvaluation."Performance Task ID" := PerformancePlanTask."Task Code";
                PerfomanceEvaluation.Validate("Performance Task ID");
                PerfomanceEvaluation."Employee No." := Employee."No.";
                PerfomanceEvaluation.Validate("Employee No.");
                PerfomanceEvaluation."Personal Scorecard ID" := FnGetPersonalScorecard(Employee."No.", AnnualReportingCode);
                PerfomanceEvaluation."Annual Reporting Code" := AnnualReportingCode;
                if PerfomanceEvaluation.Insert(true) then begin
                    FnSuggestObjectives(PerfomanceEvaluation);
                    FnSuggestEvaluations(PerfomanceEvaluation);
                end;
            until Employee.Next = 0;
        end;
        Message('Employees Performance Appraisals Generated Successfully');
    end;


    procedure FnGetPersonalScorecard(EmployeeNo: Code[30]; AnnualReportingCode: Code[10]) PersonalScoreCard: Code[10]
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", EmployeeNo);
        PerfomanceContractHeader.SetRange("Annual Reporting Code", AnnualReportingCode);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        PerfomanceContractHeader.SetRange(Status, PerfomanceContractHeader.Status::Signed);
        if PerfomanceContractHeader.FindFirst then begin
            PersonalScoreCard := PerfomanceContractHeader.No;
            exit(PersonalScoreCard);
        end else
            Error('Employee No %1 does not have a Signed Performance Contract for Annual Period %2', EmployeeNo, AnnualReportingCode);
    end;


    procedure FnSuggestObjectives(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
        PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
        if PCObjective.FindFirst then begin
            repeat

                ObjectiveOutcome.Init;
                ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                ObjectiveOutcome.Insert(true);

            until PCObjective.Next = 0;

        end;
    end;

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;


    procedure FnSuggestEvaluations(PerfomanceEvaluation: Record "Perfomance Evaluation")
    begin
        CompetencyLines.Reset;
        CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
        if CompetencyLines.Find('-') then begin
            repeat

                ProEvaluation.Init;
                ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                ProEvaluation.Description := CompetencyLines.Description;
                ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                ProEvaluation."Weight %" := CompetencyLines."Weight %";
                ProEvaluation.Insert(true);
            until CompetencyLines.Next = 0;
        end;
    end;


    procedure FnSuggestPlogLines(PerformanceDiaryLog: Record "Performance Diary Log")
    var
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
    begin
        PerformanceDiaryLog.TestField("Employee No.");
        PerformanceDiaryLog.TestField("Personal Scorecard ID");
        PerformanceDiaryLog.TestField("Activity Start Date");
        PerformanceDiaryLog.TestField("Activity End Date");

        SPMGeneralSetup.Get();
        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCObjective.FindFirst then begin
                repeat
                    PCObjective.CalcFields("Individual Achieved Targets");
                    PCObjective.TestField("Due Date");
                    PCObjective.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                    PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;

                    //Sub Activities
                    SubPCObjective.Reset;
                    SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                    if SubPCObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Outcome Perfomance Indicator";
                            SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                            SubPlogLines."Sub Initiative No." := SubPCObjective."Sub Initiative No.";
                            SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                            SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                            //SubPlogLines.VALIDATE("Initiative No.");
                            //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubPCObjective.Next = 0;
                    end;


                until PCObjective.Next = 0;
            end;
            //Secondary Activities
            SecondaryPCObjective.Reset;
            SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            SecondaryPCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if SecondaryPCObjective.FindFirst then begin
                repeat
                    SecondaryPCObjective.CalcFields("Individual Achieved Targets");
                    SecondaryPCObjective.TestField("Due Date");
                    SecondaryPCObjective.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                    PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                    PlogLines.Insert;
                until SecondaryPCObjective.Next = 0;
            end;
        end;
        //JD Loading
        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
            PCJobDescription.Reset;
            PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
            if PCJobDescription.FindFirst then begin
                repeat
                    PCJobDescription.CalcFields("Individual Achieved Targets");
                    PCJobDescription.TestField("Due Date");
                    PCJobDescription.TestField("Imported Annual Target Qty");
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                    PlogLines."Sub Intiative No" := PCJobDescription.Description;
                    PlogLines."Planned Date" := PCJobDescription."Start Date";
                    PlogLines."Achieved Date" := PerformanceDiaryLog."Document Date";
                    PlogLines."Due Date" := PCJobDescription."Due Date";
                    PlogLines."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                    PlogLines."Weight %" := PCJobDescription."Assigned Weight (%)";
                    PlogLines."Remaining Targets" := PCJobDescription."Imported Annual Target Qty" - PCJobDescription."Individual Achieved Targets";
                    PlogLines.Insert;
                    //Sub JD Plog Lines... Kisavi
                    SubJDObjective.Reset;
                    SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                    SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                    if SubJDObjective.FindSet then begin
                        repeat
                            SubPlogLines.Init;
                            SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                            SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                            SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                            SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                            SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                            SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                            SubPlogLines."Sub Initiative No." := SubJDObjective."Sub Initiative No.";
                            SubPlogLines.Description := SubJDObjective.Description;
                            SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                            SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                            SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                            SubPlogLines."Due Date" := SubJDObjective."Due Date";
                            if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Initiative No.", SubPlogLines."Personal Scorecard ID") then
                                SubPlogLines.Insert(true);
                        until SubJDObjective.Next = 0;
                    end;
                until PCJobDescription.Next = 0;
            end;
        end;
    end;


    procedure FnInsertPlogEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract"; EmployeeNo: Code[30]; PostingDate: Date; DocumentType: Option Plog,Appraisal; RegionCode: Code[30]; PerformanceContractID: Code[30]; AnnualWorkplan: Code[30]; BoardPCID: Code[30]; CEOPCID: Code[30]; FunctionalPCID: Code[30]; UnitofMeasure: Code[30])
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry."Employee No" := EmployeeNo;
        StrategyEntry."Region Code" := RegionCode;
        StrategyEntry."Performance Contract ID" := PerformanceContractID;
        StrategyEntry."Annual Workplan" := AnnualWorkplan;
        StrategyEntry."Board PC ID" := BoardPCID;
        StrategyEntry."CEO PC ID" := CEOPCID;
        StrategyEntry."Functional PC ID" := FunctionalPCID;
        StrategyEntry."Unit of Measure" := UnitofMeasure;
        StrategyEntry.Insert(true);
    end;


    procedure FnInsertJDPlogEntry(PlogLines: Record "Plog Lines")
    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
    begin
        PerformanceDiaryEntry.Init;
        PerformanceDiaryEntry."Line Number" := PlogLines."Initiative No.";
        PerformanceDiaryEntry."Employee No" := PlogLines."Employee No.";
        PerformanceDiaryEntry."Posting Date" := PlogLines."Achieved Date";
        PerformanceDiaryEntry."Performance Entry Type" := PerformanceDiaryEntry."performance entry type"::"Positive Performance";
        PerformanceDiaryEntry."Diary Source" := PerformanceDiaryEntry."diary source"::"Self-Log";
        PerformanceDiaryEntry.Description := 'PLOG_' + Format(PlogLines."Achieved Date");
        PerformanceDiaryEntry."Personal Scorecard ID" := PlogLines."Personal Scorecard ID";
        PerformanceDiaryEntry.Quantity := PlogLines."Achieved Target";
        PerformanceDiaryEntry."Primary Directorate" := PlogLines."Primary Directorate";
        PerformanceDiaryEntry."Primary Department" := PlogLines."Primary Department";
        PerformanceDiaryEntry.Insert(true);
    end;


    procedure FnSendAppraisalReport(PerfomanceEvaluation: Record "Perfomance Evaluation")
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        // DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        // PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        // PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        // IFSCommitteMembers: Record "IFS Tender Committee Member";
        IFS: Record "Standard Purchase Code";
        // CommitteType: Record "Procurement Committee Types";
        // CommitteMembers: Record "IFS Tender Committee";
        Employee: Record Employee;
    begin
        ///Notifying Employee Appraisal Report
        CompInfo.Get;
        HRSetup.Get;

        Employee.Reset;
        Employee.SetRange(Employee."No.", PerfomanceEvaluation."Employee No.");
        if Employee.FindSet then begin
            RequesterEmail := Employee."Company E-Mail";
            RequesterName := PerfomanceEvaluation."Employee Name";

            Window.Open('Notifying the employee...');

            WindowisOpen := true;


            Counter := Counter + 1;

            //Create message
            if HRSetup."E-Mail" = '' then
                Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
            SenderAddress := HRSetup."E-Mail";
            CompanyDetails := 'Dear,  ' + RequesterName;
            SenderMessage := '<BR>This is to notify you that your appraisal was successfully submitted: ' + PerfomanceEvaluation.No + '</BR>';
            LoginDetails := 'Attached herein, please find an e-copy of your appraisal report';
            //ProcNote:='<BR> If you require any assistance, please contact our Supply Chain Management team by Phone '+ HRSetup."Phone No."+' or vendor support team via Email: '+PPayableSetup."Default Proc Email Contact";
            FileDirectory := 'C:\DOCS\';
            FileName := 'AppraisalReport_' + PerfomanceEvaluation.No + '.pdf';

            PerfomanceEvaluation.Reset;
            PerfomanceEvaluation.SetRange(No, PerfomanceEvaluation.No);
            if PerfomanceEvaluation.FindSet then begin

                //Report.SaveAsPdf(80016, FileDirectory + FileName, PerfomanceEvaluation);

            end;

            //IF CustEmail='' THEN
            //EXIT;

            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := 'PERFORMANCE APPRAISAL ' + PerfomanceEvaluation.No;

            // cu400.Create(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);

            // //cu400.AddCC(RequesterEmail);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);

            // cu400.AppendToBody(ProcNote);


            // cu400.Send;
            SendingDate := Today;
            SendingTime := Time;




            Sleep(1000);
            Window.Close;

            //UNTIL IFSCommitteMembers.NEXT=0;
        end;
    end;


    procedure FnUpdateAnnualWorkplan(AnnualStrategyWorkplan: Record "Annual Strategy Workplan")
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        StrategyWorkplanLines1: Record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
    // WorkplanCostElements: Record "Workplan Cost Elements";
    // WorkplanCostElement1: Record "Workplan Cost Elements";
    begin
        AnnualStrategyWorkplan.TestField("Annual Workplan");
        AnnualStrategyWorkplan.TestField("Functional Procurment Plan No");
        AnnualStrategyWorkplan.TestField("Approval Status", AnnualStrategyWorkplan."approval status"::Released);

        AnnualStrategyWorkplan.TestField("Annual Workplan");
        AnnualStrategyWorkplan.TestField(Posted, false);
        AnnualStrategyWorkplan.CalcFields("Total Assigned Weight(%)");
        if AnnualStrategyWorkplan."Total Assigned Weight(%)" <> 100 then
            Error('Assigned Weight should be equals to 100%');

        if not Confirm('Are you sure you want to update the Selected Annual Workplan?', true) then begin
            Error('Annual Workplan not Updated');
        end;
        //Insert Strategy Workplan Lines
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange(No, AnnualStrategyWorkplan.No);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                StrategyWorkplanLines.TestField("Primary Directorate");
                StrategyWorkplanLines.TestField("Primary Department");

                StrategyWorkplanLines1.Init;
                StrategyWorkplanLines1.No := AnnualStrategyWorkplan."Annual Workplan";
                StrategyWorkplanLines1."Strategy Plan ID" := AnnualStrategyWorkplan."Strategy Plan ID";
                StrategyWorkplanLines1."Activity ID" := StrategyWorkplanLines."Activity ID";
                StrategyWorkplanLines1.Description := StrategyWorkplanLines.Description;
                StrategyWorkplanLines1."Cross Cutting" := StrategyWorkplanLines."Cross Cutting";
                StrategyWorkplanLines1."Imported Annual Target Qty" := StrategyWorkplanLines."Imported Annual Target Qty";
                StrategyWorkplanLines1."Imported Annual Budget Est." := StrategyWorkplanLines."Imported Annual Budget Est.";
                StrategyWorkplanLines1."Primary Department" := StrategyWorkplanLines."Primary Department";
                StrategyWorkplanLines1."Primary Department Name" := StrategyWorkplanLines."Primary Department Name";
                StrategyWorkplanLines1."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                StrategyWorkplanLines1."Primary Directorate Name" := StrategyWorkplanLines."Primary Directorate Name";
                StrategyWorkplanLines1."Q1 Target" := StrategyWorkplanLines."Q1 Target";
                StrategyWorkplanLines1."Q1 Budget" := StrategyWorkplanLines."Q1 Budget";
                StrategyWorkplanLines1."Q2 Target" := StrategyWorkplanLines."Q2 Target";
                StrategyWorkplanLines1."Q2 Budget" := StrategyWorkplanLines."Q2 Budget";
                StrategyWorkplanLines1."Q3 Target" := StrategyWorkplanLines."Q3 Target";
                StrategyWorkplanLines1."Q3 Budget" := StrategyWorkplanLines."Q3 Budget";
                StrategyWorkplanLines1."Q4 Target" := StrategyWorkplanLines."Q4 Target";
                StrategyWorkplanLines1."Q4 Budget" := StrategyWorkplanLines."Q4 Budget";
                StrategyWorkplanLines1."Entry Type" := StrategyWorkplanLines."Entry Type";
                StrategyWorkplanLines1."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                StrategyWorkplanLines1."Perfomance Indicator" := Format(StrategyWorkplanLines."Perfomance Indicator");
                StrategyWorkplanLines1."Source Of Fund" := StrategyWorkplanLines."Source Of Fund";
                StrategyWorkplanLines1."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                StrategyWorkplanLines1."Desired Perfomance Direction" := StrategyWorkplanLines."Desired Perfomance Direction";
                StrategyWorkplanLines1."Strategy Framework" := StrategyWorkplanLines."Strategy Framework";
                StrategyWorkplanLines1."Framework Perspective" := StrategyWorkplanLines."Framework Perspective";
                StrategyWorkplanLines1."Key Performance Indicator" := StrategyWorkplanLines."Key Performance Indicator";
                StrategyWorkplanLines1."Assigned Weight(%)" := StrategyWorkplanLines."Assigned Weight(%)";
                StrategyWorkplanLines1."Annual Budget" := StrategyWorkplanLines."Annual Budget";
                StrategyWorkplanLines1."Annual Target" := StrategyWorkplanLines."Annual Target";
                StrategyWorkplanLines1."Total Subactivity budget" := StrategyWorkplanLines."Total Subactivity budget";
                StrategyWorkplanLines1."Departmental Activity Weight" := StrategyWorkplanLines."Departmental Activity Weight";
                StrategyWorkplanLines1.Insert(true);

                //Insert Annual Workplan Sub-Activities
                SubWorkplanActivity.Reset;
                SubWorkplanActivity.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                SubWorkplanActivity.SetRange("Activity Id", StrategyWorkplanLines."Activity ID");
                if SubWorkplanActivity.FindSet then begin
                    repeat
                        // ERROR('Testing');
                        SubWorkplanActivity1.Init;
                        SubWorkplanActivity1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                        SubWorkplanActivity1."Initiative No." := SubWorkplanActivity."Initiative No.";
                        SubWorkplanActivity1."Activity Id" := SubWorkplanActivity."Activity Id";
                        SubWorkplanActivity1."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                        SubWorkplanActivity1."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                        SubWorkplanActivity1."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                        SubWorkplanActivity1."Imported Annual Target Qty" := SubWorkplanActivity."Imported Annual Target Qty";
                        SubWorkplanActivity1.Weight := SubWorkplanActivity.Weight;
                        SubWorkplanActivity1."Total Budget" := SubWorkplanActivity."Total Budget";
                        SubWorkplanActivity1."Due Date" := SubWorkplanActivity."Due Date";
                        SubWorkplanActivity1."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                        if SubWorkplanActivity1.Insert = true then begin
                            //work plan cost elements
                            // WorkplanCostElements.Reset;
                            // WorkplanCostElements.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                            // WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                            // WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                            // if WorkplanCostElements.FindSet then begin
                            //     repeat
                            //         // WorkplanCostElements.TESTFIELD("Plan Item No");
                            //         /*WorkplanCostElements.TESTFIELD("Unit Cost");
                            //         WorkplanCostElements.TESTFIELD(Quantity);
                            //         WorkplanCostElements.TESTFIELD(Amount);*/// to be uncommented in future

                            //         WorkplanCostElement1.Init;
                            //         WorkplanCostElement1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                            //         WorkplanCostElement1."Activity Id" := WorkplanCostElements."Activity Id";
                            //         WorkplanCostElement1."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                            //         WorkplanCostElement1."Initiative No." := WorkplanCostElements."Initiative No.";
                            //         WorkplanCostElement1.TransferFields(WorkplanCostElements, false);
                            //         WorkplanCostElement1."Functional Procurment Plan No" := AnnualStrategyWorkplan."Functional Procurment Plan No";

                            //         WorkplanCostElement1.Insert;
                            //     until WorkplanCostElements.Next = 0;
                            // end;
                        end;
                    until SubWorkplanActivity.Next = 0;
                end;
            until StrategyWorkplanLines.Next = 0;
        end;
        //Insert Board Activities
        BoardActivities.Reset;
        BoardActivities.SetRange("AWP No", AnnualStrategyWorkplan.No);
        if BoardActivities.FindSet then begin
            repeat
                BoardActivities1.Init;
                BoardActivities1."AWP No" := AnnualStrategyWorkplan."Annual Workplan";
                BoardActivities1."Board Activity Code" := BoardActivities."Board Activity Code";
                BoardActivities1."Activity Code" := BoardActivities."Activity Code";
                BoardActivities1."Board Activity Description" := BoardActivities."Board Activity Description";
                BoardActivities1."Activity Description" := BoardActivities."Activity Description";
                BoardActivities1."Unit of Measure" := BoardActivities."Unit of Measure";
                BoardActivities1."WT(%)" := BoardActivities."WT(%)";
                BoardActivities1.Target := BoardActivities.Target;
                BoardActivities1."Framework Perspective" := BoardActivities."Framework Perspective";
                BoardActivities1."Strategy Framework" := BoardActivities."Strategy Framework";
                BoardActivities1."Achieved Target" := BoardActivities."Achieved Target";
                //BoardActivities1."Outcome Performance Indicator":=BoardActivities."Outcome Performance Indicator";
                //BoardActivities1."Previous Annual Target Qty":=BoardActivities."Previous Annual Target Qty";
                if BoardActivities1.Insert = true then begin
                    //Insert Board sub-Activities
                    BoardSubActivities.Reset;
                    BoardSubActivities.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                    BoardSubActivities.SetRange("Initiative No.", BoardActivities."Board Activity Code");
                    BoardSubActivities.SetRange("Activity Id", BoardActivities."Activity Code");
                    if BoardSubActivities.FindSet then begin
                        repeat
                            BoardSubActivities1.Init;
                            BoardSubActivities1."Workplan No." := AnnualStrategyWorkplan."Annual Workplan";
                            BoardSubActivities1."Initiative No." := BoardSubActivities."Initiative No.";
                            BoardSubActivities1."Activity Id" := BoardSubActivities."Activity Id";
                            BoardSubActivities1."Entry Number" := BoardSubActivities."Entry Number";
                            BoardSubActivities1."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                            BoardSubActivities1."Initiative Type" := BoardSubActivities."Initiative Type";
                            BoardSubActivities1."Task Type" := BoardSubActivities."Task Type";
                            BoardSubActivities1.Indentation := BoardSubActivities.Indentation;
                            BoardSubActivities1."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                            BoardSubActivities1."Year Reporting Code" := BoardSubActivities."Year Reporting Code";
                            BoardSubActivities1."Start Date" := BoardSubActivities."Start Date";
                            BoardSubActivities1."Due Date" := BoardSubActivities."Due Date";
                            BoardSubActivities1."Primary Department" := BoardSubActivities."Primary Department";
                            BoardSubActivities1."Primary Directorate" := BoardSubActivities."Primary Directorate";
                            BoardSubActivities1."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                            BoardSubActivities1."Q1 Target Qty" := BoardSubActivities."Q1 Target Qty";
                            BoardSubActivities1."Q2 Target Qty" := BoardSubActivities."Q2 Target Qty";
                            BoardSubActivities1."Q3 Target Qty" := BoardSubActivities."Q3 Target Qty";
                            BoardSubActivities1."Q4 Target Qty" := BoardSubActivities."Q4 Target Qty";
                            BoardSubActivities1."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                            BoardSubActivities1."Sub Targets" := BoardSubActivities."Sub Targets";
                        until BoardSubActivities.Next = 0;
                    end;
                end;
            until BoardActivities.Next = 0;
        end;

        AnnualStrategyWorkplan.Posted := true;
        AnnualStrategyWorkplan.Modify;
        Message('Annual Workplan Updated Successfully!');
    end;

    procedure FnCopyAnnuallWorkplan(AnnualStrategyWorkplan: Record "Annual Strategy Workplan"; TargetAnnualWorkPlan: Code[30])
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        StrategyWorkplanLines1: Record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
        // WorkplanCostElements: Record "Workplan Cost Elements";
        // WorkplanCostElement1: Record "Workplan Cost Elements";
        AnnualStrategyWorkplan1: Record "Annual Strategy Workplan";
    begin

        //AnnualStrategyWorkplan.TESTFIELD("Annual Workplan");
        //AnnualStrategyWorkplan.TESTFIELD("Functional Procurment Plan No");
        //AnnualStrategyWorkplan.TESTFIELD("Approval Status",AnnualStrategyWorkplan."Approval Status"::Released);

        //AnnualStrategyWorkplan.TESTFIELD("Annual Workplan");
        //AnnualStrategyWorkplan.TESTFIELD(Posted, TRUE);
        // AnnualStrategyWorkplan.CALCFIELDS("Total Assigned Weight(%)");
        // IF AnnualStrategyWorkplan."Total Assigned Weight(%)"<>100 THEN
        //   ERROR('Assigned Weight should be equals to 100%');

        //Insert Header
        AnnualStrategyWorkplan1.Init;
        AnnualStrategyWorkplan1.No := TargetAnnualWorkPlan;
        AnnualStrategyWorkplan1.TransferFields(AnnualStrategyWorkplan, false);
        AnnualStrategyWorkplan1."Approval Status" := AnnualStrategyWorkplan."approval status"::Open;
        AnnualStrategyWorkplan1.Posted := false;
        AnnualStrategyWorkplan1.Insert;

        //Insert Strategy Workplan Lines
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange(No, AnnualStrategyWorkplan.No);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                //StrategyWorkplanLines.TESTFIELD("Primary Directorate");
                //StrategyWorkplanLines.TESTFIELD("Primary Department");
                StrategyWorkplanLines1.Init;
                StrategyWorkplanLines1.No := TargetAnnualWorkPlan;
                StrategyWorkplanLines1."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                StrategyWorkplanLines1."Activity ID" := StrategyWorkplanLines."Activity ID";
                StrategyWorkplanLines1.Description := StrategyWorkplanLines.Description;
                StrategyWorkplanLines1."Cross Cutting" := StrategyWorkplanLines."Cross Cutting";
                StrategyWorkplanLines1."Imported Annual Target Qty" := StrategyWorkplanLines."Imported Annual Target Qty";
                StrategyWorkplanLines1."Imported Annual Budget Est." := StrategyWorkplanLines."Imported Annual Budget Est.";
                StrategyWorkplanLines1."Primary Department" := StrategyWorkplanLines."Primary Department";
                StrategyWorkplanLines1."Primary Department Name" := StrategyWorkplanLines."Primary Department Name";
                StrategyWorkplanLines1."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                StrategyWorkplanLines1."Primary Directorate Name" := StrategyWorkplanLines."Primary Directorate Name";
                StrategyWorkplanLines1."Q1 Target" := StrategyWorkplanLines."Q1 Target";
                StrategyWorkplanLines1."Q1 Budget" := StrategyWorkplanLines."Q1 Budget";
                StrategyWorkplanLines1."Q2 Target" := StrategyWorkplanLines."Q2 Target";
                StrategyWorkplanLines1."Q2 Budget" := StrategyWorkplanLines."Q2 Budget";
                StrategyWorkplanLines1."Q3 Target" := StrategyWorkplanLines."Q3 Target";
                StrategyWorkplanLines1."Q3 Budget" := StrategyWorkplanLines."Q3 Budget";
                StrategyWorkplanLines1."Q4 Target" := StrategyWorkplanLines."Q4 Target";
                StrategyWorkplanLines1."Q4 Budget" := StrategyWorkplanLines."Q4 Budget";
                StrategyWorkplanLines1."Entry Type" := StrategyWorkplanLines."Entry Type";
                StrategyWorkplanLines1."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                StrategyWorkplanLines1."Perfomance Indicator" := Format(StrategyWorkplanLines."Perfomance Indicator");
                StrategyWorkplanLines1."Source Of Fund" := StrategyWorkplanLines."Source Of Fund";
                StrategyWorkplanLines1."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                StrategyWorkplanLines1."Desired Perfomance Direction" := StrategyWorkplanLines."Desired Perfomance Direction";
                StrategyWorkplanLines1."Strategy Framework" := StrategyWorkplanLines."Strategy Framework";
                StrategyWorkplanLines1."Framework Perspective" := StrategyWorkplanLines."Framework Perspective";
                StrategyWorkplanLines1."Key Performance Indicator" := StrategyWorkplanLines."Key Performance Indicator";
                StrategyWorkplanLines1."Assigned Weight(%)" := StrategyWorkplanLines."Assigned Weight(%)";
                StrategyWorkplanLines1."Annual Budget" := StrategyWorkplanLines."Annual Budget";
                StrategyWorkplanLines1."Annual Target" := StrategyWorkplanLines."Annual Target";
                StrategyWorkplanLines1."Total Subactivity budget" := StrategyWorkplanLines."Total Subactivity budget";
                StrategyWorkplanLines1."Departmental Activity Weight" := StrategyWorkplanLines."Departmental Activity Weight";
                StrategyWorkplanLines1.Insert(true);

                //Insert Annual Workplan Sub-Activities
                SubWorkplanActivity.Reset;
                SubWorkplanActivity.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                SubWorkplanActivity.SetRange("Activity Id", StrategyWorkplanLines."Activity ID");
                if SubWorkplanActivity.FindSet then begin
                    repeat
                        // ERROR('Testing');
                        SubWorkplanActivity1.Init;
                        SubWorkplanActivity1."Workplan No." := TargetAnnualWorkPlan;
                        SubWorkplanActivity1."Initiative No." := SubWorkplanActivity."Initiative No.";
                        SubWorkplanActivity1."Activity Id" := SubWorkplanActivity."Activity Id";
                        SubWorkplanActivity1."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                        SubWorkplanActivity1."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                        SubWorkplanActivity1."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                        SubWorkplanActivity1."Imported Annual Target Qty" := SubWorkplanActivity."Imported Annual Target Qty";
                        SubWorkplanActivity1.Weight := SubWorkplanActivity.Weight;
                        SubWorkplanActivity1."Total Budget" := SubWorkplanActivity."Total Budget";
                        SubWorkplanActivity1."Due Date" := SubWorkplanActivity."Due Date";
                        SubWorkplanActivity1."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                        if SubWorkplanActivity1.Insert = true then begin
                            //work plan cost elements
                            // WorkplanCostElements.Reset;
                            // WorkplanCostElements.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                            // WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                            // WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                            // if WorkplanCostElements.FindSet then begin
                            //     repeat
                            //         // WorkplanCostElements.TESTFIELD("Plan Item No");
                            //         /*WorkplanCostElements.TESTFIELD("Unit Cost");
                            //         WorkplanCostElements.TESTFIELD(Quantity);
                            //         WorkplanCostElements.TESTFIELD(Amount);*/// to be uncommented in future

                            //         WorkplanCostElement1.Init;
                            //         WorkplanCostElement1."Workplan No." := TargetAnnualWorkPlan;
                            //         WorkplanCostElement1."Activity Id" := WorkplanCostElements."Activity Id";
                            //         WorkplanCostElement1."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                            //         WorkplanCostElement1."Initiative No." := WorkplanCostElements."Initiative No.";
                            //         WorkplanCostElement1.TransferFields(WorkplanCostElements, false);
                            //         WorkplanCostElement1."Functional Procurment Plan No" := AnnualStrategyWorkplan."Functional Procurment Plan No";
                            //         WorkplanCostElement1."Prevously RequestedQuantity" := WorkplanCostElements.Quantity;
                            //         WorkplanCostElement1."Prevously Requested Unit Cost" := WorkplanCostElements."Unit Cost";
                            //         WorkplanCostElement1."Prevously Requested Amount" := WorkplanCostElements.Amount;
                            //         WorkplanCostElement1.Insert;
                            //     until WorkplanCostElements.Next = 0;
                            // end;
                        end;
                    until SubWorkplanActivity.Next = 0;
                end;
            until StrategyWorkplanLines.Next = 0;
        end;
        //Insert Board Activities
        BoardActivities.Reset;
        BoardActivities.SetRange("AWP No", AnnualStrategyWorkplan.No);
        if BoardActivities.FindSet then begin
            repeat
                BoardActivities1.Init;
                BoardActivities1."AWP No" := TargetAnnualWorkPlan;
                BoardActivities1."Board Activity Code" := BoardActivities."Board Activity Code";
                BoardActivities1."Activity Code" := BoardActivities."Activity Code";
                BoardActivities1."Board Activity Description" := BoardActivities."Board Activity Description";
                BoardActivities1."Activity Description" := BoardActivities."Activity Description";
                BoardActivities1."Unit of Measure" := BoardActivities."Unit of Measure";
                BoardActivities1."WT(%)" := BoardActivities."WT(%)";
                BoardActivities1.Target := BoardActivities.Target;
                BoardActivities1."Framework Perspective" := BoardActivities."Framework Perspective";
                BoardActivities1."Strategy Framework" := BoardActivities."Strategy Framework";
                BoardActivities1."Achieved Target" := BoardActivities."Achieved Target";
                //BoardActivities1."Outcome Performance Indicator":=BoardActivities."Outcome Performance Indicator";
                //BoardActivities1."Previous Annual Target Qty":=BoardActivities."Previous Annual Target Qty";
                if BoardActivities1.Insert = true then begin
                    //Insert Board sub-Activities
                    BoardSubActivities.Reset;
                    BoardSubActivities.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                    BoardSubActivities.SetRange("Initiative No.", BoardActivities."Board Activity Code");
                    BoardSubActivities.SetRange("Activity Id", BoardActivities."Activity Code");
                    if BoardSubActivities.FindSet then begin
                        repeat
                            BoardSubActivities1.Init;
                            BoardSubActivities1."Workplan No." := TargetAnnualWorkPlan;
                            BoardSubActivities1."Initiative No." := BoardSubActivities."Initiative No.";
                            BoardSubActivities1."Activity Id" := BoardSubActivities."Activity Id";
                            BoardSubActivities1."Entry Number" := BoardSubActivities."Entry Number";
                            BoardSubActivities1."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                            BoardSubActivities1."Initiative Type" := BoardSubActivities."Initiative Type";
                            BoardSubActivities1."Task Type" := BoardSubActivities."Task Type";
                            BoardSubActivities1.Indentation := BoardSubActivities.Indentation;
                            BoardSubActivities1."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                            BoardSubActivities1."Year Reporting Code" := BoardSubActivities."Year Reporting Code";
                            BoardSubActivities1."Start Date" := BoardSubActivities."Start Date";
                            BoardSubActivities1."Due Date" := BoardSubActivities."Due Date";
                            BoardSubActivities1."Primary Department" := BoardSubActivities."Primary Department";
                            BoardSubActivities1."Primary Directorate" := BoardSubActivities."Primary Directorate";
                            BoardSubActivities1."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                            BoardSubActivities1."Q1 Target Qty" := BoardSubActivities."Q1 Target Qty";
                            BoardSubActivities1."Q2 Target Qty" := BoardSubActivities."Q2 Target Qty";
                            BoardSubActivities1."Q3 Target Qty" := BoardSubActivities."Q3 Target Qty";
                            BoardSubActivities1."Q4 Target Qty" := BoardSubActivities."Q4 Target Qty";
                            BoardSubActivities1."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                            BoardSubActivities1."Sub Targets" := BoardSubActivities."Sub Targets";
                        until BoardSubActivities.Next = 0;
                    end;
                end;
            until BoardActivities.Next = 0;
        end;

        AnnualStrategyWorkplan.Posted := true;
        AnnualStrategyWorkplan.Modify;
        Message('Annual Workplan Updated Successfully!');
    end;

    // procedure FnSumSubActivityAmount(SubWorkplanActivity: Record "Sub Workplan Activity")
    // var
    //     WorkplanCostElements: Record "Workplan Cost Elements";
    // begin
    //     WorkplanCostElements.Reset;
    //     WorkplanCostElements.SetRange("Workplan No.", SubWorkplanActivity."Workplan No.");
    //     WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
    //     WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
    //     WorkplanCostElements.CalcSums(Amount);
    //     SubWorkplanActivity."Total Budget" := WorkplanCostElements.Amount;
    //     SubWorkplanActivity.Modify;
    // end;


    procedure FnSumActivityAmount(StrategyWorkplanLines: Record "Strategy Workplan Lines")
    var
        SubWorkplanActivity: Record "Sub Workplan Activity";
    begin
        SubWorkplanActivity.Reset;
        SubWorkplanActivity.SetRange("Workplan No.", StrategyWorkplanLines.No);
        SubWorkplanActivity.SetRange("Activity Id", StrategyWorkplanLines."Activity ID");
        SubWorkplanActivity.CalcSums("Total Budget");
        StrategyWorkplanLines."Total Subactivity budget" := SubWorkplanActivity."Total Budget";
        StrategyWorkplanLines.Modify;
    end;


    procedure FnCopyFunctionallWorkplanReview(AnnualStrategyWorkplan: Record "Annual Strategy Workplan"; TargetAnnualWorkPlan: Code[30]; Directorate: Code[30]; Department: Code[30])
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        StrategyWorkplanLines1: Record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
        // WorkplanCostElements: Record "Workplan Cost Elements";
        // WorkplanCostElement1: Record "Workplan Cost Elements";
        AnnualStrategyWorkplan1: Record "Annual Strategy Workplan";
    begin

        AnnualStrategyWorkplan.TestField("Annual Workplan");
        AnnualStrategyWorkplan.TestField("Functional Procurment Plan No");
        //AnnualStrategyWorkplan.TESTFIELD("Approval Status",AnnualStrategyWorkplan."Approval Status"::Released);

        AnnualStrategyWorkplan.TestField("Annual Workplan");
        //AnnualStrategyWorkplan.TESTFIELD(Posted, TRUE);
        AnnualStrategyWorkplan.CalcFields("Total Assigned Weight(%)");
        //IF AnnualStrategyWorkplan."Total Assigned Weight(%)"<>100 THEN
        //   ERROR('Assigned Weight should be equals to 100%');


        //Insert Header
        /*AnnualStrategyWorkplan1.INIT;
        AnnualStrategyWorkplan1."Annual Strategy Type":=AnnualStrategyWorkplan."Annual Strategy Type";
        AnnualStrategyWorkplan1.No:=TargetAnnualWorkPlan;
        AnnualStrategyWorkplan1.VALIDATE(No);
        AnnualStrategyWorkplan1.TRANSFERFIELDS(AnnualStrategyWorkplan,FALSE);
        AnnualStrategyWorkplan1."Approval Status":=AnnualStrategyWorkplan."Approval Status"::Open;
        AnnualStrategyWorkplan1.Posted:=FALSE;
        AnnualStrategyWorkplan1.INSERT;*/

        //Insert Strategy Workplan Lines
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange(No, AnnualStrategyWorkplan."Alligned Wishlist Temp");
        StrategyWorkplanLines.SetRange("Primary Department", AnnualStrategyWorkplan.Department);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                StrategyWorkplanLines.TestField("Primary Directorate");
                StrategyWorkplanLines.TestField("Primary Department");

                StrategyWorkplanLines1.Init;
                StrategyWorkplanLines1.No := TargetAnnualWorkPlan;
                StrategyWorkplanLines1."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                StrategyWorkplanLines1."Activity ID" := StrategyWorkplanLines."Activity ID";
                StrategyWorkplanLines1.Description := StrategyWorkplanLines.Description;
                StrategyWorkplanLines1."Cross Cutting" := StrategyWorkplanLines."Cross Cutting";
                StrategyWorkplanLines1."Imported Annual Target Qty" := StrategyWorkplanLines."Imported Annual Target Qty";
                StrategyWorkplanLines1."Imported Annual Budget Est." := StrategyWorkplanLines."Imported Annual Budget Est.";
                StrategyWorkplanLines1."Primary Department" := StrategyWorkplanLines."Primary Department";
                StrategyWorkplanLines1."Primary Department Name" := StrategyWorkplanLines."Primary Department Name";
                StrategyWorkplanLines1."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                StrategyWorkplanLines1."Primary Directorate Name" := StrategyWorkplanLines."Primary Directorate Name";
                StrategyWorkplanLines1."Q1 Target" := StrategyWorkplanLines."Q1 Target";
                StrategyWorkplanLines1."Q1 Budget" := StrategyWorkplanLines."Q1 Budget";
                StrategyWorkplanLines1."Q2 Target" := StrategyWorkplanLines."Q2 Target";
                StrategyWorkplanLines1."Q2 Budget" := StrategyWorkplanLines."Q2 Budget";
                StrategyWorkplanLines1."Q3 Target" := StrategyWorkplanLines."Q3 Target";
                StrategyWorkplanLines1."Q3 Budget" := StrategyWorkplanLines."Q3 Budget";
                StrategyWorkplanLines1."Q4 Target" := StrategyWorkplanLines."Q4 Target";
                StrategyWorkplanLines1."Q4 Budget" := StrategyWorkplanLines."Q4 Budget";
                StrategyWorkplanLines1."Entry Type" := StrategyWorkplanLines."Entry Type";
                StrategyWorkplanLines1."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                StrategyWorkplanLines1."Perfomance Indicator" := Format(StrategyWorkplanLines."Perfomance Indicator");
                StrategyWorkplanLines1."Source Of Fund" := StrategyWorkplanLines."Source Of Fund";
                StrategyWorkplanLines1."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                StrategyWorkplanLines1."Desired Perfomance Direction" := StrategyWorkplanLines."Desired Perfomance Direction";
                StrategyWorkplanLines1."Strategy Framework" := StrategyWorkplanLines."Strategy Framework";
                StrategyWorkplanLines1."Framework Perspective" := StrategyWorkplanLines."Framework Perspective";
                StrategyWorkplanLines1."Key Performance Indicator" := StrategyWorkplanLines."Key Performance Indicator";
                StrategyWorkplanLines1."Assigned Weight(%)" := StrategyWorkplanLines."Assigned Weight(%)";
                StrategyWorkplanLines1."Annual Budget" := StrategyWorkplanLines."Annual Budget";
                StrategyWorkplanLines1."Annual Target" := StrategyWorkplanLines."Annual Target";
                StrategyWorkplanLines1."Total Subactivity budget" := StrategyWorkplanLines."Total Subactivity budget";
                StrategyWorkplanLines1."Departmental Activity Weight" := StrategyWorkplanLines."Departmental Activity Weight";
                StrategyWorkplanLines1.Insert(true);

                //Insert Annual Workplan Sub-Activities
                SubWorkplanActivity.Reset;
                SubWorkplanActivity.SetRange("Workplan No.", StrategyWorkplanLines.No);
                SubWorkplanActivity.SetRange("Activity Id", StrategyWorkplanLines."Activity ID");
                if SubWorkplanActivity.FindSet then begin
                    repeat
                        // ERROR('Testing');
                        SubWorkplanActivity1.Init;
                        SubWorkplanActivity1."Workplan No." := TargetAnnualWorkPlan;
                        SubWorkplanActivity1."Initiative No." := SubWorkplanActivity."Initiative No.";
                        SubWorkplanActivity1."Activity Id" := SubWorkplanActivity."Activity Id";
                        SubWorkplanActivity1."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                        SubWorkplanActivity1."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                        SubWorkplanActivity1."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                        SubWorkplanActivity1."Imported Annual Target Qty" := SubWorkplanActivity."Imported Annual Target Qty";
                        SubWorkplanActivity1.Weight := SubWorkplanActivity.Weight;
                        SubWorkplanActivity1."Total Budget" := SubWorkplanActivity."Total Budget";
                        SubWorkplanActivity1."Due Date" := SubWorkplanActivity."Due Date";
                        SubWorkplanActivity1."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                        if SubWorkplanActivity1.Insert = true then begin
                            //work plan cost elements
                            // WorkplanCostElements.Reset;
                            // WorkplanCostElements.SetRange("Workplan No.", SubWorkplanActivity."Workplan No.");
                            // WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                            // WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                            // if WorkplanCostElements.FindSet then begin
                            //     repeat
                            //         // WorkplanCostElements.TESTFIELD("Plan Item No");
                            //         /*WorkplanCostElements.TESTFIELD("Unit Cost");
                            //         WorkplanCostElements.TESTFIELD(Quantity);
                            //         WorkplanCostElements.TESTFIELD(Amount);*/// to be uncommented in future

                            //         WorkplanCostElement1.Init;
                            //         WorkplanCostElement1."Workplan No." := TargetAnnualWorkPlan;
                            //         WorkplanCostElement1."Activity Id" := WorkplanCostElements."Activity Id";
                            //         WorkplanCostElement1."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                            //         WorkplanCostElement1."Initiative No." := WorkplanCostElements."Initiative No.";
                            //         WorkplanCostElement1.TransferFields(WorkplanCostElements, false);
                            //         WorkplanCostElement1."Functional Procurment Plan No" := AnnualStrategyWorkplan."Functional Procurment Plan No";
                            //         WorkplanCostElement1.Insert;
                            //     until WorkplanCostElements.Next = 0;
                            // end;
                        end;
                    until SubWorkplanActivity.Next = 0;
                end;
            until StrategyWorkplanLines.Next = 0;
        end;
        //Insert Board Activities
        BoardActivities.Reset;
        BoardActivities.SetRange("AWP No", AnnualStrategyWorkplan."Alligned Wishlist Temp");
        BoardActivities.SetRange("Primary Department", AnnualStrategyWorkplan.Department);
        if BoardActivities.FindSet then begin
            repeat
                BoardActivities1.Init;
                BoardActivities1."AWP No" := TargetAnnualWorkPlan;
                BoardActivities1."Board Activity Code" := BoardActivities."Board Activity Code";
                BoardActivities1."Activity Code" := BoardActivities."Activity Code";
                BoardActivities1."Board Activity Description" := BoardActivities."Board Activity Description";
                BoardActivities1."Activity Description" := BoardActivities."Activity Description";
                BoardActivities1."Unit of Measure" := BoardActivities."Unit of Measure";
                BoardActivities1."WT(%)" := BoardActivities."WT(%)";
                BoardActivities1.Target := BoardActivities.Target;
                BoardActivities1."Framework Perspective" := BoardActivities."Framework Perspective";
                BoardActivities1."Strategy Framework" := BoardActivities."Strategy Framework";
                BoardActivities1."Achieved Target" := BoardActivities."Achieved Target";
                //BoardActivities1."Outcome Performance Indicator":=BoardActivities."Outcome Performance Indicator";
                //BoardActivities1."Previous Annual Target Qty":=BoardActivities."Previous Annual Target Qty";
                if BoardActivities1.Insert = true then begin
                    //Insert Board sub-Activities
                    BoardSubActivities.Reset;
                    BoardSubActivities.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                    BoardSubActivities.SetRange("Initiative No.", BoardActivities."Board Activity Code");
                    BoardSubActivities.SetRange("Activity Id", BoardActivities."Activity Code");
                    if BoardSubActivities.FindSet then begin
                        repeat
                            BoardSubActivities1.Init;
                            BoardSubActivities1."Workplan No." := TargetAnnualWorkPlan;
                            BoardSubActivities1."Initiative No." := BoardSubActivities."Initiative No.";
                            BoardSubActivities1."Activity Id" := BoardSubActivities."Activity Id";
                            BoardSubActivities1."Entry Number" := BoardSubActivities."Entry Number";
                            BoardSubActivities1."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                            BoardSubActivities1."Initiative Type" := BoardSubActivities."Initiative Type";
                            BoardSubActivities1."Task Type" := BoardSubActivities."Task Type";
                            BoardSubActivities1.Indentation := BoardSubActivities.Indentation;
                            BoardSubActivities1."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                            BoardSubActivities1."Year Reporting Code" := BoardSubActivities."Year Reporting Code";
                            BoardSubActivities1."Start Date" := BoardSubActivities."Start Date";
                            BoardSubActivities1."Due Date" := BoardSubActivities."Due Date";
                            BoardSubActivities1."Primary Department" := BoardSubActivities."Primary Department";
                            BoardSubActivities1."Primary Directorate" := BoardSubActivities."Primary Directorate";
                            BoardSubActivities1."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                            BoardSubActivities1."Q1 Target Qty" := BoardSubActivities."Q1 Target Qty";
                            BoardSubActivities1."Q2 Target Qty" := BoardSubActivities."Q2 Target Qty";
                            BoardSubActivities1."Q3 Target Qty" := BoardSubActivities."Q3 Target Qty";
                            BoardSubActivities1."Q4 Target Qty" := BoardSubActivities."Q4 Target Qty";
                            BoardSubActivities1."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                            BoardSubActivities1."Sub Targets" := BoardSubActivities."Sub Targets";
                        until BoardSubActivities.Next = 0;
                    end;
                end;
            until BoardActivities.Next = 0;
        end;

        AnnualStrategyWorkplan.Posted := true;
        AnnualStrategyWorkplan.Modify;

    end;


    procedure FnSuggestNotFunded(AnnualStrategyWorkplan: Record "Annual Strategy Workplan"; TargetAnnualWorkPlan: Code[30])
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        StrategyWorkplanLines1: Record "Strategy Workplan Lines";
        BoardActivities: Record "Board Activities";
        BoardActivities1: Record "Board Activities";
        BoardSubActivities: Record "Board Sub Activities";
        BoardSubActivities1: Record "Board Sub Activities";
        SubWorkplanActivity: Record "Sub Workplan Activity";
        SubWorkplanActivity1: Record "Sub Workplan Activity";
        // WorkplanCostElements: Record "Workplan Cost Elements";
        // WorkplanCostElement1: Record "Workplan Cost Elements";
        AnnualStrategyWorkplan1: Record "Annual Strategy Workplan";
        SubWorkplanActivity2: Record "Sub Workplan Activity";
        // WorkplanCostElement2: Record "Workplan Cost Elements";
        StrategyWorkplanLines3: Record "Strategy Workplan Lines";
        SubWorkplanActivity3: Record "Sub Workplan Activity";
        Counting: Integer;
    // WorkplanCostElementsBuffer: Record "Workplan Cost Elements Buffer";
    begin


        //Insert Strategy Workplan Lines
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange(No, AnnualStrategyWorkplan."Workplan No");
        StrategyWorkplanLines.SetRange("Primary Department", AnnualStrategyWorkplan.Department);
        if StrategyWorkplanLines.FindSet then begin
            repeat

                //StrategyWorkplanLines.TESTFIELD("Primary Directorate");
                //StrategyWorkplanLines.TESTFIELD("Primary Department");

                SubWorkplanActivity.Reset;
                SubWorkplanActivity.SetRange("Workplan No.", StrategyWorkplanLines.No);
                SubWorkplanActivity.SetRange("Activity Id", StrategyWorkplanLines."Activity ID");
                if SubWorkplanActivity.FindSet then begin
                    // repeat

                    //     //----------------------------------------------------------------------------------------------------
                    //     WorkplanCostElements.Reset;
                    //     WorkplanCostElements.SetRange("Workplan No.", SubWorkplanActivity."Workplan No.");
                    //     WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                    //     WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                    //     WorkplanCostElements.SetRange("Funding Level", WorkplanCostElements."funding level"::Fully);
                    //     if WorkplanCostElements.FindSet then begin
                    //         repeat
                    //             WorkplanCostElementsBuffer.Init;
                    //             WorkplanCostElementsBuffer."Workplan No." := AnnualStrategyWorkplan.No;
                    //             WorkplanCostElementsBuffer."Activity Id" := WorkplanCostElements."Activity Id";
                    //             WorkplanCostElementsBuffer."Sub Activity No" := WorkplanCostElements."Sub Activity No";
                    //             WorkplanCostElementsBuffer."Initiative No." := WorkplanCostElements."Initiative No.";
                    //             WorkplanCostElementsBuffer.TransferFields(WorkplanCostElements, false);
                    //             WorkplanCostElementsBuffer.Insert;

                    //             WorkplanCostElement1.Reset;
                    //             WorkplanCostElement1.SetRange("Workplan No.", AnnualStrategyWorkplan.No);
                    //             WorkplanCostElement1.SetRange("Activity Id", WorkplanCostElements."Activity Id");
                    //             WorkplanCostElement1.SetRange("Sub Activity No", WorkplanCostElements."Sub Activity No");
                    //             WorkplanCostElement1.SetRange("Initiative No.", WorkplanCostElements."Initiative No.");
                    //             WorkplanCostElement1.DeleteAll;

                    //             WorkplanCostElement2.Init;
                    //             WorkplanCostElement2.TransferFields(WorkplanCostElementsBuffer);
                    //             WorkplanCostElement2.Insert;
                    //         until WorkplanCostElements.Next = 0;
                    //     end;

                    // //------------------------------------------------------------------------------
                    // until SubWorkplanActivity.Next = 0;
                end;
            until StrategyWorkplanLines.Next = 0;
        end;

        /*
        SubWorkplanActivity2.RESET;
        SubWorkplanActivity2.SETRANGE("Workplan No.",TargetAnnualWorkPlan);
        IF SubWorkplanActivity2.FINDSET THEN BEGIN
        REPEAT
        WorkplanCostElement2.RESET;
        WorkplanCostElement2.SETRANGE("Workplan No.",TargetAnnualWorkPlan);
        WorkplanCostElement2.SETRANGE("Activity Id",SubWorkplanActivity2."Activity Id");
        WorkplanCostElement2.SETRANGE("Sub Activity No",SubWorkplanActivity2."Sub Initiative No.");
        CountInt:=WorkplanCostElement2.COUNT;
        IF CountInt=0 THEN BEGIN
        SubWorkplanActivity2.DELETE;
        END;
        UNTIL SubWorkplanActivity2.NEXT=0;
        END;
        
        
        
        StrategyWorkplanLines3.RESET;
        StrategyWorkplanLines3.SETRANGE(No,TargetAnnualWorkPlan);
        StrategyWorkplanLines3.SETRANGE("Cross Cutting",FALSE);
        IF StrategyWorkplanLines3.FINDSET THEN BEGIN
        REPEAT
        SubWorkplanActivity3.RESET;
        SubWorkplanActivity3.SETRANGE("Workplan No.",TargetAnnualWorkPlan);
        SubWorkplanActivity3.SETRANGE("Activity Id",StrategyWorkplanLines3."Activity ID");
        SubWorkplanActivity3.SETRANGE("Strategy Plan ID",StrategyWorkplanLines3."Strategy Plan ID");
        Counting:=SubWorkplanActivity3.COUNT;
        IF Counting=0 THEN BEGIN
        StrategyWorkplanLines3.DELETE;
        END;
        UNTIL StrategyWorkplanLines3.NEXT=0;
        END;
        */
        //AnnualStrategyWorkplan.Posted:=TRUE;
        //AnnualStrategyWorkplan.MODIFY;

    end;
}

