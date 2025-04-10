Page 52194019 "Employee Appraisal Objectives"
{
    PageType = Card;
    SourceTable = "Employee Appraisal Objectives1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(ObjectiveNo; "Objective No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisalPeriod; "Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNoAppraisee; "Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No(Appraisee)';
                }
                field(AppraiseeName; "Appraisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeID; "Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeJobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Job Group';
                }
                field(AppraiseeJobID; "Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Job ID';
                }
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeDepartment; "Department Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Department ';
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserNo; "Appraiser No")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersName; "Appraisers Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersJobTitle; "Appraiser's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group(TechnicalCompetencies)
            {
                Caption = 'Technical Competencies';
                part(ObjectivesTCFinancial; "Objectives TC Financial")
                {
                    Caption = 'Objectives TC Financial';
                    SubPageLink = "Appraisal No" = field("Objective No");
                }
                part(ObjectivesTCStakeholder; "Objectives TC Stakeholder")
                {
                    Caption = 'Objectives TC Stakeholder';
                    SubPageLink = "Appraisal No" = field("Objective No");
                }
                part(ObjectivesTCIBP; "Objectives TC IBP")
                {
                    Caption = 'Objectives TC IBP';
                    SubPageLink = "Appraisal No" = field("Objective No");
                }
                part(ObjectivesTCLearning; "Objectives TC Learning")
                {
                    Caption = 'Objectives TC Learning';
                    SubPageLink = "Appraisal No" = field("Objective No");
                }
            }
            group(BehaviouralCompetencies)
            {
                Caption = 'Behavioural Competencies';
                part(ObjectivesBehavioural; "Objectives Behavioural")
                {
                    Caption = 'Objectives Behavioural';
                    SubPageLink = "Appraisal No" = field("Objective No");
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(AppraisalObjective)
            {
                Caption = 'Appraisal Objective';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendApprObjApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelApprObjApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        if Status = Status::Released then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}

