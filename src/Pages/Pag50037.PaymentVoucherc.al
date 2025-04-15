namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using Microsoft.Foundation.NoSeries;
using System.Security.User;


page 50037 "Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = Payments;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
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
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
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
                    Visible = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
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
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
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
                field(relatedTaxPv; Rec.relatedTaxPv)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the created tax pv.';
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
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
                    Editable = false;
                    ApplicationArea = Basic;
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
                field("Payment Type"; "Payment Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("PV Type"; "PV Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            part(Control1000000021; "PV Lines")
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
                    // RunPageLink = "Table Name" = const(57000),
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        lengthOfNarration: integer;

                    begin
                        /*  pvLines.Reset;
                          pvLines.SetRange(No, Rec."No.");
                          if pvLines.FindSet then begin
                              repeat
                                  PVLines1.Reset;
                                  PVLines1.SetFilter(No, '<>%1', pvLines.No);
                                  PVLines1.SetRange("Account No", pvLines."Account No");
                                  PVLines1.SetRange("Applies to Doc. No", pvLines."Applies to Doc. No");
                                  if PVLines1.FindSet then begin
                                      Message(Text003, PVLines1.No, pvLines."Applies to Doc. No");
                                  end;
                              until pvLines.Next = 0;
                          end;
                          //TESTFIELD("Funding Source");
                          Rec.TestField(Status, Rec.Status::Open);//status must be open.
                          //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                          if Rec.Budgeted = true then begin
                              //TESTFIELD(Job);
                              //TESTFIELD("Job Task No");
                          end;
                          if (Rec."Advance Recovery" <> 0) and (Rec."Account No." = '') then begin
                              Error(text0001);
                          end;
                          Rec.TestField("Payment Narration");
                          Rec.TestField(Payee);
                          Rec.TestField(Date);
                          pvheader.Reset;
                          pvheader.SetRange(pvheader."No.", Rec."No.");
                          if pvheader.Find('-') then begin
                              pvLines.Reset;
                              pvLines.SetRange(pvLines.No, pvheader."No.");
                              pvLines.SetRange("Account Type", pvLines."account type"::Vendor);
                              if pvLines.Find('-') then begin
                                  repeat
                                      pvLines.TestField(pvLines."Applies to Doc. No");
                                  until pvLines.Next = 0;
                              end;
                          end;
                          */
                        lengthOfNarration := StrLen(Rec."Payment Narration");
                        if (lengthOfNarration >= 100) then
                            Error('Narration Cannot exceed 100');
                        Rec.ValidatePVOnSendApproval(Rec);
                        // PaymentsPost.ValidatePaymentVoucher(Rsssssec);

                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
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
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = CanCancelApprovalRequest;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                                                             //  ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
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
                        Report.Run(57000, true, true, Rec)
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
                    PromotedCategory = Report;
                    ToolTip = 'Executes the Payment Advice action.';
                    trigger OnAction()
                    var
                        Paymentsrec: Record payments;
                    begin
                        Paymentsrec.Reset();
                        Paymentsrec.SetRange("No.", rec."No.");
                        if Paymentsrec.findfirst then begin
                            //DocPrint.PrintPurchHeader(Rec);
                            Report.Run(57018, true, true, Paymentsrec)
                        end;
                    end;
                }
                action("BULK EFT")
                {
                    ApplicationArea = Basic;
                    Caption = 'BULK EFT';
                    Image = ElectronicPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the BULK EFT action.';
                    trigger OnAction()
                    begin
                        pvLines.Reset;
                        pvLines.SetRange(No, Rec."No.");
                        if pvLines.FindSet then begin
                            PaymentEntries.Reset;
                            PaymentEntries.SetRange(No, pvLines."Applies to Doc. No");
                            if PaymentEntries.FindSet then
                                Report.Run(89039, true, true, PaymentEntries);
                        end;
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        // usersetup.Get(UserId);
                        // usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        // ReopenPV.PerformManualReopen(Rec);
                        Rec.Status := Rec.Status::Released;
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.Status := Rec.Status::Open;
                        // usersetup.Get(UserId);
                        // usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        // Rec.TestField("Reasons to Reopen");
                        // ReopenPV.PerformManualReopen(Rec);
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
                    Visible = (Rec.Status = Rec.Status::Released) and (not Posted);
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");
                        //PVPost."Post Payment Voucher"(Rec);
                        // PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    // IntegrationMgt: Codeunit "Create Refund Voucher";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                        if Rec.Posted then
                            Error('The payment voucher has already been posted!!');
                        Rec.TestField("Reasons to Reopen");
                        Rec.Status := rec.Status::Rejected;
                        // IntegrationMgt.CancelPV(Rec);
                        CurrPage.Close();
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
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExist;

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
                //         DMSManagement.FnUploadPaymentVoucherDocs(Rec."No.", 'Payment Voucher', Rec.RecordId);
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
                        DocType := DocType::Voucher;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Payment Voucher');
                    end;
                }

                action(testVoucher)
                {
                    ApplicationArea = All;
                    Caption = 'Test Voucher';
                    Image = Image;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    visible = false;

                    trigger OnAction()
                    var
                        hrPortal: Codeunit HRPortal;
                    begin

                        // hrPortal.createPaymentVoucherLines('FO20A-0000410', '10431087', 41472, 'SUPPLIER', 0);
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

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
        Rec.Budgeted := true;
        Rec."PV Type" := Rec."PV Type"::Normal;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        PaymentsPost: Codeunit "Payment- Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit "Payment- Post";
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PaymentEntries: Record "Payment Entries";
        Text003: label 'The PV No.:%1 has already attached this invoice No.: %2.';
        PVLines1: Record "PV Lines";
    // DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;

    procedure AssistEdit(OldVend: Record Payments): Boolean
    var
        Vend: Record Payments;
    begin
        with Vend do begin
            Vend := Rec;
            CashMgt.Get;
            CashMgt.TestField("PV Nos");
            if NoSeriesMgt.SelectSeries(CashMgt."PV Nos", OldVend."No. Series", "No. Series") then begin
                CashMgt.Get;
                CashMgt.TestField("PV Nos");
                NoSeriesMgt.SetSeries("No.");
                Rec := Vend;
                exit(true);
            end;
        end;
    end;

    var
    // Default: Record "Default Dimension";
}


