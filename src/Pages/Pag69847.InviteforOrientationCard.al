page 69847 "Invite for Orientation Card"
{
    Caption = 'Invitation for Orientation Card';
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

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
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


            }
            part(Control22; "Orientation Lines")
            {
                Caption = 'Interview-Stage Job Applications';
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
            //"Orientations Activities"
            part(Control222; "Orientations Activities")
            {
                Caption = 'Orientation Content/Course';
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }

        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(69706),
                              "No." = field("Document No.");
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

            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = DocumentsMaturity;
                RunObject = Page "Requisition Required Documents";
                RunPageLink = "Document No." = field("Vacancy ID");
                ToolTip = 'Executes the Required Documents action.';
            }
            action("Orientation Content/Course")
            {
                ApplicationArea = Basic;
                Image = DocumentsMaturity;
                RunObject = Page "Orientations Activities";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Required Documents action.';
            }
            action("Suggest Orientation Attendees")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                ToolTip = 'Executes the Suggest Orientation Attendees action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to Suggest Orientation Attendees';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.SuggestOrientationCandidates(Rec);
                    end
                end;
            }
            //PostOrientationCandidates
            action("Complete Orientation")
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                ToolTip = 'Executes the Complete Orientation action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to Complete Orientation';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.PostOrientationCandidates(Rec);
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
                        Recruitment.NotifyOrientationCandidates(Rec);
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
            group(Category_Process)
            {
                actionref("Suggest Orientation Attendees_Promoted"; "Suggest Orientation Attendees")
                {
                }
                actionref("Complete Orientation_Promoted"; "Complete Orientation")
                {
                }
                actionref("Invite Candidates_Promoted"; "Invite Candidates")
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
                actionref("Orientation Content/Course_Promoted"; "Orientation Content/Course")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Invitation for Orientation";
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        Recruitment: Codeunit Recruitment;
}

