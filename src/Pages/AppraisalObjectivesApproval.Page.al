Page 52194022 "Appraisal Objectives Approval"
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
                field(AppraiseeID; "Appraisee ID")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
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
                field(JobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateCode; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiserID; "Appraiser ID")
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
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period");
                }
                part(ObjectivesTCStakeholder; "Objectives TC Stakeholder")
                {
                    Caption = 'Objectives TC Stakeholder';
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period");
                }
                part(ObjectivesTCIBP; "Objectives TC IBP")
                {
                    Caption = 'Objectives TC IBP';
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period");
                }
                part(ObjectivesTCLearning; "Objectives TC Learning")
                {
                    Caption = 'Objectives TC Learning';
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period");
                }
            }
            group(BehaviouralCompetencies)
            {
                Caption = 'Behavioural Competencies';
                part(ObjectivesBehavioural; "Objectives Behavioural")
                {
                    Caption = 'Objectives Behavioural';
                    SubPageLink = "Employee No" = field("Employee No"),
                                  "Appraisal Period" = field("Appraisal Period");
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
                        //  //if ApprovalMgt.CancelApprObjApprovalRequest(Rec,true,true) then;
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

