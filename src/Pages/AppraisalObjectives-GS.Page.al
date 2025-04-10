Page 52194024 "Appraisal Objectives-GS"
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
                field(AppraiseeUSERID; "Appraisee ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee USER ID';
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
                field(AppraiseesJobID; "Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job ID';
                }
                field(AppraiseesJobTitle; "Appraisee's Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseesJobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee''s Job Group';
                }
                field(DirectorateCode; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeDepartment; "Department Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Department';
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserUSERID; "Appraiser ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraiser USER ID';
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
            part(Control1000000032; "Objectives TC Financial")
            {
                Caption = 'Technical Competencies Objectives Financial';
                SubPageLink = "Employee No" = field("Employee No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Appraisal No" = field("Objective No");
            }
            part(Control1000000002; "Objectives TC Stakeholder")
            {
                Caption = 'Technical Competencies Objectives Stakeholder';
                SubPageLink = "Employee No" = field("Employee No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Appraisal No" = field("Objective No");
            }
            part(Control1000000004; "Objectives TC IBP")
            {
                Caption = 'Technical CompetenciesObjectives IBP';
                SubPageLink = "Employee No" = field("Employee No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Appraisal No" = field("Objective No");
            }
            part(Control1000000008; "Objectives TC Learning")
            {
                Caption = 'Technical Competencies Objectives Learning & Growth';
                SubPageLink = "Employee No" = field("Employee No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Appraisal No" = field("Objective No");
            }
            group(BehaviouralCompetencies)
            {
                Caption = 'Behavioural Competencies';
                part(Control1000000006; "Objectives Behavioural")
                {
                    Caption = 'Behavioural Competencies Objectives';
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period"),
                                  "Appraisal No" = field("Objective No");
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
                        //   //if ApprovalMgt.SendApprObjApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelApprObjApprovalRequest(Rec,true,true) then;
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

    trigger OnOpenPage()
    begin
        SetRange("Appraisee ID", UserId);
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

