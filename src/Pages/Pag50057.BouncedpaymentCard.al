namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using Microsoft.Foundation.NoSeries;


page 50057 "Bounced Payment"
{
    Caption = 'Bounced Payment';
    PageType = Card;
    SourceTable = payments;
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

                field("Bounced Payment Type"; Rec."Bounced Payment Type")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin

                        CurrPage.UPDATE();


                    end;
                }

                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic, Suit;
                    Editable = false;

                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic, Suit;
                    // Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Staff Claim";
                    Editable = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic, Suit;
                    Editable = false;

                }

                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                    Editable = false;

                }

                field("Payee Bank Code"; Rec."Payee Bank Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Code field.', Comment = '%';
                    // Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Imprest";
                    Editable = false;

                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.', Comment = '%';
                    // Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Imprest";
                    Editable = false;


                }
                field("Payee Bank Account"; Rec."Payee Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Account field.', Comment = '%';
                    // Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Imprest";
                    Editable = false;


                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                    // Editable = false;

                }
                field("Bounced Pv Type"; Rec."Bounced Pv Type")
                {
                    Caption = 'Bounced PV Type';
                    Editable = ((Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Payment Voucher") and (not OpenApprovalEntriesExist));

                    ApplicationArea = Basic, Suit;

                }

                field("Bounced Payment Doc. No"; Rec."Bounced Payment Doc. No")
                {
                    ApplicationArea = Basic;
                }


                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic, Suit;
                    Editable = false;
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
                    ApplicationArea = Basic, Suit;
                    ToolTip = 'Specifies the value of the Payee field.';
                    Editable = false;
                }

                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic, Suit;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                    // Editable = false;

                }

                field("Bank Payment Ref"; Rec.BankPaymentRef)
                {
                    ApplicationArea = Basic, Suit;
                    Caption = 'Returned Bank Ref No.';
                    Editable = Rec.Status = Rec.Status::Open;



                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }





                field(bouncedPaymentDate; Rec.bouncedPaymentDate)
                {
                    ApplicationArea = Basic, Suit;
                    Caption = 'Bounced Payment Date';
                    Editable = Rec.Status = Rec.Status::Open;
                }

                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field(BouncedPaymenttype; Rec.BouncedPaymenttype)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                }
                field("PV Type"; Rec."PV Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field(status; Rec.Status)
                {
                    ApplicationArea = All;
                }




            }
            part(Control1000000021; "PV Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                // Visible = (Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Payment Voucher") and
                Visible = Rec."Bounced Pv Type" = Rec."Bounced Pv Type"::Normal;
            }
            part(Control1000000022; "Staff Claim Lines")
            {
                Editable = not OpenApprovalEntriesExist;

                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Staff Claim";

            }
            part(DepositRefundDetails; "Deposit Refund Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Visible = Rec."Bounced Pv Type" = Rec."Bounced Pv Type"::Refund;

                //     Visible = (Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Payment Voucher") and
                //  (Rec."Bounced Pv Type" = Rec."Bounced Pv Type"::Refund);

            }
            part(Control1000000025; "Standing Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Standing Imprest";
            }
            part(Control1000000017; "Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Visible = Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::Imprest;

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
                        paymentsVoucher: Record Payments;
                        payee: Text[150];
                        bankName: Text[50];
                        DocNo: Code[20];
                        bouncedPaymentDoc: Code[20];
                        bouncedPvType: Option;
                        bouncedPaymentType: Option;
                        bouncedPaymentDate: Date;
                        bouncedRefNumber: Code[200];
                        paymode: Code[20];
                        payeeBankAccName: Code[100];
                        payeeBankBranch: Code[100];
                        payeeBankName: Text[80];
                        payeeBankCode: Code[80];
                        payeeBankAccount: Code[30];
                        payeebankBrName: Text[80];
                        narration: Text[99];
                        payment2: Record Payments;
                        postingDate: Date;







                    begin

                        Rec.TestField(Rec.BankPaymentRef);
                        Rec.TestField(Rec.bouncedPaymentDate);
                        payee := Rec.Payee;
                        bankName := Rec."Bank Name";
                        DocNo := Rec."No.";
                        postingDate := Rec."Posting Date";
                        bouncedPaymentDoc := Rec."Bounced Payment Doc. No";
                        bouncedPvType := Rec."Bounced Pv Type";
                        bouncedPaymentType := Rec."Bounced Payment Type";
                        bouncedPaymentDate := Rec.bouncedPaymentDate;
                        bouncedRefNumber := Rec.BankPaymentRef;
                        payeeBankAccount := Rec."Payee Bank Account";
                        payeeBankCode := Rec."Payee Bank Code";
                        payeeBankAccName := Rec.Payee;
                        payeeBankName := Rec."Payee Bank Name";
                        payeeBankBranch := Rec."Payee Bank Branch";
                        payeebankBrName := Rec."Payee Branch Name";
                        narration := Rec."Payment Narration";
                        paymode := Rec."Pay Mode";
                        lengthOfNarration := StrLen(Rec."Payment Narration");
                        payment2.reset();
                        payment2.setRange(BankPaymentRef, bouncedRefNumber);
                        if payment2.FindSet() then begin
                            if payment2.count() > 1 then
                                Error('Returned Bank Reference Exists');
                        end;
                        paymentsVoucher.reset();
                        paymentsVoucher.setRange("No.", Rec."Bounced Payment Doc. No");
                        if paymentsVoucher.FindFirst() then begin
                            paymentsVoucher.CalcFields("Imprest Amount", "Total Net Amount");
                            Rec.TransferFields(paymentsVoucher, false);
                            Rec."Created By" := UserId;
                            Rec."No." := DocNo;
                            Rec.Status := Rec.status::open;
                            Rec.Posted := false;
                            Rec."Posting Date" := postingDate;
                            Rec."Posted By" := '';
                            Rec."EFT Code" := '';
                            Rec."Pay Mode" := paymode;
                            Rec.isBouncedUsed := true;
                            Rec."Bounced Payment Doc. No" := bouncedPaymentDoc;
                            Rec."Bounced Payment Type" := bouncedPaymentType;
                            Rec."Bounced Pv Type" := bouncedPvType;
                            Rec."Document Type" := Rec."Document Type"::"Bounced Payment Voucher";
                            Rec.bouncedPaymentDate := bouncedPaymentDate;
                            Rec.BankPaymentRef := bouncedRefNumber;
                            Rec."Payee Bank Account" := payeeBankAccount;
                            Rec."Payee Bank Code" := payeeBankCode;
                            Rec.Payee := payeeBankAccName;
                            Rec."Payee Bank Name" := payeeBankName;
                            Rec."Payee Bank Branch" := payeeBankBranch;
                            Rec."Payee Branch Name" := payeebankBrName;
                            Rec."Payment Narration" := narration;
                            // Rec."Total Net Amount" := "Total Net Amount";
                            // Rec."Imprest Amount" := "Imprest Amount";
                            // Rec."Total Amount" := "Total Amount";
                            if paymentsVoucher."EFT Code" = '' then begin
                                paymentsVoucher."EFT Code" := 'Reversed';
                                paymentsVoucher.isBouncedUsed := true;
                                paymentsVoucher.Modify();
                            end;

                            Rec.Modify();

                        end;
                        if (lengthOfNarration >= 99) then
                            Error('Narration Cannot exceed 100');
                        // Rec.ValidatePVOnSendApproval(Rec);
                        // PaymentsPost.ValidatePaymentVoucher(Rec);

                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                        // Rec.CheckDimensions(Rec."Dimension Set ID");
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
                    Visible = false;
                    trigger OnAction()

                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57000, true, true, Rec)
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
                    var
                        bouncedPv, originalPv : Record Payments;
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");
                        //PVPost."Post Payment Voucher"(Rec);
                        // originalPv.reset;
                        // originalPv.setRange("No.", Rec."Bounced Payment Doc. No");
                        // if originalPv.FindFirst() then begin
                        //     bouncedPv.init();
                        //     bouncedPv.TransferFields(originalPv, false);
                        //     bouncedPv."No." := Rec."No.";
                        //     bouncedPv.Posted := false;
                        //     bouncedPv."Posted By" := UserId;
                        //     bouncedPv."Posting Date" := Today;
                        //     bouncedPv."Bounced Payment Type" := Rec."Bounced Payment Type";
                        //     bouncedPv."Bounced Pv Type" := Rec."Bounced Pv Type";
                        //     bouncedPv."Bounced Payment Doc. No" := Rec."Bounced Payment Doc. No";
                        //     bouncedPv."Document Type" := Rec."Document Type";
                        // if (Rec."Payment Type" = Rec."Payment Type"::"Staff Claim") then
                        //     PaymentsPost.PostStaffClaims(Rec, false);
                        // if (Rec."Payment Type" = Rec."Payment Type"::"Payment Voucher") then
                        //     PaymentsPost."Post Payment Voucher"(Rec, false, UserId);
                        // if (Rec."Payment Type" = Rec."Payment Type"::"Standing Imprest") then
                        //     PaymentsPost.PostBankTransfer(Rec, false);
                        // if (Rec."Payment Type" = Rec."Payment Type"::"Imprest") then
                        //     PaymentsPost."Post Imprest"(Rec);



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
                        // Rec.TestField("Reasons to Reopen");
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


                action("UpdatePayeeBankName")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Process;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Update Bank Details';

                    trigger OnAction()
                    var
                        isSucess: Boolean;
                        payment: Record "Payments";
                        pvLines: Record "PV Lines";
                        payeeBankAccName: Code[100];
                        payeeBankBranch: Code[100];
                        payeeBankName: Text[80];
                        payeeBankCode: Code[80];
                        payeeBankAccount: Code[30];
                        payeebankBrName: Text[80];
                        empBankDetails: JsonObject;
                        // OutwardPayment: Codeunit OutwardPayment;
                        jsonToken: JsonToken;
                        accountNumber: Code[20];
                        ImprestLines: Record "Imprest Lines";


                    begin

                        payment.reset();
                        Rec.TestField(Rec."Bounced Payment Doc. No");
                        payment.setRange("No.", Rec."Bounced Payment Doc. No");
                        if payment.FindFirst() then begin
                            if payment."Payment Type" = payment."Payment Type"::"Standing Imprest" then
                                accountNumber := payment."Source No"

                            else
                                accountNumber := payment."Account No.";
                        end;
                        rec.TestField(Status, rec.Status::Open);
                        if ((Rec."Payment Type" = Rec."Payment Type"::"Staff Claim") or (Rec."Payment Type" = Rec."Payment Type"::"Standing Imprest")) then begin
                            empBankDetails := Rec.updateEmpBankDetails(accountNumber);
                            // payeeBankAccName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank acc name');
                            // payeeBankBranch := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank branch');
                            // payeeBankCode := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank code');
                            // payeeBankAccount := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank account');
                            // payeeBankName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank name');
                            // payeebankBrName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank br name');


                            if ((payeeBankAccName = '') or (payeebankBrName = '') or (payeeBankBranch = '') or (payeeBankCode = '') or (payeeBankAccount = '') or (payeeBankName = '')) then
                                Error('Request Employee to Update Bank Details');

                            Rec."Payee Bank Account" := payeeBankAccount;
                            Rec."Payee Bank Code" := payeeBankCode;
                            Rec.Payee := payeeBankAccName;
                            Rec."Payee Bank Name" := payeeBankName;
                            Rec."Payee Bank Branch" := payeeBankBranch;
                            Rec."Payee Branch Name" := payeebankBrName;
                            Rec.Modify();


                            pvLines.Reset();
                            pvLines.SetRange(No, Rec."No.");
                            if pvLines.FindSet() then
                                repeat
                                    pvLines."Payee Bank Acc Name" := payeeBankAccName;
                                    pvLines."Payee Bank Account No." := payeeBankAccount;
                                    pvLines."Payee Bank Code" := payeeBankCode;
                                    pvLines."Payee Bank Name" := payeeBankName;
                                    pvLines."Payee Bank Branch Code" := payeeBankBranch;
                                    pvLines."Payee Bank Branch Name" := payeebankBrName;
                                    pvLines.Modify();
                                    Message('Updated Successfully');
                                until pvLines.Next = 0;
                        end;
                        if (Rec."Payment Type" = Rec."Payment Type"::"Imprest") then begin
                            empBankDetails := Rec.updateEmpBankDetails(accountNumber);
                            // payeeBankAccName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank acc name');
                            // payeeBankBranch := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank branch');
                            // payeeBankCode := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank code');
                            // payeeBankAccount := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank account');
                            // payeeBankName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank name');
                            // payeebankBrName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank br name');


                            if ((payeeBankAccName = '') or (payeebankBrName = '') or (payeeBankBranch = '') or (payeeBankCode = '') or (payeeBankAccount = '') or (payeeBankName = '')) then
                                Error('Request Employee to Update Bank Details');

                            Rec."Payee Bank Account" := payeeBankAccount;
                            Rec."Payee Bank Code" := payeeBankCode;
                            Rec.Payee := payeeBankAccName;
                            Rec."Payee Bank Name" := payeeBankName;
                            Rec."Payee Bank Branch" := payeeBankBranch;
                            Rec."Payee Branch Name" := payeebankBrName;
                            Rec.Modify();



                        end;

                    end;




                }

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
        // Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        // Rec."Account Type" := Rec."account type"::Customer;
        // Rec.Budgeted := true;
        // Rec."PV Type" := Rec."PV Type"::"Bounced Payments Voucher";
        Rec."PV Type" := Rec."PV Type"::"Bounced Payments Voucher";
        Rec."Document Type" := Rec."Document Type"::"Bounced Payment Voucher";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
        Rec."PV Type" := Rec."PV Type"::"Bounced Payments Voucher";
        Rec."Document Type" := Rec."Document Type"::"Bounced Payment Voucher";

    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        // PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        // ReopenPV: Codeunit Payments;
        // usersetup: Record "User Setup";
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
            // CashMgt.TestField("/Bounced Pvs Nos");
            // if NoSeriesMgt.SelectSeries(CashMgt."Bounced Pvs Nos", OldVend."No. Series", "No. Series") then begin
            //     CashMgt.Get;
            //     // CashMgt.TestField("Bounced Pvs Nos");
            //     NoSeriesMgt.SetSeries("No.");
            //     Rec := Vend;
            //     exit(true);
            // end;
        end;
    end;




    var
        // Default: Record "Default Dimension";
        isVisible: Boolean;
}



