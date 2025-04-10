

page 69508 "Safe Work Permit Completion"
{
    PageType = Card;
    SourceTable = "Safe Work Permit Header";
    UsageCategory = History;
    ApplicationArea = All;

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
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Work Permit ID"; Rec."Safety Work Permit ID")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Plan Type"; Rec."HSE Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Permit Type"; Rec."Permit Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Works Location Details"; Rec."Works Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Emergency Coordinator"; Rec."Lead Emergency Coordinator")
                {
                    ApplicationArea = Basic;
                }
                field("Final Permit Verdict"; Rec."Final Permit Verdict")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44; "Safety Permit Completion Lines")
            {
                Caption = 'Safety Compliance Checklist';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(69453, true, true, Rec);
                end;
            }
            action("Suggest Safety Checklist")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin
                    Rec.TestField("Permit Type");
                    SafetyPermitApplicationLine.Reset;
                    SafetyPermitApplicationLine.SetRange("Document No.", Rec."Document No.");
                    if SafetyPermitApplicationLine.FindSet then
                        SafetyPermitApplicationLine.DeleteAll;
                    SafetyPermitChecklist.Reset;
                    SafetyPermitChecklist.SetRange("Permit Type", Rec."Permit Type");
                    SafetyPermitChecklist.SetRange("Condition Type", SafetyPermitChecklist."condition type"::"Post-Works");
                    if SafetyPermitChecklist.FindSet then begin
                        repeat
                            SafetyPermitApplicationLine.Init;
                            SafetyPermitApplicationLine."Document No." := Rec."Document No.";
                            SafetyPermitApplicationLine."Document Type" := Rec."Document Type";
                            SafetyPermitApplicationLine."Line No." := SafetyPermitApplicationLine."Line No." + 100;
                            SafetyPermitApplicationLine."Restricted Activity ID" := Rec."Permit Type";
                            SafetyPermitApplicationLine."Compliance Requirement" := SafetyPermitChecklist.Description;
                            SafetyPermitApplicationLine."Requirement Type" := SafetyPermitChecklist."Condition Type";
                            SafetyPermitApplicationLine."Severity Level for Violation" := SafetyPermitChecklist."Severity Level for Violation";
                            SafetyPermitApplicationLine.Insert(true);
                        until SafetyPermitChecklist.Next = 0;
                    end;
                    Message('Suggested Successfully');
                end;
            }
            action("Safe Works Personnel")
            {
                ApplicationArea = Basic;
                Image = PersonInCharge;
                RunObject = Page "Safety Permit Teams";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            action("Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                RunObject = Page "Safety Permit Workgroups";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Record Type" = filter("Emergency Response");
            }
            action("Other Informed Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                RunObject = Page "Safety Permit Workgroups";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Record Type" = filter("To-be Informed");
            }
            action("Safety Equipment Register")
            {
                ApplicationArea = Basic;
                Image = Registered;
                RunObject = Page "Safety Equipment Registers";
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Rec."Final Permit Verdict" := Rec."final permit verdict"::Approved;
                    Rec.Modify;
                    Message('Approval Request has been sent.');
                end;
            }
            action("Cancel Approval Requestl ")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;

                trigger OnAction()
                begin
                    Message('Approval Request has been canceled.');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Rec."Final Permit Verdict" := Rec."final permit verdict"::Approved;
                    Rec.Modify;

                    Message('The document has been released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;

                    Message('The document has been reopened successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;

                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;

                trigger OnAction()
                begin
                    // IF UserSetup.GET(USERID) THEN BEGIN
                    //  IF UserSetup."Original Approver ID"=TRUE THEN BEGIN
                    //    TESTFIELD(Status,Status::Released);
                    //
                    //  END;
                    //    END;
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Final Permit Verdict", Rec."final permit verdict"::Approved);
                    Rec."Final Permit Verdict" := Rec."final permit verdict"::Completed;
                    Rec.Modify(true);
                    Message('Closed successfully');
                end;
            }
            action("e-Permit")
            {
                ApplicationArea = Basic;
                Image = Permission;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Safety Work Permit ID");
                    if Rec.FindSet then
                        Report.Run(69458, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;

                trigger OnAction()
                begin
                    Message('Dimensions');
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;

                trigger OnAction()
                begin
                    // IF UserSetup.GET(USERID) THEN BEGIN
                    //  IF UserSetup."Original Approver ID"=TRUE THEN BEGIN
                    //    TESTFIELD(Status,Status::Released);
                    //
                    //  END;
                    //    END;
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Final Permit Verdict", Rec."final permit verdict"::Approved);
                    Rec."Final Permit Verdict" := Rec."final permit verdict"::Rejected;
                    Rec.Modify(true);
                    Message('Application Rejected');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Safety Checklist_Promoted"; "Suggest Safety Checklist")
                {
                }
                actionref("Safe Works Personnel_Promoted"; "Safe Works Personnel")
                {
                }
                actionref("Emergency Contacts_Promoted"; "Emergency Contacts")
                {
                }
                actionref("Other Informed Workgroups_Promoted"; "Other Informed Workgroups")
                {
                }
                actionref("Safety Equipment Register_Promoted"; "Safety Equipment Register")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Requestl _Promoted"; "Cancel Approval Requestl ")
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Close_Promoted; Close)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
            }
            group(Category_Category7)
            {
                actionref("e-Permit_Promoted"; "e-Permit")
                {
                }
            }
            group(Category_Category8)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Safe Work Completion Report";
    end;

    var
        UserSetup: Record "User Setup";
        SafetyPermitChecklist: Record "Safety Permit Checklist";
        SafetyPermitApplicationLine: Record "Safety Permit Completion Line";
}

#pragma implicitwith restore

