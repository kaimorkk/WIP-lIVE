

page 69751 "Background Checks Card"
{
    PageType = Card;
    SourceTable = "Background Checks Header";

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Panel Interview Report ID"; Rec."Panel Interview Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Interview Report ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Tax Registration(PIN)"; Rec."Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration(PIN) field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control30; "Background Checks Documents")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control40; "Background Checks Reference")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Vacancy Id" = field("Vacancy ID"),
                              "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Offer Employment")
            {
                ApplicationArea = Basic;
                Image = Approve;
                Caption = 'Generate Offer Letter';
                //  Visible = false;
                ToolTip = 'Executes the Offer Employment action.';
                trigger OnAction()
                begin
                    JobApplications.Reset;
                    JobApplications.SetRange("Application No.", Rec."Application No.");
                    if JobApplications.FindFirst then begin
                        //Recruitment.NotifyBackgroundCheckResult(Rec);
                        JobApplications."Background Checks Pass" := true;
                        JobApplications.Modify(true);
                        //offer employment
                        Recruitment.CreateEmploymentOffer(Rec);
                        Rec."Document Status" := Rec."document status"::Closed;
                        Rec.Modify(true);
                    end
                end;
            }
            // action("Offer Appointment")
            // {
            //     ApplicationArea = Basic;
            //     Image = Approve;
            //     Promoted = true;
            //     PromotedCategory = Process;

            //     Caption = 'Generate Appointment Letter';
            //     PromotedIsBig = true;
            //     //  Visible = false;
            //     ToolTip = 'Executes the Offer Employment action.';
            //     trigger OnAction()
            //     var
            //         JobApplications: Record "Job Applications";
            //         Recruitment: Codeunit Recruitment;
            //     begin
            //         JobApplications.Reset;
            //         JobApplications.SetRange("Application No.", Rec."Application No.");
            //         if JobApplications.FindFirst then begin
            //             // Recruitment.NotifyBackgroundCheckResult(Rec);
            //             JobApplications."Background Checks Pass" := true;
            //             JobApplications.Modify(true);
            //             //offer employment
            //             Recruitment.CreateEmploymentappoinment(Rec);
            //             Rec."Document Status" := Rec."document status"::Closed;
            //             Rec.Modify(true);
            //         end
            //     end;
            // }
            action("Dis-Qualify Applicant")
            {
                ApplicationArea = Basic;
                Image = Reject;
                ToolTip = 'Executes the Dis-Qualify Applicant action.';
                Visible = false;
                trigger OnAction()
                begin
                    JobApplications.Reset;
                    JobApplications.SetRange("Application No.", Rec."Application No.");
                    if JobApplications.FindFirst then begin
                        Recruitment.NotifyBackgroundCheckResult(Rec);
                        JobApplications."Background Checks Pass" := false;
                        JobApplications.Modify(true);
                        Rec."Document Status" := Rec."document status"::Closed;
                        Rec.Modify(true);
                    end
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69626, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header","Document Type","No.");
                    // ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::Open);
                    MESSAGE('Approval Request has been approved');
                    "Approval Status":="Approval Status"::Released;*/
                    Rec.Modify(true);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::"Pending Approval");
                    MESSAGE('Approval Request has been cancelled');
                    "Approval Status":="Approval Status"::Open;*/
                    Rec.Modify(true);

                end;
            }
            separator(Action34)
            {
            }
            action("Referee Recommendations")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Referee Recommendation";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                ToolTip = 'Executes the Referee Recommendations action.';
            }
            // action("Medical Report")
            // {
            //     ApplicationArea = Basic;
            //     Image = Agreement;
            //     Promoted = true;
            //     PromotedCategory = "Report";
            //     PromotedIsBig = true;
            //     RunObject = Page "Medical Check Reports";
            //     RunPageLink = "Application No." = field("Application No.");
            //     RunPageMode = View;
            //     ToolTip = 'Executes the Medical Report action.';
            // }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Offer Employment_Promoted"; "Offer Employment")
                {
                }
                actionref("Dis-Qualify Applicant_Promoted"; "Dis-Qualify Applicant")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Referee Recommendations_Promoted"; "Referee Recommendations")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Status" := Rec."document status"::Active;
    end;

    var
        JobApplications: Record "Job Applications";
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

