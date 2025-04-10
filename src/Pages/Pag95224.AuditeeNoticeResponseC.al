

page 95224 "Auditee Notice Response C"
{
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Response No.';
                    ToolTip = 'Specifies the value of the Response No. field.';
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
            part("Proposed Auditee Team"; "Audit ANR Auditor Team Lines")
            {
                Caption = 'Proposed Auditee Team';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Audit Engagement Details")
            {
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
                field("Audit Lead ID"; Rec."Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Lead ID field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
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
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Overview));
                ToolTip = 'Executes the Overview action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
                ToolTip = 'Executes the Scope Exclusions action.';
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Objectives action.';
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Auditt Checklists")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Auditt Checklists action.';
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Document No.");
                ToolTip = 'Executes the Audit Locations/Sites action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Message('Posted');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Message('Printed');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = DimensionSets;
                RunObject = Page "Dimension Set Entries";
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Send Approval Request action.';
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Cancel Approval Request action.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Approvals action.';
            }
            action(Release)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Release action.';
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Reopen action.';
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
                actionref("Auditt Checklists_Promoted"; "Auditt Checklists")
                {
                }
                actionref("Audit Locations/Sites_Promoted"; "Audit Locations/Sites")
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
}

#pragma implicitwith restore

