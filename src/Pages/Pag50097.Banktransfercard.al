namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using Microsoft.Bank.BankAccount;


page 50097 "Bank Transfer"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Bank Transfer"));

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
                    Editable = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer From';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Transfer From field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Total Payment Amount LCY"; Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount LCY';
                    ToolTip = 'Specifies the value of the Total Net Amount LCY field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
            }
            part(Control1000000021; "Bank Transfer Lines")
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
                action("Recoup Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recoup Entries';
                    Image = Entries;
                    // RunObject = Page "Petty Cash Recoup Entries";
                    // RunPageLink = "No" = field("No.");
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
                action("Suggest Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Entries';
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                        PettyCashEntries: Record "Petty Cash Entries";
                        BankTransfer: Record Payments;
                        LineNo: Integer;
                        BankAccount: Record "Bank Account";
                        PVLines: Record "PV Lines";
                        PettyCashLines: Record "Petty Cash Lines";
                        PettyCashEntries1: Record "Petty Cash Entries";
                        Payments: Record Payments;
                    begin

                        PettyCashEntries.RESET;
                        PettyCashEntries.SETRANGE(No, Payments."No.");
                        if PettyCashEntries.FINDSET then begin
                            PettyCashEntries.DELETEALL;
                        end;

                        PettyCashEntries.RESET;
                        if PettyCashEntries.FINDLAST then begin
                            LineNo := PettyCashEntries."Line No";
                        end;
                        //get specific bank
                        PVLines.RESET;
                        PVLines.SETRANGE(No, Payments."No.");
                        if PVLines.FINDFIRST then begin
                            PVLines.TESTFIELD("Account No");//get the bank code
                            BankTransfer.RESET;
                            BankTransfer.SETRANGE("Paying Bank Account", PVLines."Account No");
                            BankTransfer.SETFILTER("Payment Type", '<>%1', BankTransfer."Payment Type"::"Petty Cash");
                            BankTransfer.SETFILTER("Payment Type", '<>%1', BankTransfer."Payment Type"::"Petty Cash Surrender");
                            BankTransfer.SETRANGE(Posted, true);
                            BankTransfer.SETRANGE(Recouped, false);
                            if BankTransfer.FINDSET then begin
                                repeat
                                    //insert the lines
                                    PettyCashEntries.INIT;
                                    PettyCashEntries.No := Payments."No.";
                                    PettyCashEntries."Line No" := LineNo + 1;
                                    PettyCashEntries."Payment Document No." := BankTransfer."No.";
                                    PettyCashEntries."Posted Date" := BankTransfer."Posted Date";
                                    PettyCashEntries.Description := FORMAT(BankTransfer."Payment Narration", 200);
                                    BankTransfer.CALCFIELDS("Total Amount");
                                    PettyCashEntries.Amount := BankTransfer."Total Amount";
                                    PettyCashEntries.INSERT;
                                    LineNo += 1;
                                until BankTransfer.NEXT = 0;
                            end;


                            PettyCashEntries1.RESET;
                            if PettyCashEntries1.FINDLAST then begin
                                LineNo := PettyCashEntries1."Line No";
                            end;
                            //fr petty cash surrender
                            BankTransfer.RESET;
                            BankTransfer.SETRANGE("Paying Bank Account", PVLines."Account No");
                            BankTransfer.SETFILTER("Payment Type", '=%1', BankTransfer."Payment Type"::"Petty Cash Surrender");
                            BankTransfer.SETRANGE(Posted, true);
                            BankTransfer.SETRANGE(Surrendered, true);
                            BankTransfer.SETRANGE(Recouped, false);
                            if BankTransfer.FINDSET then begin
                                repeat
                                    //insert the lines
                                    PettyCashEntries.INIT;
                                    PettyCashEntries.No := Payments."No.";
                                    PettyCashEntries."Line No" := LineNo + 1;
                                    PettyCashEntries."Payment Document No." := BankTransfer."No.";
                                    PettyCashEntries.Description := FORMAT(BankTransfer."Payment Narration", 200);
                                    BankTransfer.CALCFIELDS("Actual Petty Cash Amount Spent");
                                    PettyCashEntries."Posted Date" := BankTransfer."Posted Date";
                                    PettyCashEntries.Amount := BankTransfer."Actual Petty Cash Amount Spent";
                                    PettyCashEntries.INSERT;
                                    LineNo += 1;
                                until BankTransfer.NEXT = 0;
                            end;
                        end
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    Visible = Rec.Status = Rec.Status::Open;
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
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    Visible = CanCancelApprovalRequest;
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        /*TESTFIELD(Status,Status::"Pending Approval");*/
                        ////ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

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
                action(DocAttach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        // DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GetTable(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RunModal;
                    end;
                }
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
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57006, true, true, Rec)
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
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';
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
                    Visible = false;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
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
                    ToolTip = 'Executes the P&ost action.';
                    Visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);
                    trigger OnAction()
                    begin
                        PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
                    end;
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
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
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
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
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
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        // DMSManagement.FnUploadInterBankTransferDocs(Rec."No.", 'InterBank Transfer', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Bank Transfer";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        OpenApprovalEntriesExistForCurrUser: Boolean;
    // DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;
}

