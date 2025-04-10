

page 69601 "Position Card"
{
    PageType = Card;
    SourceTable = "Company Positions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary/Job Purpose"; Rec."Executive Summary/Job Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Position Details")
            {
                Caption = 'Position Details';
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service"; Rec."Default Terms of Service")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Importance = Additional;
                }
                field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Academic Hierarchy Code"; Rec."Academic Hierarchy Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Minimum Work Experience"; Rec."Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Default Duty Station"; Rec."Default Duty Station")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Direct Hire Unit Cost"; Rec."Direct Hire Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Cadre Type"; Rec."Cadre Type")
                {
                    ApplicationArea = Basic;
                }
                field("Average Monthly Salary (LCY)"; Rec."Average Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Minimum Gross  Monthly Salary (LCY)';
                }
                field("Maximum Monthly Salary (LCY)"; Rec."Maximum Monthly Salary (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maximum Gross  Monthly Salary (LCY)';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part(Control50; "Position Responsibilities")
            {
                Caption = 'Duties & Responsibilities';
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const(Responsibility);
                ApplicationArea = Basic;
            }
            part(Control46; "Position Responsibilities")
            {
                Caption = 'Job Dimensions';
                SubPageLink = "Position ID" = field("Position ID"),
                              Type = const("Job Dimensions");
                ApplicationArea = Basic;
            }
            part(Control45; "General Work Conditions")
            {
                SubPageLink = "Position ID" = field("Position ID");
                ApplicationArea = Basic;
            }
            group("Special Work Conditions")
            {
                field("Travel Frequency"; Rec."Travel Frequency")
                {
                    ApplicationArea = Basic;
                }
                field("Default Work Shift"; Rec."Default Work Shift")
                {
                    ApplicationArea = Basic;
                }
                field("Work Shift Description"; Rec."Work Shift Description")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Responsibilities"; Rec."Additional Responsibilities")
                {
                    ApplicationArea = Basic;
                }
                field("Loc Relocation/Transfers"; Rec."Loc Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                }
                field("Int Relocation/Transfers"; Rec."Int Relocation/Transfers")
                {
                    ApplicationArea = Basic;
                }
                field("Qualifies for Overtime"; Rec."Qualifies for Overtime")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control21; "Position Factbox")
            {
                ApplicationArea = Basic;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(69600),
                              "No." = field("Position ID");
            }

        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                RunObject = Page "Academic Qualifications";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                RunObject = Page "Professional Qualificationss";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                RunObject = Page "Skills & Competencies";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = UserCertificate;
                RunObject = Page Experience;
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Ethics & Integrity")
            {
                ApplicationArea = Basic;
                Image = InteractionLog;
                RunObject = Page "Ethics & Integrity";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Physical Attributes")
            {
                ApplicationArea = Basic;
                Image = PhysicalInventory;
                RunObject = Page "Physical Attributes";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Position Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                RunObject = Page "General Work Conditions";
                RunPageLink = "Position ID" = field("Position ID");
                Visible = false;
            }
            action("Professional Bodies")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                RunObject = Page "Professional Bodies";
                RunPageLink = "Position ID" = field("Position ID");
            }
            action("Position Targets")
            {
                ApplicationArea = Basic;
                Image = Track;
                RunObject = Page "Position Targets";
                RunPageLink = "Position Code" = field("Position ID");
            }
        }
        area(navigation)
        {

            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;

                    trigger OnAction()
                    begin
                        Rec.SetRange("Position ID", Rec."Position ID");
                        Report.Run(69602, true, false, Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                separator(Action1000000043)
                {
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Academic Qualifications_Promoted"; "Academic Qualifications")
                {
                }
                actionref("Professional Qualifications_Promoted"; "Professional Qualifications")
                {
                }
                actionref("Skills & Competencies_Promoted"; "Skills & Competencies")
                {
                }
                actionref(Experience_Promoted; Experience)
                {
                }
                actionref("Ethics & Integrity_Promoted"; "Ethics & Integrity")
                {
                }
                actionref("Physical Attributes_Promoted"; "Physical Attributes")
                {
                }
                actionref("Position Work Condition_Promoted"; "Position Work Condition")
                {
                }
                actionref("Professional Bodies_Promoted"; "Professional Bodies")
                {
                }
                actionref("Position Targets_Promoted"; "Position Targets")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Position Category" := Rec."position category"::Employee
    end;
}

#pragma implicitwith restore

