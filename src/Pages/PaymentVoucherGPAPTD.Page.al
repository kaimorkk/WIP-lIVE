Page 52193497 "Payment Voucher GPA PTD"
{
    PageType = Card;
    SourceTable = "Payment Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(UserRemarks; "User Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GOKCode; "GOK Code")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(VATCode; "VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(WithholdingTaxCode; "Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(VATAmount; "VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field(WithholdingTaxAmount; "Withholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount; "Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("PV Lines"; "PV Lines111")
            {
                SubPageLink = No = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approve)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if "Account Type" = "account type"::Vendor then begin
                        pvline.Reset;
                        pvline.SetRange(pvline.No, No);
                        if pvline.Find('-') = false then
                            Error('You must specify the invoices for vendor Payment Vouchers');
                    end;



                    NextLocation := '';
                    EntryNo := 0;
                    MovementTracker.Reset;
                    if MovementTracker.Find('+') then
                        EntryNo := MovementTracker."Entry No.";

                    EntryNo := EntryNo + 1;

                    MovementTracker.Reset;
                    MovementTracker.SetCurrentkey(MovementTracker."Entry No.");
                    MovementTracker.SetRange(MovementTracker."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                    MovementTracker.SetRange(MovementTracker."Document No.", No);
                    if MovementTracker.Find('+') then begin
                        NextStage := MovementTracker.Stage + 1;

                        MovementTracker."Current Location" := false;
                        MovementTracker."Date/Time Out" := CreateDatetime(Today, Time);
                        MovementTracker."USER ID" := UserId;
                        MovementTracker.Validate(MovementTracker."USER ID");
                        MovementTracker.Remarks := "User Remarks";
                        MovementTracker.Status := MovementTracker.Status::Approved;
                        MovementTracker.Modify;

                        ApprovalsSetup.Reset;
                        ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                        ApprovalsSetup.SetRange(ApprovalsSetup.Stage, NextStage);
                        if ApprovalsSetup.Find('-') then begin
                            MovementTracker.Init;
                            MovementTracker."Entry No." := EntryNo;
                            MovementTracker."Document No." := No;
                            MovementTracker."Approval Type" := ApprovalsSetup."Approval Type";
                            MovementTracker.Stage := ApprovalsSetup.Stage;
                            MovementTracker."Current Location" := true;
                            MovementTracker.Status := MovementTracker.Status::"Being Processed";
                            MovementTracker.Description := ApprovalsSetup.Description;
                            MovementTracker.Remarks := "User Remarks";
                            NextLocation := ApprovalsSetup.Station;
                            MovementTracker.Station := ApprovalsSetup.Station;
                            MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
                            MovementTracker.Insert(true);
                        end else begin
                            Approved := true;
                            Modify;
                        end;
                    end else begin
                        ApprovalsSetup.Reset;
                        ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                        ApprovalsSetup.SetRange(ApprovalsSetup.Stage, 1);
                        if ApprovalsSetup.Find('-') then begin
                            MovementTracker.Init;
                            MovementTracker."Entry No." := EntryNo;
                            MovementTracker."Document No." := No;
                            MovementTracker."Approval Type" := ApprovalsSetup."Approval Type";
                            MovementTracker.Stage := ApprovalsSetup.Stage;
                            MovementTracker."Current Location" := true;
                            MovementTracker.Status := MovementTracker.Status::"Being Processed";
                            MovementTracker.Description := ApprovalsSetup.Description;
                            MovementTracker.Remarks := "User Remarks";
                            NextLocation := ApprovalsSetup.Station;
                            MovementTracker.Station := ApprovalsSetup.Station;
                            MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
                            MovementTracker.Insert(true);
                        end;
                    end;


                    //Check Approval Rights
                    MovementTracker.Reset;
                    MovementTracker.SetCurrentkey(MovementTracker."Entry No.");
                    MovementTracker.SetRange(MovementTracker."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                    MovementTracker.SetRange(MovementTracker."Document No.", No);
                    if MovementTracker.Find('+') then begin

                        ApprovalUsers.Reset;
                        ApprovalUsers.SetRange(ApprovalUsers."Approval Type", MovementTracker."Approval Type");
                        ApprovalUsers.SetRange(ApprovalUsers.Stage, MovementTracker.Stage);
                        ApprovalUsers.SetRange(ApprovalUsers."User ID", UserId);
                        if ApprovalUsers.Find('-') then begin
                            CurrPage.Editable := true;
                            //CurrPage.Approve.ENABLED:=TRUE;
                            //CurrPage.Reject.ENABLED:=TRUE;
                        end else begin
                            CurrPage.Editable := false;
                            //CurrPage.Approve.ENABLED:=FALSE;
                            //CurrPage.Reject.ENABLED:=FALSE;
                        end;
                    end;
                    //Check Approval Rights

                    if NextLocation = '' then begin
                        MovementTracker."Current Location" := true;
                        MovementTracker.Modify;
                        Message('Batch successfully approved.')
                    end else begin

                        Message('Batch successfully approved. It has now been moved to ' + NextLocation);
                    end;
                end;
            }
            action("Update Amount")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    pvline.Reset;
                    totalamt := 0;
                    pvline.SetRange(pvline.No, No);
                    if pvline.Find('-') then begin
                        repeat
                            totalamt := totalamt + pvline."Remaining Amount";
                        until pvline.Next = 0;
                    end;
                    PV.SetRange(PV.No, No);
                    if PV.Find('-') then begin
                        PV.Amount := totalamt;
                        PV.Modify;
                    end;
                end;
            }
            group(Functions)
            {
                action(Reject)
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        if Confirm('Are you sure you want to reject this batch?') = false then
                            exit;

                        EntryNo := 0;
                        MovementTracker.Reset;
                        if MovementTracker.Find('+') then
                            EntryNo := MovementTracker."Entry No.";

                        EntryNo := EntryNo + 1;

                        MovementTracker.Reset;
                        MovementTracker.SetCurrentkey(MovementTracker."Entry No.");
                        MovementTracker.SetRange(MovementTracker."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                        MovementTracker.SetRange(MovementTracker."Document No.", No);
                        if MovementTracker.Find('+') then begin
                            NextStage := MovementTracker.Stage - 1;

                            MovementTracker."Current Location" := false;
                            MovementTracker."Date/Time Out" := CreateDatetime(Today, Time);
                            MovementTracker."USER ID" := UserId;
                            MovementTracker.Remarks := 'Shares Transfer';
                            MovementTracker.Status := MovementTracker.Status::Rejected;
                            MovementTracker.Modify;

                            ApprovalsSetup.Reset;
                            ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                            ApprovalsSetup.SetRange(ApprovalsSetup.Stage, NextStage);
                            if ApprovalsSetup.Find('-') then begin
                                MovementTracker.Init;
                                MovementTracker."Entry No." := EntryNo;
                                MovementTracker."Document No." := No;
                                MovementTracker."Approval Type" := MovementTracker."approval type"::"Payment Voucher";
                                MovementTracker.Stage := ApprovalsSetup.Stage;
                                MovementTracker."Current Location" := true;
                                MovementTracker.Status := MovementTracker.Status::"Being Processed";
                                MovementTracker.Description := ApprovalsSetup.Description;
                                NextLocation := ApprovalsSetup.Station;
                                MovementTracker.Station := ApprovalsSetup.Station;
                                MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
                                MovementTracker.Insert(true);
                            end;

                        end else begin
                            ApprovalsSetup.Reset;
                            ApprovalsSetup.SetRange(ApprovalsSetup."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                            if ApprovalsSetup.Find('-') then begin
                                MovementTracker.Init;
                                MovementTracker."Entry No." := EntryNo;
                                MovementTracker."Document No." := No;
                                MovementTracker."Approval Type" := ApprovalsSetup."Approval Type";
                                MovementTracker.Stage := ApprovalsSetup.Stage;
                                MovementTracker."Current Location" := true;
                                MovementTracker.Status := MovementTracker.Status::Rejected;
                                MovementTracker.Description := ApprovalsSetup.Description;
                                NextLocation := ApprovalsSetup.Station;
                                MovementTracker.Station := ApprovalsSetup.Station;
                                MovementTracker."Date/Time In" := CreateDatetime(Today, Time);
                                MovementTracker.Insert(true);
                            end;

                        end;

                        //Check Approval Rights
                        MovementTracker.Reset;
                        MovementTracker.SetCurrentkey(MovementTracker."Entry No.");
                        MovementTracker.SetRange(MovementTracker."Approval Type", MovementTracker."approval type"::"Payment Voucher");
                        MovementTracker.SetRange(MovementTracker."Document No.", No);
                        if MovementTracker.Find('+') then begin

                            ApprovalUsers.Reset;
                            ApprovalUsers.SetRange(ApprovalUsers."Approval Type", MovementTracker."Approval Type");
                            ApprovalUsers.SetRange(ApprovalUsers.Stage, MovementTracker.Stage);
                            ApprovalUsers.SetRange(ApprovalUsers."User ID", UserId);
                            if ApprovalUsers.Find('-') then begin
                                CurrPage.Editable := true;
                                //CurrForm.Approve.ENABLED:=TRUE;
                                //CurrForm.Reject.ENABLED:=TRUE;
                            end else begin
                                CurrPage.Editable := false;
                                //CurrForm.Approve.ENABLED:=FALSE;
                                //CurrForm.Reject.ENABLED:=FALSE;
                            end;
                        end;
                        //Check Approval Rights


                        if NextLocation = '' then
                            Message('Batch successfully Rejected.')
                        else begin

                            Message('Batch successfully Rejected. It has now been moved back to ' + NextLocation);
                        end;
                    end;
                }
                separator(Action1000000031)
                {
                }
                action(Post)
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        if Status <> Status::Verified then
                            Error('You cannot post this Payment Voucher before it is  approved');

                        TestField("Cheque Date");
                        TestField("Account No.");
                        TestField(Amount);
                        TestField("Net Amount");
                        TestField("Paying Bank Account");

                        genJnlLine.SetRange(genJnlLine."Journal Template Name", 'GENERAL');
                        genJnlLine.SetRange(genJnlLine."Journal Batch Name", 'PVPOSTING');
                        genJnlLine.DeleteAll;

                        LineNo := 0;
                        totalamt := Amount;

                        paymentVoucher.SetRange(paymentVoucher.No, No);
                        if paymentVoucher.Find('-') then begin
                            pvline.SetRange(pvline.No, No);

                            if pvline.Find('-') then begin
                                repeat


                                    Tarrifcodes.Reset;
                                    Vatamt := 0;
                                    Tarrifcodes.SetRange(Tarrifcodes.Code, "VAT Code");
                                    if Tarrifcodes.Find('-') then begin
                                        Vatamt := (pvline."Remaining Amount" * (Tarrifcodes.Percentage / 100)) / ((100 + Tarrifcodes.Percentage) / 100);
                                    end;

                                    Tarrifcodes.Reset;
                                    WithAmt := 0;
                                    Tarrifcodes.SetRange(Tarrifcodes.Code, "Withholding Tax Code");
                                    if Tarrifcodes.Find('-') then begin
                                        WithAmt := pvline."Remaining Amount" * (Tarrifcodes.Percentage / 100);
                                    end;

                                    //for invoice ammt paid
                                    genJnlLine.Init;
                                    LineNo := LineNo + 1000;
                                    genJnlLine."Line No." := LineNo;
                                    genJnlLine."Journal Template Name" := 'GENERAL';
                                    genJnlLine."Journal Batch Name" := 'PVPOSTING';
                                    genJnlLine."Account Type" := paymentVoucher."Account Type";
                                    genJnlLine."Account No." := paymentVoucher."Account No.";
                                    genJnlLine.Validate(genJnlLine."Account No.");
                                    genJnlLine."Posting Date" := ("Cheque Date");
                                    genJnlLine."Document No." := paymentVoucher.No;
                                    genJnlLine.Description := 'Invoice For' + Format(paymentVoucher.No);

                                    InvAmt := pvline."Remaining Amount" - Vatamt - WithAmt;
                                    if totalamt > 0 then begin
                                        if totalamt >= InvAmt then begin
                                            genJnlLine.Amount := InvAmt;
                                        end
                                        else if totalamt < InvAmt then begin
                                            genJnlLine.Amount := totalamt;
                                        end;
                                        totalamt := totalamt - InvAmt;
                                    end;
                                    genJnlLine.Validate(genJnlLine.Amount);
                                    vendorLedgerEntry.Reset;
                                    //   vendorLedgerEntry.SetRange(vendorLedgerEntry."Vendor No.",pvline."Vendor No.");
                                    //   vendorLedgerEntry.SetRange(vendorLedgerEntry."Document No.",pvline."Apply to");
                                    //   vendorLedgerEntry.SetRange(vendorLedgerEntry."External Document No.",pvline."External Document No");
                                    if vendorLedgerEntry.Find('-') then begin
                                        genJnlLine."Applies-to Doc. Type" := vendorLedgerEntry."Document Type";
                                        genJnlLine."Applies-to Doc. No." := vendorLedgerEntry."Applies-to Doc. No.";
                                        genJnlLine.Validate(genJnlLine."Applies-to Doc. No.");
                                    end else
                                        //genJnlLine."Applies-to Doc. Type":=genJnlLine."Applies-to Doc. Type"::" ";
                                        //   genJnlLine."Applies-to Doc. No.":=pvline."Apply to";
                                        genJnlLine.Validate(genJnlLine."Applies-to Doc. No.");
                                    genJnlLine."External Document No." := "Cheque No";
                                    if genJnlLine.Amount <> 0 then
                                        genJnlLine.Insert;


                                    //for invoice ammt paid
                                    genJnlLine.Init;
                                    LineNo := LineNo + 1000;
                                    genJnlLine."Line No." := LineNo;
                                    genJnlLine."Journal Template Name" := 'GENERAL';
                                    genJnlLine."Journal Batch Name" := 'PVPOSTING';
                                    genJnlLine."Account Type" := genJnlLine."account type"::Vendor;
                                    genJnlLine."Account No." := paymentVoucher."Account No.";
                                    genJnlLine.Validate(genJnlLine."Account No.");
                                    genJnlLine."Posting Date" := ("Cheque Date");
                                    genJnlLine."Document No." := paymentVoucher.No;
                                    genJnlLine."External Document No." := "Cheque No";
                                    genJnlLine.Description := 'Invoice For' + Format(paymentVoucher.No);

                                    InvAmt := pvline."Remaining Amount" - Vatamt - WithAmt;
                                    if totalamt > 0 then begin
                                        if totalamt >= InvAmt then begin
                                            genJnlLine.Amount := InvAmt;
                                        end
                                        else if totalamt < InvAmt then begin
                                            genJnlLine.Amount := totalamt;
                                        end;
                                        totalamt := totalamt - InvAmt;
                                    end;
                                    genJnlLine.Validate(genJnlLine.Amount);
                                    genJnlLine."Applies-to Doc. Type" := genJnlLine."applies-to doc. type"::" ";
                                    // genJnlLine."Applies-to Doc. No." := pvline."Apply to";
                                    // genJnlLine.Validate(genJnlLine."Applies-to Doc. No.");
                                    if genJnlLine.Amount <> 0 then
                                        genJnlLine.Insert;

                                until pvline.Next = 0;
                            end;

                            genJnlLine.Init;
                            LineNo := LineNo + 1000;
                            genJnlLine."Line No." := LineNo;
                            genJnlLine."Journal Template Name" := 'GENERAL';
                            genJnlLine."Journal Batch Name" := 'PVPOSTING';
                            genJnlLine."Account Type" := genJnlLine."account type"::"Bank Account";
                            genJnlLine."Account No." := paymentVoucher."Paying Bank Account";
                            genJnlLine.Validate(genJnlLine."Account No.");
                            genJnlLine."Posting Date" := ("Cheque Date");
                            genJnlLine."Document No." := paymentVoucher.No;
                            genJnlLine.Description := Format(paymentVoucher.No);
                            genJnlLine.Amount := -paymentVoucher."Net Amount";
                            genJnlLine.Validate(genJnlLine.Amount);
                            genJnlLine."External Document No." := "Cheque No";
                            if genJnlLine.Amount <> 0 then
                                genJnlLine.Insert;

                            /*IF "Cash Analysis" <> '' THEN BEGIN
                              JournalLineDim.INIT;
                              JournalLineDim."Table ID" := 81;
                              JournalLineDim."Journal Template Name" := 'GENERAL';
                              JournalLineDim."Journal Batch Name":='PVPOSTING';
                              JournalLineDim."Journal Line No." :=LineNo;
                              JournalLineDim."Dimension Code" := 'CASHANALYSIS';
                              JournalLineDim."Dimension Value Code" := "Cash Analysis";
                              JournalLineDim.VALIDATE(JournalLineDim."Dimension Value Code");
                              JournalLineDim.INSERT;
                            END;*/


                            genJnlLine.Init;
                            LineNo := LineNo + 1000;
                            genJnlLine."Line No." := LineNo;
                            genJnlLine."Journal Template Name" := 'GENERAL';
                            genJnlLine."Journal Batch Name" := 'PVPOSTING';
                            genJnlLine."Account Type" := genJnlLine."account type"::"G/L Account";

                            Tarrifcodes.SetRange(Tarrifcodes.Code, paymentVoucher."VAT Code");
                            if Tarrifcodes.Find('-') then begin
                                genJnlLine."Account No." := Tarrifcodes."G/L Account";
                                genJnlLine.Validate(genJnlLine."Account No.");
                            end;

                            genJnlLine."Posting Date" := ("Cheque Date");
                            genJnlLine."Document No." := paymentVoucher.No;
                            genJnlLine.Description := Format(paymentVoucher.No);
                            genJnlLine.Amount := -paymentVoucher."VAT Amount";
                            genJnlLine."External Document No." := "Cheque No";
                            if genJnlLine.Amount <> 0 then
                                genJnlLine.Insert;
                            genJnlLine.Init;
                            LineNo := LineNo + 1000;
                            genJnlLine."Line No." := LineNo;
                            genJnlLine."Journal Template Name" := 'GENERAL';
                            genJnlLine."Journal Batch Name" := 'PVPOSTING';
                            genJnlLine."Account Type" := genJnlLine."account type"::"G/L Account";

                            Tarrifcodes.SetRange(Tarrifcodes.Code, paymentVoucher."Withholding Tax Code");
                            if Tarrifcodes.Find('-') then begin
                                genJnlLine."Account No." := Tarrifcodes."G/L Account";
                                genJnlLine.Validate(genJnlLine."Account No.");
                            end;

                            genJnlLine."Posting Date" := ("Cheque Date");
                            genJnlLine."Document No." := paymentVoucher.No;
                            genJnlLine.Description := Format(paymentVoucher.No);
                            genJnlLine.Amount := -paymentVoucher."Withholding Tax Amount";
                            genJnlLine.Validate(genJnlLine.Amount);
                            genJnlLine."External Document No." := "Cheque No";
                            if genJnlLine.Amount <> 0 then
                                genJnlLine.Insert;
                            if Confirm('Are you sure you want to post the voucher ') = true then begin
                                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", genJnlLine);
                                // Posted:=Posted::"1";
                                "Date Posted" := Today;
                                // "GPA Posting":="gpa posting"::"1";
                                "GPA Posting Date" := ("Cheque Date");
                                Modify;
                            end else
                                exit;
                        end;

                    end;
                }
                action("Print Preview")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        paymentVoucher.SetRange(paymentVoucher.No, No);
                        if paymentVoucher.Find('-') then begin
                            Report.Run(51507095, true, true, paymentVoucher);
                        end;
                    end;
                }
                action("Send for approval")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        if Confirm('Are You Sure you want to send this PV for Approval?') then begin
                            //   GPA:=Gpa::"1";
                            "GPA Date" := Today;
                            Modify;
                        end;
                        paymentVoucher.SetRange(paymentVoucher.No, No);
                        if paymentVoucher.Find('-') then begin
                            Report.Run(50005, true, true, paymentVoucher);
                        end;
                    end;
                }
            }
        }
    }

    var
        vendorledEntry: Record "Vendor Ledger Entry";
        Amt: Decimal;
        vendorledEntry1: Record "Vendor Ledger Entry";
        Ramt: Decimal;
        paymentVoucher: Record "Payment Voucher";
        pvline: Record "PV Lines";
        totalamt: Decimal;
        PV: Record "Payment Voucher";
        genJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Tarrifcodes: Record "Tarriff Codes";
        Vatamt: Decimal;
        WithAmt: Decimal;
        InvAmt: Decimal;
        NextLocation: Text[50];
        EntryNo: Integer;
        MovementTracker: Record "Movement Tracker";
        NextStage: Integer;
        ApprovalsSetup: Record "Approvals Set Up";
        ApprovalUsers: Record "Approvals Users Set Up";
        vendorLedgerEntry: Record "Vendor Ledger Entry";
}

