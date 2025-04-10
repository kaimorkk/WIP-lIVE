Page 52193754 "Payment Voucher Card"
{
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where(Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(BankName; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        if Status <> Status::Open then
                            Error('You cannot change this document at this stage');
                    end;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Payment Modes111";
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = CheqNoEditable;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = CheqDateEditable;
                }
                field(LPOLSOS15S12S13; "PO/INV No")
                {
                    ApplicationArea = Basic;
                    Caption = 'LPO/LSO/S15/S12/S13';
                }
                field(Purpose; Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000049; "PV Lines")
            {
                SubPageLink = "PV No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Payments)
            {
                Caption = 'Payments';
                action(PrintCheque)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Cheque';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);

                        Reset;
                        SetFilter(No, No);
                        Report.Run(51511019, true, true, Rec);
                        Reset;
                    end;
                }
                action(IncludeTaxation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Include Taxation';
                    Visible = false;

                    trigger OnAction()
                    begin
                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", No);
                        PVLines.SetRange(PVLines.Tax, true);
                        PVLines.DeleteAll;

                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", No);
                        if PVLines.Find('+') then
                            LastPVLine := PVLines."Line No";


                        if TarriffCodes.Get("VAT Code") then begin
                            PVLines.Init;
                            PVLines."PV No" := No;
                            PVLines."Line No" := LastPVLine + 10000;
                            PVLines."Account Type" := PVLines."account type"::"G/L Account";
                            PVLines."Account No" := TarriffCodes."G/L Account";
                            PVLines.Description := TarriffCodes.Description;
                            PVLines.Validate(PVLines."Account No");
                            PVLines.Tax := true;
                            CalcFields("Base Amount");
                            PVLines.Amount := -ROUND(("Base Amount" / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage));
                            if PVLines.Amount <> 0 then
                                PVLines.Insert;

                        end;

                        PVLines.Reset;
                        PVLines.SetRange(PVLines."PV No", No);
                        if PVLines.Find('+') then
                            LastPVLine := PVLines."Line No";

                        if TarriffCodes.Get("Withholding Tax Code") then begin
                            PVLines.Init;
                            PVLines."PV No" := No;
                            PVLines."Line No" := LastPVLine + 10000;
                            PVLines."Account Type" := PVLines."account type"::"G/L Account";
                            PVLines."Account No" := TarriffCodes."G/L Account";
                            PVLines.Description := TarriffCodes.Description;
                            PVLines.Validate(PVLines."Account No");
                            PVLines.Tax := true;

                            CalcFields("Base Amount");
                            PVLines.Amount := -ROUND(("Base Amount" / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage));
                            if PVLines.Amount <> 0 then
                                PVLines.Insert;


                        end;
                    end;
                }
                action(RemittanceAdvice)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remittance Advice';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*
                        RESET;
                        SETFILTER(No,No);
                        REPORT.RUN(53097,TRUE,TRUE,Rec);
                        RESET;
                        */

                    end;
                }
                action(ClaimAdvise)
                {
                    ApplicationArea = Basic;
                    Caption = 'Claim Advise';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*
                       RESET;
                       SETFILTER(No,No);
                       REPORT.RUN(53029,TRUE,TRUE,Rec);
                       RESET;
                        */

                    end;
                }
                action(VATCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT Certificate';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);


                        /*IF Status<>Status::Released THEN
                        ERROR('This document is not yet fully approved'); */
                        PVRec.Reset;
                        PVRec.SetRange(PVRec.No, No);
                        Report.RunModal(51511009, true, true, PVRec);

                    end;
                }
                action(WithholdingTaxCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Withholding Tax Certificate';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);


                        PVRec.Reset;
                        PVRec.SetRange(PVRec.No, No);
                        Report.RunModal(51511010, true, true, PVRec);
                    end;
                }
                action(GenerateKCBEFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate KCB  EFT';
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*
                        TESTFIELD("Pay Mode");
                        TESTFIELD("Paying Bank Account");
                        TESTFIELD(Payee);
                        
                        
                        KCBEFT.GetPV(Rec);
                        KCBEFT.RUN;
                         */

                    end;
                }
                action(CBAEFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'CBA EFT';

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);

                        PVRec.Reset;
                        PVRec.SetRange(PVRec.No, No);
                        Report.Run(51511362, true, true, PVRec);
                    end;
                }
                action(PrintChequedotmarix)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Cheque - dot marix';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);

                        Reset;
                        SetFilter(No, No);
                        Report.Run(51511177, true, true, Rec);
                        Reset;
                    end;
                }
            }
            group(Approvals)
            {
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Visible = true;

                    trigger OnAction()
                    begin
                        TestField("Pay Mode");
                        TestField("Paying Bank Account");
                        TestField(Payee);
                        // if Amount <> "Total Amount" then
                        //     Error(' Total Amount on the lines must be equal to amount');
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Visible = true;

                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant)
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-open';

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        if Rec.Status = Rec.Status::Open then
                            exit;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Release';

                    trigger OnAction()
                    begin
                        Rec.Status := Status::Released;
                        Rec.Modify(true);
                    end;
                }
                action(SuggestBoardMemberPayments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Board Member Payments';

                    trigger OnAction()
                    begin
                        suggestcoompayment.GetPV(Rec);
                        suggestcoompayment.Run;
                    end;
                }
                action(SuggestMedicalClaimPayments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Medical Claim Payments';

                    trigger OnAction()
                    begin
                        // GenerateClaimPayable.GetPV(Rec);
                        // GenerateClaimPayable.Run;
                    end;
                }
                action(SuggestCommissionerTax)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Commissioner Tax';

                    trigger OnAction()
                    begin
                        SuggestCoomTax.GetPV(Rec);
                        SuggestCoomTax.Run;
                    end;
                }
                action("Print Check")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Reset;
                        PVRec.SetRange(PVRec.No, No);
                        Report.RunModal(51511368, true, true, PVRec);
                    end;
                }
                action("Payment Remittance Advice")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Reset;
                        PVRec.SetRange(PVRec.No, No);
                        Report.RunModal(51511373, true, true, PVRec);
                    end;
                }
                action("Send Remittance Advice")
                {
                    ApplicationArea = Basic;
                    Caption = '   Send Remittance Advice';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CompanyInfo.Get();
                        SenderAddress := CompanyInfo."Administrator Email";
                        SenderName := COMPANYNAME;
                        Subject := StrSubstNo('Payment Remittance Advice');
                        Body := StrSubstNo('Please find attached your Payment Remittance Advice');

                        Vendor.Reset;
                        if Vendor.Get("Account No.") then
                            Recipients := Vendor."E-Mail";

                        SMTPSetup.Create(Recipients, Subject, Body, true);

                        // FileName := FileManagement.ServerTempFileName('.pdf');

                        Reset;
                        PVRec.SetRange(PVRec.No, No);
                        // Report.SaveAsPdf(51511373, FileName, PVRec);
                        /*
                        SMTPSetup.AddAttachment(FileName);
                        //SMTPSetup.AddCC(CompanyInfo."Finance Support Email");
                        Email.Send(SMTPSetup);*/

                        Message('Payment Remittance Advice sent to %1', "Account Name");

                    end;
                }
            }
        }
        area(processing)
        {
            action(SendForApproval)
            {
                ApplicationArea = Basic;
                Caption = 'Send For Approval';
                Visible = false;

                trigger OnAction()
                begin
                    if Status <> Status::Open then
                        Error('The document has already been processed.');

                    if Amount < 0 then
                        Error('Amount cannot be less than zero.');

                    if Amount = 0 then
                        Error('Please enter amount.');


                    if "Pay Mode" = 'CHEQUE' then begin
                        TestField("Paying Bank Account");
                        //TESTFIELD("Cheque No");
                        //TESTFIELD("Cheque Date");
                        //TESTFIELD("Cheque Type");
                        //TESTFIELD("Bank Code");
                    end;
                    TestField("Paying Bank Account");
                    TestField("Transaction Name");
                    TestField("Pay Mode");
                    TestField(Payee);
                    TestField(Amount);
                    TestField("VAT Code");
                    TestField("Withholding Tax Code");
                    TestField("Global Dimension 1 Code");
                    TestField("Account No.");
                    TestField("Branch Code");
                    TestField("Net Amount");
                    TestField("Paying Bank Account");

                    if Confirm('Are you sure you would like to approve the payment?', false) = true then begin
                        Status := Status::Released;
                        Modify;
                        Message('Document approved successfully.');
                    end;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Visible = true;

                trigger OnAction()
                var
                    PVPost: Codeunit "Payment- Post";
                begin
                    // if Amount <> "Total Amount" then
                    //     Error(' Total Amount on the lines must be equal to amount');
                    if Status <> Status::Released then
                        Error('The Document cannot be posted before it is fully approved');
                    Rec.CalcFields("Total Amount");
                    Rec.Amount := Rec."Total Amount";
                    Rec.Modify();
                    PVPost.PostPayment(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter(No, No);
                    //REPORT.RUN(51511013,TRUE,TRUE,Rec);
                    // Report.Run(51511010, true, true, Rec);
                    Report.Run(52193452, true, true, Rec);
                    Reset;
                end;
            }
            action(DMSLink)
            {
                ApplicationArea = Basic;
                Caption = 'DMS Link';
                Enabled = true;
                Visible = true;

                trigger OnAction()
                begin
                    GLSetup.Get();
                    Link := GLSetup."DMS PV Link" + No;
                    Hyperlink(Link);
                end;
            }
            action(ImportPayments)
            {
                ApplicationArea = Basic;
                Caption = 'Import Payments';

                trigger OnAction()
                begin
                    //PaymentImport.GetRec(Rec);
                    PaymentImport.Run;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref(SendForApproval_Promoted; SendForApproval)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(DMSLink_Promoted; DMSLink)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Pay Mode" = 'CHEQUE' then begin
            CheqNoEditable := true;
            CheqDateEditable := true;
        end;
        if "Pay Mode" = 'EFT' then begin
            CheqNoEditable := true;
            CheqDateEditable := true;
        end;
        if "Pay Mode" = 'DEPOSIT SLIP' then begin
            CheqNoEditable := true;
            CheqDateEditable := true;
        end
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Posted then
            Error('You cannot delete the details of the payment voucher at this stage');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF Posted THEN
        ERROR('You cannot change the details of the payment voucher at this stage');
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // CurrForm.EDITABLE:=TRUE;
        "Payment Type" := "payment type"::Normal;

        CheqNoEditable := true;
        CheqDateEditable := true;
    end;

    trigger OnOpenPage()
    begin
        CurrPage.Editable := true;
    end;

    var
        RecPayTypes: Record "Receipts and Payment Types1";
        TarriffCodes: Record "Tarriff Codes1";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        FaDepreciation: Record "FA Depreciation Book";
        BankAcc: Record "Bank Account";
        PVLines: Record "PV Lines1";
        LastPVLine: Integer;
        PolicyRec: Record "Sales Cr.Memo Header";
        PremiumControlAmt: Decimal;
        BasePremium: Decimal;
        TotalTax: Decimal;
        TotalTaxPercent: Decimal;
        TotalPercent: Decimal;
        SalesInvoiceHeadr: Record "Sales Cr.Memo Header";
        AdjustConversion: Codeunit "Adjust Gen. Journal Balance";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        //VATCert: Report "VAT Withholding Certificate";
        //WithholdCert: Report "VAT Withholding Certificate";
        PVRec: Record Payments;
        suggestcoompayment: Report "Commissioner Balance";
        RequestHeader: Record "Request Header1";
        RequestLines: Record "Request Lines1";
        CommittmentEntries: Record "Commitment Register";
        LastEntry: Integer;
        // GenerateClaimPayable: Report "Generate Claims Payable";
        BankLedger: Record "Bank Account Ledger Entry";
        ClaimLines: Record "Claim Line1";
        SuggestCoomTax: Report "Commissioner Balance Tax";
        GlLineNo: Integer;
        GLSetup: Record "General Ledger Setup";
        Link: Text[250];
        PaymentImport: XmlPort Payments;
        //CBAEFT: Report "CBA EFT";
        CompanyInfo: Record "Company Information";
        SenderAddress: Text[80];
        SenderName: Text[80];
        Subject: Text[100];
        Body: Text[250];
        Recipients: Text[80];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        FileName: Text[250];
        Vendor: Record Vendor;
        FileManagement: Codeunit "File Management";
        CheqNoEditable: Boolean;
        CheqDateEditable: Boolean;
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
}

