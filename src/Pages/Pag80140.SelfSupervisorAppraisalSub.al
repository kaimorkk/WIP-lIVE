

page 80140 "Self-Supervisor Appraisal-Sub"
{
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
                }
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
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
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("2nd Supervisor Staff No."; Rec."2nd Supervisor Staff No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 2nd Supervisor Staff No. field.';
                }
                field("2nd Supervisor Staff Name"; Rec."2nd Supervisor Staff Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 2nd Supervisor Staff Name field.';
                }
                field("2nd Supervisor Remarks"; Rec."2nd Supervisor Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 2nd Supervisor Remarks field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
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
                    Visible = false;
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Objective Weight"; Rec."Objective Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Objective Weight field.';
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Values Weight"; Rec."Values Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Values Weight field.';
                }
                field("Performance Objectives Grade"; Rec.GetPerformanceGrade(Rec."Performance Rating Scale", Rec."Objective Weight"))
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Values Grade"; Rec.GetPerformanceGrade(Rec."Proficiency Rating Scale", Rec."Values Weight"))
                {
                    Editable = false;
                    ApplicationArea = All;
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
                }
            }

            group(History)
            {
                Editable = false;
                field("Previous Year Reporting Code"; Rec."Previous Year Reporting Code")
                {
                    ApplicationArea = All;
                }
                field("Previous Year Total Score"; Rec."Previous Year Total Score")
                {
                    ApplicationArea = All;
                }
            }
            part("Objectives and Outcomes"; "Objectives and Outcomes-Self S")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
            part(Control39; "Proficiency Evalulation-Self S")
            {
                SubPageLink = "Performance Evaluation ID" = field(No);
                ApplicationArea = Basic;
            }
            part(Control391; "Training Gaps")
            {
                SubPageLink = "Appraisal No" = field(No);
                ApplicationArea = Basic;
            }
            part(Control392; "Appraisal Award Recommend")
            {
                SubPageLink = "Appraisal No" = field(No);
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
                            ObjectiveOutcome.TestField("Self-Review Qty");
                            ObjectiveOutcome.TestField("AppraiserReview Qty");
                        until ObjectiveOutcome.Next = 0;
                    end;

                    ProEvaluation.Reset;
                    ProEvaluation.SetRange("Performance Evaluation ID", Rec.No);
                    if ProEvaluation.Find('-') then begin
                        repeat
                            ProEvaluation.TestField("Self-Review Qty");
                            ProEvaluation.TestField("AppraiserReview Qty");
                        until ProEvaluation.Next = 0;
                    end;


                    ObjectiveOutcome.Reset;
                    ObjectiveOutcome.SetRange("Performance Evaluation ID", Rec.No);
                    if ObjectiveOutcome.Find('-') then begin
                        repeat
                            //  StrategicPlanning.PostBudgetReallocations(ObjectiveOutcome);

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

                trigger OnAction()
                begin
                    Message('Testing');
                end;
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
        Rec."Evaluation Type" := Rec."evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Performance Appraisal";
        Rec."Evaluation Type" := Rec."evaluation type"::"Self-Appraisal with Supervisor Score";
    end;

    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        StrategicPlanning: Codeunit KasnebFunctions;

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
}

#pragma implicitwith restore

