

page 69645 "Vacancy Announcement Voucher"
{
    Caption = 'Vacancy Announcement Voucher';
    PageType = Card;
    SourceTable = "Vacancy Announcement";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Announcement No."; Rec."Announcement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer User ID"; Rec."HR Officer User ID")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer Staff No."; Rec."HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                }

                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing  Time"; Rec."Application Closing  Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Job Vacancies"; Rec."No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Cost"; Rec."Advertisement Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Advertisement Vacancies"; "Announcement Lines")
            {
                // SubPageLink = "Announcement No." = field("Announcement No."),
                //                "Posting Type" = field("Posting Type");
                ApplicationArea = Basic;
            }
            group("Organization Details")
            {
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Organization Overview"; Rec."Organization Overview")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
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

            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Caption = 'Publish to E-Recruitment Portal';
                Image = PostedPutAway;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                    Recruitment: Codeunit Recruitment;
                begin
                    if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                        Recruitment.AdvertiseVacancy(Rec);
                    end
                    //create ledger entries
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
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
                actionref("Publish to E-Recruitment Portal_Promoted"; "Publish to E-Recruitment Portal")
                {
                }
            }
        }
    }

}
#pragma implicitwith restore
