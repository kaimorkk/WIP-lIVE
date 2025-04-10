

page 69722 "Interview invitation Card"
{
    PageType = Card;
    SourceTable = "Candidate Selection Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Interview Mode"; Rec."Interview Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Mode field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field("Appointed Selection Comm ID"; Rec."Appointed Selection Comm ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Appointed Selection Comm ID field.';
                // }
                // field("Selection Committee Chair"; Rec."Selection Committee Chair")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Selection Committee Chair field.';
                // }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned end Date"; Rec."Planned end Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned end Date field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Document No. field.';
                }
                field("Primary Contact Person"; Rec."Primary Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Person field.';
                }
                field("Primary Contact Phone"; Rec."Primary Contact Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Phone field.';
                }
                field("Primary Contact Email"; Rec."Primary Contact Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contact Email field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                group("Shortlisting Fields")
                {
                    Visible = false;
                    field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Academic Qualification field.';
                    }
                    field("Min Academic Hierarchy Pointer"; Rec."Min Academic Hierarchy Pointer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Min Academic Hierarchy Pointer field.';
                    }
                    field("Minimum Work Experience"; Rec."Minimum Work Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Work Experience field.';
                    }
                    field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Management Experience field.';
                    }
                }
                group(Statistics)
                {
                    Visible = false;
                    field("No. of Submitted Applications"; Rec."No. of Submitted Applications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. of Submitted Applications field.';
                    }
                    field("No. of Apptitude Invitees"; Rec."No. of Apptitude Invitees")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. of Apptitude Invitees field.';
                    }
                    field("No. of Final Shortlisted Candi"; Rec."No. of Final Shortlisted Candi")
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Final Shortlisted Candidates';
                        ToolTip = 'Specifies the value of the No. of Final Shortlisted Candidates field.';
                    }
                    field("Missed Academic Total"; Rec."Missed Academic Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed Academic Total field.';
                    }
                    field("Missed Management Total"; Rec."Missed Management Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed Management Total field.';
                    }
                    field("Missed General Total"; Rec."Missed General Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed General Total field.';
                    }
                }
            }
            part(Control22; "Interview Lines")
            {
                Caption = 'Interview-Stage Job Applications';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
            group("Vacancy Details")
            {
                Editable = false;
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("No. of openings"; Rec."No. of openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of openings field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Terms of Service Code field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control5; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control4; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Interview Panels")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Commitee Appointment Vouchers";
                RunPageLink = "Vacancy ID" = field("Vacancy ID");
                ToolTip = 'Executes the Interview Panels action.';
            }

            action(AutoassignShortlistcomm)
            {
                ApplicationArea = Basic;
                Image = DistributionGroup;
                Caption = 'Auto-Allocate Applications';
                trigger OnAction()
                var
                    TXT001: label 'All the applications have been assigned successfully,Kindly proceed for Interview';
                    TXT002: label 'Are you sure you want to Auto-assign interview panels';
                begin
                    if Confirm(TXT002, true, Rec."Job Title") = true then begin
                        Rec.TestField(Rec."Document Status", Rec."Document Status"::Active);
                        Recruitment.Autoassigninterviewcomm(Rec);
                        Rec.Modify(true);
                        Message(TXT001);
                    end;
                end;
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = DocumentsMaturity;
                RunObject = Page "Requisition Required Documents";
                RunPageLink = "Document No." = field("Vacancy ID");
                ToolTip = 'Executes the Required Documents action.';
            }
            action("Suggest Job Applications")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                ToolTip = 'Executes the Suggest Job Applications action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest job applicants';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.SuggestInterviewCandidates(Rec);
                    end
                end;
            }
            action("Notify Panelist")
            {
                ApplicationArea = Basic;
                Image = NewOpportunity;
                ToolTip = 'Executes the Notify Panelist action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to invite the panelitsts?';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.NotifyInterviewPanelist(Rec);
                    end
                end;
            }
            action("Invite Candidates")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                ToolTip = 'Executes the Invite Candidates action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to invite the candidates';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.NotifyInterviewCandidates(Rec);
                    end
                end;
            }
            action("Post")
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Invite Candidates action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to invite the candidates';
                begin
                    Rec.Posted := true;
                    Rec.modify();
                end;
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69623, true, false, Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        // ApprovalEntries.SetRecordFilters(Database::"HR Leave Application", 15, Rec."Document No.");
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
                    begin
                        Message('');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Message('');
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Suggest Job Applications_Promoted"; "Suggest Job Applications")
                {
                }
            }
            group(Category_Process)
            {
                actionref(AutoassignShortlistcomm_Promoted; AutoassignShortlistcomm)
                {
                }
                actionref("Notify Panelist_Promoted"; "Notify Panelist")
                {
                }
                actionref("Invite Candidates_Promoted"; "Invite Candidates")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Interview Panels_Promoted"; "Interview Panels")
                {
                }
            }
            group(Category_Category6)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Required Documents_Promoted"; "Required Documents")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Interview Invitation";
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

