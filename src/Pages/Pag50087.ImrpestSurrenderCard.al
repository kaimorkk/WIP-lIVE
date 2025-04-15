namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using System.Security.User;
page 50087 "Imprest Surrender"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Surrender));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field("Imprest Memo Surrender No"; Rec."Imprest Memo Surrender No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Imprest Memo Surrender No field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Amount Spent field.';
                }
                field("Actual Amount Spent LCY"; Rec."Actual Amount Spent LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Amount Spent LCY field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Strategic Plan"; "Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Reporting Year Code"; "Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Workplan Code"; "Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Activity Code"; "Activity Code")
                {
                    Editable = false;
                    ApplicationArea = Basic, Suite;
                }
                field("Expenditure Requisition Code"; "Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
            }
            part(Control1000000017; "Imprest Surrender Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachment Factbox")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(57000),
            //                   "No." = field("No.");
            // }
            part("Attached Documents"; Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                // SubPageLink = "Table ID" = const(57008),
                //               "No." = field("No.");
                // SubPageLink = Document_No = field("No.");
            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    // RunObject = Page "Comment Sheet";
                    // RunPageLink = "Table Name" = const(56000),
                    //               "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        Rec.ShowEditDimension(CurrPage.Editable);
                        CurrPage.Update();
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
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
                    Visible = Rec.Status = Rec.Status::Open;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        attachment: Record Attachments;

                    begin
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        attachment.reset;
                        attachment.SetRange(Document_No, Rec."No.");
                        if not attachment.FindFirst() then
                            Error('Kindly Attach the document');

                        ImprestLines.Reset;
                        ImprestLines.SetRange(No, Rec."No.");
                        if ImprestLines.FindSet() then begin

                            repeat
                                // ImprestLines.CalcSums("Actual Spent");
                                if (ImprestLines."Remaining Amount" > 0) and (ImprestLines."Receipt No." = '') then
                                    Error('Receipt Number Must a value');
                                if ImprestLines."Actual Spent" <= 0 then
                                    Error('Actual Spent must have a value');

                                if ImprestLines."Actual Spent" > ImprestLines.Amount then
                                    Error('Actual Spent must not be greater than the Imprest Amount');


                            until ImprestLines.Next = 0;


                            VarVariant := Rec;
                            if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                                ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                        end;
                    end;
                }

                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    Visible = CanCancelApprovalRequest;
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."User ID" <> Rec."Created By" then
                                Error(Text0001, Rec."No.");
                        end;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        if ImprestHeader.Get(Rec."Imprest Issue Doc. No") then begin
                            ImprestHeader.Selected := false;
                            ImprestHeader.Modify;
                        end;
                    end;
                }
                separator(Action1000000037)
                {
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
                    Promoted = true;
                    PromotedCategory = Report;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57005, true, true, Rec)
                    end;
                }
            }
            // action(Attachments)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     Image = Attach;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
            //     Visible = false;
            //     trigger OnAction()
            //     var
            //         DocumentAttachmentDetails: Page "Document Attachment Details";
            //         RecRef: RecordRef;
            //     begin
            //         RecRef.GetTable(Rec);
            //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
            //         DocumentAttachmentDetails.RunModal;
            //     end;
            // }
            action("Attachments")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DMSManagement: Codeunit "Sharepoint Integration";
                    DocType: Enum SharepointDocumentType;
                begin
                    DocType := DocType::Imprest;
                    DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Imprest Surrender');
                end;
            }
            action("View Attached Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;


                trigger OnAction()
                var
                    attachLink: Record Attachments;
                begin
                    attachLink.setRange(attachLink.Document_No, Rec."No.");
                    if attachLink.FindSet then
                        Page.Run(Page::Attachments, attachLink)
                    else
                        Error('No attached links found');

                    // DMSManagement.FnUploadPurchaseOrderDocs(Rec."No.", 'Purchase Order', Rec.RecordId);
                end;

            }

            action(retrievDoc)
            {
                caption = 'TestFn Retrieve API';
                trigger OnAction()
                var
                    sharepoint: Codeunit "Sharepoint Integration";
                    attachment: Record Attachments;
                begin
                    attachment.reset();
                    attachment.setRange(Document_No, Rec."No.");
                    if attachment.FindFirst() then begin
                        sharepoint.RetrieveDocument(attachment.Module, attachment.Document_No, attachment.FileType, attachment.DocumentID);
                    end

                end;
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
                    Visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    visible = true;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.ReopenPv(Rec."No.")
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                action("Archive")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    visible = true;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        if Rec.Status = Rec.Status::Open then
                            Rec."Archive Document" := true
                        else
                            Message('Reopen the document first')
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000031)
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
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    Visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action("Generate Receipt")
                {
                    ApplicationArea = Suite;
                    Caption = 'Generate Receipt';
                    // Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Generate Receipt';
                    // Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        PageReceipt: Page "Receipt";
                        receiptHeader: Record "Receipts Header1";
                        receiptLines: Record "Receipt Lines1";
                        ImprestLines: Record "Imprest Lines";
                        receiptLines2: Record "Receipt Lines1";
                        lineNumber: Integer;

                    begin
                        receiptLines.reset();
                        receiptLines.setRange("Applies to Doc. No", Rec."Imprest Issue Doc. No");
                        if receiptLines.findFirst() then
                            Error('A Receipt Already Exists for the Surrender. Receipt No.: %1', receiptLines."Receipt No.");
                        receiptHeader.init();
                        receiptHeader."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                        receiptHeader."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 2 Code";
                        receiptHeader."Global Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                        receiptHeader."Global Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        receiptHeader."Dimension Set ID" := Rec."Dimension Set ID";
                        receiptHeader."Receipt Type" := receiptHeader."receipt type"::Surrender;
                        receiptHeader.Date := Rec.Date;
                        receiptHeader."Bank Code" := Rec."Bank Code";
                        receiptHeader."Posting Date" := Today();
                        receiptHeader."applies to doc no" := Rec."Imprest Issue Doc. No";
                        if receiptHeader.Insert(true) then begin
                            ImprestLines.reset();
                            ImprestLines.SetRange(No, Rec."No.");


                            if ImprestLines.FindSet() then begin
                                receiptLines2.reset();
                                receiptLines2.SetRange("Receipt No.", receiptHeader."No.");
                                if receiptLines2.FindLast() then
                                    lineNumber := receiptLines2."Line No" + 1
                                else
                                    lineNumber := 1;

                                repeat

                                    receiptLines.init();
                                    receiptLines."Line No" := lineNumber;
                                    receiptLines."Receipt No." := receiptHeader."No.";
                                    receiptLines."Account Type" := receiptLines."Account Type"::Employee;
                                    receiptLines."Applies to Doc. No" := Rec."Imprest Issue Doc. No";
                                    receiptLines."Account No." := Rec."Account No.";
                                    receiptLines.validate("Account No.");
                                    receiptLines.Amount := ImprestLines."Remaining Amount";
                                    receiptLines."Surrender Gl Account" := ImprestLines."Account No.";
                                    receiptLines.Validate(Amount);
                                    receiptLines.insert(true);
                                    lineNumber := lineNumber + 1;
                                until ImprestLines.Next = 0;
                            end;


                        end;
                        PageReceipt.SetRecord(receiptHeader);
                        PageReceipt.Run();
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                // action("Attach Documents")
                // {
                //     ApplicationArea = Basic;
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ToolTip = 'Executes the Attach Documents action.';
                //     trigger OnAction()
                //     begin
                //         DMSManagement.FnUploadImptestSurrenderDocs(Rec."No.", 'Imprest Surrender', Rec.RecordId);
                //     end;
                // }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenSurrEntries(Rec);
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Account Type" := Rec."account type"::Employee;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Document Type" := Rec."document type"::Surrender;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenSurrEntries(Rec);
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        ImprestHeader: Record Payments;
        ImprestLines: Record "Imprest Lines";
        OpenApprovalEntriesExistForCurrUser: Boolean;
    // DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}

