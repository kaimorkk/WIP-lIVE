

page 95199 "Audit Mobilization Header"
{
    Caption = 'Auditee Notice Response';
    PageType = Card;
    SourceTable = "Audit Mobilization Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Audit Commencement Notice No."; Rec."Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Commencement Notice No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part(Control7; "Audit Project Teams")
            {
                Caption = 'Proposed Auditee Team';
                SubPageLink = "Engagement ID" = field("Engagement ID"),
                              "Audit Team Type" = const("Auditee Team");
                ApplicationArea = Basic;
            }
            part(Control39; "Audit Proj Required Documents")
            {
                Caption = 'Required Documents';
                SubPageLink = "Engagement ID" = field("Engagement ID");
                ApplicationArea = Basic;
            }
            group("Audit Engagement Details")
            {
                Caption = 'Audit Engagement Details';
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Auditee Lead ID"; Rec."Auditee Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Lead ID field.';
                }
                field("Audit Lead ID"; Rec."Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Lead ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
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
                Image = AddWatch;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Overview));
                ToolTip = 'Executes the Overview action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = BinContent;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = CalculateBalanceAccount;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
                ToolTip = 'Executes the Scope Exclusions action.';
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = CalculateInventory;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Objectives action.';
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Process;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Audit Checklists")
            {
                ApplicationArea = Basic;
                Image = Zones;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Checklists action.';
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                Image = Location;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Locations/Sites action.';
            }
            action("Audit Engagement Team")
            {
                ApplicationArea = Basic;
                Image = Template;
                RunObject = Page "Audit Project Teams";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Engagement Team action.';
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = EditList;
                RunObject = Page "Audit Proj Required Documents";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Required Documents action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Submit Response';
                Image = Copy;
                ToolTip = 'Executes the Submit Response action.';
                trigger OnAction()
                begin
                    Rec.Posted := true;
                    Rec.Modify(true);
                    Message('Posted');
                    //RiskManagement.FnCopyAuditProject(Rec,AuditProjectSchedule,AuditProjectSection,AuditProjectObjective,AuditProjectProcedure,AuditProjectChecklist,AuditProjectLocation,
                    //AuditProjectTeam,AuditProjRequiredDocument);
                    //  RiskManagement.FNnotifyAuditor(Rec);
                    Message('Notified Successfully');
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
                    Rec.SetRange("Engagement ID", Rec."Engagement ID");
                    Report.Run(95016, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Dimension Set Entries";
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Overview_Promoted; Overview)
                {
                }
                actionref(Scope_Promoted; Scope)
                {
                }
                actionref("Scope Exclusions_Promoted"; "Scope Exclusions")
                {
                }
                actionref("Audit Objectives_Promoted"; "Audit Objectives")
                {
                }
                actionref("Audit Procedures_Promoted"; "Audit Procedures")
                {
                }
                actionref("Audit Checklists_Promoted"; "Audit Checklists")
                {
                }
                actionref("Audit Locations/Sites_Promoted"; "Audit Locations/Sites")
                {
                }
                actionref("Audit Engagement Team_Promoted"; "Audit Engagement Team")
                {
                }
                actionref("Required Documents_Promoted"; "Required Documents")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
}

#pragma implicitwith restore

