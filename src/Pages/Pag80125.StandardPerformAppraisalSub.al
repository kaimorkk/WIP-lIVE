

page 80125 "Standard Perform Appraisal-Sub"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type" = const("Performance Appraisal"),
                            "Document Status" = const(Submitted));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Objectives and Outcomes"; "Objectives and Outcomes-Sub")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
            part(Control39; "Proficiency Evalulation-Sub")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;

                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Close Appraisal")
            {
                ApplicationArea = Basic;
                Image = Close;

                trigger OnAction()
                begin
                    Rec.TestField(Closed, false);

                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("Target Qty");
                            ObjectiveOutcome.TestField("AppraiserReview Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Target Qty");
                            ProEvaluation.TestField("AppraiserReview Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            fnPostObjectiveEntry(ObjectiveOutcome);


                        until ObjectiveOutcome.Next = 0;
                    end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome."Final/Actual Qty" := ObjectiveOutcome."AppraiserReview Qty";
                            ObjectiveOutcome.Modify;
                        until ObjectiveOutcome.Next = 0;
                    end;


                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation."Final/Actual Qty" := ProEvaluation."AppraiserReview Qty";
                            ProEvaluation.Modify;
                        until ProEvaluation.Next = 0;
                    end;

                    Rec.Closed := true;
                    Rec."Closed By" := UserId;
                    Rec.Modify;
                    //"Closed On":=TODAY;

                    Message('Appraisal No %1 Closed Successfully', Rec.No);
                end;
            }
            separator(Action44)
            {
            }
            action("Print Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80016, true, true, Rec)
                end;
            }
            separator(Action40)
            {
            }
            action("Email Apraisal Report")
            {
                ApplicationArea = Basic;
                Image = Email;

                trigger OnAction()
                begin
                    Message('Email');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Close Appraisal_Promoted"; "Close Appraisal")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Email Apraisal Report_Promoted"; "Email Apraisal Report")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Print Appraisal Report_Promoted"; "Print Appraisal Report")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Standard Appraisal/Supervisor Score Only";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
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
        ReviewPeriods: Record "Review Periods";

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
                            if Rec.Find('-') then begin
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
                            if Rec.Find('-') then begin
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
                            if Rec.Find('-') then begin
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
}

#pragma implicitwith restore

