

page 95164 "Audit Plan"
{
    PageType = Card;
    SourceTable = "Audit Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit Plan Type"; Rec."Audit Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Code field.';
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Name';
                    ToolTip = 'Specifies the value of the Audit Plan Name field.';
                }
                field("Overall Purpose"; Rec."Overall Purpose")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Purpose field.';
                }
                field("Internal Audit Charter ID"; Rec."Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Charter ID field.';
                }
                field("Chief Audit Executive ID"; Rec."Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Audit Executive ID field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Datetime"; Rec."Created Datetime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Datetime field.';
                }
            }
            part("Planned Audit Engagements"; "Audit Plan Lines")
            {
                Caption = 'Planned Audit Engagements';
                SubPageLink = "Audit Plan ID" = field("Audit Plan ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = OpportunitiesList;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Overview),
                                    "Document No." = filter('AUDIT PLAN ID'));
                ToolTip = 'Executes the Overview action.';
            }
            action("Planning Objectives")
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Objective));
                ToolTip = 'Executes the Planning Objectives action.';
            }
            action("Planning Approach")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Approach));
                ToolTip = 'Executes the Planning Approach action.';
            }
            action("Create Audit Projects")
            {
                ApplicationArea = Basic;
                Image = Production;
                ToolTip = 'Executes the Create Audit Projects action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);

                    RiskManagement.FnCreateProjectsFromAuditPlanLines(Rec, AuditPlanLine, AuditTemplate, AuditTemplateDefaultRisk, AuditPlanLineTeam, AuditPlanLineLocation, AuditPlanLineObjective, AuditPlanLineRisk);
                    Message('Project(s) Created successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Canceled');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Released');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('Reopened');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Audit Plan ID", Rec."Audit Plan ID");
                    Report.Run(95012, true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Overview_Promoted; Overview)
                {
                }
                actionref("Planning Objectives_Promoted"; "Planning Objectives")
                {
                }
                actionref("Planning Approach_Promoted"; "Planning Approach")
                {
                }
                actionref("Create Audit Projects_Promoted"; "Create Audit Projects")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditPlanLine: Record "Audit Plan Line";
        AuditTemplate: Record "Audit Template";
        AuditTemplateDefaultRisk: Record "Audit Template Default Risk";
        AuditPlanLineLocation: Record "Audit Plan Line Location";
        AuditPlanLineTeam: Record "Audit Plan Line Team";
        AuditPlanLineObjective: Record "Audit PlanLine Objective";
        AuditPlanLineRisk: Record "Audit Plan Line Risk";
}

#pragma implicitwith restore

