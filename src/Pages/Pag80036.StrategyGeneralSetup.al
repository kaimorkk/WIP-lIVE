

page 80036 "Strategy General Setup"
{
    PageType = Card;
    SourceTable = "SPM General Setup";
    UsageCategory = Administration;
    Caption = 'General Setup';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Numbers)
            {
                field("Corp Strategic Plan Nos"; Rec."Corp Strategic Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Work Plan Nos"; Rec."Work Plan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Functional Annual Workplan Nos"; Rec."Functional Annual Workplan Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PM Plans Nos"; Rec."PM Plans Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PET Nos"; Rec."PET Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PWork Plans"; Rec."PWork Plans")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate PC No. Series"; Rec."Corporate PC No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Functional PC No. Series"; Rec."Functional PC No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Individual Scorecard Nos"; Rec."Individual Scorecard Nos")
                {
                    ApplicationArea = Basic;
                }
                field("PC Target Revision Voucher Nos"; Rec."PC Target Revision Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Performance Diary Nos"; Rec."Daily Performance Diary Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Evaluation Nos"; Rec."Performance Evaluation Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Appeals No. Series"; Rec."Performance Appeals No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Improv Review Nos"; Rec."Performance Improv Review Nos")
                {
                    ApplicationArea = Basic;
                }
                field("policy  Nos"; Rec."policy  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Revision No"; Rec."Workplan Revision No")
                {
                    ApplicationArea = Basic;
                }
                field("PLog Nos"; Rec."PLog Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Consolidation Nos"; Rec."Budget Consolidation Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Draft Workplan Cons. Nos"; Rec."Draft Workplan Cons. Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Plan Activity Nos"; Rec."Plan Activity Nos")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("AIE Nos"; Rec."AIE Nos")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Authority to Incur Expenditure number series';
                }
                field("Batch AIE Nos"; Rec."Batch AIE Nos")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Batch Authority to Incur Expenditure number series';
                }
                field("Exp. Requisition Nos"; Rec."Exp. Requisition Nos")
                {
                    ApplicationArea = ToBeClassified;
                }
                field("Budget Control Nos"; Rec."Budget Control Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Control Nos field.', Comment = '%';
                }
            }
            group(Setup)
            {
                field("AIE Journal Template"; Rec."AIE Journal Template")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Enable Performance Appeals"; Rec."Enable Performance Appeals")
                {
                    ApplicationArea = Basic;
                }
                field("Review Duration"; Rec."Review Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Review Description"; Rec."Review Description")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Based On"; Rec."Appraisal Based On")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Loading of  CSP"; Rec."Allow Loading of  CSP")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Loading of JD"; Rec."Allow Loading of JD")
                {
                    ApplicationArea = Basic;
                }
                field("AutoCons. Resource Req on Appr"; Rec."AutoCons. Resource Req on Appr")
                {
                    ApplicationArea = Basic, Suite;
                    Tooltip = 'When enabled, the resource requirements from stations will be autosubmitted and consolidated to the selected resource requirement consolidation  document';
                }
                field("AutoCons. Spend. Unit on Appr"; Rec."AutoCons. Spend. Unit on Appr")
                {
                    ApplicationArea = Basic, Suite;
                    Tooltip = 'When enabled, the draft  Workplan from spending unit will be autosubmitted and consolidated to the selected draft workplan consolidation  document';
                }
                field("Send Draft Cons JSC on Appr."; Rec."Send Draft Cons JSC on Appr.")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Create Draft Plans on Approval"; Rec."Create Draft Plans on Approval")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Commit Exp. Req. On Approval"; Rec."Commit Exp. Req. On Approval")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("PMMU Document Stage"; Rec."PMMU Document Stage")
                {
                    ApplicationArea = Basic, Suite;

                }
                field("PAS Document Stage"; Rec."PAS Document Stage")
                {
                    ApplicationArea = Basic, Suite;

                }
                field("Target Setting Start Date"; Rec."Target Setting Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Target Setting End Date"; Rec."Target Setting End Date")
                {
                    ApplicationArea = Basic, Suite;

                }
                field("Supplementary Nos"; Rec."Supplementary Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supplementary Nos field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

