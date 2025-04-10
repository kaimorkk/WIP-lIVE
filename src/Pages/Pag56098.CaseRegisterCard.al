

page 56098 "Case Register Card"
{
    PageType = Card;
    SourceTable = "Case Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Nature of Case"; Rec."Nature of Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Case field.';
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Types field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Nature of Claim"; Rec."Nature of Claim")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Nature of Claim field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Court House"; Rec."Court House")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court House field.';
                }
                field("Last Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Next Hearing Date field.';
                }
                field(Judge; Rec.Judge)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Judge field.';
                }
                field("Judge Name"; Rec."Judge Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Judge Name field.';
                }
                field("Advocate on Record"; Rec."Advocate on Record")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate on Record field.';
                }
                field("Advocate name"; Rec."Advocate name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advocate Name';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate Name field.';
                }
                field("Advocate Firm"; Rec."Advocate Firm")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate Firm field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = Basic;
                    Caption = 'Verdict Status';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Verdict Status field.';
                }
                field("Last Mention Date"; Rec."Last Mention Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Mention Date field.';
                }
                field("Next Mention Date"; Rec."Next Mention Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Mention Date field.';
                }
                field("No of Attachments"; Rec."No of Attachments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Attachments field.';
                }
            }
            part(Control35; "Case Hearings")
            {
                SubPageLink = "Case Entry" = field("No."),
                              "Entry Type" = const(Hearing);
                ApplicationArea = Basic;
            }
            part(Control59; "Case Mentions")
            {
                SubPageLink = "Case Entry" = field("No."),
                              "Entry Type" = const(Mention);
                ApplicationArea = Basic;
            }
            group("Judgement Details")
            {
                Caption = 'Judgement Details';
                field("Judgement Date"; Rec."Verdict Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Date field.';
                }
                field("Judgement Summary"; Rec."Verdict Summary")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Verdict Summary field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Feasibility Study")
            {
                Caption = 'Feasibility Study';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        /*
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                        */

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
                        /*
                        ApprovalEntries.SetRecordFilters(DATABASE::Payments,8,"No.");
                        ApprovalEntries.RUN;
                        */

                    end;
                }
            }
        }
        area(processing)
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
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*
                        //TESTFIELD("Funding Source");
                        TESTFIELD(Status,Status::Open);//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        TESTFIELD(Job);
                        TESTFIELD("Job Task No");
                        IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
                        BEGIN
                          ERROR(text0001);
                        END;
                        TESTFIELD("Payment Narration");
                        TESTFIELD(Payee);
                        TESTFIELD(Date);
                        pvheader.RESET;
                        pvheader.SETRANGE(pvheader."No.","No.");
                        IF pvheader.FIND('-') THEN
                          BEGIN
                            pvLines.RESET;
                            pvLines.SETRANGE(pvLines.No,pvheader."No.");
                            IF pvLines.FIND('-') THEN
                        
                              BEGIN
                                REPEAT
                                  pvLines.TESTFIELD(pvLines."Applies to Doc. No");
                                  UNTIL pvLines.NEXT=0;
                                END;
                        
                            END;
                        
                        
                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        /*
                        TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        */

                    end;
                }
                separator(Action28)
                {
                }
                action(Plaintiffs)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    RunObject = Page "Case Plantiffs";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Plaintiff);
                    ToolTip = 'Executes the Plaintiffs action.';
                }
                action(Defendants)
                {
                    ApplicationArea = Basic;
                    Image = Account;
                    RunObject = Page "Case Defandants";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Defendant);
                    ToolTip = 'Executes the Defendants action.';
                }
                action("Defendant Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = ZoneCode;
                    RunObject = Page "Case Witnesses";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Defendant);
                    ToolTip = 'Executes the Defendant Witnesses action.';
                }
                action("Plaintiff Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = XMLFile;
                    RunObject = Page "Case Witnesses";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Plantif);
                    ToolTip = 'Executes the Plaintiff Witnesses action.';
                }
                action("Advocates Defendant, Plaintiff")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    // RunObject = Page "Advocate on record list";
                    // RunPageLink = no = field("No.");
                    ToolTip = 'Executes the Advocates Defendant, Plaintiff action.';
                }
                action("Advocate on record for Plaintiff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Advocate on record for Plaintiff action.';
                }
                action(Judges)
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    RunObject = Page "Case Judges";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Judges action.';
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        CaseRegister.Reset;
                        CaseRegister.SetRange("No.", Rec."No.");
                        if CaseRegister.FindSet then
                            Report.Run(56092, true, false, CaseRegister)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        /*
                        usersetup.GET(USERID);
                        usersetup.TESTFIELD(usersetup."Reopen Document",usersetup."Reopen Document"=TRUE);
                        TESTFIELD("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                        */

                    end;
                }
                separator(Action22)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    ShortCutKey = 'F9';
                    Visible = false;
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        //PaymentsPost."Post Payment Voucher"(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(MoveToOngoing)
                {
                    ApplicationArea = Suite;
                    Caption = 'Move To Ongoing';
                    Image = Migration;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                        if Dialog.Confirm('Are you sure you want to move case to ongoing?', true) then begin
                            Rec.Status := Rec.Status::Ongoing;
                            Rec.Modify;
                            CurrPage.Close;
                        end;
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the requested changes.';
                    Visible = false;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(DocAttach0)
                {
                    ApplicationArea = All;
                    Caption = 'HR Documents';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //           "Document Type" = filter("HR Case");
                    //RunPageView = where("Document Type" = filter("HR Case"));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action("Appeal Case")
                {
                    ApplicationArea = Basic;
                    Image = Aging;
                    ToolTip = 'Executes the Appeal Case action.';
                    // trigger OnAction()
                    // var
                    //     TXT001: label 'Create an appeal for the case %1';
                    // begin
                    //     if Confirm(TXT001, true, Rec."Case Desscription/Transpired") = true then
                    //         CaseManagment.CreateAppeal(Rec);
                    // end;
                }
                action(DocAttach1)
                {
                    ApplicationArea = All;
                    Caption = 'Court Documents';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    // RunPageLink = "No." = field("No."),
                    //          "Document Type" = filter("Court Hearings");
                    //  RunPageView = where("Document Type" = filter("Court Hearings"));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action(DocAttach2)
                {
                    ApplicationArea = All;
                    Caption = 'Plaintiff Documents';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //             "Document Type" = filter(Plaintiffs);
                    //  RunPageView = where("Document Type" = filter(Plaintiffs));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action(DocAttach3)
                {
                    ApplicationArea = All;
                    Caption = 'Defendants Documents';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    //   RunPageLink = "No." = field("No."),"Document Type" = filter(Defendants);
                    //  RunPageView = where("Document Type" = filter(Defendants));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action(DocAttach4)
                {
                    ApplicationArea = All;
                    Caption = 'Judgement Documents';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //   "Document Type" = filter(Defendants);
                    //  RunPageView = where("Document Type" = filter(Defendants));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                separator(Action45)
                {
                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Verdict Summary");
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;
                        Message('Case Closed Successfully');
                    end;
                }
                action(CaseMentioning)
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Hearing Reminder';
                    Image = "Action";
                    Visible = true;
                    ToolTip = 'Executes the Case Hearing Reminder action.';
                    trigger OnAction()
                    begin
                        // if Rec."Next Hearing Date" = Today then
                        //     InsuranceNotifications.CaseOpeningNotifications(Rec);
                    end;
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
            group(Category_Process)
            {
                actionref(Plaintiffs_Promoted; Plaintiffs)
                {
                }
                actionref(Defendants_Promoted; Defendants)
                {
                }
                actionref("Defendant Witnesses_Promoted"; "Defendant Witnesses")
                {
                }
                actionref("Plaintiff Witnesses_Promoted"; "Plaintiff Witnesses")
                {
                }
                actionref("Advocates Defendant, Plaintiff_Promoted"; "Advocates Defendant, Plaintiff")
                {
                }
                actionref(Judges_Promoted; Judges)
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
                actionref(Close_Promoted; Close)
                {
                }
                actionref(CaseMentioning_Promoted; CaseMentioning)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(MoveToOngoing_Promoted; MoveToOngoing)
                {
                }
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref("Appeal Case_Promoted"; "Appeal Case")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
            group(Category_Category8)
            {
                actionref(DocAttach0_Promoted; DocAttach0)
                {
                }
                actionref(DocAttach1_Promoted; DocAttach1)
                {
                }
                actionref(DocAttach2_Promoted; DocAttach2)
                {
                }
                actionref(DocAttach3_Promoted; DocAttach3)
                {
                }
                actionref(DocAttach4_Promoted; DocAttach4)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::External;
    end;

    var
        ConfirmVerdict: Page "Confirm Verdict";
        CaseRegister: Record "Case Register";
    // CaseManagment: Codeunit CuePortal;
    // InsuranceNotifications: Codeunit "Insurance Notifications";
}

#pragma implicitwith restore

