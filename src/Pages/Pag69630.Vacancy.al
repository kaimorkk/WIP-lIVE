

page 69630 "Vacancy"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancy No.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition ID"; Rec."Requisition ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }

                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }
                field("Job Purpose"; Rec."Job Purpose")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Purpose field.';
                }

                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Justification"; Rec."Recruitment Justification")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Published"; Rec."Published")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy Status"; Rec."Vacancy Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vacancy Status field.', Comment = '%';
                }
            }
            part("Roles & Responsibilities"; "Vacancy Responsibilities")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment Start Date"; Rec."Planned Recruitment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment End Date"; Rec."Planned Recruitment End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Employment End Date"; Rec."Planned Employment End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Line Budget Cost"; Rec."Recruitment Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Cost/Hire"; Rec."Average Cost/Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Job Information")
            {
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports Name"; Rec."Hierarchically Reports Name")
                {
                    ApplicationArea = Basic;
                }
                field("Functionally  Reports To"; Rec."Functionally  Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Functionally Reports Name"; Rec."Functionally Reports Name")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Gross Salary"; Rec."Estimate Gross Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimate Gross Salary field.';
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
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Application Procedure")
            {
                field("Application Procedure 1"; Rec."Application Procedure 1")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Application Procedure 1 field.';
                }
                field("Application Procedure 2"; Rec."Application Procedure 2")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Application Procedure 2 field.';
                }
                field("Application Procedure 3"; Rec."Application Procedure 3")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Application Procedure 3 field.';
                }
                field("Application Procedure 4"; Rec."Application Procedure 4")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Application Procedure 4 field.';
                }
            }
            part("Application Procedures"; "Application Procedures")
            {
                ApplicationArea = Basic;
            }

        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }

        }
    }

    actions
    {
        area(processing)
        {
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
            separator(Action84)
            {
            }
            separator(Action85)
            {
            }
            action("Create Vacancy Announcement")
            {
                ApplicationArea = Basic;
                Image = CreateBinContent;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to create a vacancy announcement voucher?') = true then begin
                    end
                end;
            }
            action("Cancel/Terminate Recruitment")
            {
                ApplicationArea = Basic;
                Image = Cancel;

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }
            action("Close Recruitment Project")
            {
                ApplicationArea = Basic;
                Image = Close;

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    if Confirm('Are you sure yo want to publish the vacancy %1 to the E-recruitment portal', true, Rec."Document No.") = true then begin
                        Rec.Published := true;
                        Rec."Vacancy Status" := Rec."vacancy status"::Published;
                        Rec."Date Published" := Today;
                        Rec.Modify(true);
                    end
                end;
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69605, true, false, Rec);
                end;
            }
        }
        area(navigation)
        {
            group("Vacancy Details")
            {

                action("Academic Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Academic);
                }
                action("Professional Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Professional);
                }
                action("Skills & Competencies")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Skills & Competencies");
                }
                action("Experience")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Experience);
                }
                action("Ethics & Integrity")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Ethics & Integrity");
                }
                action("Physical Attributes")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Physical Attributes");
                }


                // action("Position Requirements")
                // {
                //     ApplicationArea = Basic;
                //     Image = Register;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Category7;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = true;
                //     RunObject = Page "Vacancy Requirements";
                //     RunPageLink = "Document No." = field("Document No.");
                // }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Substitutes";
                }
                // action("Position Responsibilities")
                // {
                //     ApplicationArea = Basic;
                //     Image = ReceiveLoaner;
                //     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedCategory = Category7;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = true;
                //     RunObject = Page "Vacancy Responsibilities";
                // }

                action("Duties and Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    RunObject = Page "Vacancy Responsibilities";
                    RunPageLink = "Document No." = field("Document No."), Type = filter(Responsibility);
                }
                action("Job Dimensions")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    RunObject = Page "Vacancy Responsibilities";
                    RunPageLink = "Document No." = field("Document No."), Type = filter("Job Dimensions");
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    RunObject = Page "Vacancy Work Condition";
                }
                action("Position Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BankAccountLedger;
                    RunObject = Page "Recruitment Salary Benefits";
                    RunPageLink = "Document No" = field("Document No.");
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Replan;
                    RunObject = Page "Requisition Required Documents";
                    RunPageLink = "Document No." = field("Requisition ID");
                }
            }
            group(Applications)
            {
                action("Vacancy Announcement Events")
                {
                    ApplicationArea = Basic;
                    Image = Alerts;
                }
                action("Job Applications")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action("Shortlisting History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                }
                action("Background Check Reports")
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                }
                action("Pre-hire Medical Reports")
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                }
                action("Employment Offers")
                {
                    ApplicationArea = Basic;
                    Image = NewSparkle;
                }
            }
            group(History)
            {
                action("Vacancy Posting")
                {
                    ApplicationArea = Basic;
                    Image = VendorPayment;
                    RunObject = Page "Vacancy Posting";
                    RunPageLink = "Vacancy ID" = field("Document No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

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
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Publish to E-Recruitment Portal_Promoted"; "Publish to E-Recruitment Portal")
                {
                }
                actionref("Create Vacancy Announcement_Promoted"; "Create Vacancy Announcement")
                {
                }
                actionref("Cancel/Terminate Recruitment_Promoted"; "Cancel/Terminate Recruitment")
                {
                }
                actionref("Close Recruitment Project_Promoted"; "Close Recruitment Project")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Academic Requirements_Promoted"; "Academic Requirements")
                {
                }
                actionref("Professional Requirements_Promoted"; "Professional Requirements")
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
                actionref("Duties and Responsibilities_Promoted"; "Duties and Responsibilities")
                {
                }
                actionref("Job Dimensions_Promoted"; "Job Dimensions")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Document', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
            group(Category_Category7)
            {
                actionref("Position Benefits_Promoted"; "Position Benefits")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Job Vacancy";
    end;
}

#pragma implicitwith restore

