

page 69653 "Recruitment Agency Voucher"
{
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
                field("Recruitment Agency No."; Rec."Recruitment Agency No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Name"; Rec."Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Recruiter Fees"; Rec."Actual Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
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
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
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
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Advertised Vacancies"; "Announcement Lines")
            {
                SubPageLink = "Announcement No." = field("Announcement No."),
                              "Posting Type" = field("Posting Type");
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
            systempart(Control4; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control2; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1; Links)
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
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header","Document Type","No.");
                    // ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Announcement No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
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
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
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
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                        // Recruitment.AdvertiseVacancy(Rec);
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
            group(Category_Category4)
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
}
#pragma implicitwith restore
