

page 69651 "Career Fair"
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
                    ToolTip = 'Specifies the value of the Announcement No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Career Fair Venue"; Rec."Career Fair Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Career Fair Venue field.';
                }
                field("Career Fair Date"; Rec."Career Fair Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Career Fair Date field.';
                }
                field("Career Fair Start Time"; Rec."Career Fair Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Career Fair Start Time field.';
                }
                field("Career Fair End Time"; Rec."Career Fair End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Career Fair End Time field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("HR Officer User ID"; Rec."HR Officer User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer User ID field.';
                }
                field("HR Officer Staff No."; Rec."HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Officer Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
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
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
            part(Control5; "Career Fair Attendance")
            {
                SubPageLink = "Career Fair ID" = field("Announcement No.");
                ApplicationArea = Basic;
            }
            group("Employer Profile")
            {
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Organization Overview"; Rec."Organization Overview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Overview field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Page field.';
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
            group("Actions")
            {
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
                        Message('Approval Request has been approved');
                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify(true);
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
                        // ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Announcement No.");
                        ApprovalEntries.Run;
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
                        Message('Approval Request has been cancelled');
                        Rec."Approval Status" := Rec."approval status"::Open;
                        Rec.Modify(true);
                    end;
                }
                action("E-Notify Candidates")
                {
                    ApplicationArea = Basic;
                    Caption = 'E-Notify Candidates';
                    Image = PostedPutAway;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the E-Notify Candidates action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                            //  Recruitment.NotifyAtendees(Rec);
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Posted On" := CurrentDatetime;
                            Rec.Modify(true);
                        end;

                        //create ledger entries
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("E-Notify Candidates_Promoted"; "E-Notify Candidates")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
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
