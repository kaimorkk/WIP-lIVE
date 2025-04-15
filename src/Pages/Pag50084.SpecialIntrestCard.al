 
   page 50084 "Special Interest Card"
{
    Caption = 'Special Imprest Warranty';
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Special Imprest"));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocEditable;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Standing Imprest Type"; Rec."Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Committed Amount"; Rec."Committed Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committed Amount field.', Comment = '%';
                }
                field("AIE Receipt"; Rec."AIE Receipt")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AIE Receipt field.', Comment = '%';
                }
                field("Strategic Plan"; "Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Year Code"; "Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Workplan Code"; "Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity Code"; "Activity Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Expenditure Requisition Code"; "Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            group(Recalling)
            {

                field("Reasons to Reopen"; "Reasons to Reopen")
                {
                    ApplicationArea = all;
                    Editable = rec.Status = rec.Status::Released;
                }
            }
            part(Control1000000021; "Standing Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Sanding Imprest")
            {
                Caption = 'Special Imprest';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.ShowEditDimension(not Rec.Posted);
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
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = Rec.Status = Rec.Status::Open;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.CheckDimensions(Rec."Dimension Set ID");
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = CanCancelApprovalRequest;

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

                action("Update Payee Bank Name")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Category4;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Update Payee Bank Acc Name';

                    trigger OnAction()
                    var
                        isSucess: Boolean;
                        payment: Record "Payments";
                        pvLines: Record "PV Lines";


                    begin
                        rec.TestField(Status, rec.Status::Open);
                        pvLines.Reset();
                        pvLines.setRange(No, Rec."No.");

                        if pvLines.FindSet() then
                            repeat
                                isSucess := Rec.UpdateBankName(pvLines."Payee Bank Acc Name", pvLines.rbankName);
                                if (isSucess) then begin
                                    pvLines."Payee Bank Acc Name" := pvLines.rbankName;
                                    pvLines.Modify();
                                    Message('Updated Successfuly');
                                end
                                else
                                    Message('No Matching Records Founds');


                            until pvLines.next = 0;
                    end;
                }
                separator(Action1000000043)
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

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(Report::"Imprest Warranty", true, true, Rec);
                    end;
                }
                // action(DocAttach)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Attachments';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

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

                action("Attach Documents")
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
                        DocType := DocType::Invoice;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Special Imprest');

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

                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                Visible = false;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
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
                    Visible = rec.Status = rec.Status::Released;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        rec.TestField(Posted, false);
                        rec.TestField("Reasons to Reopen");
                        rec.TestField(Status, rec.Status::Released);
                        if Confirm('Do you want to reoprn this document?') then begin
                            rec.Status := rec.Status::Open;
                            rec.Modify();

                        end;
                        //   ReleasePurchDoc.PerformManualReopen(Rec);
                        //   ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }

                separator(Action1000000036)
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
                    Visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);

                    trigger OnAction()
                    begin
                        Rec.CheckDimensions(Rec."Dimension Set ID");
                        Rec.UpdateLineDimensions(Rec."Dimension Set ID");
                        PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action("Archive Document")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Category4;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Archive Document';

                    trigger OnAction()
                    begin
                        Rec.archiveDocument();

                    end;


                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Special Imprest";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then begin
            DocEditable := false;
            // CurrPage.Editable := DocEditable;
        end else begin
            DocEditable := true;
            // CurrPage.Editable := DocEditable;

        end;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        DimensionValue: Record "Dimension Value";
        DocEditable: Boolean;
        DimensionValueList: Page "Dimension Value List";
        OpenApprovalEntriesExistForCurrUser: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}