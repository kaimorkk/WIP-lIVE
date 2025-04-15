namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using Microsoft.Finance.GeneralLedger.Journal;
using System.Security.User;

page 50041 "Approved Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(false),
                            Status = const(Released),
                            "PV Type" = const(Normal));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocOpen;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("File No."; Rec."File No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the File No. field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    ShowMandatory = true;
                }
                field("Salary Payment"; Rec."Salary Payment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Payment field.';
                    Visible = false;
                }
                field(Budgeted; Rec.Budgeted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted field.';
                    Visible = false;
                }

                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field(relatedTaxPv; Rec.relatedTaxPv)
                {
                    ApplicationArea = Basic;
                    Caption = 'Related Tax Pv';

                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT Wthheld two %';
                    ToolTip = 'Specifies the value of the VAT Wthheld two % field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Board PAYE"; Rec."Board PAYE")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Board PAYE field.';
                    Visible = false;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the PV Remaining Amount field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Strategic Plan"; Rec."Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Year Code"; Rec."Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Expenditure Requisition Code"; "Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Recalling)
            {
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    Editable = rec.Status = rec.Status::Released;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
                }
            }
            part(Control1000000021; "Posted PV Lines")
            {
                Editable = false;
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
                    PromotedCategory = category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
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
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57000, true, true, Rec)
                    end;
                }
                action("View EDMS Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                        // postedPurchaseInv: Record "Purch. Inv. Header";
                        pvLines: Record "PV Lines";
                        docAttachedNo: Code[20];
                        attachmentsPage: Page Attachments;


                    begin

                        attachLink.Reset();
                        attachLink.setRange(attachLink.Document_No, Rec."No.");

                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');

                        // DMSManagement.FnUploadPurchaseOrderDocs(Rec."No.", 'Purchase Order', Rec.RecordId);
                    end;
                }

                action("Payment Advice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Advice';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Payment Advice action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57018, true, true, Rec)
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
                    visible = false;
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
                    // visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);
                    Visible = rec.Status = rec.Status::Released;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        rec.TestField(Posted, false);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        //ReopenPV.PerformManualReopen(Rec);
                        Rec.ReopenPv(Rec."No.")
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
        }
        area(creation)
        {
            action("Banked Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Banked Payment Voucher action.';
                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange("No.", Rec."No.");
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
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
                        // PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
                    end;
                }
                action(PreviewCheck)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&review Check';
                    Image = ViewCheck;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;
                    ToolTip = 'Preview the check before printing it.';

                    trigger OnAction()
                    begin
                        if Rec."Pay Mode" = 'CHEQUE' then begin
                            GenJnLine.DeleteAll;
                            LineNo := 252;
                            GenJnLine.Init;
                            if CMSetup.Get then
                                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                            GenJnLine."Line No." := LineNo;
                            PVLines.SetRange(No, Rec."No.");
                            if PVLines.FindSet then begin
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine."Account No." := PVLines."Account No";
                                GenJnLine.Validate(GenJnLine."Account No.");
                                GenJnLine."Posting Date" := Rec."Posting Date";
                                GenJnLine."Document No." := Rec."No.";
                                GenJnLine."External Document No." := Rec."Cheque No";
                                GenJnLine."Payment Method Code" := Rec."Pay Mode";
                                GenJnLine."Currency Code" := Rec."Currency Code";
                                GenJnLine.Validate("Currency Code");
                                GenJnLine.Amount := Rec."Total Net Amount";
                                GenJnLine.Description := CopyStr((Rec."Payment Narration"), 50);
                                //Ruth
                                GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                                GenJnLine."Bal. Account No." := Rec."Paying Bank Account";

                                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                                GenJnLine.Validate("Currency Code");
                                GenJnLine.Validate(GenJnLine.Amount);
                                // GenJnLine.Validate("Bal. Account No.");

                            end;
                            GenJnLine.Insert(true);
                            Page.Run(404, GenJnLine, Rec."No.");
                        end
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
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payment- Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be Empty.';
        // ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        Payments: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        CMSetup: Record "Cash Management Setup";
        PVLines: Record "PV Lines";
        DocOpen: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        if Rec.Status <> Rec.Status::Open then
            DocOpen := false
        else
            DocOpen := true;
    end;
}


