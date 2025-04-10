
page 51004 "Published Announcement Voucher"
{
    Caption = 'Published Announcement Voucher';
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Vacancy Announcement";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Announcement No."; "Announcement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer User ID"; "HR Officer User ID")
                {
                    ApplicationArea = Basic;
                }
                field("HR Officer Staff No."; "HR Officer Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; "Application Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing  Time"; "Application Closing  Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Job Vacancies"; "No. of Job Vacancies")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Cost"; "Advertisement Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Vacancy Status"; "Vacancy Status")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Date Published"; "Date Published")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Advertisement Vacancies"; "Announcement Lines")
            {
                SubPageLink = "Announcement No." = field("Announcement No."),
                              "Posting Type" = field("Posting Type");
                ApplicationArea = All;
            }
            group("Organization Details")
            {
                field("Organization Name"; "Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Organization Overview"; "Organization Overview")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Home Page"; "Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Ammendments)
            {
                // field(Ammended; Ammended)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Ammended By"; "Ammended By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Reason for Ammendment"; "Reason for Ammendment")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("DateTime Ammended"; "DateTime Ammended")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = All;
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
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been approved');
                    "Approval Status" := "approval status"::Released;
                    Modify(true);
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
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Message('Approval Request has been cancelled');
                    "Approval Status" := "approval status"::Open;
                    Modify(true);
                end;
            }
            action("Re-Open for Ammendment")
            {
                ApplicationArea = Basic;
                Image = ReOpen;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    // UserSetup.Reset();
                    // UserSetup.SetRange("User ID",UserId);
                    // UserSetup.FindFirst;
                    // if UserSetup."Ammend Vacancy Adverts" = false then Error('You have not been authorised to ammend vacancy adverts in User Setup');



                    // if Confirm('Do you wish to ammend this vacancy voucher?',false) = false then Error('Process aborted');

                    // TestField("Approval Status","approval status"::Released);
                    // TestField("Reason for Ammendment");
                    // "Approval Status":="approval status"::Open;
                    // "Vacancy Status":="vacancy status"::Draft;
                    // Ammended:=true;
                    // "Ammended By":=UserId;
                    // "DateTime Ammended":=CreateDatetime(Today,Time);
                    // Modify;
                    // //Vacancy Status to Draft
                    // AnnouncementLine.Reset;
                    // AnnouncementLine.SetRange(AnnouncementLine."Announcement No.","Announcement No.");
                    // if AnnouncementLine.FindSet then begin
                    //   //MESSAGE('AnnouncementLine."Announcement No." %1  and "Announcement No."%2',AnnouncementLine."Announcement No.", "Announcement No.");
                    //   repeat
                    //     //advertise no
                    //     Vacancy.Reset;
                    //     Vacancy.SetRange(Vacancy."Document No.",AnnouncementLine."Vacancy ID");
                    //     if Vacancy.FindSet then begin
                    //       //MESSAGE('Vacancy."Document No."%1 and AnnouncementLine."Vacancy ID"%2', Vacancy."Document No.", AnnouncementLine."Vacancy ID");
                    //       Vacancy.Published:=false;
                    //       Vacancy."Date Published":=0D;
                    //       Vacancy."Application Closing Date":=0D;
                    //       Vacancy."Application Closing Time":=0T;
                    //       Vacancy."Vacancy Status":=Vacancy."vacancy status"::Draft;
                    //       Vacancy.Modify(true);
                    //     end
                    //   until
                    // AnnouncementLine.Next=0;
                    // Announcement."Date Published":=0D;
                    // Announcement."Vacancy Status":=Announcement."vacancy status"::Draft;
                    // if not Announcement.Insert(true) then
                    // Announcement.Modify(true);
                    // end;
                    // Message('Ammended Successfully!');
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
                        //   Recruitment.AdvertiseVacancy(Rec);
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
                actionref("Re-Open for Ammendment_Promoted"; "Re-Open for Ammendment")
                {
                }
            }
        }
        // Codeunit "Release Purchase Document"Page "Job Board";
        //                     Report                    ReportCodeunit ""
    }
}