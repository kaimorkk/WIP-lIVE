

page 80153 "Group Appraisal-Sub"
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
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Mgt Plan ID field.';
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Task ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Start Date field.';
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation End Date field.';
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Template ID field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Designation field.';
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Grade field.';
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Staff No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Competency Template ID field.';
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the General Assessment Template ID field.';
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Objective & Outcome Weight % field.';
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Competency Weight % field.';
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Weight % field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Performance Rating Scale field.';
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Proficiency Rating Scale field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            part("Objectives and Outcomes"; "Group Objective && Outcome-Sub")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
            part(Control39; "Group Proficiency-Submitted")
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
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Close Appraisal")
            {
                ApplicationArea = Basic;
                Image = Close;
                ToolTip = 'Executes the Close Appraisal action.';
                trigger OnAction()
                begin
                    Rec.TestField(Closed, false);

                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            ObjectiveOutcome.TestField("AppraiserReview Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("AppraiserReview Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            fnPostObjectiveEntry(ObjectiveOutcome);

                            ObjectiveOutcome."Final/Actual Qty" := ObjectiveOutcome."AppraiserReview Qty";
                            Rec.Modify;
                        until ObjectiveOutcome.Next = 0;
                    end;

                    Rec.Closed := true;
                    Rec."Closed By" := UserId;
                    Rec.Modify;
                    //"Closed On":=TODAY;

                    Message('Appraisal No %1 Closed Successfully', Rec.No);
                end;
            }
            action("Print Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print Appraisal Report action.';
                trigger OnAction()
                begin
                    Message('Testing');
                end;
            }
            action("Email Apraisal Report")
            {
                ApplicationArea = Basic;
                Image = Email;
                ToolTip = 'Executes the Email Apraisal Report action.';
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
                actionref("Print Appraisal Report_Promoted"; "Print Appraisal Report")
                {
                }
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
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"360-Degree/Group Appraisal";
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

