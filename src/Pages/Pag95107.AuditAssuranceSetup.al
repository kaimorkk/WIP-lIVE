

page 95107 "Audit & Assurance Setup"
{
    PageType = Card;
    SourceTable = "Audit & Assurance Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default CAE ID"; Rec."Default CAE ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default CAE ID field.';
                }
                field("Def. Internal Audit Charter ID"; Rec."Def. Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Def. Internal Audit Charter ID field.';
                }
            }
            group("Audit & Assurance Statistics")
            {
                field("No. of Audit Plans"; Rec."No. of Audit Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Plans field.';
                }
                field("No. of Project Quality Plans"; Rec."No. of Project Quality Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Quality Plans field.';
                }
                field("No. of Audit Engagements"; Rec."No. of Audit Engagements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Engagements field.';
                }
                field("No. of Project Quality Inspect"; Rec."No. of Project Quality Inspect")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Quality Inspect field.';
                }
                field("No. of Audit Commencem Notices"; Rec."No. of Audit Commencem Notices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Commencem Notices field.';
                }
                field("No. of Auditee Notice Resps"; Rec."No. of Auditee Notice Resps")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Auditee Notice Resps field.';
                }
                field("No. of Audit Entrace Meetings"; Rec."No. of Audit Entrace Meetings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Entrace Meetings field.';
                }
                field("No. of Pre-Audit Suvy Invitati"; Rec."No. of Pre-Audit Suvy Invitati")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Pre-Audit Suvy Invitati field.';
                }
                field("No. of Pre-Audit Suvy Response"; Rec."No. of Pre-Audit Suvy Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Pre-Audit Suvy Response field.';
                }
            }
            group("No. Series")
            {
                Caption = 'No. Series';
                field("Audit Plan Nos."; Rec."Audit Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Nos. field.';
                }
                field("Audit Project Nos"; Rec."Audit Project Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Project Nos field.';
                }
                field("Project Supervision Plan Nos."; Rec."Project Supervision Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Supervision Plan Nos. field.';
                }
                field("Audit Commencement Notice Nos."; Rec."Audit Commencement Notice Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Commencement Notice Nos. field.';
                }
                field("Auditee Notice Response Nos."; Rec."Auditee Notice Response Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Notice Response Nos. field.';
                }
                field("Audit Entrace Meeting Nos."; Rec."Audit Entrace Meeting Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Entrace Meeting Nos. field.';
                }
                field("PreAudit Survey InvitationNos."; Rec."PreAudit Survey InvitationNos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PreAudit Survey InvitationNos. field.';
                }
                field("PreAudit Survey Response Nos."; Rec."PreAudit Survey Response Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PreAudit Survey Response Nos. field.';
                }
                field("Fieldwork Voucher Nos"; Rec."Fieldwork Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Voucher Nos field.';
                }
                field("Audit Exit Conference Nos"; Rec."Audit Exit Conference Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Exit Conference Nos field.';
                }
                field("Draft AUidt Report Nos"; Rec."Draft AUidt Report Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Draft AUidt Report Nos field.';
                }
                field("Final Audit Report Nos"; Rec."Final Audit Report Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Audit Report Nos field.';
                }
                field("Audit Implementation Log Nos"; Rec."Audit Implementation Log Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Implementation Log Nos field.';
                }
                field("Working Paper Nos"; Rec."Working Paper Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Working Paper Nos field.';
                }
                field("Committees No."; Rec."Committees No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committees No. field.';
                }
                field("Follow-up Audit Voucher  Nos"; Rec."Follow-up Audit Voucher  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow-up Audit Voucher  Nos field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "Audit & Assurance Setup Factbo")
            {
                Caption = 'Audit & Assurance Statistics Factbox';
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Audit Work Types")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                RunObject = Page "Audit Work Types";
                ToolTip = 'Executes the Audit Work Types action.';
            }
            action("Audit Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                RunObject = Page "Audit Templates";
                ToolTip = 'Executes the Audit Templates action.';
            }
            action("Compliance Frameworks")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Compliance Frameworks";
                ToolTip = 'Executes the Compliance Frameworks action.';
            }
            action("Audit Testing Methods")
            {
                ApplicationArea = Basic;
                Image = TestDatabase;
                RunObject = Page "Audit Testing Methods";
                ToolTip = 'Executes the Audit Testing Methods action.';
            }
            action("Audit Locations")
            {
                ApplicationArea = Basic;
                Image = Bin;
                RunObject = Page "Audit Locations";
                ToolTip = 'Executes the Audit Locations action.';
            }
            action("Audit Assurance Levels")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                RunObject = Page "Audit Assurance Levels";
                ToolTip = 'Executes the Audit Assurance Levels action.';
            }
            action("Audit Finding Rating Codes")
            {
                ApplicationArea = Basic;
                Image = Ranges;
                RunObject = Page "Audit Finding Rating Codes";
                ToolTip = 'Executes the Audit Finding Rating Codes action.';
            }
            action("Audit Opinion Types")
            {
                ApplicationArea = Basic;
                Image = OrderPromising;
                RunObject = Page "Audit Opinion Types";
                ToolTip = 'Executes the Audit Opinion Types action.';
            }
            action("Risk & Audit Officer")
            {
                ApplicationArea = Basic;
                Caption = 'Risk, Compliance & Audit Officers';
                Image = Employee;
                RunObject = Page "Risk & Audit Officers";
                ToolTip = 'Executes the Risk, Compliance & Audit Officers action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Audit Work Types_Promoted"; "Audit Work Types")
                {
                }
                actionref("Audit Templates_Promoted"; "Audit Templates")
                {
                }
                actionref("Compliance Frameworks_Promoted"; "Compliance Frameworks")
                {
                }
                actionref("Audit Testing Methods_Promoted"; "Audit Testing Methods")
                {
                }
                actionref("Audit Locations_Promoted"; "Audit Locations")
                {
                }
                actionref("Audit Assurance Levels_Promoted"; "Audit Assurance Levels")
                {
                }
                actionref("Audit Finding Rating Codes_Promoted"; "Audit Finding Rating Codes")
                {
                }
                actionref("Audit Opinion Types_Promoted"; "Audit Opinion Types")
                {
                }
                actionref("Risk & Audit Officer_Promoted"; "Risk & Audit Officer")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

