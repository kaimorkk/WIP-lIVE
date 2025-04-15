namespace ALProjectLIWPA.ALProjectLIWPA;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Sales.Customer;
using System.Email;
using Microsoft.Purchases.Posting;
using Microsoft.Purchases.Setup;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;
using Microsoft.Finance.GeneralLedger.Preview;
using System.Utilities;
using Microsoft.Projects.Resources.Resource;
using System.Environment.Configuration;
using Microsoft.Foundation.Company;
using Microsoft.HumanResources.Setup;
using Microsoft.Projects.Project.Planning;
using Microsoft.Utilities;
using Microsoft.Bank.BankAccount;
using Microsoft.HumanResources.Payables;
using Microsoft.Foundation.NoSeries;
using Microsoft.Finance.VAT.Setup;
using Microsoft.Finance.GeneralLedger.Posting;
using System.Security.User;
using Microsoft.Sales.Setup;
using Microsoft.Finance.Dimension;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Vendor;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Finance.GeneralLedger.Reversal;
using Microsoft.HumanResources.Employee;
using Microsoft.Bank.Ledger;
using Microsoft.Foundation.Reporting;


codeunit 50006 "Payments-Post"
{
    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup";
        Text000: label 'There is a remaining amount of %1 are you sure you want to create a receipt for this amount?';
        Text001: label '&Post and Create &Receipt,&Post';
        Text002: label 'Are you sure you want to post Imprest No %1 ?';
        Text102: label 'Are you sure you want to Send Imprest No %1?';
        Text003: label 'The Imprest No %1  has not been fully approved';
        Text004: label 'The Imprest Lines are empty';
        Text005: label 'Amount cannot be zero';
        Text006: label 'Imprest %1 has been posted';
        Text007: label 'Are u sure u want to post Imprest Surrender No. %1 ?';
        Text008: label 'The Imprest Surrender No. %1 has not been fully approved';
        Text009: label 'The Imprest Surrender Lines are empty';
        Text010: label 'Imprest %1 has been surrendered';
        Text011: label 'Are you sure tou want to post Imprest Memo %1 ?';
        Text012: label 'The Imprest Memo amount is zero';
        Text013: label 'The Imprest Memo has already been posted';
        Tariffs: Record "Tariff Codes1";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        Text014: label 'Are you sure you want to post petty cash surrender No %1 ?';
        Text015: label 'Petty Cash %1 has been surrendered';
        Text016: label 'Actual amount spent cannot be zero';
        Text017: label 'Are you sure you want to post receipt no. %1 ?';
        Text018: label 'The receipt is already posted';
        WText001: label 'Last Check No. must be filled in.';
        WText002: label 'Filters on %1 and %2 are not allowed.';
        WText003: label 'XXXXXXXXXXXXXXXX';
        WText004: label 'must be entered.';
        WText005: label 'The Bank Account and the General Journal Line must have the same currency.';
        WText006: label 'Salesperson';
        WText007: label 'Purchaser';
        WText008: label 'Both Bank Accounts must have the same currency.';
        WText009: label 'Our Contact';
        WText010: label 'XXXXXXXXXX';
        WText011: label 'XXXX';
        WText012: label 'XX.XXXXXXXXXX.XXXX';
        WText013: label '%1 already exists.';
        WText014: label 'Check for %1 %2';
        WText015: label 'Payment';
        WText016: label 'In the Check report, One Check per Vendor and Document No.\';
        WText017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        WText018: label 'XXX';
        WText019: label 'Total';
        WText020: label 'The total amount of check %1 is %2. The amount must be positive.';
        WText021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        WText022: label 'NON-NEGOTIABLE';
        WText023: label 'Test print';
        WText024: label 'XXXX.XX';
        WText025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        WText026: label 'ZERO';
        WText027: label 'HUNDRED';
        WText028: label 'AND';
        WText029: label '%1 results in a written number that is too long.';
        WText030: label ' is already applied to %1 %2 for customer %3.';
        WText031: label ' is already applied to %1 %2 for vendor %3.';
        WText032: label 'ONE';
        WText033: label 'TWO';
        WText034: label 'THREE';
        WText035: label 'FOUR';
        WText036: label 'FIVE';
        WText037: label 'SIX';
        WText038: label 'SEVEN';
        WText039: label 'EIGHT';
        WText040: label 'NINE';
        WText041: label 'TEN';
        WText042: label 'ELEVEN';
        WText043: label 'TWELVE';
        WText044: label 'THIRTEEN';
        WText045: label 'FOURTEEN';
        WText046: label 'FIFTEEN';
        WText047: label 'SIXTEEN';
        WText048: label 'SEVENTEEN';
        WText049: label 'EIGHTEEN';
        WText050: label 'NINETEEN';
        WText051: label 'TWENTY';
        WText052: label 'THIRTY';
        WText053: label 'FORTY';
        WText054: label 'FIFTY';
        WText055: label 'SIXTY';
        WText056: label 'SEVENTY';
        WText057: label 'EIGHTY';
        WText058: label 'NINETY';
        WText059: label 'THOUSAND';
        WText060: label 'MILLION';
        WText061: label 'BILLION';
        Acct: Record "G/L Account";
        Imprest1: Record Payments;
        Text019: label 'Are you sure tou want to post Imprest Memo Surrender %1 ?';
        Text020: label 'The Imprest Memo has already been surrendered';
        Text021: label 'Are you sure you want to post Staff Claim %1?';
        text022: label 'Staff claim amount cannot be 0. Please confirm the amount and try again.';
        Text023: label 'Staff claim must be fully approved before posting';
        text024: label 'Are you sure you want to post staff claim No. %1?';
        text025: label 'Are you sure you want to post salary Advance No. %1?';
        Text026: label 'Salary Advance  must be fully approved before posting';
        text027: label 'Approved Salary Advance amount cannot be 0. Please confirm the amount and try again.';
        text028: label 'Are you sure you want to post Standing Imprest Surrender No. %1?';
        GenJnlLine: Record "Gen. Journal Line";
        DocPrint: Codeunit "Document-Print";
        BALedgerEntry: Record "Bank Account Ledger Entry";
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        NoSeries: Code[20];
        CashManagementSetup: Record "Cash Management Setup";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line";
        SafariMembers1: Record "Project Members";
        EMp: Record Employee;
        Casual: Record Casuals;
        Window: Dialog;
        EmpName: Text;
        Warrant: Record Payments;
        ApplicationDocNumber: Code[20];
        Employee: Record Employee;

    // subscribes to the OnAfterReverseEntries and marks the receipts as reversed , it can be extended to include other tables

    [EventSubscriber(ObjectType::Table, Database::"Reversal Entry", 'OnAfterReverseEntries', '', false, false)]
    local procedure OnAfterReverseEntries(Number: Integer; RevType: Integer; HideDialog: Boolean)
    var
        ReversalEntry: Record "Reversal Entry";
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.reset();
        GLEntry.setRange("Transaction No.", Number);
        if GLEntry.findFirst() then begin
            MarkOriginalDocumentAsReversed(GLEntry."Document No.");
        end;
    end;

    local procedure MarkOriginalDocumentAsReversed(DocumentNo: Code[20])

    var
        ReceiptsHeader: Record "Receipts Header1";
        Paymenthdr: Record Payments;
    // KRAIntegration: Codeunit "KRA Integration";
    // KRALog: Record "KRA Integration Log";
    begin
        if ReceiptsHeader.Get(DocumentNo) then begin
            ReceiptsHeader.Reversed := true;
            ReceiptsHeader."Reversed By" := userId;
            ReceiptsHeader."Date Reversed" := Today;
            ReceiptsHeader.Modify();
        end
        else if
        Paymenthdr.Get(DocumentNo) then begin
            if Paymenthdr."PV Type" = Paymenthdr."PV Type"::Tax then begin
                if Paymenthdr.Eslip <> '' then begin
                    Paymenthdr.Calcfields("Total Amount LCY");
                    // if KRAIntegration.CancelPRN(DocumentNo, Paymenthdr."Total Amount LCY", Paymenthdr.Eslip, KRALog)
                    // then
                    //     Message('The associated PRN has been cancelled successfully')
                    // else
                    //     Message('The PRN could not be cancelled due to %1', GetLastErrorText());
                end;
            end;
            Paymenthdr.Reversed := true;
            Paymenthdr."Reversed By" := userId;

            Paymenthdr.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforePostGenJnlLine', '', false, false)]
    local procedure OnBeforePostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line")
    var
        BankAccount: Record "Bank Account";
        BankAccountBalance: Decimal;
    begin
        if GuiAllowed then
            if GenJournalLine."Account Type" = GenJournalLine."Account Type"::"Bank Account" then begin
                BankAccount.reset();
                BankAccount.setRange("No.", GenJournalLine."Account No.");
                BankAccount.FindFirst();
                if BankAccount.AllowedOverDraft = true then
                    exit;
                BankAccount.CalcFields(Balance);
                BankAccountBalance := BankAccount.Balance;

                // Check if the transaction will make the balance negative
                if BankAccountBalance + GenJournalLine.Amount < 0 then
                    Error('Posting this transaction will make the balance negative. Current balance: %1, Transaction amount: %2.', BankAccountBalance, GenJournalLine.Amount);

                // log the balance check
                Message('Transaction approved. Current balance: %1, New balance after posting: %2.', BankAccountBalance, BankAccountBalance + GenJournalLine.Amount);
            end;
    end;

    procedure verifyEFTInformation(docNo: Code[20])
    var
        eftLines: Record "EFT Line";
        eftHeader: Record "EFT Header";
        errorMessage: Text;
    begin
        eftHeader.reset();
        eftHeader.setRange(No, docNo);
        if eftHeader.FindFirst() then begin
            eftLines.reset();
            eftLines.setRange("Document No.", docNo);
            if eftLines.FindSet() then begin
                repeat
                    errorMessage := '';
                    if (eftLines.Amount = 0) then
                        errorMessage := errorMessage + 'Amount, ';
                    if (eftLines."Payee Bank Account Name" = '') then
                        errorMessage := errorMessage + 'Payee Bank Account Name, ';
                    if (eftLines."Payee Bank Account No." = '') then
                        errorMessage := errorMessage + 'Payee Bank Account No., ';
                    if (eftLines."Payee Bank Code" = '') then
                        errorMessage := errorMessage + 'Payee Bank Code, ';
                    if (eftHeader."Bank Account No." = '') then
                        errorMessage := errorMessage + 'Bank Account No., ';
                    if (eftLines."Pay Mode" = '') then
                        errorMessage := errorMessage + 'Pay Mode, ';

                    if errorMessage <> '' then begin
                        errorMessage := CopyStr(errorMessage, 1, StrLen(errorMessage) - 2);
                        Error('The following fields are missing or invalid: %1', errorMessage);
                    end;
                until eftLines.Next() = 0;
            end;
        end;
    end;

    procedure "Post Payment Voucher"(PV: Record Payments; Batch: Boolean; Creator: Code[50])
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PVLines1: Record "PV Lines";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        CarLoan: Record Payments;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        InterestAmount: Decimal;
        DimensionCodes, DimensionCodes2 : array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        PVNos: array[4] of Code[20];
        NetAmount: Decimal;
        PaymentVoucher: Record Payments;
        CustomerPostingGrp: Record "Customer Posting Group";
        PostingGroupCode, CustomerAccount : Code[20];
        UserSetUp: Record "User Setup";
    begin
        if not Batch then begin
            if not Dialog.Confirm('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?', true) then
                exit;
        end;
        if PV.Status <> PV.Status::Released then
            Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
        if Pv.Posted = true then
            Error('The Payment Voucher No %1 has already been posted', PV."No.");
        // IF PV.Posted THEN
        // ERROR('Payment Voucher %1 has been posted',PV."No.");
        PV.TestField(Date);
        PV.TestField("Paying Bank Account");
        PV.TestField(PV.Payee);
        PV.TestField(PV."Pay Mode");
        PV.TestField(PV."Posting Date");
        if PV."Pay Mode" = 'CHEQUE' then begin
            PV.TESTFIELD(PV."Cheque No");
            PV.TestField(PV."Cheque Date");
        end;

        if PV.IsPVPosted(PV."No.") then begin //Mark Already Posted
            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := PV."Posting Date";
            PV."Time Posted" := Time;
            PV.Modify;
            exit;
        end;
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", PV."No.");
        GLEntry.SetRange(Reversed, false);
        if GLEntry.FindFirst() then begin
            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := PV."Posting Date";
            PV."Time Posted" := Time;
            PV.Modify;
            exit;
        end;
        PV.CalcFields(PV."Total Retention Amount", "Total Witholding Tax Amount", "VAT Wthheld six %", "Total Amount LCY");

        //Check Lines
        if PV."Total Amount LCY" = 0 then
            Error('Amount cannot be zero');
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if not PVLines.FindLast then
            Error('Payment voucher Lines cannot be empty');
        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
        GenJnLine.DeleteAll;
        PVLines.Reset;

        LineNo := LineNo + 10000;
        PV.CalcFields(PV."Total Amount LCY");
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        PVLines.Validate(PVLines.Amount);
        PVLines.CalcSums(PVLines.Amount, "W/Tax Amount", "VAT Amount", "Retention  Amount", "Net Amount", "Amount Paid");
        if PVLines."Amount Paid" = PVLines."Net Amount" then
            Message('%1', PVLines."Amount Paid");
        //Insert Inerest Balancing Line for Car Loan
        if CarLoan.Get(PVLines."Car Loan Doc. No") then begin
            SalesReceivablesSetup.Get;
            InterestAmount := 0;
            InterestAmount := CarLoan."Interest Amount";
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            // GenJnLine."Account No." := SalesReceivablesSetup."Car Loan Int. Due Acc.";
            GenJnLine.Validate(Amount, -1 * CarLoan."Interest Amount");
            GenJnLine.Validate("Posting Date", Today);
            GenJnLine."Document No." := PV."No.";
            GenJnLine.Description := 'Car Loan Interest ' + CarLoan."No.";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
            GenJnLine.Validate("Bal. Account No.", CarLoan."Account No.");
            GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
        end;

        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if PVLines.FindFirst then begin
            //Create Tax PV 
            if (PV."Total Witholding Tax Amount" + PV."VAT Wthheld six %" <> 0) and (PV."Bounced Pv Type" <> PV."Bounced Pv Type"::Normal) then begin
                PVNos[1] := CreateTaxPV(PV);
                // if PaymentVoucher.Get(PvNos[1]) then
                // PostPV2(PaymentVoucher);
            end;
            if (PV."Total Retention Amount" <> 0) and (PV."Bounced Pv Type" <> PV."Bounced Pv Type"::Retention) then begin
                PVNos[2] := CreateRetentionMovementPV(PV);
                if PaymentVoucher.Get(PvNos[2]) then
                    PostPV2(PaymentVoucher);
            end;

            //Create Refund Receipt
            if (PV."Bounced Pv Type" <> PV."Bounced Pv Type"::Refund) and (PV."PV Type" = PV."PV Type"::Refund) then
                CreateReceiptFromRefundVouchers(PV);


        end;
        //PV Lines Entries

        DimensionMgt.GetShortcutDimensions(PV."Dimension Set ID", DimensionCodes);

        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if PVLines.FindSet() then begin
            repeat
                DimensionMgt.GetShortcutDimensions(PVLines."Dimension Set ID", DimensionCodes2);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                //Check Imprests
                case
                    PV."Payment Type" of
                    PV."Payment Type"::"Standing Imprest":
                        begin
                            if PVLines."Account Type" = PVLines."Account Type"::Employee then begin
                                CustomerAccount := UserSetUp.GetImprestAccount(PVLines."Account No");
                                if CustomerAccount = '' then
                                    Error('There is no Imprest Account setup for Employee %1. Please setup under User Setup', PVLines."Account No");
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine.Validate("Account Type");
                                GenJnLine."Account No." := CustomerAccount;
                                GenJnLine.Validate(GenJnLine."Account No.");
                            end else
                                if PVLines."Account Type" = PVLines."Account Type"::Customer then begin
                                    GenJnLine."Account Type" := PVLines."Account Type";
                                    GenJnLine.Validate("Account Type");
                                    GenJnLine."Account No." := PVLines."Account No";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                            PostingGroupCode := CustomerPostingGrp.GetPostinGroup(CustomerPostingGrp.Utilization::"Standing Imprest");
                            if PostingGroupCode = '' then
                                Error('There is no %1 code defined under Customer Posting Group', CustomerPostingGrp.Utilization::"Standing Imprest");
                            GenJnLine."Posting Group" := PostingGroupCode;
                        end;
                    PV."Payment Type"::Imprest:
                        begin
                            if PVLines."Account Type" = PVLines."Account Type"::Employee then begin
                                CustomerAccount := UserSetUp.GetImprestAccount(PVLines."Account No");
                                if CustomerAccount = '' then
                                    Error('There is no Imprest Accoutn setup for Employee %1. Please setup under User Setup', PVLines."Account No");
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine.Validate("Account Type");
                                GenJnLine."Account No." := CustomerAccount;
                                GenJnLine.Validate(GenJnLine."Account No.");
                            end else
                                if PVLines."Account Type" = PVLines."Account Type"::Customer then begin
                                    GenJnLine."Account Type" := PVLines."Account Type";
                                    GenJnLine.Validate("Account Type");
                                    GenJnLine."Account No." := PVLines."Account No";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                            PostingGroupCode := CustomerPostingGrp.GetPostinGroup(CustomerPostingGrp.Utilization::"Safari Imprest");
                            if PostingGroupCode = '' then
                                Error('There is no %1 code defined under Customer Posting Group', CustomerPostingGrp.Utilization::"Standing Imprest");
                            GenJnLine."Posting Group" := PostingGroupCode;
                        end;
                    PV."Payment Type"::"Special Imprest":
                        begin
                            if PVLines."Account Type" = PVLines."Account Type"::Employee then begin
                                CustomerAccount := UserSetUp.GetImprestAccount(PVLines."Account No");
                                if CustomerAccount = '' then
                                    Error('There is no Imprest Accoutn setup for Employee %1. Please setup under User Setup', PVLines."Account No");
                                GenJnLine."Account Type" := PVLines."Account Type";
                                GenJnLine.Validate("Account Type");
                                GenJnLine."Account No." := CustomerAccount;
                                GenJnLine.Validate(GenJnLine."Account No.");
                            end else
                                if PVLines."Account Type" = PVLines."Account Type"::Customer then begin
                                    GenJnLine."Account Type" := PVLines."Account Type";
                                    GenJnLine.Validate("Account Type");
                                    GenJnLine."Account No." := PVLines."Account No";
                                    GenJnLine.Validate(GenJnLine."Account No.");
                                end;
                            PostingGroupCode := CustomerPostingGrp.GetPostinGroup(CustomerPostingGrp.Utilization::"Special Imprest");
                            if PostingGroupCode = '' then
                                Error('There is no %1 code defined under Customer Posting Group', CustomerPostingGrp.Utilization::"Standing Imprest");
                            GenJnLine."Posting Group" := PostingGroupCode;
                        end;
                    else begin
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine.Validate("Account Type");
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                    end;
                end;
                if PV."Posting Date" = 0D then
                    Error('You must specify the PV posting date');
                GenJnLine."Posting Date" := PV."Posting Date";
                GenJnLine."Document No." := PV."No.";
                GenJnLine."External Document No." := PV."No.";
                GenJnLine."Payment Method Code" := PV."Pay Mode";
                GenJnLine.Amount := Round(PVLines.Amount);
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine.Description := CopyStr(PVLines.Description, 1, MaxStrLen(GenJnLine.Description));
                if GenJnLine.Description = '' then
                    GenJnLine.Description := PV."Payment Narration";
                // if PV."Pay Mode" = 'CHEQUE' then
                ////GenJnLine."Pay Mode":=PV."Pay Mode";
                GenJnLine."Currency Code" := PV."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                //NOT ALL DOCUMENTS ARE INVOICES
                UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                if PVLines."Applies-to Doc. Type" = PVLines."applies-to doc. type"::Invoice then
                    GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                if PVLines."Account Type" <> PVLines."account type"::Employee then
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                //Add Applies To Document Type
                VendorLedgerEntry.Reset;
                VendorLedgerEntry.SetRange("Document No.", PVLines."Applies to Doc. No");
                if VendorLedgerEntry.FindFirst then begin
                    GenJnLine."Applies-to Doc. Type" := VendorLedgerEntry."Document Type";
                end;
                if GenJnLine.Amount <> 0 then begin
                    NetAmount += GenJnLine.Amount;
                    GenJnLine.Insert;
                end;

                // VAT withheld
                if PVLines."VAT Withheld Amount" > 0 then begin
                    Tariffs.Get(PVLines."VAT Withheld Code");
                    Tariffs.TestField("Account No.");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-WVAT'), 50);
                    GenJnLine.Amount := -Round(PVLines."VAT Withheld Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;
                end;
                //Posting of Advance Recovery David & Spencer

                if PV."Advance Recovery" <> 0 then begin
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PV."Account Type";
                    GenJnLine."Account No." := PV."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV posting date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-AdA'), 50);
                    GenJnLine.Amount := -Round(PV."Advance Recovery");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;
                    //end of Posting of Advance Recovery David & Spencer
                end;

                //Withholding Tax
                if PVLines."W/Tax Amount" > 0 then begin
                    Tariffs.Get(PVLines."W/Tax Code");
                    Tariffs.TestField("Account No.");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-WTax'), 50);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -Round(PVLines."W/Tax Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;
                end;

                //Retention
                if PVLines."Retention  Amount" > 0 then begin
                    Tariffs.Get(PVLines."Retention Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    if PVLines."Account Type" = PVLines."Account Type"::Vendor then begin
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if Tariffs."Vendor Posting Group" <> '' then
                            GenJnLine."Posting Group" := Tariffs."Vendor Posting Group";
                    end else begin
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                    end;
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."No.";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr((PV.Payee + '- Retention Payable'), 1, Maxstrlen(GenJnLine.Description));
                    GenJnLine.Amount := -Round(PVLines."Retention  Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Entry Type2" := GenJnLine."Entry Type2"::Retention;
                    UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;
                end;
            until PVLines.Next = 0;

            //Net Amount Payments
            if NetAmount <> 0 then begin
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                GenJnLine.Validate("Account Type");
                GenJnLine."Account No." := PV."Paying Bank Account";
                GenJnLine.Validate(GenJnLine."Account No.");
                if PV."Posting Date" = 0D then
                    Error('You must specify the PV date');
                GenJnLine."Posting Date" := PV."Posting Date";
                GenJnLine."Document No." := PV."No.";
                GenJnLine."External Document No." := PV."No.";
                if PV."Pay Mode" = 'CHEQUE' then
                    GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                GenJnLine.Description := CopyStr(PV."Payment Narration", 1, MaxStrLen(GenJnLine.Description));
                GenJnLine.Amount := -Round(NetAmount);
                GenJnLine."Currency Code" := PV."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                UpdateDimensions(GenJnLine, DimensionCodes, DimensionCodes);
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert();
                //add jobs if g/l account and income statement account
                if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                    if Acct.Get(GenJnLine."Account No.") then begin
                        if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                            GenJnLine."Job No." := PVLines.Project;
                            GenJnLine."Job Task No." := PVLines."Job Task No.";
                            GenJnLine."Job Quantity" := 1;
                            GenJnLine.Validate(GenJnLine."Job No.");
                            GenJnLine.Validate(GenJnLine."Job Task No.");
                            GenJnLine.Validate(GenJnLine."Job Quantity");
                        end;
                    end;
                end;
            end;

            //loop to print check
            Commit();
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                repeat
                    CMSetup.Get;
                    PrintCheck(GenJnLine, CMSetup."PV Journal Template", CMSetup."PV Journal Batch Name");
                    PVLines1.SetRange(No, PVLines.No);
                    if PVLines1.FindSet then begin
                        PVLines1."Check No" := GenJnLine."Document No.";
                        PVLines1."Check Printed" := true;
                        PVLines1.Modify();
                    end;
                until GenJnLine.Next = 0;
            end;
        end;

        if CMSetup.Get then
            GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
        if GenJnlLine.FindSet then begin
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine);
        end;

        if PV.IsPVPosted(PV."No.") then begin
            PV.Posted := true;
            PV."Posted By" := Creator;
            PV."Posted Date" := PV."Posting Date";
            PV."Time Posted" := Time;
            PV.Modify;
            PVLines."No. Posted" := PVLines."No. Posted" + 1;
        end;
        OnAfterPostPymentVoucher(PV);
    end;

    procedure "Previw-Post Payment Voucher"(PV: Record Payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PVLines1: Record "PV Lines";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        CarLoan: Record Payments;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        InterestAmount: Decimal;
        DimensionCodes: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        PVNos: array[4] of Code[20];
        NetAmount: Decimal;
        PaymentVoucher: Record Payments;
    begin
        if PV.Status <> PV.Status::Released then
            Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
        // IF PV.Posted THEN
        // ERROR('Payment Voucher %1 has been posted',PV."No.");
        PV.TestField(Date);
        PV.TestField("Paying Bank Account");
        PV.TestField(PV.Payee);
        PV.TestField(PV."Pay Mode");
        PV.TestField(PV."Posting Date");
        if PV."Pay Mode" = 'CHEQUE' then begin
            PV.TESTFIELD(PV."Cheque No");
            PV.TestField(PV."Cheque Date");
        end;

        if PV.IsPVPosted(PV."No.") then begin //Mark Already Posted
            PV.Posted := true;
            PV."Posted By" := UserId;
            PV."Posted Date" := Today;
            PV."Time Posted" := Time;
            PV.Modify;
        end;

        PV.CalcFields(PV."Total Retention Amount", "Total Witholding Tax Amount", "VAT Wthheld six %", "Total Amount LCY");

        //Check Lines
        if PV."Total Amount LCY" = 0 then
            Error('Amount is cannot be zero');
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if not PVLines.FindLast then
            Error('Payment voucher Lines cannot be empty');
        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
        GenJnLine.DeleteAll;
        PVLines.Reset;

        LineNo := LineNo + 10000;
        PV.CalcFields(PV."Total Amount LCY");
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        PVLines.Validate(PVLines.Amount);
        PVLines.CalcSums(PVLines.Amount, "W/Tax Amount", "VAT Amount", "Retention  Amount", "Net Amount", "Amount Paid");
        if PVLines."Amount Paid" = PVLines."Net Amount" then
            Message('', PVLines."Amount Paid");
        //Insert Inerest Balancing Line for Car Loan
        if CarLoan.Get(PVLines."Car Loan Doc. No") then begin
            SalesReceivablesSetup.Get;
            InterestAmount := 0;
            InterestAmount := CarLoan."Interest Amount";
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := SalesReceivablesSetup."Car Loan Int. Due Acc.";
            GenJnLine.Validate(Amount, -1 * CarLoan."Interest Amount");
            GenJnLine.Validate("Posting Date", Today);
            GenJnLine."Document No." := PV."No.";
            GenJnLine.Description := 'Car Loan Interest ' + CarLoan."No.";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
            GenJnLine.Validate("Bal. Account No.", CarLoan."Account No.");
            GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
        end;
        //PVLines.VALIDATE(PVLines.Amount);
        //PVLines.VALIDATE(PVLines."Retention  Amount");
        // LineNo := LineNo + 10000;
        // GenJnLine.Init;
        // if CMSetup.Get then
        //     GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
        // GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
        // GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
        // GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        // GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
        // GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        // GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
        // GenJnLine.Validate(GenJnLine."Dimension Set ID");
        // if GenJnLine.Amount <> 0 then
        //     GenJnLine.Insert;

        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if PVLines.FindFirst then begin
            //Create Tax PV 
            if PV."Total Witholding Tax Amount" + PV."VAT Wthheld six %" <> 0 then begin
                PVNos[1] := CreateTaxPV(PV);
                if PaymentVoucher.Get(PvNos[1]) then;
                //Ignore retention on preview
                //  PostPV2(PaymentVoucher);
            end;
            if PV."Total Retention Amount" <> 0 then begin
                PVNos[2] := CreateRetentionMovementPV(PV);
                if PaymentVoucher.Get(PvNos[2]) then;
                // Ignore retention on preview
                // PostPV2(PaymentVoucher);
            end;
        end;

        //end jobs
        //PV Lines Entries
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, PV."No.");
        if PVLines.FindSet() then begin
            repeat
                if PVLines."Dimension Set ID" = 0 then
                    DimensionMgt.GetShortcutDimensions(PV."Dimension Set ID", DimensionCodes)
                else
                    DimensionMgt.GetShortcutDimensions(PVLines."Dimension Set ID", DimensionCodes);

                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := PVLines."Account Type";
                GenJnLine.Validate("Account Type");
                GenJnLine."Account No." := PVLines."Account No";
                GenJnLine.Validate(GenJnLine."Account No.");
                if PV."Posting Date" = 0D then
                    Error('You must specify the PV date');
                GenJnLine."Posting Date" := Today;
                GenJnLine."Document No." := PV."No.";
                GenJnLine."External Document No." := PV."No.";
                GenJnLine."Payment Method Code" := PV."Pay Mode";
                GenJnLine.Amount := Round(PVLines.Amount);
                GenJnLine.Validate(GenJnLine.Amount);
                //GenJnLine.Description:=PV."Payment Narration";
                GenJnLine.Description := CopyStr(PVLines.Description, 1, MaxStrLen(GenJnLine.Description));
                // if PV."Pay Mode" = 'CHEQUE' then
                ////GenJnLine."Pay Mode":=PV."Pay Mode";
                GenJnLine."Currency Code" := PV."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                GenJnLine."Dimension Set ID" := PvLines."Dimension Set ID";
                if GenjnLine."Dimension Set ID" = 0 then
                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                GenJnLine.Validate(GenJnLine."Dimension Set ID");
                //NOT ALL DOCUMENTS ARE INVOICES
                if PVLines."Applies-to Doc. Type" = PVLines."applies-to doc. type"::Invoice then
                    GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                if PVLines."Account Type" <> PVLines."account type"::Employee then
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                //Add Applies To Document Type
                VendorLedgerEntry.Reset;
                VendorLedgerEntry.SetRange("Document No.", PVLines."Applies to Doc. No");
                if VendorLedgerEntry.FindFirst then begin
                    GenJnLine."Applies-to Doc. Type" := VendorLedgerEntry."Document Type";
                end;
                if GenJnLine.Amount <> 0 then begin
                    NetAmount += GenJnLine.Amount;
                    GenJnLine.Insert;
                end;

                // VAT withheld
                if PVLines."VAT Withheld Amount" > 0 then begin
                    Tariffs.Get(PVLines."VAT Withheld Code");
                    Tariffs.TestField("Account No.");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := Today;
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-WVAT'), 50);
                    GenJnLine.Amount := -Round(PVLines."VAT Withheld Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                    GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                    GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                    GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                    GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                    GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                    GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                    GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                    GenJnLine."Dimension Set ID" := PvLines."Dimension Set ID";
                    if GenjnLine."Dimension Set ID" = 0 then
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;

                    /*  LineNo := LineNo + 10000;
                      GenJnLine.Init;
                      if CMSetup.Get then
                          GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                      GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                      GenJnLine."Line No." := LineNo;
                      GenJnLine."Account Type" := PVLines."Account Type";
                      GenJnLine."Account No." := PVLines."Account No";
                      GenJnLine.Validate(GenJnLine."Account No.");
                      if PV."Posting Date" = 0D then
                          Error('You must specify the PV date');
                      GenJnLine."Posting Date" := PV."Posting Date";
                      GenJnLine."Document No." := PV."No.";
                      GenJnLine."External Document No." := PV."Cheque No";
                      GenJnLine."Payment Method Code" := PV."Pay Mode";
                      GenJnLine.Description := 'VAT WITHHELD:';
                      GenJnLine.Amount := PVLines."VAT Withheld Amount";
                      if PV."Pay Mode" = 'CHEQUE' then
                          GenJnLine."Currency Code" := PV."Currency Code";
                      GenJnLine.Validate("Currency Code");
                      GenJnLine.Validate(GenJnLine.Amount);
                      GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                      GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                      GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                      GenJnLine.Validate(GenJnLine."Dimension Set ID");

                      if GenJnLine.Amount <> 0 then GenJnLine.Insert;
                      */
                end;
                //Posting of Advance Recovery David & Spencer

                if PV."Advance Recovery" <> 0 then begin
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PV."Account Type";
                    GenJnLine."Account No." := PV."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV posting date');
                    GenJnLine."Posting Date" := Today;
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-AdA'), 50);
                    GenJnLine.Amount := -Round(PV."Advance Recovery");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                    GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                    GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                    GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                    GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                    GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                    GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                    GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                    GenJnLine."Dimension Set ID" := PvLines."Dimension Set ID";
                    if GenjnLine."Dimension Set ID" = 0 then
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;

                    /*  LineNo := LineNo + 10000;
                      GenJnLine.Init;
                      if CMSetup.Get then
                          GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                      GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                      GenJnLine."Line No." := LineNo;
                      GenJnLine."Account Type" := PVLines."Account Type";
                      GenJnLine."Account No." := PVLines."Account No";
                      GenJnLine.Validate(GenJnLine."Account No.");
                      if PV."Posting Date" = 0D then
                          Error('You must specify the Posting PV date');
                      GenJnLine."Posting Date" := PV."Posting Date";
                      GenJnLine."Document No." := PV."No.";
                      GenJnLine."External Document No." := PV."Cheque No";
                      GenJnLine."Payment Method Code" := PV."Pay Mode";
                      GenJnLine.Description := 'Advance Recovery Amount:';
                      GenJnLine.Amount := PV."Advance Recovery";
                      if PV."Pay Mode" = 'CHEQUE' then
                          ////GenJnLine."Pay Mode":=PV."Pay Mode";
                          GenJnLine."Currency Code" := PV."Currency Code";
                      GenJnLine.Validate("Currency Code");
                      GenJnLine.Validate(GenJnLine.Amount);
                      GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                      GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                      GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                      GenJnLine.Validate(GenJnLine."Dimension Set ID");

                      if GenJnLine.Amount <> 0 then
                          GenJnLine.Insert;
                          */
                    //end of Posting of Advance Recovery David & Spencer
                end;

                //Withholding Tax
                if PVLines."W/Tax Amount" > 0 then begin
                    Tariffs.Get(PVLines."W/Tax Code");
                    Tariffs.TestField("Account No.");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := Today;
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := Format((PV.Payee + '-WTax'), 50);
                    //GenJnLine."Description 2":=PV."On behalf of";
                    GenJnLine.Amount := -Round(PVLines."W/Tax Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                    GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                    GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                    GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                    GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                    GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                    GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                    GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                    GenJnLine."Dimension Set ID" := PvLines."Dimension Set ID";
                    if GenjnLine."Dimension Set ID" = 0 then
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;

                    /*  LineNo := LineNo + 10000;
                      GenJnLine.Init;
                      if CMSetup.Get then
                          GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                      GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                      GenJnLine."Line No." := LineNo;
                      GenJnLine."Account Type" := PVLines."Account Type";
                      GenJnLine."Account No." := PVLines."Account No";
                      GenJnLine.Validate(GenJnLine."Account No.");
                      if PV."Posting Date" = 0D then
                          Error('You must specify the PV date');
                      GenJnLine."Posting Date" := PV."Posting Date";
                      GenJnLine."Document No." := PV."No.";
                      GenJnLine."External Document No." := PV."Cheque No";
                      GenJnLine."Payment Method Code" := PV."Pay Mode";
                      GenJnLine.Description := 'WITHHOLDING TAX:';
                      GenJnLine.Amount := PVLines."W/Tax Amount";
                      if PV."Pay Mode" = 'CHEQUE' then
                          ////GenJnLine."Pay Mode":=PV."Pay Mode";
                          GenJnLine."Currency Code" := PV."Currency Code";
                      GenJnLine.Validate("Currency Code");
                      GenJnLine.Validate(GenJnLine.Amount);

                      GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                      GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                      GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                      GenJnLine.Validate(GenJnLine."Dimension Set ID");
                      if GenJnLine.Amount <> 0 then GenJnLine.Insert;
                      */
                end;

                //Retention
                if PVLines."Retention  Amount" > 0 then begin
                    Tariffs.Get(PVLines."Retention Code");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    if PVLines."Account Type" = PVLines."Account Type"::Vendor then begin
                        GenJnLine."Account Type" := PVLines."Account Type";
                        GenJnLine."Account No." := PVLines."Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if Tariffs."Vendor Posting Group" <> '' then
                            GenJnLine."Posting Group" := Tariffs."Vendor Posting Group";
                    end else begin
                        GenJnLine."Account Type" := Tariffs."Account Type";
                        GenJnLine."Account No." := Tariffs."Account No.";
                        GenJnLine.Validate(GenJnLine."Account No.");
                    end;
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := Today;
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."No.";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := CopyStr((PV.Payee + '- Retention Payable'), 1, Maxstrlen(GenJnLine.Description));
                    GenJnLine.Amount := -Round(PVLines."Retention  Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        ////GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Entry Type2" := GenJnLine."Entry Type2"::Retention;
                    GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                    GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                    GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                    GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                    GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                    GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                    GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                    GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                    GenJnLine."Dimension Set ID" := PvLines."Dimension Set ID";
                    if GenjnLine."Dimension Set ID" = 0 then
                        GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then begin
                        NetAmount += GenJnLine.Amount;
                        GenJnLine.Insert;
                    end;
                    /*  LineNo := LineNo + 10000;
                      GenJnLine.Init;
                      if CMSetup.Get then
                          GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                      GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                      GenJnLine."Line No." := LineNo;
                      GenJnLine."Account Type" := PVLines."Account Type";
                      GenJnLine."Account No." := PVLines."Account No";
                      GenJnLine.Validate(GenJnLine."Account No.");
                      if PV."Posting Date" = 0D then
                          Error('You must specify the PV date');
                      GenJnLine."Posting Date" := PV."Posting Date";
                      GenJnLine."Document No." := PV."No.";
                      GenJnLine."External Document No." := PV."No.";
                      GenJnLine."Payment Method Code" := PV."Pay Mode";
                      GenJnLine.Description := 'AMOUNT RETAINED:';
                      GenJnLine.Amount := PVLines."Retention  Amount";
                      if PV."Pay Mode" = 'CHEQUE' then
                          ////GenJnLine."Pay Mode":=PV."Pay Mode";
                          GenJnLine."Currency Code" := PV."Currency Code";
                      GenJnLine.Validate("Currency Code");
                      GenJnLine.Validate(GenJnLine.Amount);

                      GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                      GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                      GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                      GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                      GenJnLine.Validate(GenJnLine."Dimension Set ID");
                      if GenJnLine.Amount <> 0 then
                          GenJnLine.Insert;
                          */
                end;
            until PVLines.Next = 0;

            //Net Amount Payments
            if NetAmount <> 0 then begin
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
                GenJnLine.Validate("Account Type");
                GenJnLine."Account No." := PV."Paying Bank Account";
                GenJnLine.Validate(GenJnLine."Account No.");
                if PV."Posting Date" = 0D then
                    Error('You must specify the PV date');
                GenJnLine."Posting Date" := Today;
                GenJnLine."Document No." := PV."No.";
                GenJnLine."External Document No." := PV."No.";
                GenJnLine."Payment Method Code" := PV."Pay Mode";
                //Ruth
                // GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                // GenJnLine."Bal. Account No." := PV."Paying Bank Account";
                if PV."Pay Mode" = 'CHEQUE' then
                    GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                //GenJnLine.VALIDATE("Currency Code");
                // GenJnLine.Validate(GenJnLine.Amount);
                // GenJnLine.Validate("Bal. Account No.");
                //GenJnLine.Description:=PV."Payment Narration";
                GenJnLine.Description := CopyStr(PV."Payment Narration", 1, MaxStrLen(GenJnLine.Description));
                // GenJnLine.Amount := PV."Total Net Amount" - InterestAmount;
                GenJnLine.Amount := -Round(NetAmount);
                // if PV."Pay Mode" = 'CHEQUE' then
                ////GenJnLine."Pay Mode":=PV."Pay Mode";
                GenJnLine."Currency Code" := PV."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                DimensionMgt.GetShortcutDimensions(PV."Dimension Set ID", DimensionCodes);
                GenJnLine."Shortcut Dimension 1 Code" := DimensionCodes[1];
                GenJnLine."Shortcut Dimension 2 Code" := DimensionCodes[2];
                GenJnLine."Shortcut Dimension 3 Code" := DimensionCodes[3];
                GenJnLine."Shortcut Dimension 4 Code" := DimensionCodes[4];
                GenJnLine."Shortcut Dimension 5 Code" := DimensionCodes[5];
                GenJnLine."Shortcut Dimension 6 Code" := DimensionCodes[6];
                GenJnLine."Shortcut Dimension 7 Code" := DimensionCodes[7];
                GenJnLine."Shortcut Dimension 8 Code" := DimensionCodes[8];
                GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                GenjnLine.Validate("Dimension Set ID");
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert();
                //add jobs if g/l account and income statement account
                if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                    if Acct.Get(GenJnLine."Account No.") then begin
                        if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                            GenJnLine."Job No." := PVLines.Project;
                            GenJnLine."Job Task No." := PVLines."Job Task No.";
                            GenJnLine."Job Quantity" := 1;
                            GenJnLine.Validate(GenJnLine."Job No.");
                            GenJnLine.Validate(GenJnLine."Job Task No.");
                            GenJnLine.Validate(GenJnLine."Job Quantity");
                        end;
                    end;
                end;
            end;

            //loop to print check
            Commit();
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                repeat
                    CMSetup.Get;
                    PrintCheck(GenJnLine, CMSetup."PV Journal Template", CMSetup."PV Journal Batch Name");
                    PVLines1.SetRange(No, PVLines.No);
                    if PVLines1.FindSet then begin
                        PVLines1."Check No" := GenJnLine."Document No.";
                        PVLines1."Check Printed" := true;
                        PVLines1.Modify();
                    end;
                until GenJnLine.Next = 0;
            end;
        end;

        if CMSetup.Get then
            GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
        if GenJnlLine.FindSet then begin
            Preview(GenJnLine);
        end;
    end;


    procedure UpdateDimensions(var GenjnLine: Record "Gen. Journal Line"; DimensionCodes1: array[8] of Code[20]; DimensionCodes2: array[8] of Code[20])
    var
        DimensionMgt: Codeunit DimensionManagement;
    begin
        GenjnLine."Shortcut Dimension 1 Code" := DimensionCodes1[1];
        GenjnLine."Shortcut Dimension 2 Code" := DimensionCodes1[2];
        GenjnLine."Shortcut Dimension 3 Code" := DimensionCodes1[3];
        GenjnLine."Shortcut Dimension 4 Code" := DimensionCodes1[4];
        GenjnLine."Shortcut Dimension 5 Code" := DimensionCodes1[5];
        GenjnLine."Shortcut Dimension 6 Code" := DimensionCodes1[6];
        GenjnLine."Shortcut Dimension 7 Code" := DimensionCodes1[7];
        GenjnLine."Shortcut Dimension 8 Code" := DimensionCodes1[8];
        if GenjnLine."Shortcut Dimension 1 Code" = '' then
            GenjnLine."Shortcut Dimension 1 Code" := DimensionCodes2[1];
        if GenjnLine."Shortcut Dimension 2 Code" = '' then
            GenjnLine."Shortcut Dimension 2 Code" := DimensionCodes2[2];
        if GenjnLine."Shortcut Dimension 3 Code" = '' then
            GenjnLine."Shortcut Dimension 3 Code" := DimensionCodes2[3];
        if GenjnLine."Shortcut Dimension 4 Code" = '' then
            GenjnLine."Shortcut Dimension 4 Code" := DimensionCodes2[4];
        if GenjnLine."Shortcut Dimension 5 Code" = '' then
            GenjnLine."Shortcut Dimension 5 Code" := DimensionCodes2[5];
        if GenjnLine."Shortcut Dimension 6 Code" = '' then
            GenjnLine."Shortcut Dimension 6 Code" := DimensionCodes2[6];
        if GenjnLine."Shortcut Dimension 7 Code" = '' then
            GenjnLine."Shortcut Dimension 7 Code" := DimensionCodes2[7];
        if GenjnLine."Shortcut Dimension 8 Code" = '' then
            GenjnLine."Shortcut Dimension 8 Code" := DimensionCodes2[8];

        //Validate DimensionSet Id
        DimensionMgt.ValidateShortcutDimValues(1, GenjnLine."Shortcut Dimension 1 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(2, GenjnLine."Shortcut Dimension 2 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(3, GenjnLine."Shortcut Dimension 3 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(4, GenjnLine."Shortcut Dimension 4 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(5, GenjnLine."Shortcut Dimension 5 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(6, GenjnLine."Shortcut Dimension 6 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(7, GenjnLine."Shortcut Dimension 7 Code", GenjnLine."Dimension Set ID");
        DimensionMgt.ValidateShortcutDimValues(8, GenjnLine."Shortcut Dimension 8 Code", GenjnLine."Dimension Set ID");
    end;


    procedure "Post Imprest"(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
        AmountRe: Decimal;
    begin
        if Imprest.Status <> Imprest.Status::Released then
            Error(Text003, Imprest."No.");

        CMSetup.Get;
        AmountRe := 0;
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", Imprest."No.");
        GLEntry.SetRange(Reversed, false);
        if GLEntry.FindFirst() then begin
            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            Imprest.Modify;
            exit;
        end;
        Imprest.TestField("Account No.");
        Imprest.TestField("Paying Bank Account");
        Imprest.TestField(Date);
        Imprest.TestField(Payee);
        Imprest.TestField("Pay Mode");
        Imprest.TestField("Shortcut Dimension 1 Code");
        Imprest.TestField("Shortcut Dimension 2 Code");
        //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
        Imprest.TestField("Posting Date");

        if Imprest."Pay Mode" = 'CHEQUE' then begin
            Imprest.TestField("Cheque No");
            Imprest.TestField("Cheque Date");
        end;
        //Check if the imprest Lines have been populated
        ImprestLines.Reset();
        ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
        if not ImprestLines.FindLast then
            Error(Text004)
        else begin
            Imprest.CalcFields(Imprest."Imprest Amount");
            AmountRe := Imprest."Imprest Amount";
            if AmountRe = 0 then
                Error(Text005);
        end;

        if Imprest.Posted then
            Error(Text006, Imprest."No.");

        CMSetup.Get();
        CMSetup.TestField("Imprest Due Date");
        CMSetup.TestField("IMPREST Journal Batch Name");
        CMSetup.TestField("Imprest Journal Template");

        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST Journal Batch Name");
        GenJnLine.DeleteAll;
        /*
          // Delete Lines Present on the General Journal Line
          GenJnLine.RESET;
          GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
          GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
          GenJnLine.DELETEALL;
        d
          Batch.INIT;
          IF CMSetup.GET() THEN
          Batch."Journal Template Name":=CMSetup."Imprest Template";
          Batch.Name:=Imprest."No.";
          IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
          Batch.INSERT;
          */
        LineNo := 1000;
        GenJnLine.Init;
        GenJnLine."Journal Template Name" := CMSetup."Imprest Journal Template";
        GenJnLine."Journal Batch Name" := CMSetup."IMPREST Journal Batch Name";
        GenJnLine."Line No." := LineNo;
        // GenJnLine."Account Type" := GenJnLine."account type"::Employee;
        if (Imprest."account type" = Imprest."account type"::Employee) then
            GenJnLine."Account Type" := GenJnLine."account type"::Employee
        else if (Imprest."account type" = Imprest."account type"::Resource) then
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
        GenJnLine."Account No." := Imprest."Account No.";
        GenJnLine."Posting Date" := Imprest."Posting Date";
        GenJnLine."Document No." := Imprest."No.";
        GenJnLine."External Document No." := Imprest."Cheque No";
        GenJnLine.Description := Format('Imprest issued to ' + Imprest.Payee, 50);
        // GenJnLine."Currency Code":=Imprest.Currency;
        // GenJnLine.VALIDATE("Currency Code");
        GenJnLine.Amount := Imprest."Imprest Amount";
        GenJnLine."Posting Group" := CMSetup."Imprest Posting Group";
        GenJnLine.Validate(Amount);
        GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
        GenJnLine.Validate("Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
        GenJnLine.Validate("Shortcut Dimension 2 Code");
        //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

        GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
        GenJnLine."Bal. Account No." := Imprest."Paying Bank Account";
        GenJnLine.Validate("Bal. Account No.");

        GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
        GenJnLine.Validate(GenJnLine."Dimension Set ID");

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        //GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
        if GLEntry.FindFirst then begin

            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            /// Imprest.Status:=Imprest.Status::Open;
            //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
            //Update the Imprest Deadline
            //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
            Imprest.Modify;
        end;
        //pending
        /*
         IF Imprest1.GET(ImprestLines."No.") THEN BEGIN
         Imprest1."Payment Type":=Imprest1."Payment Type"::"Imprest Surrender";
         Imprest1."Document Type":=Imprest1."Document Type"::"Imprest Surrender";
         Imprest1.Status:=Imprest1.Status::Open;
         Imprest1."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",GenJnLine."Posting Date");
         Imprest1.MODIFY;
         END;
         */
    end;

    procedure "Post ImprestSurrenderBCK"(var ImprestSurrender: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        Committment: Codeunit Committment2;
        GLEntry: Record "G/L Entry";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Set-Up";
        Window: Dialog;
        Selection: Integer;
        payment2: Record Payments;
    begin
        if Confirm(Text007, false, ImprestSurrender."No.") = true then begin

            ImprestSurrender.TestField("Surrender Date");
            //Check if amount surrendered is less than amount advanced
            ImprestSurrender.CalcFields("Remaining Amount");
            if ImprestSurrender."Remaining Amount" > 0 then
                Selection := StrMenu(Text001, 1);
            if ImprestSurrender.Status <> ImprestSurrender.Status::Released then
                Error(Text008, ImprestSurrender."No.");

            ImprestSurrender.TestField("Account No.");
            ImprestSurrender.TestField("Paying Bank Account");
            ImprestSurrender.TestField(Date);
            ImprestSurrender.TestField(Payee);
            ImprestSurrender.TestField("Pay Mode");
            if ImprestSurrender."Pay Mode" = 'CHEQUE' then begin
                ImprestSurrender.TestField("Cheque No");
                ImprestSurrender.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if not ImprestLines.FindLast then
                Error(Text009);

            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            /*IF ImprestLines."Actual Spent"=0 THEN
             ERROR('Actual Spent Amount cannot be zero');*/

            if ImprestSurrender.Surrendered then
                Error(Text010, ImprestSurrender."No.");
            //MESSAGE('Tuko hapa!');
            GLSetup.Get;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ImprestSurrender."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Surrender Template";
            Batch.Name := ImprestSurrender."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            //Staff entries
            LineNo := 10000;
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := ImprestSurrender."Account No.";
            GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
            GenJnLine."Document No." := ImprestSurrender."No.";
            GenJnLine."External Document No." := ImprestSurrender."Cheque No";
            GenJnLine.Description := ImprestSurrender.Payee;
            GenJnLine.Amount := -ImprestLines."Actual Spent";
            //GenJnLine.VALIDATE(Amount);
            GenJnLine."Applies-to Doc. No." := ImprestSurrender."No.";
            GenJnLine.Validate("Applies-to Doc. No.");
            GenJnLine."Shortcut Dimension 1 Code" := ImprestSurrender."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ImprestSurrender."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            //Create Receipt IF Chosen
            if Selection = 1 then begin
                //Insert Header
                ImprestSurrender.CalcFields("Remaining Amount");
                if ImprestSurrender."Remaining Amount" > 0 then begin
                    if ImprestSurrender."Receipt Created" = false then begin
                        /*
                        ReceiptHeader.INIT;
                        ReceiptHeader."No.":=NoSeriesMgt.GetNextNo(GLSetup."Receipt Nos",TODAY,TRUE);
                        ReceiptHeader.Date:=ImprestSurrender."Imprest Surrender Date";
                        ReceiptHeader."Received From":=ImprestSurrender.Payee;
                        ReceiptHeader."On Behalf Of":=ImprestSurrender."On behalf of";
                        ReceiptHeader."Global Dimension 1 Code":=ImprestSurrender."Global Dimension 1 Code";
                        ReceiptHeader."Global Dimension 2 Code":=ImprestSurrender."Global Dimension 2 Code";
                        IF NOT ReceiptHeader.GET(ReceiptHeader."No.") THEN
                        ReceiptHeader.INSERT;
                        */
                    end;
                end;
            end;

            //Expenses
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    if GenJnLine."Account Type" = ImprestLines."account type"::"Fixed Asset" then
                        GenJnLine."FA Posting Type" := GenJnLine."fa posting type"::"Acquisition Cost";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
                    GenJnLine."Document No." := ImprestSurrender."No.";
                    GenJnLine.Description := ImprestLines.Description;
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine.Validate(Amount);
                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    //Ushindi...Insert Job Nos
                    GenJnLine."Job No." := ImprestLines."Job No.";
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine."Job Task No." := ImprestLines."Job Task No.";
                    //MESSAGE('Tuko hapa!');
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine."Job Quantity" := ImprestLines."Job Quantity";
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //End Of Ushindi changes
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Insert Receipt Lines
                    if Selection = 1 then begin
                        if ImprestLines."Remaining Amount" > 0 then begin
                            if ImprestSurrender."Receipt Created" = false then begin
                                /*
                                ReceiptLine.INIT;
                                ReceiptLine."Line No":=LineNo;
                                ReceiptLine."Receipt No.":=ReceiptHeader."No.";
                                ReceiptLine."Account Type":=ImprestSurrender."Account Type";
                                ReceiptLine."Account No.":=ImprestSurrender."Account No.";
                                ReceiptLine."Account Name":=ImprestSurrender."Account Name";
                                ReceiptLine.Description:=ImprestLines.Description;
                                ReceiptLine.Amount:=ImprestLines."Remaining Amount";
                                ReceiptLine."Global Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                                ReceiptLine."Global Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                                IF NOT ReceiptLine.GET(ReceiptLine."Line No",ReceiptLine."Receipt No.") THEN
                                 ReceiptLine.INSERT;
                                */
                            end;
                        end;
                    end;
                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /* GLEntry.RESET;
             GLEntry.SETRANGE(GLEntry."Document No.",ImprestSurrender."No.");
             GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
             GLEntry.SETRANGE("Posting Date",ImprestSurrender."Surrender Date");
             IF GLEntry.FINDFIRST THEN BEGIN*/


            ImprestSurrender.Surrendered := true;
            if Selection = 1 then
                ImprestSurrender."Receipt Created" := true;
            ImprestSurrender.Modify;
            //Uncommit Entries made to the varoius expenses accounts
            Committment.UncommitImprest(ImprestSurrender);
            //END;
        end;

    end;


    procedure PostImprestMemo(var ImprestMemo: Record "Imprest Memo")
    var
        //JobPlanningLines: Record "Job Planning Line";
        Payments: record payments;
        JobPlanningLines: record "Imprest Voucher Lines";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text011, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted then
                Error(Text013);

            //
            //Check totals
            ImprestMemo.CalcFields("Total Subsistence Allowance");
            //  IF ImprestMemo."Total Subsistence Allowance"=0 THEN
            //    ERROR(Text012);
            // {
            //  //Post Entries into the Job Task Lines
            //   JobPlanningLines.RESET;
            //   JobPlanningLines.SETRANGE("Job No.",Project);
            //   JobPlanningLines.SETRANGE("Job Task No.","Project Task");
            //    IF JobPlanningLines.FINDLAST THEN
            //     LineNo:=JobPlanningLines."Line No."+1
            //    ELSE
            //     LineNo:=1000;
            // }
            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    /*
                     LineNo:=LineNo+1000;
                     JobPlanningLines.INIT;
                     JobPlanningLines."Job No.":=ImprestMemo.Project;
                     JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                     JobPlanningLines."Line No.":=LineNo;
                     JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                     JobPlanningLines."No.":=ProjectMembers."No.";
                     JobPlanningLines.VALIDATE("No.");
                     JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                     JobPlanningLines."Planning Date":=Date;
                     JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(ProjectMembers.Delivery)+'D',Date);
                     JobPlanningLines.Description:=ProjectMembers."Tasks to Carry Out";
                     JobPlanningLines."Work Type Code":=ProjectMembers."Work Type";
                     JobPlanningLines.VALIDATE("Work Type Code");
                     JobPlanningLines.Quantity:=ProjectMembers."Time Period";
                     IF ProjectMembers.Entitlement<>0 THEN //Cases of Personell
                     BEGIN
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers.Entitlement;
                       JobPlanningLines."Line Amount (LCY)":=ProjectMembers.Entitlement;
                    END ELSE
                    BEGIN//Cases of Machinery
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers."Expected Maintenance Cost";
                        JobPlanningLines."Line Amount (LCY)":=ProjectMembers."Expected Maintenance Cost";
                    END;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                      BEGIN
                       JobPlanningLines.INSERT(TRUE);
                       */
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                    JobPlanningLines."No.":=Casuals."Resource No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(Casuals."No. of Days")+'D',Date);
                    JobPlanningLines.Description:=Casuals.Activity;
                    JobPlanningLines."Work Type Code":=Casuals."Work Type";
                    JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=Casuals."No. of Days"*Casuals."No. Required";
                    JobPlanningLines."Unit Cost":=Casuals.Rate;
                    JobPlanningLines."Unit Cost (LCY)":=Casuals.Rate;
                    JobPlanningLines."Line Amount":=Casuals.Amount;
                    JobPlanningLines."Line Amount (LCY)":=Casuals.Amount;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::"G/L Account";
                    JobPlanningLines."No.":=OtherCosts."No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=Date;
                    JobPlanningLines.Description:=OtherCosts.Description;
                    JobPlanningLines."Work Type Code":=OtherCosts."Work Type";
                    //JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=OtherCosts."Quantity Required";
                    JobPlanningLines."Unit Cost":=OtherCosts."Unit Cost";
                    JobPlanningLines."Unit Cost (LCY)":=OtherCosts."Unit Cost";
                    JobPlanningLines."Line Amount":=OtherCosts."Line Amount";
                    JobPlanningLines."Line Amount (LCY)":=OtherCosts."Line Amount";
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            Posted := true;
            "Posted By" := UserId;
            Modify;
            //

            //
        end;

    end;


    procedure PostPettyCash(PCASH: Record Payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PCLines: Record "Petty Cash Lines";
    begin
        if Confirm('Are you sure you want to post the Special Imprest Voucher No. ' + PCASH."No." + ' ?') = true then begin
            // if PCASH.Status <> PCASH.Status::Released then
            //     Error('The Petty Cash Voucher No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('Petty Cash Voucher %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            PCASH.TestField(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount LCY");
            if PCASH."Total Amount LCY" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('Petty Cash voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;


            //Bank Entries
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount LCY");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PCASH Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            if PCASH.Date = 0D then
                Error('You must specify the PCASH date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            GenJnLine.Description := 'Pay To:' + PCASH.Payee;
            GenJnLine."Account Type" := PCASH."Account Type";
            GenJnLine."Account No." := PCASH."Account No.";
            GenJnLine.Validate("Account No.");
            GenJnLine.Amount := PCASH."Total Amount LCY";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Bal. Account No.");
            if PCASH."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Commit();
            CMSetup.Get;
            GenJnLine.Reset;
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                PrintCheck(GenJnLine, CMSetup."PCASH Journal Template", CMSetup."PCASH Journal Batch Name");
            end;

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            if GenJnlLine.FindSet then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            end;

            // BankAccountLedgerEntry.Reset;
            // BankAccountLedgerEntry.SetRange("Document No.", PCASH."No.");
            // if BankAccountLedgerEntry.FindFirst then begin
            PCASH.Posted := true;
            PCASH."Posted By" := UserId;
            PCASH."Posted Date" := Today;
            PCASH."Time Posted" := Time;
            PCASH.Status := PCASH.Status::Released;
            PCASH."Payment Type" := PCASH."Payment Type"::"Petty Cash Surrender";
            PCASH.Modify(true);

            //generate Petty cash Surrender Document
            //     //CreateSpecialImprestSurrender(PCASH);
            //     ;
            // end;
            //Update Petty Cash Lines
            UpdatePCLines(PCASH);


        end;
    end;


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, WText026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No div Power(1000, Exponent - 1);
                Hundreds := Ones div 100;
                Tens := (Ones mod 100) div 10;
                Ones := Ones mod 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, WText027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        AddToNoText(NoText, NoTextIndex, PrintExponent, WText028);
        AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + '/100');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(WText029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := WText032;
        OnesText[2] := WText033;
        OnesText[3] := WText034;
        OnesText[4] := WText035;
        OnesText[5] := WText036;
        OnesText[6] := WText037;
        OnesText[7] := WText038;
        OnesText[8] := WText039;
        OnesText[9] := WText040;
        OnesText[10] := WText041;
        OnesText[11] := WText042;
        OnesText[12] := WText043;
        OnesText[13] := WText044;
        OnesText[14] := WText045;
        OnesText[15] := WText046;
        OnesText[16] := WText047;
        OnesText[17] := WText048;
        OnesText[18] := WText049;
        OnesText[19] := WText050;

        TensText[1] := '';
        TensText[2] := WText051;
        TensText[3] := WText052;
        TensText[4] := WText053;
        TensText[5] := WText054;
        TensText[6] := WText055;
        TensText[7] := WText056;
        TensText[8] := WText057;
        TensText[9] := WText058;

        ExponentText[1] := '';
        ExponentText[2] := WText059;
        ExponentText[3] := WText060;
        ExponentText[4] := WText061;
    end;


    procedure "Post ImprestSurrender"(var Imprest: Record Payments; BatchPost: Boolean)
    var
        ImprestLines: Record "Imprest Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImprestHeader: Record Payments;
        payment2: Record Payments;
        CustomerPostingGrp: Record "Customer Posting Group";
    begin

        if BatchPost then begin
            if not Confirm(Text002, false, Imprest."No.") then
                exit;

        end;
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", Imprest."No.");
        GLEntry.SetRange(Reversed, false);
        if GLEntry.FindFirst() then begin
            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            Imprest.Modify;
            exit;
        end;
        if Imprest.Status <> Imprest.Status::Released then
            Error(Text003, Imprest."No.");


        Imprest.TestField("Account No.");
        //Imprest.TESTFIELD("Paying Bank Account");
        Imprest.TestField(Date);
        Imprest.TestField(Payee);
        Imprest.TestField("Shortcut Dimension 1 Code");
        Imprest.TestField("Shortcut Dimension 2 Code");
        // Imprest.TESTFIELD("Shortcut Dimension 3 Code");
        Imprest.TestField("Posting Date");

        /*
          //Check if the imprest Lines have been populated
          ImprestLines.SETRANGE(ImprestLines."No.",Imprest."No.");
          IF NOT ImprestLines.FINDLAST  THEN
           ERROR(Text004);

        */


        Imprest.CalcFields("Imprest Amount", "Actual Amount Spent", "Actual Amount Spent LCY", "Imprest Amount LCY");
        //post if surrender was for all amount
        if Imprest."Cash Receipt Amount" = Imprest."Imprest Amount" then begin
            Imprest.Posted := true;
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then begin
                ImprestHeader.Surrendered := true;
                ImprestHeader.Modify(true);
            end;
            exit;
        end;

        if Imprest."Imprest Amount" = 0 then
            Error(Text005);
        if Imprest."Actual Amount Spent" = 0 then
            Error(Text005);
        /*IF Imprest."Imprest Amount"=0 THEN
        ERROR(Text005);*/
        if Imprest."Actual Amount Spent LCY" = 0 then
            Error(Text005);

        if Imprest.Posted then
            Error(Text006, Imprest."No.");


        CMSetup.Get();
        CMSetup.TestField("Imprest Due Date");
        CMSetup.TestField(CMSetup."IMPREST SUR Journal Batch Name");
        CMSetup.TestField(CMSetup."Imprest Surrender Template");

        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST SUR Journal Batch Name");
        GenJnLine.DeleteAll;

        //get the Application Warrant DOcument no for application on employee ledgers\
        Warrant.Reset;
        Warrant.SetRange("No.", Imprest."Reference No.");
        if Warrant.FindSet then begin
            ApplicationDocNumber := Warrant."Cheque No";

        end;

        /*
          // Delete Lines Present on the General Journal Line
          GenJnLine.RESET;
          GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
          GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
          GenJnLine.DELETEALL;

          Batch.INIT;
          IF CMSetup.GET() THEN
          Batch."Journal Template Name":=CMSetup."Imprest Template";
          Batch.Name:=Imprest."No.";
          IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
          Batch.INSERT;
          */
        LineNo := 1000;
        GenJnLine.Init;
        GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
        GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
        GenJnLine."Line No." := LineNo;
        if (checkIFEmployee(Imprest."Account No.")) then
            GenJnLine."Account Type" := Imprest."Account Type";
        if (checkIFEmployee(Imprest."Account No.") = false) then
            GenJnLine."Account Type" := GenJnLine."Account Type"::Customer;

        GenJnLine."Account No." := Imprest."Account No.";
        GenJnLine.Validate("Account No.");
        ImprestHeader.Get(Imprest."Imprest Issue Doc. No");
        Case ImprestHeader."Payment Type" of
            ImprestHeader."Payment Type"::Imprest:
                begin
                    GenJnLine."Posting Group" := CustomerPostingGrp.GetPostinGroup(CustomerPostingGrp.Utilization::"Safari Imprest");
                end;
            ImprestHeader."Payment Type"::"Standing Imprest":
                begin
                    GenJnLine."Posting Group" := CustomerPostingGrp.GetPostinGroup(CustomerPostingGrp.Utilization::"Standing Imprest");
                end;

        End;

        GenJnLine."Posting Date" := Imprest."Posting Date";
        GenJnLine."Document No." := Imprest."No.";
        GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
        GenJnLine.Description := Format('Surrendered by: ' + Imprest.Payee, 100);
        // GenJnLine.Amount:=-Imprest."Actual Amount Spent LCY";
        GenJnLine."Currency Code" := Imprest."Currency Code";
        GenJnLine.Validate("Currency Code");
        GenJnLine.Amount := -Imprest."Actual Amount Spent";
        GenJnLine.Validate(Amount);

        /*
        GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
        GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
        GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

      *///
        //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

        //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
        //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
        // GenJnLine.VALIDATE("Bal. Account No.");

        GenJnLine."Applies-to Doc. No." := ApplicationDocNumber;
        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

        GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
        GenJnLine.Validate(GenJnLine."Dimension Set ID");


        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;


        //IMP surrender Lines Entries
        ImprestLines.Reset;
        ImprestLines.SetRange(ImprestLines.No, Imprest."No.");
        if ImprestLines.FindFirst then begin
            repeat
                //ImprestLines.TESTFIELD(ImprestLines."Job Task No.");
                ImprestLines.Validate(ImprestLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                //IF CMSetup.GET THEN
                GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
                //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := ImprestLines."Account Type";
                GenJnLine."Account No." := ImprestLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                if Imprest."Posting Date" = 0D then
                    Error('You must specify the posting date');
                GenJnLine."Posting Date" := Imprest."Posting Date";
                GenJnLine."Document No." := Imprest."No.";
                GenJnLine."External Document No." := Imprest."Reference No.";
                GenJnLine.Description := Format(ImprestLines.Purpose, 100);
                //GenJnLine.Amount:=ImprestLines."Actual Spent LCY";
                GenJnLine.Amount := ImprestLines."Actual Spent";
                //IF PCASH."Pay Mode"='CHEQUE' THEN
                ////GenJnLine."Pay Mode":=PCASH."Pay Mode";
                GenJnLine."Currency Code" := Imprest."Currency Code";
                GenJnLine.Validate("Currency Code");

                /*GenJnLine."Job No.":=I := ImprestLines. "Job Task No.";
                GenJnLine."Job Quantity"  t := ImprestLines."Job Task No.";
                GenJnLine."Job Quantity":=1;
                GenJnLine.VALIDATE(GenJnLine."Job No.");
                GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                GenJnLine.VALIDATE(GenJnLine."Job Quantity");*/ //Commented by Morris
                                                                //end jobs

                //add jobs Morris                //add jobs Morris


                //add jobs Morris
                GenJnLine."Job No." := Imprest.Job;
                GenJnLine."Job Task No." := Imprest."Job Task No";
                GenJnLine."Job Quantity" := 1;
                GenJnLine.Validate(GenJnLine."Job No.");
                GenJnLine.Validate(GenJnLine."Job Task No.");
                //GenJnLine.n.






                GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
                GenJnLine.Validate(GenJnLine."Dimension Set ID");

                //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                //GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until ImprestLines.Next = 0;
        end;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
        /*GLEntry.RESET;
        GLEntry.SETRANGE(GLEntry."Document No.",Imprest."No.");
        GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
        GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
        IF GLEntry.FINDFIRST THEN BEGIN*/
        Imprest.Posted := true;
        Imprest."Posted By" := UserId;
        Imprest."Posted Date" := Today;
        Imprest."Time Posted" := Time;
        Imprest.Modify();
        /// Imprest.Status:=Imprest.Status::Open;
        //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
        //Update the Imprest Deadline
        //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
        //tImprest.MODIFY;

        if ImprestHeader.Get(Imprest."Imprest Issue Doc. No") then begin
            ImprestHeader.Surrendered := true;
            ImprestHeader.MODIFY;

        end;

        // END;

    end;

    procedure PostBankTransfer(PCASH: Record Payments; BatchPost: Boolean)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetups: Record "Cash Management Setup";
        DocPrint: Codeunit "Document-Print";
        PettyCashEntries: Record "Petty Cash Entries";
        PettyCash: Record Payments;
    begin
        if not BatchPost then begin
            if not Confirm('Are u sure u want to post this InterBank Transfer' + PCASH."No." + ' ?') then
                exit;

        end;
        if PCASH.Status <> PCASH.Status::Released then
            Error('The InterBank Transfer No %1 has not been fully approved', PCASH."No.");
        if PCASH.Posted then
            Error('InterBank Transfer %1 has been posted', PCASH."No.");
        PCASH.TestField(Date);
        PCASH.TestField("Paying Bank Account");
        //PCASH.TESTFIELD(PCASH.Payee);
        PCASH.TestField(PCASH."Pay Mode");
        PCASH.TestField(PCASH."Posting Date");
        if PCASH."Pay Mode" = 'CHEQUE' then begin
            PCASH.TestField(PCASH."Cheque Date");
        end;

        //Check Lines
        PCASH.CalcFields("Total Amount LCY");
        if PCASH."Total Amount LCY" = 0 then
            Error('Amount is cannot be zero');
        PCASHLines.Reset;
        PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
        if not PCASHLines.FindLast then
            Error('InterBank Transfer Lines cannot be empty');

        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank TR Journal Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
        GenJnLine.DeleteAll;

        //Bank Entries
        LineNo := LineNo + 1000;
        PCASH.CalcFields(PCASH."Total Amount LCY");
        PCASHLines.Reset;
        PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
        PCASHLines.Validate(PCASHLines.Amount);
        PCASHLines.CalcSums(PCASHLines.Amount);


        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
        GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No." := PCASHLines."Account No";
        GenJnLine.Validate(GenJnLine."Account No.");
        if PCASH.Date = 0D then
            Error('You must specify the Transfer date');
        //Ruth

        if PCASH."Pay Mode" = 'CHEQUE' then
            GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
        GenJnLine.Validate("Currency Code");
        GenJnLine."Posting Date" := PCASH."Posting Date";
        GenJnLine."Document No." := PCASH."No.";
        GenJnLine."External Document No." := PCASH."No.";
        GenJnLine."Payment Method Code" := PCASH."Pay Mode";
        //use paye field
        /*
        PCASH.CALCFIELDS("Bank Name");*/
        GenJnLine.Description := PCASH.Payee;
        GenJnLine.Amount := PCASHLines.Amount;
        GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Bal. Account No." := PCASH."Paying Bank Account";
        GenJnLine.Validate(GenJnLine."Bal. Account No.");
        GenJnLine.Validate(GenJnLine.Amount);//

        GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

        GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
        GenJnLine.Validate(GenJnLine."Dimension Set ID");

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;


        Commit();


        //loop to print check
        GenJnLine.Reset;
        GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
        GenJnLine.SetRange("Check Printed", false);
        if GenJnLine.FindSet then begin
            repeat
                CMSetup.Get;

                PrintCheck(GenJnLine, CMSetup."Bank TR Journal Template", CMSetup."Bank TR Journal Batch Name");

                PCASHLines.SetRange(No, PCASHLines.No);
                if PCASHLines.FindSet then begin
                    PCASHLines."Check No" := GenJnLine."Document No.";
                    PCASHLines."Check Printed" := true;
                    PCASHLines.Modify();
                end;
            until GenJnLine.Next = 0;
        end;

        GenJnLine.Reset;
        GenJnLine.SetRange("Journal Template Name", CMSetup."Bank TR Journal Template");
        GenJnlLine.SetRange("Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
        if GenJnLine.FindSet then begin
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
        end;
        if PCASH."Pay Mode" = 'CHEQUE' then begin
            BALedgerEntry.Reset;
            BALedgerEntry.SetRange("External Document No.", PCASH."No.");
            if BALedgerEntry.FindSet then begin
                PCASH."Cheque No" := BALedgerEntry."Document No.";
                PCASH.Posted := true;
                PCASH."Posted By" := UserId;
                PCASH."Posted Date" := Today;
                PCASH."Time Posted" := Time;
                PCASH.Modify;

            end;
        end else

            //check entries on the ledger
            BALedgerEntry.Reset;
        BALedgerEntry.SetRange("Document No.", PCASH."No.");
        if BALedgerEntry.FindFirst then begin
            PCASH.Posted := true;
            PCASH."Posted By" := UserId;
            PCASH."Posted Date" := Today;
            PCASH."Time Posted" := Time;
            PCASH.Modify;
        end;



        //Create Imprest Surrender in the event the document originated from an imprest.
        /*
        IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
           PV."Payment Type":=PV."Payment Type"::"10";
           PV.Status:=PV.Status::Open;
           PV.MODIFY;
        END;
        */
        //END;

        PettyCashEntries.RESET;
        PettyCashEntries.SETRANGE(No, PCASH."No.");
        if PettyCashEntries.FINDSET then begin
            repeat
                PettyCash.RESET;
                PettyCash.SETRANGE("No.", PettyCashEntries."Payment Document No.");
                if PettyCash.FINDFIRST then begin
                    PettyCash.Recouped := true;
                    PettyCash.MODIFY;
                end;
            until PettyCashEntries.NEXT = 0
        end;
    end;


    procedure PostPettyCashSurrender(var PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
    begin

        if Confirm(Text014, false, PCash."No.") = true then begin
            if PCash.Status <> PCash.Status::Released then
                Error(Text003, PCash."No.");

            PCash.TestField("Surrender Date");


            PCash.CalcFields("Petty Cash Amount", PCash."Actual Petty Cash Amount Spent");
            if PCash."Petty Cash Amount" = 0 then
                Error(Text005);
            if PCash."Actual Petty Cash Amount Spent" = 0 then
                Error(Text016);


            if PCash.Surrendered then
                Error(Text015, PCash."No.");


            CMSetup.Get();
            CMSetup.TestField("Petty Cash Surrender Template");
            CMSetup.TestField("PCASH Journal Batch Name");

            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Petty Cash Surrender Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            Batch.Name := CMSetup."PCASH Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := PCash."Account Type";
            GenJnLine."Account No." := PCash."Account No.";
            if PCash."Posting Date" = 0D then
                Error('You must specify the posting date');
            GenJnLine."Posting Date" := PCash."Posting Date";
            GenJnLine."Document No." := PCash."No.";
            GenJnLine.Description := 'Petty Cash Surrendered by: ' + PCash.Payee;
            GenJnLine.Amount := -PCash."Actual Petty Cash Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Petty Cash surrender Lines Entries
            PCLines.Reset;
            PCLines.SetRange(PCLines.No, PCash."No.");
            if PCLines.FindFirst then begin
                repeat
                    PCLines.Validate(PCLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCLines."Account Type";
                    GenJnLine."Account No." := PCLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCash."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := PCash."Posting Date";
                    GenJnLine."Document No." := PCash."No.";
                    //PCLines.TESTFIELD(Description);
                    GenJnLine.Description := 'Petty Cash to  ' + PCash."Account Name";
                    GenJnLine.Amount := PCLines."Actual Spent";
                    GenJnLine."Currency Code" := PCash."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");

                    //add jobs
                    GenJnLine."Job No." := PCash.Job;
                    GenJnLine."Job Task No." := PCash."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PCash."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",PCash."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PCash.Surrendered := true;
            PCash."Surrendered By" := UserId;
            PCash."Date Surrendered" := Today;
            PCash.Modify;
            //END;
        end;
    end;

    local procedure UpdatePCLines(PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        PVLines: Record "PV Lines";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PCash."No.");
        if PVLines.Find('-') then
            repeat
                PCLines.Init;
                PCLines.No := PVLines.No;
                PCLines."Line No" := PVLines."Line No";
                PCLines."Account Type" := PVLines."Account Type";
                PCLines."Account No" := PVLines."Account No";
                PCLines."Account Name" := PVLines."Account Name";
                PCLines.Description := PVLines.Description;
                PCLines.Amount := PVLines.Amount;
                PCLines.Validate(Amount);
                if not PCLines.Get(PCLines.No, PCLines."Line No") then
                    PCLines.Insert;
            until
           PVLines.Next = 0;
    end;

    procedure PostReceipt(var ReceiptRec: Record "Receipts Header1"; BatchPost: Boolean)
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        ReceiptRec2: Record "Receipts Header1";
        DimensionMgt: Codeunit DimensionManagement;
        BudgetManagement: Codeunit Committment2;
        DimensionCodes, DimensionCodes2 : array[8] of Code[20];
    begin
        if GuiAllowed then
            if not BatchPost then
                if not Confirm(Text017, false, ReceiptRec."No.") then
                    exit;

        GLEntry.Reset;
        GLEntry.SetCurrentKey("Document No.", "Posting Date");
        GLEntry.SetLoadFields("Document No.", "Reversed");
        GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
            ReceiptRec.Posted := true;
            ReceiptRec.Validate(Posted);
            ReceiptRec."Posted By" := GLEntry."User ID";
            ReceiptRec."Posted Date" := GLEntry."Posting Date";
            ReceiptRec."Posted Time" := Time;
            ReceiptRec.Modify;
            exit;
        end;
        /*IF ReceiptRec.Posted=TRUE THEN
        ERROR(Text018,ReceiptRec."No.");*/
        ReceiptRec.TestField(Date);
        ReceiptRec.TestField("Bank Code");
        ReceiptRec.TestField("Received From");
        ReceiptRec.TestField("Pay Mode");
        if ReceiptRec."Receipt Type" in [ReceiptRec."Receipt Type"::Deposit, ReceiptRec."Receipt Type"::Fee] then
            ReceiptRec.TestField("Case No.");
        ReceiptRec.TestField("Shortcut Dimension 1 Code");
        ReceiptRec.TestField("Shortcut Dimension 2 Code");

        if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
            ReceiptRec.TestField("Cheque No");
            ReceiptRec.TestField("Cheque Date");
        end;

        ReceiptRec.CalcFields(Amount);
        //Check Lines
        if ReceiptRec.Amount = 0 then
            Error('Amount cannot be zero');
        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        if not RcptLines.FindLast then
            Error('Receipt Lines cannot be empty');

        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
        GenJnLine.DeleteAll;

        Batch.Init;
        if CMSetup.Get() then
            Batch."Journal Template Name" := CMSetup."Receipt Template";
        Batch.Name := CMSetup."Receipt Batch Name";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;

        //Bank Entries
        LineNo := LineNo + 10000;

        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        RcptLines.Validate(Amount);
        RcptLines.CalcSums(Amount);

        DimensionMgt.GetShortcutDimensions(ReceiptRec."Dimension Set ID", DimensionCodes);

        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No." := ReceiptRec."Bank Code";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        if ReceiptRec."Posted Date" = 0D then
            Error('You must specify the Posted date');
        GenJnLine."Posting Date" := ReceiptRec."Posted Date";
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := CopyStr('Received from:' + ReceiptRec."Received From", 1, 100);
        GenJnLine.Amount := ReceiptRec.Amount;
        GenJnLine."Currency Code" := ReceiptRec."Currency Code";
        GenJnLine.Validate("Currency Code");
        GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
        GenJnLine.Validate("Currency Factor");
        GenJnLine.Validate(GenJnLine.Amount);
        UpdateDimensions(GenJnLine, DimensionCodes, DimensionCodes);
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindSet() then begin
            repeat
                DimensionMgt.GetShortcutDimensions(RcptLines."Dimension Set ID", DimensionCodes2);
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                if ReceiptRec."Receipt Type" = ReceiptRec."Receipt Type"::Fee then begin //Post to Revenue Account
                    GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                    GenJnLine."Account No." := ReceiptRec.GetInvoiceItemRevenueAccount(ReceiptRec."PRN No.");
                end else begin
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                end;
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := CopyStr('Received from:' + ReceiptRec."Received From", 1, 100);
                GenJnLine.Amount := -RcptLines.Amount;
                GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine."Currency Factor" := ReceiptRec."Currency Factor";
                GenJnLine.Validate("Currency Factor");
                GenJnLine.Validate(GenJnLine.Amount);
                UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;
        if BatchPost = false then
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine)
        else
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine);

        //kkaimor
        GLEntry.Reset;
        GLEntry.SetCurrentKey("Document No.", "Posting Date");
        GLEntry.SetLoadFields("Document No.", "Reversed");
        GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
            ///Set the remaining amount on the AIE receipt
            if ReceiptRec."Receipt Type" = ReceiptRec."Receipt Type"::AIE then begin
                ReceiptRec2.Reset;
                ReceiptRec2.SetRange("Receipt Type", ReceiptRec2."Receipt Type"::AIE);
                ReceiptRec2.SetRange(Closed, false);
                ReceiptRec2.SetRange(Posted, true);
                ReceiptRec2.SetRange("Global Dimension 2 Code", ReceiptRec."Global Dimension 2 Code");
                ReceiptRec2.SetFilter("No.", '<>%1', ReceiptRec."No.");
                if ReceiptRec2.FindFirst() then begin
                    ReceiptRec."Remaining Amount" := ReceiptRec."Amount" + ReceiptRec2."Remaining Amount";
                    ReceiptRec."Previous Receipt" := ReceiptRec2."No.";
                    ReceiptRec."Balance BF" := ReceiptRec2.GetRemainingAmount(ReceiptRec2."No.");
                END else begin
                    ReceiptRec."Remaining Amount" := ReceiptRec."Amount";
                end;
            end;
            if ReceiptRec."Receipt Type" = ReceiptRec."Receipt Type"::Surrender then
                Budgetmanagement.RecallExpRequisition(ReceiptRec.RecordId);
            ReceiptRec.Posted := true;
            ReceiptRec.Validate(Posted);
            ReceiptRec."Posted By" := UserId;
            ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
            ReceiptRec."Posted Time" := Time;
            ReceiptRec.Modify;
        end;
        // GLEntry.Reset;
        // GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        // GLEntry.SetRange(GLEntry.Reversed, false);
        // if GLEntry.FindFirst then begin
        //     //if GuiAllowed then begin
        //     if (ReceiptRec."Receipt Type" = ReceiptRec."Receipt Type"::Deposit) or (ReceiptRec."Receipt Type" = ReceiptRec."Receipt Type"::Fee) then
        //         ReceiptRec.Validate(Status, ReceiptRec.Status::Released);
        //     ReceiptRec.Validate(Posted, true);
        //     ReceiptRec."Posted By" := UserId;
        //     ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
        //     ReceiptRec."Posted Time" := Time;
        //     if not ReceiptRec.Modify then begin
        //         ReceiptRec2.Reset();
        //         ReceiptRec2.SetRange("No.", ReceiptRec."No.");
        //         if ReceiptRec2.findfirst() then begin
        //             if (ReceiptRec2."Receipt Type" = ReceiptRec2."Receipt Type"::Deposit) or (ReceiptRec2."Receipt Type" = ReceiptRec2."Receipt Type"::Fee) then
        //                 ReceiptRec2.Validate(Status, ReceiptRec2.Status::Released);
        //             ReceiptRec2.Validate(Posted, true);
        //             ReceiptRec2."Posted By" := UserId;
        //             ReceiptRec2."Posted Date" := ReceiptRec2."Posted Date";
        //             ReceiptRec2."Posted Time" := Time;
        //             ReceiptRec2.modify(true);
        //         end;
        //     end;
        //     //end;
        // end;
    end;

    procedure PostImprestMemoSurr(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text019, false, ImprestMemo."No.") then
            exit;

        with ImprestMemo do begin
            //Check if Posted
            if Posted and Surrendered then
                Error(Text020);

            //
            //Check totals
            /*
            ImprestMemo.CALCFIELDS("Actual Subsistence Allowance");
            IF ImprestMemo."Actual Subsistence Allowance"=0 THEN
              ERROR(Text012);
              */

            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", "No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");

                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", "No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");

                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            Posted := true;
            "Posted By" := UserId;
            Surrendered := true;
            Modify;
        end;
    end;
    //post of staff claims

    procedure PostStaffClaims(Sclaims: Record Payments; BatchPost: Boolean)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        DimensionMgt: Codeunit DimensionManagement;
        GLEntry: Record "G/L Entry";
        DimensionCodes, DimensionCodes2 : array[8] of Code[20];
    begin
        if GuiAllowed then
            if not BatchPost then begin
                if not Confirm(text024, false, Sclaims."No.") then
                    exit;
            end;
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", Sclaims."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
            Sclaims.Posted := true;
            Sclaims."Posted By" := GLEntry."User ID";
            Sclaims."Posted Date" := GLEntry."Posting Date";
            Sclaims.Modify;
            exit;
        end;
        if Sclaims.Status <> Sclaims.Status::Released then
            Error(Text023, Sclaims."No.");
        Sclaims.TestField(Sclaims.Date);
        Sclaims.CalcFields(Sclaims."Total Amount LCY");
        if Sclaims."Total Amount LCY" = 0 then
            Error(text022);

        DimensionMgt.GetShortcutDimensions(Sclaims."Dimension Set ID", DimensionCodes);
        CMSetup.Get();
        CMSetup.TestField(CMSetup."Staff Claim Journal Template");
        CMSetup.TestField(CMSetup."Staff Claim Journal Batch Name");
        GenJnLine.Reset;
        GenJnLine.SetRange("Journal Template Name", CMSetup."Staff Claim Journal Template");
        GenJnLine.SetRange("Journal Batch Name", CMSetup."Staff Claim Journal Batch Name");
        GenJnLine.DeleteAll;
        Batch.Init;
        Batch."Journal Template Name" := CMSetup."Staff Claim Journal Template";
        Batch.Name := CMSetup."Staff Claim Journal Batch Name";

        LineNo := 1000;
        GenJnLine.Init;
        GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
        GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
        GenJnLine."Line No." := LineNo + 1000;
        // GenJnLine."Account Type" := Sclaims."Account Type";
        // GenJnLine."Account No." := Sclaims."Account No.";
        GenJnLine."Account Type" := GenJnLine."Account Type"::"Bank Account";
        GenJnLine."Account No." := SClaims."Paying Bank Account";
        GenJnLine.Validate("Account No.");
        GenJnLine."Posting Date" := Sclaims."Posting Date";
        // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
        GenJnLine."Document No." := Sclaims."No.";
        GenJnLine."External Document No." := Sclaims."Account No.";
        GenJnLine.Description := 'Staff Claim From:  ' + Sclaims."Account Name";
        GenJnLine.Amount := -Sclaims."Total Amount LCY";
        GenJnLine.Validate(Amount);
        UpdateDimensions(GenJnLine, DimensionCodes, DimensionCodes);
        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;


        //Staff Claim Lines
        sclaimlines.Reset;
        sclaimlines.SetRange(sclaimlines.No, Sclaims."No.");
        if sclaimlines.FindSet() then begin
            repeat
                DimensionMgt.GetShortcutDimensions(sclaimlines."Dimension Set ID", DimensionCodes2);
                sclaimlines.Validate(sclaimlines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
                GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := sclaimlines."Account Type";
                GenJnLine."Account No." := sclaimlines."Account No";
                GenJnLine."External Document No." := Sclaims."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                if Sclaims."Posting Date" = 0D then
                    Error('You must specify the posting date');
                GenJnLine."Posting Date" := Sclaims."Posting Date";
                //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                GenJnLine."Document No." := Sclaims."No.";
                GenJnLine."External Document No." := Sclaims."Account No.";
                sclaimlines.TestField(Description);
                GenJnLine.Description := sclaimlines.Description;
                GenJnLine.Amount := sclaimlines.Amount;
                UpdateDimensions(GenJnLine, DimensionCodes2, DimensionCodes);
                GenJnLine.Validate(GenJnLine.Amount);
                //Added for Jobs
                GenJnLine."Job No." := Sclaims.Job;
                GenJnLine."Job Task No." := Sclaims."Job Task No";
                GenJnLine."Job Quantity" := 1;
                GenJnLine.Validate(GenJnLine."Job No.");
                GenJnLine.Validate(GenJnLine."Job Task No.");
                GenJnLine.Validate(GenJnLine."Job Quantity");
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;
            until sclaimlines.Next = 0;
        end;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
        Sclaims.Posted := true;
        Sclaims."Posted By" := UserId;
        Sclaims."Posted Date" := Today;
        Sclaims.Modify;
    end;


    procedure SendforPosting(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text102, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            // Imprest.TESTFIELD("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            Imprest."Send for Posting" := true;
            Imprest.Modify;
            Message('Imprest %1 has been sent for posting successfully', Imprest."No.");

        end;
    end;

    procedure PostSalaryAdvance(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        Employee: Record Employee;
        HumanResourceSetup: Record "Human Resources Setup";
    begin
        if Confirm(text025, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text026, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            Sclaims.TestField("Paying Bank Account");
            Sclaims.TestField("Effective from Month");
            Sclaims.TestField("Posting Date");
            if Sclaims."Amount Approved" = 0 then
                Error(text027);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Salary Adv Journal Batch Name");
            CMSetup.TestField(CMSetup."Salary Adv Journal Template");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Salary Adv Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Salary Adv Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            Batch.Name := CMSetup."Salary Adv Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Salary Adv Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Employee;
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            HumanResourceSetup.Get;

            // Employee.RESET;
            // Employee.SETRANGE("No.",Sclaims."Account No.");
            // IF Employee.FIND('-') THEN BEGIN
            // //   Employee.TESTFIELD("Salary Advance Posting Group");
            GenJnLine."Posting Group" := HumanResourceSetup."Salary Advance Posting Group";
            // END;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Salary Advance From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Amount Approved";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Sclaims."Paying Bank Account";

            GenJnLine.Validate(Amount);
            //GenJnLine."Posting Group":=CMSetup."SClaims Posting Group";
            //GenJnLine.VALIDATE(GenJnLine."Posting Group");
            //GenJnLine."Transaction Type":=Sclaims."Transaction Type";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;
        end;

        //end of salary advance
    end;


    procedure FnPostSalaryAdvance(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text025, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text026, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            if Sclaims."Amount Approved" = 0 then
                Error(text027);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Salary Adv Journal Batch Name");
            CMSetup.TestField(CMSetup."Salary Adv Journal Template");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Salary Adv Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Salary Adv Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            Batch.Name := CMSetup."Salary Adv Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Salary Adv Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Salary Adv Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := Sclaims."Account Type";
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Salary Advance From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Amount Approved";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Sclaims."Paying Bank Account";

            GenJnLine.Validate(Amount);
            //GenJnLine."Posting Group":=CMSetup."SClaims Posting Group";
            //GenJnLine.VALIDATE(GenJnLine."Posting Group");
            //GenJnLine."Transaction Type":=Sclaims."Transaction Type";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            /*
            //Staff Claim Lines
            sclaimlines.RESET;
            sclaimlines.SETRANGE(sclaimlines.No,Sclaims."No.");
            IF sclaimlines.FINDFIRST THEN BEGIN
            REPEAT
            sclaimlines.VALIDATE(sclaimlines.Amount);
            LineNo:=LineNo+10000;
            GenJnLine.INIT;
            GenJnLine."Journal Template Name":=CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name":=CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No.":=LineNo;
            GenJnLine."Account Type":=sclaimlines."Account Type";
            GenJnLine."Account No.":=sclaimlines."Account No";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
             IF Sclaims."Posting Date"=0D THEN
              ERROR('You must specify the posting date');
            GenJnLine."Posting Date":=Sclaims."Posting Date";
            //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
            GenJnLine."Document No.":=Sclaims."No.";
            GenJnLine."External Document No.":=Sclaims."Account No.";
            sclaimlines.TESTFIELD(Description);
            GenJnLine.Description:=sclaimlines.Description;
            GenJnLine.Amount:=sclaimlines.Amount;
            GenJnLine.VALIDATE(GenJnLine.Amount);

            //Job ledger entries
            {
            GenJnLine."Job No.":=sclaimlines."Shortcut Dimension 2 Code";
            GenJnLine."Job Task No.":=sclaimlines."Job Task No.";
            GenJnLine."Job Quantity":=1;
            GenJnLine.VALIDATE(GenJnLine."Job No.");
            GenJnLine.VALIDATE(GenJnLine."Job Task No.");
            GenJnLine.VALIDATE(GenJnLine."Job Quantity");
            }
            //end jobs

            GenJnLine."Dimension Set ID":=Sclaims."Dimension Set ID";
            GenJnLine.VALIDATE(GenJnLine."Dimension Set ID");

             IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;

            UNTIL sclaimlines.NEXT=0;
            END;
            */
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;
        OnAfterPostSalaryAdvance(Sclaims);
        //end of staff claim post

    end;


    procedure PostStandingImprestSurrenders(StandingImprest: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        StandingImprestlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text028, false, StandingImprest."No.") = true then begin
            if StandingImprest.Status <> StandingImprest.Status::Released then
                Error(Text023, StandingImprest."No.");
            StandingImprest.TestField(StandingImprest.Date);
            StandingImprest.CalcFields(StandingImprest."Total Amount LCY");
            if StandingImprest."Total Amount LCY" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Standing Imp Journal Template");
            CMSetup.TestField(CMSetup."StandingImp Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Standing Imp Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."StandingImp Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Standing Imp Journal Template";
            Batch.Name := CMSetup."StandingImp Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;




            //Staff Claim Lines
            StandingImprestlines.Reset;
            StandingImprestlines.SetRange(StandingImprestlines.No, StandingImprest."No.");
            if StandingImprestlines.FindFirst then begin
                repeat
                    StandingImprestlines.TestField("Reference No");
                    StandingImprestlines.TestField(Description);
                    StandingImprestlines.Validate(StandingImprestlines.Amount);



                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
                    GenJnLine."Account No." := StandingImprest."Paying Bank Account";
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprestlines."Reference No";
                    GenJnLine.Description := StandingImprestlines.Description;
                    GenJnLine.Amount := -StandingImprestlines.Amount;
                    GenJnLine.Validate(Amount);

                    //Added for Jobs
                    /*GenJnLine."Job No.":=StandingImprest.Job;
                    GenJnLine."Job Task No.":=StandingImprest."Job Task No";*/

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;





                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Standing Imp Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."StandingImp Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := StandingImprestlines."Account Type";
                    GenJnLine."Account No." := StandingImprestlines."Account No";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if StandingImprest.Date = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := StandingImprest.Date;
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := StandingImprest."No.";
                    GenJnLine."External Document No." := StandingImprest."Account No.";
                    //StandingImprestlines.TESTFIELD(Description);
                    GenJnLine.Description := StandingImprestlines."Account Name";
                    GenJnLine.Amount := StandingImprestlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    GenJnLine."Job No." := StandingImprest.Job;
                    GenJnLine."Job Task No." := StandingImprest."Job Task No";

                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := StandingImprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                until StandingImprestlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            StandingImprest.Posted := true;
            StandingImprest."Posted By" := UserId;
            StandingImprest."Posted Date" := Today;
            StandingImprest.Modify;

        end;

        //end of standing imprest surrender

    end;

    procedure PostDIV(ReceiptRec: Record "Receipts Header1"; BatchPost: Boolean)
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if not BatchPost then begin
            if not Confirm(Text017, false, ReceiptRec."No.") then
                exit;
        end;

        if ReceiptRec.Posted = true then
            Error(Text018, ReceiptRec."No.");
        ReceiptRec.TestField(Date);
        ReceiptRec.TestField("Bank Code");
        ReceiptRec.TestField("Received From");
        ReceiptRec.TestField("Pay Mode");

        if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
            ReceiptRec.TestField("Cheque No");
            ReceiptRec.TestField("Cheque Date");
        end;

        ReceiptRec.CalcFields(Amount);
        //Check Lines
        if ReceiptRec.Amount = 0 then
            Error('Amount cannot be zero');
        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        if not RcptLines.FindLast then
            Error('Receipt Lines cannot be empty');

        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
        GenJnLine.DeleteAll;


        Batch.Init;
        if CMSetup.Get() then
            Batch."Journal Template Name" := CMSetup."Receipt Template";
        Batch.Name := CMSetup."Receipt Batch Name";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;

        //Bank Entries
        LineNo := LineNo + 10000;

        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        RcptLines.Validate(Amount);
        RcptLines.CalcSums(Amount);



        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No." := ReceiptRec."Bank Code";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        GenJnLine."Posting Date" := ReceiptRec."Posted Date";
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
        GenJnLine.Amount := ReceiptRec.Amount;
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindFirst then begin
            repeat
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := RcptLines."Account Type";
                GenJnLine."Account No." := RcptLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                GenJnLine.Amount := -RcptLines.Amount;
                //GenJnLine."Currency Code":=ReceiptRec.Currency;
                //GenJnLine.VALIDATE("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;

        //DIV
        LineNo := LineNo + 10000;
        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
        GenJnLine."Account No." := ReceiptRec."Expense Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        GenJnLine."Posting Date" := ReceiptRec."Posted Date";
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
        GenJnLine.Amount := -ReceiptRec.Amount;
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindFirst then begin
            repeat
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := RcptLines."Account Type";
                GenJnLine."Account No." := RcptLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec."Posted Date";
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                GenJnLine.Amount := RcptLines.Amount;
                //GenJnLine."Currency Code":=ReceiptRec.Currency;
                //GenJnLine.VALIDATE("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
            ReceiptRec.Posted := true;
            ReceiptRec."Posted By" := UserId;
            ReceiptRec."Posted Date" := ReceiptRec."Posted Date";
            ReceiptRec."Posted Time" := Time;
            ReceiptRec.Modify;

        end;

    end;

    procedure PrintCheck(LineValue: Record "Gen. Journal Line"; TemplateName: Text; BatchName: Text)
    begin
        CMSetup.Get;
        /*
        GenJnlLine."Journal Template Name":=TemplateName;
        GenJnlLine."Journal Batch Name":=BatchName;
        GenJnlLine.COPY(LineValue);*/
        DocPrint.PrintCheck(LineValue);
        Codeunit.Run(Codeunit::"Adjust Gen. Journal Balance", LineValue);

    end;


    procedure "Post Prepayment Voucher"(PrepaymentHeader: Record "Prepayment Header")
    var
        PVLines: Record "Prepayment Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PVLines1: Record "Prepayment Lines";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        if Dialog.Confirm('Are you sure you want to post the Prepayment Voucher No. ' + PrepaymentHeader."No." + ' ?', true) then begin
            if PrepaymentHeader.Status <> PrepaymentHeader.Status::Released then
                Error('The Pre-Payment Voucher No %1 has not been fully approved', PrepaymentHeader."No.");
            if PrepaymentHeader.Posted then
                Error('Pre-Payment Voucher %1 has been posted', PrepaymentHeader."No.");
            PrepaymentHeader.TestField(Date);
            PrepaymentHeader.TestField("Paying Bank Account");
            PrepaymentHeader.TestField(PrepaymentHeader."Pay Mode");
            PrepaymentHeader.TestField(PrepaymentHeader."Posting Date");
            PrepaymentHeader.CalcFields("Total Amount");
            if PrepaymentHeader."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PrepaymentHeader."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;

            //PrepaymentHeader Lines Entries
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine.Validate("Account Type");
            GenJnLine."Account No." := CMSetup."Prepayment Account";
            GenJnLine.Validate("Account No.");

            if PrepaymentHeader."Posting Date" = 0D then
                Error('You must specify the PrepaymentHeader date');
            GenJnLine."Posting Date" := PrepaymentHeader."Posting Date";
            GenJnLine."Document No." := PrepaymentHeader."No.";
            GenJnLine."External Document No." := PrepaymentHeader."No.";
            GenJnLine."Payment Method Code" := PrepaymentHeader."Pay Mode";
            //Ruth
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := PrepaymentHeader."Paying Bank Account";
            if PrepaymentHeader."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine.Description := CopyStr(Format((PrepaymentHeader."Payment Narration")), 1, 100);
            GenJnLine.Amount := PrepaymentHeader."Total Amount";
            if PrepaymentHeader."Pay Mode" = 'CHEQUE' then
                ////GenJnLine."Pay Mode":=PrepaymentHeader."Pay Mode";
                GenJnLine."Currency Code" := PrepaymentHeader.Currency;
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            if GenJnLine.Amount <> 0 then GenJnLine.Insert;
            Commit();
            //loop to print check
            GenJnLine.Reset;
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                repeat
                    CMSetup.Get;
                    PrintCheck(GenJnLine, CMSetup."PV Journal Template", CMSetup."PV Journal Batch Name");

                until GenJnLine.Next = 0;
            end;


            //today
            if CMSetup.Get then
                GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            PrepaymentHeader.Posted := true;
            PrepaymentHeader."Posted By" := UserId;
            PrepaymentHeader."Posted Date" := Today;
            PrepaymentHeader."Time Posted" := Time;
            PrepaymentHeader.Modify;


        end;
    end;


    procedure PostWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin

        if Dialog.Confirm('Are you sure you want to post the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin

            if Warrant.Status <> Warrant.Status::Released then
                Error('The Warrant Voucher No %1 has not been fully approved', Warrant."No.");
            if Warrant.Posted then
                Error('Warrant Voucher %1 has been posted', Warrant."No.");
            Warrant.TestField("Paying Bank Account");
            Warrant.TestField(Warrant."Pay Mode");
            Warrant.TestField("Cheque No");
            Warrant.TestField(Warrant."Posting Date");
            Warrant.TestField(Warrant."Cheque Date");

            Warrant.CalcFields("Imprest Voucher Amount");
            Warrant.CalcFields("Imprest Voucher Amount(LCY)");
            if Warrant."Imprest Voucher Amount" = 0 then
                Error('Amount is cannot be zero');
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if not ImprestVoucherLines.FindLast then
                Error('Warrant voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("External Document No.", Warrant."No.");
            BankAccountLedgerEntry.SetRange(Reversed, false);
            if BankAccountLedgerEntry.FindFirst then
                Error('There are entries in the bank associated with this warrant.Kindly consult the system administrator');
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";

            GenJnLine.SetRange("Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            GenJnLine.DeleteAll;


            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Cheque No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := CMSetup."Warrant Voucher Default Payabl";
            GenJnLine.Description := Warrant.Payee;
            GenJnLine."Currency Code" := Warrant."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Amount := Warrant."Imprest Voucher Amount";

            if Warrant."Pay Mode" = 'CHEQUE' then
                GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Bal. Account No." := Warrant."Paying Bank Account";
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;
            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if ImprestVoucherLines.FindSet then begin
                repeat
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := ImprestVoucherLines."Account Type";
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Cheque No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := CopyStr(Format((Warrant."Payment Narration") + '- ' + Warrant."Cheque No"), 1, 100);
                    GenJnLine.Amount := ImprestVoucherLines.Amount;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
                    GenJnLine."Bal. Account No." := CMSetup."Warrant Voucher Default Payabl";
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until ImprestVoucherLines.Next = 0;
            end;
            Commit();
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            GenJnLine.SetRange("Bank Payment Type", GenJnLine."bank payment type"::"Computer Check");
            GenJnLine.SetRange("Check Printed", false);
            if GenJnLine.FindSet then begin
                PrintCheck(GenJnLine, CMSetup."Imp Voucher Journal Template", CMSetup."Imp Voucher Journal Batch Name");
            end;
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imp Voucher Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Imp Voucher Journal Batch Name");
            if GenJnlLine.FindSet then
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            /*  Payments.RESET;
              Payments.SETRANGE("Account No.",Warrant."Account No.");
              Payments.SETRANGE("Cheque No",Warrant."Cheque No");
              //do not create a new surrender
              IF Payments.FINDSET THEN BEGIN
                 Warrant.Posted:=TRUE;
                 Warrant."Posted By":=USERID;
                 Warrant."Posted Date":=TODAY;
                 Warrant."Time Posted":=TIME;
                 Warrant.MODIFY;
                 MESSAGE('The voucher has been successfully posted!');
              END ELSE BEGIN
                //create a new surrender
                CreateSurrender(Warrant."Imprest Memo No");
                 Warrant.Posted:=TRUE;
                 Warrant."Posted By":=USERID;
                 Warrant."Posted Date":=TODAY;
                 Warrant."Time Posted":=TIME;
                 Warrant.MODIFY;
                 MESSAGE('The voucher has been successfully posted!');
              END;
              */
            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("External Document No.", Warrant."No.");
            if BankAccountLedgerEntry.FindFirst then begin
                Warrant.Posted := true;
                Warrant."Posted By" := UserId;
                Warrant."Posted Date" := Today;
                Warrant."Time Posted" := Time;
                Warrant.Modify;
                Commit;
                CreateSurrender(Warrant."Imprest Memo No", Warrant."Cheque No", Warrant."No.");
                Message('The voucher has been successfully posted!');
            end;

        end

    end;


    procedure CreateSurrender(Memo: Code[30]; QpayNo: Code[30]; VoucherNo: Code[30])
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        SurrenderNo: Code[30];
        ImprestVoucherLines1: Record "Imprest Voucher Lines";
        Imprestheaders1: Record Payments;
        RecordLink: Record "Record Link";
        RecordLink1: Record "Record Link";
        "EntryNo.": Integer;
    begin
        //LOOP Voucher lines
        Memoheaders.Reset;
        Memoheaders.SetRange("No.", Memo);
        if Memoheaders.FindFirst then begin
            Imprestheaders."Imprest Memo No" := ImprestVoucherLines."Imprest Memo No.";
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(No, VoucherNo);
            if ImprestVoucherLines.FindSet then begin
                repeat
                    //check existing surrender
                    Imprestheaders1.Reset;
                    Imprestheaders1.SetRange("Reference No.", ImprestVoucherLines.No);
                    Imprestheaders1.SetRange("Account Type", Imprestheaders1."account type"::Employee);
                    Imprestheaders1.SetRange("Account No.", ImprestVoucherLines."Account No.");
                    if not Imprestheaders1.FindFirst then begin
                        //window to show progress

                        //Window.OPEN('Creating Imprest Surrender for Employee:#######1',EmpName);
                        //Window.UPDATE(1,ImprestVoucherLines."Account Name");
                        SafariMembers.Reset;
                        SafariMembers.SetRange("No.", ImprestVoucherLines."Account No.");
                        SafariMembers.SetRange("Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                        SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                        if SafariMembers.Find('-') then begin

                            CashMgt.Get;
                            NoSeries := CashMgt."Imprest Surrender Nos";
                            Email2 := CashMgt."Imprest Email";

                            //header
                            //create header
                            LineNo := 1000;
                            Imprestheaders.Init;
                            Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
                            Imprestheaders.Date := Today;
                            //change
                            Imprestheaders."Account Type" := ImprestVoucherLines."Account Type";
                            //Imprestheaders."Account Type" := Imprestheaders."Account Type"::Employee;
                            Imprestheaders."Account No." := SafariMembers."No.";
                            Imprestheaders.Validate("Account No.");
                            Imprestheaders."Account Name" := SafariMembers.Name;
                            //Check HOD
                            Employee.Reset;
                            Employee.SetRange("No.", SafariMembers."No.");
                            if Employee.FindSet then begin
                                Imprestheaders.HOD := Employee.HOD;
                            end;

                            Imprestheaders."Payment Type" := Imprestheaders."payment type"::Surrender;
                            Imprestheaders.Payee := SafariMembers.Name;
                            Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                            Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                            Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                            Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                            Imprestheaders.Job := Memoheaders.Job;
                            Imprestheaders.Status := Imprestheaders.Status::Open;
                            Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                            Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                            Imprestheaders."Currency Code" := SafariMembers."Currency Code";
                            Imprestheaders."Created By" := EMp."User ID";



                            //Imprestheaders."Reference No.":="No.";



                            EMp.Reset;
                            EMp.SetRange("No.", Imprestheaders."Account No.");
                            //sendder
                            CMSetup.Get;
                            Email2 := CMSetup."Imprest Email";
                            Email := EMp."Company E-Mail";
                            Imprestheaders."Travel Date" := Memoheaders."Start Date";
                            Imprestheaders."Payment Narration" := Memoheaders.Subject;
                            Imprestheaders.Validate(Imprestheaders."Travel Date");
                            Imprestheaders."Document Type" := Imprestheaders."document type"::Surrender;
                            Imprestheaders."Imprest Memo No" := ImprestVoucherLines."Imprest Memo No.";
                            Imprestheaders."Reference No." := VoucherNo;
                            Imprestheaders."Imprest Deadline" := Memoheaders."Due Date";
                            Imprestheaders."On behalf of" := SafariMembers.Name;
                            Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                            Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                            Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 3 Code");
                            Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                            Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 4 Code");
                            Imprestheaders.Insert;
                            //get the attached documents Machira
                            RecordLink.Reset;
                            RecordLink.SetRange("Record ID", Memoheaders.RecordId);
                            if RecordLink.FindSet then begin
                                repeat
                                    //copy to the record link table with record id
                                    RecordLink1.Reset;
                                    if RecordLink1.FindLast then begin
                                        "EntryNo." := RecordLink1."Link ID";
                                    end;
                                    RecordLink1.Init;
                                    RecordLink1."Link ID" := "EntryNo." + 1;
                                    RecordLink1."Record ID" := Imprestheaders.RecordId;
                                    RecordLink1.URL1 := RecordLink.URL1;
                                    RecordLink1.Description := RecordLink.URL1;
                                    RecordLink1.Company := RecordLink.Company;
                                    RecordLink1.Type := RecordLink.Type;
                                    RecordLink1.Created := RecordLink.Created;
                                    RecordLink1."User ID" := RecordLink."User ID";
                                    RecordLink1.Insert;

                                until RecordLink.Next = 0;

                            end;

                            //end documents attached


                            //Start of Imprest lines
                            //get multiple lines for one member
                            SafariMembers1.Reset;
                            SafariMembers1.SetRange("Imprest Memo No.", SafariMembers."Imprest Memo No.");
                            SafariMembers1.SetRange("No.", SafariMembers."No.");
                            if SafariMembers1.FindSet then begin
                                repeat
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers1.CalcFields("G/L Account");
                                    Imprestlines."Account No." := Memoheaders."Job  Task";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines."Account Name" := SafariMembers1."Work Type";
                                    Imprestlines.Purpose := SafariMembers1."Work Type";
                                    Imprestlines."Daily Rate" := SafariMembers1."Direct Unit Cost";
                                    Imprestlines."Applies- to Doc. No." := SafariMembers1."Imprest Memo No.";
                                    Imprestlines."No. of Days" := SafariMembers1."Time Period";
                                    Imprestlines.Amount := SafariMembers1.Entitlement;
                                    Imprestlines."Currency Code" := SafariMembers1."Currency Code";
                                    Imprestlines."Employee No." := SafariMembers1."No.";
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;
                                    //Transort
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Employee No." := SafariMembers."No.";


                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;
                                until SafariMembers1.Next = 0;
                            end;


                            if ImprestVoucherLines."Imprest Other Costs" > 0 then begin

                                //Casual
                                Casual.Reset;
                                Casual.SetRange(Casual."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                if Casual.Find('-') then begin
                                    repeat
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";

                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := Casual.Activity;
                                        Imprestlines."Daily Rate" := Casual.Rate;
                                        Imprestlines."No. of Days" := Casual."No. of Days";
                                        Imprestlines.Amount := Casual.Amount;
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until Casual.Next = 0;
                                end;

                                //Other Costs
                                OtherCost.Reset;
                                OtherCost.SetRange(OtherCost."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                if OtherCost.FindSet then begin
                                    repeat
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";

                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        OtherCost.CalcFields("No.");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := OtherCost."Required For";
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := OtherCost."Line Amount";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until OtherCost.Next = 0;
                                end;
                                //Project team

                                ProjectTeam.Reset;
                                ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", ImprestVoucherLines."Imprest Memo No.");
                                // ProjectTeam.SetRange(ProjectT
                                //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                begin
                                    repeat
                                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := Memoheaders."Job  Task";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := ProjectTeam."Work Type";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Employee No." := SafariMembers."No.";

                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;

                                    until ProjectTeam.Next = 0;
                                end;
                            end;

                            //send email to participants

                            CashMgt.Get;
                            if CashMgt."Send Email Notification" = true then begin
                                Body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + ImprestVoucherLines."Imprest Memo No.";
                                //SMTP.Create('KASNEB Imprest Request', Email2,
                                //     Email, 'Surrender ' + 'No: ' + Imprestheaders."No.",
                                //    'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                                //    'Your imprest surrender no. <b>' + Imprestheaders."No." + '</b> has been generated from memo no. <b>' + ImprestVoucherLines."Imprest Memo No." +
                                //    '</b><BR/> Kindly on return from your trip to:<b>' + Imprestheaders."Payment Narration" + ' </b>' + 'account for it using this document no' + ' ' + Imprestheaders."No." + ' ' + '<BR/>fill in the actual spent and send it for approval.<BR><BR>', true);
                                //SMTP.AddCC(Email2);
                                //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                                //  //SMTP.Send();
                            end;
                            // UNTIL SafariMembers.NEXT=0;
                        end;
                    end;
                until ImprestVoucherLines.Next = 0;
            end;

            ImprestVoucherLines1.Reset;
            ImprestVoucherLines1.SetRange(No, VoucherNo);
            if ImprestVoucherLines1.FindSet then begin
                repeat
                    //modify the voucher lines
                    Memoheaders.Reset;
                    Memoheaders.SetRange("No.", ImprestVoucherLines1."Imprest Memo No.");
                    Memoheaders.SetRange(Posted, false);
                    if Memoheaders.FindSet then begin
                        Memoheaders."Imprest Created" := true;
                        Memoheaders."Date converted" := Today;
                        Memoheaders."Time converted" := Time;
                        Memoheaders."Converted By" := UserId;
                        Memoheaders.Posted := true;
                        Memoheaders.Modify;
                    end;
                until ImprestVoucherLines1.Next = 0;
            end;
            //Window.CLOSE;
            Message('Successfully');
        end;
    end;

    procedure ReverseWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        ImprestMemo: Record "Imprest Memo";
        Surrenders: Record Payments;
        ReversalAmt: Decimal;
    begin
        if Dialog.Confirm('Are you sure you want to reverse the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin
            if Warrant.Posted <> true then
                Error('The Warrant Voucher %1,has not been posted!', Warrant."No.");
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine.DeleteAll;

            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            ImprestVoucherLines.SetRange(Reverse, true);
            if ImprestVoucherLines.FindSet then begin
                repeat
                    ReversalAmt := ImprestVoucherLines.Amount + ReversalAmt;
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := GenJnLine."account type"::Employee;
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Imprest Memo No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := Format('Reversal- ' + Warrant."Cheque No", 50);
                    GenJnLine.Amount := -ImprestVoucherLines.Amount;
                    GenJnLine."Reversing Entry" := true;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    //mark the reversed voucher surrenders reversed
                    Surrenders.Reset;
                    Surrenders.SetRange("Reference No.", Warrant."No.");
                    Surrenders.SetRange(Status, Surrenders.Status::Open);
                    Surrenders.SetRange("Payment Type", Surrenders."payment type"::Surrender);
                    Surrenders.SetRange("Account No.", ImprestVoucherLines."Account No.");
                    if Surrenders.FindFirst then begin
                        Surrenders.Reversed := true;
                        Surrenders.Status := Surrenders.Status::Released;
                        Surrenders.Posted := true;
                        Surrenders."Reversed By" := UserId;
                        Surrenders."Reversal Date" := Today;
                        Surrenders.Modify(true);

                    end;
                until ImprestVoucherLines.Next = 0;
            end;
            //header

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Imprest Memo No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Warrant."Paying Bank Account";
            GenJnLine.Description := Format('Reversal-' + Format(Warrant."Cheque No"), 50);
            GenJnLine.Amount := ReversalAmt;
            GenJnLine."Reversing Entry" := true;
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;


            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            //       ImprestMemo.RESET;
            //       ImprestMemo.SETRANGE("No.",Warrant."Imprest Memo No");
            //       IF ImprestMemo.FINDSET THEN BEGIN
            //         ImprestMemo.Posted:=FALSE;
            //         ImprestMemo.MODIFY;
            //         MESSAGE('Dear %1,Navigate to approved Imprest Memos and create a new voucher from'+Warrant."Imprest Memo No",USERID);
            //      END;


            //       Warrant.Reversed:=TRUE;
            //       Warrant."Reversed By":=USERID;
            //       Warrant."Reversal Date":=TODAY;
            //       Warrant.MODIFY(TRUE);
            Message('The entries have been successfully reversed!');

        end
    end;


    procedure PostAIE(AIE: Record Payments)
    var
        AIEHeader: Record Payments;
        AIELines: Record "PV Lines";
        Sclaimlines: Record "PV Lines";
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        //get the no. series
        CashMgt.Reset;
        if CashMgt.Find('-') then begin
            NoSeries := CashMgt."Staff Claim Nos.";
        end;

        AIEHeader.Init;
        AIEHeader."No." := NoSeriesMgt.GetNextNo(NoSeries, AIEHeader.Date, true);
        AIEHeader.Project := AIE.Project;
        AIEHeader."Project Description" := AIE."Project Description";
        AIEHeader.Date := Today;
        AIEHeader."Created By" := UserId;
        AIEHeader.Payee := AIE.Payee;
        AIEHeader."Account Type" := AIE."account type"::Employee;
        AIEHeader."Account No." := AIE."Account No.";
        AIEHeader.Validate("Account No.");
        AIEHeader."Payment Type" := AIEHeader."payment type"::"Staff Claim";
        AIEHeader."On behalf of" := AIE."Account Name";
        AIEHeader."Payment Narration" := AIE."Payment Narration";
        AIEHeader."Shortcut Dimension 1 Code" := AIE."Shortcut Dimension 1 Code";
        AIEHeader."Shortcut Dimension 2 Code" := AIE."Shortcut Dimension 2 Code";
        AIEHeader."Shortcut Dimension 3 Code" := AIE."Shortcut Dimension 3 Code";
        AIEHeader."Created By" := UserId;
        AIEHeader.Insert;

        Sclaimlines.Reset;
        Sclaimlines.SetRange(Sclaimlines.No, AIE."No.");
        if Sclaimlines.FindSet then begin
            repeat
                AIELines.Init;
                AIELines.No := AIEHeader."No.";
                AIELines."Line No" := Sclaimlines."Line No";
                AIELines.Type := Sclaimlines.Type;
                AIELines."Vote Item" := Sclaimlines.Type;
                //AIELines.VALIDATE("Vote Item");
                AIELines.Description := CopyStr(AIE."Payment Narration", 1, 150);
                AIELines."Account Type" := Sclaimlines."Account Type";
                AIELines."Account No" := Sclaimlines."Account No";
                AIELines."Account Name" := Sclaimlines."Account Name";
                AIELines."Applies to Doc. No" := Sclaimlines.No;
                AIELines.Amount := Sclaimlines.Amount;
                AIELines."Net Amount" := Sclaimlines.Amount;
                AIELines.Insert;
            until Sclaimlines.Next = 0;
        end;
        AIE."Payment processed" := true;

        AIE.Modify;

        Message('Staff Claim for  %1 has been created, Kindly send it for approval', AIE."No.");
    end;


    procedure PostPaymentSchedule(Schedule: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        Resource: Record Resource;
        EmployeePostingGroupX: Record "Employee Posting GroupX";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
    begin
        if Dialog.Confirm('Are you sure you want to post the Payment Schedule No. ' + Schedule."No." + ' ?', true) then begin
            if Schedule.Status <> Schedule.Status::Released then
                Error('The Payment Schedule No %1 has not been fully approved', Schedule."No.");
            if Schedule.Posted then
                Error('Payment Schedule %1 has been posted', Schedule."No.");
            CMSetup.Get();
            CMSetup.TestField("PS Journal Template");
            CMSetup.TestField("PS Journal Batch Name");
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PS Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PS Journal Batch Name");
            GenJnLine.DeleteAll;

            LineNo := LineNo + 10000;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PS Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PS Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
            GenJnLine.Validate("Account Type");
            if EmployeePostingGroupX.Get(Schedule."Posting Group Code") then
                GenJnLine."Account No." := EmployeePostingGroupX."Account No.";
            GenJnLine.Validate(GenJnLine."Account No.");
            GenJnLine."Currency Code" := Schedule."Currency Code";
            GenJnLine.Validate(GenJnLine."Currency Code");
            if Schedule."Posting Date" = 0D then
                Error('You must specify the PS date');
            GenJnLine."Posting Date" := Schedule."Posting Date";
            GenJnLine."Document No." := Schedule."No.";
            GenJnLine."External Document No." := Schedule."No.";
            //Ruth
            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Bal. Account No." := EmployeePostingGroupX."Expense Account";
            GenJnLine.Validate("Bal. Account No.");
            //GenJnLine.Description:=PV."Payment Narration";
            GenJnLine.Description := CopyStr((Schedule."Payment Narration"), 1, 150);
            Schedule.CalcFields("Resources Total Amount");
            GenJnLine.Amount := -Schedule."Resources Total Amount";
            GenJnLine."Amount (LCY)" := -Schedule."Resources Total Amount";
            if GenJnLine.Amount <> 0 then GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            VendorLedgerEntry.Reset;
            VendorLedgerEntry.SetRange("Document No.", Schedule."No.");
            if VendorLedgerEntry.FindSet then begin
                Schedule.Posted := true;
                Schedule."Posted By" := UserId;
                Schedule."Posted Date" := Today;
                Schedule."Time Posted" := Time;
                Schedule.Modify;
                Message('The payment schedule %1,has been posted succesfully', Schedule."No.");
            end;
        end;
    end;

    procedure PostCarloan(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
        TXT001: label 'The car loan has to be fully approved';
        TXT002: label 'Are you sure you want to post the loan request';
        TXT003: label 'The approved car loan amount cannot be zero';
        EmployeePGroups: Record "Employee PGroups1";
        TXT004: label 'Complete the setup for the deduction on Employee PGroups';
        TXT005: label 'The car loan %1 was succesfully posted and Payment Voucher created';
        AssignmentMatrixX: Record "Assignment Matrix-X";
    begin
        if Confirm(TXT002, false, Sclaims."No.") = true then begin
            Sclaims.TestField("Posting Date");
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(TXT001, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.TestField(Sclaims.Purpose);
            if Sclaims."Total Loan Amount" = 0 then
                Error(TXT003);

            CMSetup.Get();
            CMSetup.TestField(CMSetup."Car Loan Journal Template");
            CMSetup.TestField(CMSetup."Car Loan Journal Batch Name");
            CMSetup.TestField("Car Loan Temp Acc");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Car Loan Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Car Loan Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Car Loan Journal Template";
            Batch.Name := CMSetup."Car Loan Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;

            //create 2 lines
            GenJnlLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Car Loan Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Car Loan Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."Account Type" := GenJnlLine."account type"::Vendor;
            EmployeePGroups.Reset;
            EmployeePGroups.SetRange(Code, Sclaims."Payroll Deduction Code");
            if EmployeePGroups.FindFirst then begin
                GenJnLine."Account No." := EmployeePGroups."G/L Account";
                GenJnLine.Validate("Account No.");
            end else
                Error(TXT004);

            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Car Loan:  ' + Sclaims."Account Name";
            GenJnLine.Amount := Sclaims."Salary Advance";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
            GenJnLine."Bal. Account No." := CMSetup."Car Loan Temp Acc";
            GenJnLine.Validate(Amount);
            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //balancing line
            LineNo := LineNo + 1000;

            //create 2 lines
            GenJnlLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Car Loan Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Car Loan Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."Account Type" := GenJnlLine."account type"::Vendor;
            GenJnLine."Account No." := Sclaims."Loan Vendor";
            GenJnLine.Validate("Account No.");
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Car Loan:  ' + Sclaims."Account Name";
            GenJnLine.Amount := -Sclaims."Salary Advance";
            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::"G/L Account";
            GenJnLine."Bal. Account No." := CMSetup."Car Loan Temp Acc";
            GenJnLine.Validate(Amount);
            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;
            //create a deduction for the employee

            AssignmentMatrixX.Init;
            AssignmentMatrixX."Employee No" := Sclaims."Account No.";
            AssignmentMatrixX.Type := AssignmentMatrixX.Type::Deduction;
            AssignmentMatrixX.Code := Sclaims."Payroll Deduction Code";
            AssignmentMatrixX."Payroll Period" := Sclaims."Recovery Month";
            AssignmentMatrixX.Amount := -Sclaims."Monthly Installment";
            AssignmentMatrixX."Opening Balance" := Sclaims."Total Loan Amount";
            AssignmentMatrixX."Closing Balance" := Sclaims."Total Loan Amount" - Sclaims."Monthly Installment";
            AssignmentMatrixX.Validate(Code);
            AssignmentMatrixX.Insert(true);
            CreateCarLoanPaymentVoucher(Sclaims);
            Message(TXT005, Sclaims."No.");
        end;

        //end of staff claim post
    end;

    local procedure CreateCarLoanPaymentVoucher(AdvanceNo: Record Payments)
    var
        Payments: Record Payments;
        PVLines: Record "PV Lines";
        TEXT001: label 'The payment document for the loan request is already created,the No. is :- %1';
        PVNo: Code[30];
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Payments.Reset;
        Payments.SetRange("Applies- To Doc No.", AdvanceNo."No.");
        if not Payments.FindSet then begin
            Payments.Init;
            Payments."No." := '';
            PVNo := '';
            // FileNo:='';
            CashMgt.Get();
            CashMgt.TestField("PV Nos");
            if Payments."No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Nos", Payments."No. Series", 0D, PVNo, Payments."No. Series");
            Payments."No." := PVNo;
            Payments."Payment Type" := Payments."payment type"::"Payment Voucher";
            Payments."Document Type" := Payments."document type"::"Payment Voucher";
            Payments."Payment Narration" := AdvanceNo.Purpose;
            Payments."Shortcut Dimension 1 Code" := AdvanceNo."Shortcut Dimension 1 Code";
            Payments."Shortcut Dimension 2 Code" := AdvanceNo."Shortcut Dimension 2 Code";
            Payments."Shortcut Dimension 3 Code" := AdvanceNo."Shortcut Dimension 3 Code";
            Payments."Applies- To Doc No." := AdvanceNo."No.";
            Payments.Date := AdvanceNo.Date;
            Payments.Insert;

            PVLines.Init;
            PVLines.No := Payments."No.";
            PVLines."Account Type" := PVLines."account type"::Vendor;
            PVLines."Account No" := AdvanceNo."Loan Vendor";
            PVLines.Validate("Account No");
            PVLines.Amount := AdvanceNo."Salary Advance";
            PVLines.Insert;
            Page.Run(57001, AdvanceNo, Payments."No.");
        end else
            Error(TEXT001, Payments."No.");
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterPostSalaryAdvance(Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterPostPymentVoucher(Payments: Record Payments)
    begin
    end;

    procedure CreateStaffClaim(Surrender: Record Payments)
    var
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "PV Lines";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        SurrenderNo: Code[30];
        Imprestlines1: Record "Imprest Lines";
    begin
        //window to show progress
        Window.Open('Creating staff claim for Employee:#######1', Surrender."Account Name");
        Window.Update(1, Surrender."Account Name");
        CashMgt.Get;
        //get imprest surrender

        NoSeries := CashMgt."Staff Claim Nos.";
        Email2 := CashMgt."Imprest Email";

        //header
        //create header
        LineNo := 1000;
        Imprestheaders.Init;
        Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
        Imprestheaders.Date := Today;
        Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
        Imprestheaders."Account No." := Surrender."Account No.";
        Imprestheaders.Validate("Account No.");
        Imprestheaders."Account Name" := Surrender."Account Name";
        Imprestheaders."Payment Type" := Imprestheaders."payment type"::"Staff Claim";
        Imprestheaders.Payee := Surrender.Payee;
        Imprestheaders.Job := Surrender.Job;
        Imprestheaders."Job Task No" := Surrender."Job Task No";
        Imprestheaders."Job Task No." := Surrender."Job Task No.";
        Imprestheaders."Currency Code" := Surrender."Currency Code";
        Imprestheaders."Currency Factor" := Surrender."Currency Factor";
        Imprestheaders."Created By" := Surrender."Created By";
        //Imprestheaders."Reference No.":="No.";
        EMp.Reset;
        EMp.SetRange("No.", Imprestheaders."Account No.");
        //sendder
        CMSetup.Get;
        Email2 := CMSetup."Imprest Email";
        Email := EMp."Company E-Mail";
        Imprestheaders.Status := Imprestheaders.Status::Released;
        Imprestheaders."Travel Date" := Surrender."Travel Date";
        Imprestheaders."Payment Narration" := Surrender."Payment Narration";
        Imprestheaders.Validate(Imprestheaders."Travel Date");
        Imprestheaders."Reference No." := Surrender."Reference No.";
        Imprestheaders."On behalf of" := Surrender."On behalf of";
        Imprestheaders."Shortcut Dimension 1 Code" := Surrender."Shortcut Dimension 1 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
        Imprestheaders."Shortcut Dimension 2 Code" := Surrender."Shortcut Dimension 2 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
        Imprestheaders."Shortcut Dimension 3 Code" := Surrender."Shortcut Dimension 3 Code";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 3 Code");
        Imprestheaders."Shortcut Dimension 4 Code" := Surrender."Shortcut Dimension 4 Code";
        Imprestheaders."Dimension Set ID" := Surrender."Dimension Set ID";
        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 4 Code");
        Imprestheaders.Insert;
        //get surrender lines greater than 0
        Imprestlines1.Reset;
        Imprestlines1.SetRange(No, Surrender."No.");
        if Imprestlines1.FindSet then begin
            repeat
                if Imprestlines1."Remaining Amount" < 0 then begin
                    Imprestlines."Line No" := Imprestlines1."Line No";
                    Imprestlines.No := Imprestheaders."No.";
                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                    Imprestlines."Account No" := Imprestlines1."Account No.";
                    Imprestlines.Validate(Imprestlines."Account No");
                    Imprestlines.Description := Imprestlines1."Account Name";
                    Imprestlines.Amount := Imprestlines1."Remaining Amount" * -1;
                    Imprestlines.Validate(Amount);
                    Imprestlines."Currency Code" := Imprestlines1."Currency Code";
                    Imprestlines.Insert;
                end;
                Imprestlines1."Remaining Amount" := 0;
                Imprestlines1."Remaining Amount LCY" := 0;
                Imprestlines1.Modify(true);
            until Imprestlines1.Next = 0;

        end;
        //send email to participants
        Imprestheaders.CalcFields("Total Amount LCY");
        CashMgt.Get;
        if CashMgt."Send Email Notification" = true then begin
            //SMTP.Create(COMPANYNAME + 'Staff Claim Processing', Email2,
            // Email, 'Staff Claim ' + 'No: ' + Imprestheaders."No.",
            // 'Dear ' + Surrender.Payee + ',<BR><BR>' +
            // 'Your imprest surrender no. <b>' + ' ' + Surrender."No." + '</b> has a staff claim undergoing processing no:<b>' + ' ' + Imprestheaders."No." +
            // '</b><BR><BR>Total refund amount is <b>' + Format(Imprestheaders."Total Amount LCY") + '</b>.' +
            // '</b><BR> Kindly incase of any queries,reach out to the Finance department for correction.<BR><BR>', true);
            //SMTP.AddCC(Email2);
            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
            //SMTP.Send();
        end;
        Page.Run(57109, Imprestheaders);
        Window.Close;
    end;

    procedure CreateSpecialImprestSurrender(Payments: Record Payments)
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        SurrenderNo: Code[30];
        ImprestVoucherLines1: Record "Imprest Voucher Lines";
        PCash: Record Payments;
        PVLines: Record "PV Lines";
        PVlines1: Record "PV Lines";
    begin
        Payments.Reset;
        Payments.SetRange("No.", Payments."No.");
        if Payments.FindSet then begin
            PCash.Init;
            PCash.TransferFields(Payments);
            PCash.Status := PCash.Status::Open;
            PCash."Payment Type" := PCash."payment type"::"Petty Cash Surrender";
            if PCash.Insert(true) then begin
                PVLines.Reset;
                PVLines.SetRange(No, Payments."No.");
                if PVLines.FindSet then begin
                    repeat
                        PVlines1.Init;
                        PVlines1.TransferFields(PVLines);
                        PVlines1.No := PCash."No.";
                        PVlines1.Insert;
                    until PVLines.Next = 0;
                end;
            end;
        end;
    end;

    // procedure SuggestReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    // var
    //     ReconciliationItems: Record "Reconciliation Items";
    //     BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
    //     BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
    //     LineNo: Integer;
    //     TXT001: label 'Entries populated succesfully';
    //     BankAccReconciliationLine2: Record "Bank Acc. Reconciliation Line";
    // begin
    //     BankAccReconciliationLine1.Reset;
    //     BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     if BankAccReconciliationLine1.FindLast then begin
    //         LineNo := BankAccReconciliationLine1."Statement Line No.";
    //     end;
    //     ReconciliationItems.Reset;
    //     ReconciliationItems.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     ReconciliationItems.SetRange(Reconciled, false);
    //     if ReconciliationItems.FindSet then begin
    //         repeat
    //             //ensure suggestion twice cannot happen
    //             BankAccReconciliationLine2.Reset;
    //             BankAccReconciliationLine2.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //             BankAccReconciliationLine2.SetRange("Statement No.", BankAccReconciliation."Statement No.");
    //             BankAccReconciliationLine2.SetRange("Reconciliation ID", ReconciliationItems."Entry No.");
    //             if not BankAccReconciliationLine2.FindFirst then begin
    //                 //get statement no.
    //                 BankAccReconciliationLine."Statement No." := BankAccReconciliation."Statement No.";
    //                 BankAccReconciliationLine."Bank Account No." := BankAccReconciliation."Bank Account No.";
    //                 BankAccReconciliationLine."Statement Type" := BankAccReconciliationLine."statement type"::"Bank Reconciliation";
    //                 BankAccReconciliationLine."Statement Line No." := LineNo + 1;
    //                 BankAccReconciliationLine."Statement Amount" := ReconciliationItems."Statement Amount";
    //                 BankAccReconciliationLine."Document No." := ReconciliationItems."Document No.";
    //                 BankAccReconciliationLine.Description := ReconciliationItems.Description;
    //                 BankAccReconciliationLine."Transaction Date" := ReconciliationItems."Transaction Date";
    //                 BankAccReconciliationLine."Reconciliation ID" := ReconciliationItems."Entry No.";
    //                 BankAccReconciliationLine.Insert(true);
    //                 LineNo += 1;
    //             end;
    //         until ReconciliationItems.Next = 0;
    //         Message(TXT001);
    //     end
    // end;

    // procedure CloseReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    // var
    //     ReconciliationItems: Record "Reconciliation Items";
    //     BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
    //     ReconciliationItems1: Record "Reconciliation Items";
    //     LineNo: Integer;
    //     TXT001: label 'Entries populated succesfully';
    //     BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
    //     ReconciliationItemsEntry: Record "Reconciliation Items Entry";
    // begin
    //     BankAccReconciliationLine.Reset;
    //     BankAccReconciliationLine.SetRange("Statement No.", BankAccReconciliation."Statement No.");
    //     BankAccReconciliationLine.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     if BankAccReconciliationLine.FindSet then begin
    //         if ((BankAccReconciliationLine."Reconciliation ID" <> 0) and (BankAccReconciliationLine."Applied Amount" <> 0)) then begin
    //             repeat

    //                 ReconciliationItems1.Reset;
    //                 ReconciliationItems1.SetRange("Entry No.", BankAccReconciliationLine."Reconciliation ID");
    //                 if ReconciliationItems1.FindFirst then begin
    //                     ReconciliationItems1.Reconciled := true;
    //                     ReconciliationItems1."Reconciled By" := UserId;
    //                     ReconciliationItems1."Reconciled On" := CurrentDatetime;
    //                     ReconciliationItems1.Modify(true);
    //                 end;
    //                 //close ledger too

    //                 ReconciliationItemsEntry.Reset;
    //                 ReconciliationItemsEntry.SetRange("initial Entry No.", BankAccReconciliationLine."Reconciliation ID");
    //                 ReconciliationItemsEntry.SetRange("Statement Date", BankAccReconciliation."Statement Date");
    //                 if ReconciliationItemsEntry.FindFirst then begin
    //                     ReconciliationItemsEntry.Reconciled := true;
    //                     ReconciliationItemsEntry."Reconciled By" := UserId;
    //                     ReconciliationItemsEntry."Reconciled On" := CurrentDatetime;
    //                     ReconciliationItemsEntry.Modify(true);
    //                 end;
    //             until BankAccReconciliationLine.Next = 0;
    //         end
    //     end;


    // end;


    // procedure PopulateReconcilingItems(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    // var
    //     ReconciliationItems: Record "Reconciliation Items";
    //     BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
    //     ReconciliationItems1: Record "Reconciliation Items";
    //     LineNo: Integer;
    //     TXT001: label 'Entries populated succesfully';
    //     BankAccReconciliationLine1: Record "Bank Acc. Reconciliation Line";
    //     ReconciliationItems2: Record "Reconciliation Items";
    //     ReconciliationItemsEntry: Record "Reconciliation Items Entry";
    //     ReconciliationEntry2: Record "Reconciliation Items Entry";
    //     LineNo1: Integer;
    // begin
    //     ReconciliationItems1.Reset;
    //     ReconciliationItems1.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     if ReconciliationItems1.FindLast then begin
    //         LineNo := ReconciliationItems1."Entry No.";
    //     end;

    //     ReconciliationEntry2.Reset;
    //     ReconciliationEntry2.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     if ReconciliationEntry2.FindLast then begin
    //         LineNo1 := ReconciliationEntry2."Entry No.";
    //     end;

    //     BankAccReconciliationLine.Reset;
    //     BankAccReconciliationLine.SetRange("Statement No.", BankAccReconciliation."Statement No.");
    //     BankAccReconciliationLine.SetRange("Bank Account No.", BankAccReconciliation."Bank Account No.");
    //     if BankAccReconciliationLine.FindSet then begin
    //         repeat
    //             if ((BankAccReconciliationLine."Reconciliation ID" <> 0) and (BankAccReconciliationLine."Applied Amount" = 0)) then begin
    //                 //introduce checker if the entry no. already exists.
    //                 ReconciliationItems2.Reset;
    //                 ReconciliationItems2.SetRange("Entry No.", BankAccReconciliationLine."Reconciliation ID");
    //                 if ReconciliationItems2.FindFirst then begin
    //                     //insert in entry table if exists
    //                     ReconciliationItemsEntry."Entry No." := LineNo1 + 1;
    //                     ReconciliationItemsEntry."Bank Account No." := BankAccReconciliation."Bank Account No.";
    //                     ReconciliationItemsEntry."Document No." := BankAccReconciliationLine."Document No.";
    //                     ReconciliationItemsEntry."Transaction Date" := BankAccReconciliationLine."Transaction Date";
    //                     ReconciliationItemsEntry.Description := BankAccReconciliationLine.Description;
    //                     ReconciliationItemsEntry."Statement Amount" := BankAccReconciliationLine."Statement Amount";
    //                     ReconciliationItemsEntry.Reconciled := false;
    //                     ReconciliationItemsEntry."Created By" := UserId;
    //                     ReconciliationItemsEntry."Created On" := CurrentDatetime;
    //                     ReconciliationItemsEntry."initial Entry No." := BankAccReconciliationLine."Reconciliation ID";
    //                     ReconciliationItemsEntry."Statement Date" := BankAccReconciliation."Statement Date";
    //                     ReconciliationItemsEntry.Insert(true);
    //                     LineNo1 += 1;
    //                     BankAccReconciliationLine1.Reset;
    //                     BankAccReconciliationLine1.SetRange("Statement No.", BankAccReconciliationLine."Statement No.");
    //                     BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliationLine."Bank Account No.");
    //                     BankAccReconciliationLine1.SetRange("Statement Line No.", BankAccReconciliationLine."Statement Line No.");
    //                     if BankAccReconciliationLine1.FindFirst then begin
    //                         BankAccReconciliationLine1.Delete;

    //                     end;
    //                 end;

    //                 if ((BankAccReconciliationLine."Reconciliation ID" = 0) and (BankAccReconciliationLine."Applied Amount" = 0)) then begin
    //                     ReconciliationItems."Entry No." := LineNo + 1;
    //                     ReconciliationItems."Bank Account No." := BankAccReconciliation."Bank Account No.";
    //                     ReconciliationItems."Document No." := BankAccReconciliationLine."Document No.";
    //                     ReconciliationItems."Transaction Date" := BankAccReconciliationLine."Transaction Date";
    //                     ReconciliationItems.Description := BankAccReconciliationLine.Description;
    //                     ReconciliationItems."Statement Amount" := BankAccReconciliationLine."Statement Amount";
    //                     ReconciliationItems.Reconciled := false;
    //                     ReconciliationItems."Created By" := UserId;
    //                     ReconciliationItems."Created On" := CurrentDatetime;
    //                     ReconciliationItems.Insert(true);
    //                     LineNo += 1;
    //                     BankAccReconciliationLine1.Reset;
    //                     BankAccReconciliationLine1.SetRange("Statement No.", BankAccReconciliationLine."Statement No.");
    //                     BankAccReconciliationLine1.SetRange("Bank Account No.", BankAccReconciliationLine."Bank Account No.");
    //                     BankAccReconciliationLine1.SetRange("Statement Line No.", BankAccReconciliationLine."Statement Line No.");
    //                     if BankAccReconciliationLine1.FindFirst then begin
    //                         BankAccReconciliationLine1.Delete;

    //                     end;
    //                 end;
    //             end;

    //         until BankAccReconciliationLine.Next = 0;
    //         Message(TXT001);
    //     end;
    // end;

    procedure ValidatePaymentVoucher(PaymentVoucher: Record Payments)
    var
        PaymentLines: Record "PV Lines";
        PayRcptTypes: Record "Receipts and Payment Types1";
        Details: array[3] of Text;
        Vendor: Record Vendor;
        VendorBankAcc: Record "Vendor Bank Account";
        BankAcc: Record "Bank Account";
    begin
        //Validate Tax Accounts
        PaymentVoucher.CalcFields("Total Witholding Tax Amount", "Total Retention Amount", "VAT Wthheld six %");

        //Check PV Tax 
        if (PaymentVoucher."VAT Wthheld six %" + PaymentVoucher."Total Witholding Tax Amount") <> 0 then begin
            PayRcptTypes.GetReceiptPaymenTypeDetails(Details, 0, PayRcptTypes.Type::Payment);
            if Details[1] = '' then
                Error('Please setup Tax Codes under Receipts and Payments');

            if Details[2] = '' then
                Error('Please set up Account No. for %1', Details[2]);

            //Test vendor bank account
            if Vendor.Get(Details[2]) then begin
                Vendor.TestField("Preferred Bank Account Code");
                if VendorBankAcc.Get(Vendor."No.", Vendor."Preferred Bank Account Code") then begin
                    VendorBankAcc.TestField("Bank Code");
                    VendorBankAcc.TestField("Bank Branch No.");
                    VendorBankAcc.TestField("Bank Account No.");
                    VendorBankAcc.TestField("Bank Account Name");
                end;
            end;
        end;

        //Check Retention Amounts
        if PaymentVoucher."Total Retention Amount" <> 0 then begin
            PayRcptTypes.GetReceiptPaymenTypeDetails(Details, 1, PayRcptTypes.Type::Payment);
            if Details[1] = '' then
                Error('Please setup retention code under Receipts and Payments');

            //Validate Deposit Banks
            BankAcc.GetBankCode(BankAcc.Type::Deposit, PaymentVoucher."Shortcut Dimension 1 Code", PaymentVoucher."Shortcut Dimension 2 Code");
        end;
        //Check Bank Accounts
        PaymentLines.Reset();
        PaymentLines.SetRange(No, PaymentVoucher."No.");
        PaymentLines.SetFilter("Net Amount", '<>%1', 0);
        if PaymentLines.FindSet() then begin
            repeat
                PaymentLines.TestField("Payee Bank Code");
                PaymentLines.TestField("Payee Bank Branch Code");
                PaymentLines.TestField("Payee Bank Account No.");
                PaymentLines.TestField("Payee Bank Acc Name");
            until PaymentLines.Next() = 0;
        end;
    end;

    //Try and Post Each Pv before Posting 
    procedure CreateTaxPV(var PaymentVoucher: Record Payments) PVNo: Code[20]
    var
        PaymentLines, PVLines : Record "PV Lines";
        LineNo: Integer;
        PV: Record Payments;
        PV2: Record Payments;

        PayRcptType: Record "Receipts and Payment Types1";
        KRAVendor: Record Vendor;
        Details: array[3] of Text;
        DefaultDimensions, CurrDimensions : array[8] of Code[20];
        DefaultDimensionRec: Record "Default Dimension Custom";
        CashMgt: Record "Cash Management Setup";
        docNumber: code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TarrifCodes: Record "Tariff Codes1";


    begin
        //Create PV
        //separate by Total Witholding Tax Amount and VAT Wthheld six %
        PVNo := '';
        PaymentVoucher.CalcFields("Total Witholding Tax Amount", "VAT Wthheld six %");
        if ((PaymentVoucher."Total Witholding Tax Amount" = 0) and (PaymentVoucher."VAT Wthheld six %" = 0)) then
            exit;
        PayRcptType.GetReceiptPaymenTypeDetails(Details, 0, PayRcptType.Type::Payment);
        if not KRAVendor.Get(Details[2]) then
            Error('There is no KRA vendor setup in the system.Please check receipts and payments setup');


        if (PaymentVoucher."Total Witholding Tax Amount" <> 0) then begin


            PV.Reset();
            PV.SetRange("PV Type", PV."PV Type"::Tax);
            PV.SetRange("Source PV No.", PaymentVoucher."No.");
            PV.SetRange(taxType, PV.taxType::"Total Withholding tax");
            PV.SetRange("Archive Document", false);

            if PV.FindFirst() then
                if PV.IsPVPosted(PV."No.") then begin
                    PaymentVoucher.Posted := true;
                    PaymentVoucher.Validate(Posted);
                    PaymentVoucher.Modify();
                    exit;
                end
                else
                    PVNo := PV."No.";
            PaymentLines.Reset();
            PaymentLines.SetRange(No, PaymentVoucher."No.");
            PaymentLines.SetFilter("W/Tax Amount", '<>%1', 0);
            PaymentLines.FindFirst();
            TarrifCodes.Get(PaymentLines."W/Tax Code");
            // TarrifCodes.TestField("Tax Obligation");
            if PVNo = '' then begin
                PV.Init();
                PV."Payment Type" := PV."Payment Type"::"Payment Voucher";
                PV."PV Type" := PV."PV Type"::Tax;
                PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
                PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
                PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
                PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
                PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
                PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                PV.Date := PaymentVoucher.Date;
                pv."Posting Date" := PaymentVoucher."Posting Date";
                PV."Pay Mode" := PaymentVoucher."Pay Mode";
                PV."Posting Date" := Today;
                PV.Payee := KRAVendor.Name;
                Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
                PV."Paying Bank Account" := PaymentVoucher."Paying Bank No.";
                PV.Validate("Paying Bank Account");
                PV."Bank Name" := PaymentVoucher."Bank Name";
                PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
                PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
                PV."Workplan Code" := PaymentVoucher."Workplan Code";
                PV."Activity Code" := PaymentVoucher."Activity Code";
                PV."Source PV No." := PaymentVoucher."No.";
                PV.Status := PV.Status::Released;
                PV.taxType := PV.taxType::"Total Withholding tax";
                PV."Tax Obligation" := TarrifCodes."Tax Obligation";
                PV."Total Witholding Tax Amount" := PaymentVoucher."Total Witholding Tax Amount";
                if PV.Insert(true) then begin
                    if (PaymentVoucher.relatedTaxPv <> '') then
                        PaymentVoucher.relatedTaxPv := PaymentVoucher.relatedTaxPv + ',' + PV."No."
                    else
                        PaymentVoucher.relatedTaxPv := PV."No.";

                    PaymentVoucher.modify();
                end;
                PVNo := PV."No.";
            end else begin
                PV.Reset();
                PV.SetRange("No.", PVNo);
                PV.SetRange(taxType, PV.taxType::"Total Withholding tax");
                if PV.FindFirst() then begin
                    PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
                    PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
                    PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
                    PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
                    PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
                    PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                    PV.Date := PaymentVoucher.Date;
                    pv."Posting Date" := PaymentVoucher."Posting Date";
                    PV."Pay Mode" := PaymentVoucher."Pay Mode";
                    PV."Posting Date" := Today;
                    PV.Payee := KRAVendor.Name;
                    Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
                    PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
                    PV.validate("Paying Bank Account");
                    PV."Bank Name" := PaymentVoucher."Bank Name";
                    PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
                    PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
                    PV."Workplan Code" := PaymentVoucher."Workplan Code";
                    PV."Activity Code" := PaymentVoucher."Activity Code";
                    PV."Source PV No." := PaymentVoucher."No.";
                    PV.taxType := PV.taxType::"Total Withholding tax";
                    PV."Tax Obligation" := TarrifCodes."Tax Obligation";
                    PV.Status := PV.Status::Released;
                    PV.Modify();
                end;
            end;

            //Clear Lines
            PVLines.Reset();
            PVLines.SetRange(No, PVNo);
            PVLines.DeleteAll();

            PaymentLines.Reset();
            PaymentLines.SetRange(No, PaymentVoucher."No.");
            if PaymentLines.FindSet() then begin
                repeat
                    LineNo += 10000;
                    PVLines.Init();
                    PVLines.No := PVNo;
                    PVLines."Line No" := LineNo;
                    PVLines."Shortcut Dimension 1 Code" := PaymentLines."Shortcut Dimension 1 Code";
                    PVLines."Shortcut Dimension 2 Code" := PaymentLines."Shortcut Dimension 2 Code";
                    PVLines."Dimension Set ID" := PaymentLines."Dimension Set ID";
                    PVLines.Type := Details[1];
                    PVLines.Validate(Type);
                    PVLines."Account No" := Details[2];
                    PVLines.Validate("Account No");
                    PVLines.Validate("Payee Bank Acc Name");
                    PVLines.Description := StrSubstNo('%1 Witholding Tax and Withheld VAT  Payment for PV %2 ', PaymentLines."Account Name", PaymentVoucher."No.");
                    PVLines.Amount := PaymentLines."W/Tax Amount";
                    PVLines.Validate(Amount);
                    if PVLines.Amount <> 0 then
                        PVLines.Insert();
                until PaymentLines.Next() = 0;
            end;


        end;
        if (PaymentVoucher."VAT Wthheld six %" <> 0) then begin
            PVNo := '';
            PV.Reset();
            PV.SetRange("PV Type", PV."PV Type"::Tax);
            PV.SetRange("Source PV No.", PaymentVoucher."No.");
            PV.SetRange(taxType, PV.taxType::"VAT Withheld");
            PV.SetRange("Archive Document", false);

            if PV.FindFirst() then
                if PV.IsPVPosted(PV."No.") then begin
                    PaymentVoucher.Posted := true;
                    PaymentVoucher.Validate(Posted);
                    PaymentVoucher.Modify();
                    exit;
                end
                else
                    PVNo := PV."No.";
            PaymentLines.Reset();
            PaymentLines.SetRange(No, PaymentVoucher."No.");
            PaymentLines.SetFilter("VAT Withheld Amount", '<>%1', 0);
            PaymentLines.FindFirst();
            TarrifCodes.Get(PaymentLines."VAT Withheld Code");
            // TarrifCodes.TestField("Tax Obligation");
            if PVNo = '' then begin
                CashMgt.get();
                docNumber := NoSeriesMgt.GetNextNo(CashMgt."PV Nos", 0D, true);
                PV.Init();
                PV."No." := docNumber;
                PV."Payment Type" := PV."Payment Type"::"Payment Voucher";
                PV."PV Type" := PV."PV Type"::Tax;
                PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
                PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
                PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
                PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
                PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
                PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                PV.Date := PaymentVoucher.Date;
                pv."Posting Date" := PaymentVoucher."Posting Date";
                PV."Pay Mode" := PaymentVoucher."Pay Mode";
                PV."Posting Date" := Today;
                PV.Payee := KRAVendor.Name;
                Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
                PV."Paying Bank Account" := PaymentVoucher."Paying Bank No.";
                PV.Validate("Paying Bank Account");
                PV."Bank Name" := PaymentVoucher."Bank Name";
                PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
                PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
                PV."Workplan Code" := PaymentVoucher."Workplan Code";
                PV."Activity Code" := PaymentVoucher."Activity Code";
                PV."Source PV No." := PaymentVoucher."No.";
                PV.taxType := PV.taxType::"VAT Withheld";
                PV."Tax Obligation" := TarrifCodes."Tax Obligation";
                PV.Status := PV.Status::Released;
                if NOT PV.INSERT(TRUE) then
                    error(GetLastErrorText());
                if (PaymentVoucher.relatedTaxPv <> '') then
                    PaymentVoucher.relatedTaxPv := PaymentVoucher.relatedTaxPv + ',' + PV."No."
                else
                    PaymentVoucher.relatedTaxPv := PV."No.";
                DefaultDimensionRec.GetDimensionCodes(DefaultDimensionRec."Document Type"::"Tax Payment Voucher", DefaultDimensions);
                PaymentVoucher.modify();
                PVNo := PV."No.";
            end else begin
                PV.Reset();
                PV.SetRange("No.", PVNo);
                PV.SetRange(taxType, PV.taxType::"VAT Withheld");
                if PV.FindFirst() then begin
                    PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
                    PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
                    PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
                    PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
                    PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
                    PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                    PV.Date := PaymentVoucher.Date;
                    pv."Posting Date" := PaymentVoucher."Posting Date";
                    PV."Pay Mode" := PaymentVoucher."Pay Mode";
                    PV."Posting Date" := Today;
                    PV.Payee := KRAVendor.Name;
                    Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
                    PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
                    PV.validate("Paying Bank Account");
                    PV."Bank Name" := PaymentVoucher."Bank Name";
                    PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
                    PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
                    PV."Workplan Code" := PaymentVoucher."Workplan Code";
                    PV."Activity Code" := PaymentVoucher."Activity Code";
                    PV."Source PV No." := PaymentVoucher."No.";
                    PV.taxType := PV.taxType::"VAT Withheld";
                    PV."Tax Obligation" := TarrifCodes."Tax Obligation";
                    PV.Status := PV.Status::Released;
                    PV.Modify();
                end;
            end;

            //Clear Lines
            PVLines.Reset();
            PVLines.SetRange(No, PVNo);
            PVLines.DeleteAll();

            PaymentLines.Reset();
            PaymentLines.SetRange(No, PaymentVoucher."No.");
            if PaymentLines.FindSet() then begin
                repeat
                    LineNo += 10000;
                    PVLines.Init();
                    PVLines.No := PVNo;
                    PVLines."Line No" := LineNo;
                    PVLines."Shortcut Dimension 1 Code" := PaymentLines."Shortcut Dimension 1 Code";
                    PVLines."Shortcut Dimension 2 Code" := PaymentLines."Shortcut Dimension 2 Code";
                    PVLines."Dimension Set ID" := PaymentLines."Dimension Set ID";
                    PVLines.Type := Details[1];
                    PVLines.Validate(Type);
                    PVLines."Account No" := Details[2];
                    PVLines.Validate("Account No");
                    PVLines.Validate("Payee Bank Acc Name");
                    PVLines.Description := StrSubstNo('Withheld VAT  Payment for PV %2 ', PaymentLines."Account Name", PaymentVoucher."No.");
                    PVLines.Amount := PaymentLines."VAT Withheld Amount";
                    PVLines.Validate(Amount);
                    if PVLines.Amount <> 0 then
                        PVLines.Insert();
                until PaymentLines.Next() = 0;
            end;


        end;











        // PV.Reset();
        // PV.SetRange("PV Type", PV."PV Type"::Tax);
        // PV.SetRange("Source PV No.", PaymentVoucher."No.");
        // if PV.FindFirst() then
        //     if PV.IsPVPosted(PV."No.") then begin
        //         PaymentVoucher.Posted := true;
        //         PaymentVoucher.Validate(Posted);
        //         PaymentVoucher.Modify();
        //         exit;
        //     end
        //     else
        //         PVNo := PV."No.";

        // if PVNo = '' then begin
        //     PV.Init();
        //     PV."Payment Type" := PV."Payment Type"::"Payment Voucher";
        //     PV."PV Type" := PV."PV Type"::Tax;
        //     PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
        //     PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
        //     PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
        //     PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
        //     PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
        //     PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
        //     PV.Date := PaymentVoucher.Date;
        //     pv."Posting Date" := PaymentVoucher."Posting Date";
        //     PV."Pay Mode" := PaymentVoucher."Pay Mode";
        //     PV."Posting Date" := Today;
        //     PV.Payee := KRAVendor.Name;
        //     Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
        //     PV."Paying Bank Account" := PaymentVoucher."Paying Bank No.";
        //     PV.Validate("Paying Bank Account");
        //     PV."Bank Name" := PaymentVoucher."Bank Name";
        //     PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
        //     PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
        //     PV."Workplan Code" := PaymentVoucher."Workplan Code";
        //     PV."Activity Code" := PaymentVoucher."Activity Code";
        //     PV."Source PV No." := PaymentVoucher."No.";
        //     PV.Status := PV.Status::Released;
        //     if PV.Insert(true) then begin
        //         PaymentVoucher.relatedTaxPv := PV."No.";
        //         PaymentVoucher.modify();
        //     end;
        //     PVNo := PV."No.";
        // end else begin
        //     PV.Reset();
        //     PV.SetRange("No.", PVNo);
        //     if PV.FindFirst() then begin
        //         PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
        //         PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
        //         PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
        //         PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
        //         PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
        //         PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
        //         PV.Date := PaymentVoucher.Date;
        //         pv."Posting Date" := PaymentVoucher."Posting Date";
        //         PV."Pay Mode" := PaymentVoucher."Pay Mode";
        //         PV."Posting Date" := Today;
        //         PV.Payee := KRAVendor.Name;
        //         Pv."Payment Narration" := StrSubstNo('PV %1 Tax Payment', PaymentVoucher."No.");
        //         PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
        //         PV.validate("Paying Bank Account");
        //         PV."Bank Name" := PaymentVoucher."Bank Name";
        //         PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
        //         PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
        //         PV."Workplan Code" := PaymentVoucher."Workplan Code";
        //         PV."Activity Code" := PaymentVoucher."Activity Code";
        //         PV."Source PV No." := PaymentVoucher."No.";
        //         PV.Status := PV.Status::Released;
        //         PV.Modify();
        //     end;
        // end;

        // //Clear Lines
        // PVLines.Reset();
        // PVLines.SetRange(No, PVNo);
        // PVLines.DeleteAll();

        // PaymentLines.Reset();
        // PaymentLines.SetRange(No, PaymentVoucher."No.");
        // if PaymentLines.FindSet() then begin
        //     repeat
        //         LineNo += 10000;
        //         PVLines.Init();
        //         PVLines.No := PVNo;
        //         PVLines."Line No" := LineNo;
        //         PVLines."Shortcut Dimension 1 Code" := PaymentLines."Shortcut Dimension 1 Code";
        //         PVLines."Shortcut Dimension 2 Code" := PaymentLines."Shortcut Dimension 2 Code";
        //         PVLines."Dimension Set ID" := PaymentLines."Dimension Set ID";
        //         PVLines.Type := Details[1];
        //         PVLines.Validate(Type);
        //         PVLines."Account No" := Details[2];
        //         PVLines.Validate("Account No");
        //         PVLines.Validate("Payee Bank Acc Name");
        //         if (PaymentLines."W/Tax Amount" <> 0) and (PaymentLines."VAT Withheld Amount" <> 0) then
        //             PVLines.Description := StrSubstNo('%1 Witholding Tax and Withheld VAT  Payment for PV %2 ', PaymentLines."Account Name", PaymentVoucher."No.")
        //         else
        //             if (PaymentLines."W/Tax Amount" <> 0) and (PaymentLines."VAT Withheld Amount" = 0) then
        //                 PVLines.Description := StrSubstNo('%1 Witholding Tax Payment for PV %2 ', PaymentLines."Account Name", PaymentVoucher."No.")
        //             else
        //                 if
        //           (PaymentLines."W/Tax Amount" = 0) and (PaymentLines."VAT Withheld Amount" <> 0) then
        //                     PVLines.Description := StrSubstNo('%1  Withheld VAT  Payment for PV %2 ', PaymentLines."Account Name", PaymentVoucher."No.");
        //         PVLines.Amount := PaymentLines."VAT Withheld Amount" + PaymentLines."W/Tax Amount";
        //         PVLines.Validate(Amount);
        //         if PVLines.Amount <> 0 then
        //             PVLines.Insert();
        //     until PaymentLines.Next() = 0;
        // end;


    end;













    //Create Retention  Movement PV
    procedure CreateRetentionMovementPV(var PaymentVoucher: Record Payments) PVNo: Code[20];
    var
        PV: Record Payments;
        PaymentLines, PVLines : Record "PV Lines";
        LineNo: Integer;
        Details: array[3] of Text;
        BankAcc: Record "Bank Account";
        PayRcptTypes: Record "Receipts and Payment Types1";
    begin
        PaymentVoucher.CalcFields("Total Retention Amount");
        if PaymentVoucher."Total Retention Amount" = 0 then
            exit;

        PV.Reset();
        PV.SetRange("PV Type", PV."PV Type"::Retention);
        PV.SetRange("Source PV No.", PaymentVoucher."No.");
        if PV.FindFirst() then
            if PV.IsPVPosted(PV."No.") then begin
                PaymentVoucher.Posted := true;
                PaymentVoucher.Validate(Posted);
                PaymentVoucher.Modify();
                exit;
            end
            else
                PVNo := PV."No.";

        BankAcc.get(BankAcc.GetBankCode(BankAcc.Type::Deposit, PaymentVoucher."Shortcut Dimension 1 Code", PaymentVoucher."Shortcut Dimension 2 Code"));
        PayRcptTypes.GetReceiptPaymenTypeDetails(Details, 2, PayRcptTypes.Type::Payment);

        if PVNo = '' then begin
            PV.Init();
            PV."Payment Type" := PV."Payment Type"::"Payment Voucher";
            PV."PV Type" := PV."PV Type"::Retention;
            PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
            PV.Validate("Paying Bank Account");
            PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
            PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
            PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
            PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
            PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
            PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
            PV.Date := PaymentVoucher.Date;
            pv."Posting Date" := Today;
            PV."Pay Mode" := PaymentVoucher."Pay Mode";
            PV."Posting Date" := Today;
            PV.Payee := BankAcc.Name;
            Pv."Payment Narration" := StrSubstNo('PV %1 Retention Amount Movement to Deposit Bank Acc for %2', PaymentVoucher."No.", PaymentVoucher.Payee);
            PV."Paying Bank Account" := PaymentVoucher."Paying Bank No.";
            PV."Bank Name" := PaymentVoucher."Bank Name";
            PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
            PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
            PV."Workplan Code" := PaymentVoucher."Workplan Code";
            PV."Activity Code" := PaymentVoucher."Activity Code";
            PV."Source PV No." := PaymentVoucher."No.";
            PV.Status := PV.Status::Released;
            PV.Insert(true);
            PVNo := PV."No.";
        end else begin
            PV.Reset();
            PV.SetRange("No.", PVNo);
            if PV.FindFirst() then begin
                PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
                PV.Validate("Paying Bank Account");
                PV."Shortcut Dimension 1 Code" := PaymentVoucher."Shortcut Dimension 1 Code";
                PV."Shortcut Dimension 2 Code" := PaymentVoucher."Shortcut Dimension 2 Code";
                PV."Shortcut Dimension 3 Code" := PaymentVoucher."Shortcut Dimension 3 Code";
                PV."Shortcut Dimension 4 Code" := PaymentVoucher."Shortcut Dimension 4 Code";
                PV."Shortcut Dimension 5 Code" := PaymentVoucher."Shortcut Dimension 5 Code";
                PV."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                PV.Date := PaymentVoucher.Date;
                pv."Posting Date" := PaymentVoucher."Posting Date";
                PV."Pay Mode" := PaymentVoucher."Pay Mode";
                PV."Posting Date" := Today;
                PV.Payee := BankAcc.Name;
                Pv."Payment Narration" := StrSubstNo('PV %1 Retention Amount Movement to Deposit Bank Acc for %2', PaymentVoucher."No.", PaymentVoucher.Payee);
                PV."Paying Bank Account" := PaymentVoucher."Paying Bank Account";
                PV."Bank Name" := PaymentVoucher."Bank Name";
                PV."Strategic Plan" := PaymentVoucher."Strategic Plan";
                PV."Reporting Year Code" := PaymentVoucher."Reporting Year Code";
                PV."Workplan Code" := PaymentVoucher."Workplan Code";
                PV."Activity Code" := PaymentVoucher."Activity Code";
                PV."Source PV No." := PaymentVoucher."No.";
                PV.Status := PV.Status::Released;
                PV.Modify();
            end;
        end;

        PVLines.Reset();
        PVLines.SetRange(No, PVNo);
        PVLines.DeleteAll();

        PaymentLines.Reset();
        PaymentLines.SetRange(No, PaymentVoucher."No.");
        if PaymentLines.FindSet() then begin
            repeat
                LineNo += 10000;
                PVLines.Init();
                PVLines.No := PVNo;
                PVLines."Line No" := LineNo;
                PVLines."Shortcut Dimension 1 Code" := PaymentLines."Shortcut Dimension 1 Code";
                PVLines."Shortcut Dimension 2 Code" := PaymentLines."Shortcut Dimension 2 Code";
                PVLines."Dimension Set ID" := PaymentLines."Dimension Set ID";
                PVLines.Type := Details[1];
                PVLines.Validate(Type);
                PVLines."Account No" := Details[2];
                PVLines.Validate("Account No");
                PVLines."Payee Bank Code" := BankAcc."Bank Code";
                PVLines."Payee Bank Name" := BankAcc."Bank Name";
                PVLines."Payee Bank Branch Code" := BankAcc."Bank Branch No.";
                PVLines."Payee Bank Branch Name" := BankAcc."Bank Branch Name";
                PVLines."Payee Bank Account No." := BankAcc."Bank Account No.";
                PVLines."Payee Bank Acc Name" := BankAcc."Bank Account Name";
                PVLines.Validate("Payee Bank Acc Name");
                PVLines.Description := StrSubstNo('PV %1 Retention Movement for %1 -  %2', PaymentVoucher."No.", PaymentLines."No", PaymentLines."Account Name");
                PVLines.Amount := PaymentLines."Retention  Amount";
                PVLines.Validate(Amount);
                PVLines."Payee Account No." := PaymentLines."Account No";
                PVLines."Payee Account Name" := PaymentLines."Account Name";
                if PVLines.Amount <> 0 then
                    PVLines.Insert();
            until PaymentLines.Next() = 0;
        end;
    end;

    procedure PostPV2(var PaymentVoucher: Record Payments)
    var
        PaymentLines: Record "PV Lines";
        CashSetUp: Record "Cash Management Setup";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        GenjnlLine: Record "Gen. Journal Line";
        DimensionCodes, DimensionCodes2 : array[8] of Code[20];
        DimensiomMgt: Codeunit DimensionManagement;
        PayRcptType: Record "Receipts and Payment Types1";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        Details: array[3] of Text;
        RcptPayTypes: Record "Receipts and Payment Types1";
    begin
        //Post Bank Payments Per Line
        if PaymentVoucher.Posted then
            exit;

        PaymentVoucher.CalcFields("Total Net Amount");

        if PaymentVoucher."Total Net Amount" = 0 then
            exit;

        if PaymentVoucher.IsPVPosted(PaymentVoucher."No.") then begin
            PaymentVoucher.Posted := true;
            PaymentVoucher.Validate(Posted);
            PaymentVoucher.Modify();
            exit;
        end;

        if PaymentVoucher."PV Type" = PaymentVoucher."PV Type"::Retention then
            CreateRetentionMvtReceipt(PaymentVoucher);

        CashSetUp.Get();
        CashSetUp.TestField("PV Journal Template");
        CashSetUp.TestField("PV Journal Batch Name");

        Batch.Init();
        Batch."Journal Template Name" := CashSetUp."PV Journal Template";
        Batch.Name := CashSetUp."PV Journal Batch Name";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert();

        GenjnlLine.Reset();
        GenjnlLine.SetRange("Journal Template Name", Batch."Journal Template Name");
        GenjnlLine.SetRange("Journal Batch Name", Batch.Name);
        GenjnlLine.DeleteAll();

        //Bank Amounts
        DimensiomMgt.GetShortcutDimensions(PaymentVoucher."Dimension Set ID", DimensionCodes);
        LineNo := 10000;
        GenjnlLine.Init();
        GenjnlLine."Journal Template Name" := Batch."Journal Template Name";
        GenjnlLine."Journal Batch Name" := Batch.Name;
        GenjnlLine."Line No." := LineNo;
        GenjnlLine."Document No." := PaymentVoucher."No.";
        GenjnlLine."Posting Date" := PaymentVoucher."Posting Date";
        GenjnlLine."Account Type" := GenjnlLine."Account Type"::"Bank Account";
        GenjnlLine."Account No." := PaymentVoucher."Paying Bank Account";
        GenjnlLine.Validate("Account No.");
        GenjnlLine.Description := CopyStr(PaymentVoucher."Payment Narration", 1, MaxStrLen(GenjnlLine.Description));
        GenjnlLine."External Document No." := PaymentVoucher."No.";
        UpdateDimensions(GenjnlLine, DimensionCodes, DimensionCodes);
        // if PaymentVoucher."PV Type" = PaymentVoucher."PV Type"::Retention then //Debit Deposit Bank Account
        //     GenjnlLine.Amount := Round(PaymentVoucher."Total Net Amount")
        // else
        GenjnlLine.Amount := -Round(PaymentVoucher."Total Net Amount");
        GenjnlLine.Validate(Amount);
        if GenjnlLine.Amount <> 0 then
            GenjnlLine.Insert();

        //Process Lines
        PaymentLines.Reset();
        PaymentLines.SetRange(No, PaymentVoucher."No.");
        if PaymentLines.FindSet() then begin
            repeat
                DimensiomMgt.GetShortcutDimensions(PaymentLines."Dimension Set ID", DimensionCodes2);
                if PayRcptType.Get(PaymentLines.Type) then;
                LineNo += 10000;
                GenjnlLine.Init();
                GenjnlLine."Journal Template Name" := Batch."Journal Template Name";
                GenjnlLine."Journal Batch Name" := Batch.Name;
                GenjnlLine."Line No." := LineNo;
                GenjnlLine."Document No." := PaymentVoucher."No.";
                GenjnlLine."Posting Date" := PaymentVoucher."Posting Date";
                GenjnlLine."Account Type" := PaymentLines."Account Type";
                GenjnlLine."Account No." := PaymentLines."Account No";
                GenjnlLine.Validate("Account No.");
                GenjnlLine.Description := CopyStr(PaymentLines.Description, 1, MaxStrLen(GenjnlLine.Description));
                GenjnlLine."External Document No." := PaymentVoucher."No.";
                UpdateDimensions(GenjnlLine, DimensionCodes2, DimensionCodes);
                GenjnlLine.Validate("Dimension Set ID");
                GenjnlLine.Amount := Round(PaymentLines."Net Amount");
                GenjnlLine.Validate(Amount);
                if PaymentVoucher."PV Type" = PaymentVoucher."PV Type"::"Retention Payment" then begin
                    GenjnlLine."Entry Type2" := GenjnlLine."Entry Type2"::Retention;
                    if PaymentLines."Account Type" = PaymentLines."Account Type"::Vendor then begin
                        RcptPayTypes.GetReceiptPaymenTypeDetails(Details, 2, RcptPayTypes.Type::Payment);
                        if Details[3] <> '' then
                            GenjnlLine."Posting Group" := Details[3];
                    end;
                end;
                if GenjnlLine.Amount <> 0 then
                    GenjnlLine.Insert();
            until PaymentLines.Next() = 0;
        end;

        //Post 
        GenjnlLine.Reset();
        GenjnlLine.SetRange("Journal Template Name", Batch."Journal Template Name");
        GenjnlLine.SetRange("Journal Batch Name", Batch.Name);
        if GenjnlLine.FindSet() then
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenjnlLine);
        //Mark As Posted

        if PaymentVoucher.IsPVPosted(PaymentVoucher."No.") then begin
            PaymentVoucher.Posted := true;
            PaymentVoucher.Validate(Posted);
            PaymentVoucher.Modify();
        end;
    end;

    //Create Imprest from EXR 
    procedure CreateImprestMemoFromExpenditureRequest(var EXRHeader: Record "Expense Requisition")
    var
        ImprestHeader: Record "Imprest Memo";
        SafariMembers: Record "Project Members";
        CashSetUp: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Oustr: OutStream;
        ExpReqAllocLine: Record "Expense Req. Allocation";
        LineNo: Integer;
        UserSetUp: Record "User Setup";
        TempBlob: Codeunit "Temp Blob";
        Instr: InStream;
        OuStr_: OutStream;
        DimensionCodes: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        attachLink: Record Attachments;
        attachLink2: Record Attachments;
        entryNo: integer;
    begin
        EXRHeader.CalcFields(Objective);
        TempBlob.CreateInStream(Instr);
        EXRHeader.Objective.CreateInStream(Instr);

        ImprestHeader.Reset();
        ImprestHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        if ImprestHeader.FindFirst() then begin
            //If not warranty created (Overwrite)
            if not ImprestHeader."Imprest Created" then begin
                EXRHeader.GetFirstLineDimensions(DimensionCodes);
                ImprestHeader."Global Dimension 1 Code" := EXRHeader."Global Dimension 1 Code";
                ImprestHeader."Global Dimension 2 Code" := EXRHeader."Global Dimension 2 Code";
                ImprestHeader.Validate("Global Dimension 1 Code");
                ImprestHeader.Validate("Global Dimension 2 Code");
                DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], ImprestHeader."Dimension Set Id");
                DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], ImprestHeader."Dimension Set Id");
                DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], ImprestHeader."Dimension Set Id");
                DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], ImprestHeader."Dimension Set Id");
                DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], ImprestHeader."Dimension Set Id");
                DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], ImprestHeader."Dimension Set Id");
                ImprestHeader."Strategic Plan" := EXRHeader."Corporate Strategy";
                ImprestHeader."Reporting Year Code" := EXRHeader."Reporting Period";
                ImprestHeader."Workplan Code" := EXRHeader.Workplan;
                ImprestHeader."Activity Code" := EXRHeader."Activity Code";
                ImprestHeader."Expenditure Requisition Code" := EXRHeader."No.";
                ImprestHeader.Date := EXRHeader.Date;
                ImprestHeader.Status := ImprestHeader.Status::Released;
                ImprestHeader."User ID" := EXRHeader."Created By";
                ImprestHeader.Requestor := UserSetUp.GetEmployeeNo(EXRHeader."Created By");
                ImprestHeader.Objective.CreateOutStream(Oustr_);
                CopyStream(OuStr_, Instr);
                if ImprestHeader.Requestor <> '' then
                    ImprestHeader.Validate(Requestor);
                ImprestHeader."Imprest Naration" := EXRHeader.Justifications;
                ImprestHeader."Start Date" := EXRHeader."Start Date";
                ImprestHeader."No. of days" := EXRHeader."No Of Days";
                ImprestHeader.Validate("No. of days");
                ImprestHeader.Modify();

                SafariMembers.Reset;
                SafariMembers.SetRange("Imprest Memo No.", ImprestHeader."No.");
                SafariMembers.DeleteAll();

                //Create Safari Members
                ExpReqAllocLine.Reset;
                ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
                ExpReqAllocLine.SetRange(Type, ExpReqAllocLine.Type::Imprest);
                if ExpReqAllocLine.FindSet() then begin
                    repeat
                        LineNo += 10000;
                        SafariMembers.Reset();
                        SafariMembers."Imprest Memo No." := ImprestHeader."No.";
                        SafariMembers."Line No" := LineNo;
                        SafariMembers."Work Type" := ExpReqAllocLine.Destination;
                        SafariMembers.Validate("Work Type");
                        SafariMembers.type := SafariMembers.Type::Person;
                        SafariMembers."No." := ExpReqAllocLine."Resource No.";
                        SafariMembers.Validate("No.");
                        SafariMembers."G/L Account" := ExpReqAllocLine."G/L Account";

                        SafariMembers."Time Period" := ExpReqAllocLine.Quantity;
                        SafariMembers.Validate("Time Period");
                        SafariMembers."Direct Unit Cost" := ExpReqAllocLine.Rate;
                        SafariMembers.Entitlement := ExpReqAllocLine.Total;
                        SafariMembers.validate("Total Entitlement");
                        SafariMembers."Global Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                        SafariMembers."Global Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                        DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."Shortcut Dimension 3 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."Shortcut Dimension 4 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."Shortcut Dimension 5 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."Shortcut Dimension 6 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."Shortcut Dimension 7 Code", SafariMembers."Dimension Set Id");
                        DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."Shortcut Dimension 8 Code", SafariMembers."Dimension Set Id");
                        SafariMembers.Insert();
                    until ExpReqAllocLine.Next() = 0;
                end;
            end;
        end else begin
            CashSetUp.Get();
            CashSetUp.TestField("Imprest Memo Nos");
            EXRHeader.GetFirstLineDimensions(DimensionCodes);
            ImprestHeader.Init();
            ImprestHeader."Source RecordID" := EXRHeader.RecordId;
            ImprestHeader."Document Type" := ImprestHeader."Document Type"::"Imprest Memo";
            ImprestHeader."Global Dimension 1 Code" := EXRHeader."Global Dimension 1 Code";
            ImprestHeader."Global Dimension 2 Code" := EXRHeader."Global Dimension 2 Code";
            ImprestHeader.Validate("Global Dimension 1 Code");
            ImprestHeader.Validate("Global Dimension 2 Code");
            DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], ImprestHeader."Dimension Set Id");
            DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], ImprestHeader."Dimension Set Id");
            DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], ImprestHeader."Dimension Set Id");
            DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], ImprestHeader."Dimension Set Id");
            DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], ImprestHeader."Dimension Set Id");
            DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], ImprestHeader."Dimension Set Id");
            ImprestHeader."Strategic Plan" := EXRHeader."Corporate Strategy";
            ImprestHeader."Reporting Year Code" := EXRHeader."Reporting Period";
            ImprestHeader."Workplan Code" := EXRHeader.Workplan;
            ImprestHeader."Activity Code" := EXRHeader."Activity Code";
            ImprestHeader."Expenditure Requisition Code" := EXRHeader."No.";
            ImprestHeader.Date := EXRHeader.Date;
            ImprestHeader.Status := ImprestHeader.Status::Released;
            ImprestHeader.Subject := EXRHeader.Subject;
            ImprestHeader.Objective.CreateOutStream(Oustr_);
            CopyStream(OuStr_, Instr);
            ImprestHeader."User ID" := UserId;
            ImprestHeader.Requestor := UserSetUp.GetEmployeeNo(EXRHeader."Created By");
            if ImprestHeader.Requestor <> '' then
                ImprestHeader.Validate(Requestor);
            ImprestHeader."Imprest Naration" := EXRHeader.Justifications;
            ImprestHeader."Start Date" := EXRHeader."Start Date";
            ImprestHeader."No. of days" := EXRHeader."No Of Days";
            ImprestHeader.Validate("No. of days");
            ImprestHeader."Paying Bank Account" := CashSetUp."Imprest Bank Account";
            ImprestHeader.Validate("Paying Bank Account");
            ImprestHeader."No." := NoSeriesMgt.GetNextNo(CashSetUp."Imprest Memo Nos", Today, true);
            if ImprestHeader.Insert(true) then begin
                attachLink.reset();
                attachLink.setRange(attachLink.Document_No, EXRHeader."No.");
                if attachLink.findSet() then
                    repeat
                        attachLink2.reset();
                        if attachLink2.FindLast() then
                            entryNo := attachLink2.LineNo + 1
                        else
                            entryNo := 1;

                        attachLink2.init;
                        attachlink2.Copy(attachLink);
                        attachLink2.LineNo := entryNo;
                        attachLink2.Document_No := ImprestHeader."No.";
                        attachlink2.insert();
                    until attachLink.next = 0;

            end;

            //Create Safari Members
            ExpReqAllocLine.Reset;
            ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
            ExpReqAllocLine.SetRange(Type, ExpReqAllocLine.Type::Imprest);
            if ExpReqAllocLine.FindSet() then begin
                repeat
                    LineNo += 10000;
                    SafariMembers.Reset();
                    SafariMembers."Imprest Memo No." := ImprestHeader."No.";
                    SafariMembers."Line No" := LineNo;
                    SafariMembers."Work Type" := ExpReqAllocLine.Destination;
                    SafariMembers.Validate("Work Type");
                    SafariMembers.type := SafariMembers.Type::Person;
                    SafariMembers."No." := ExpReqAllocLine."Resource No.";
                    SafariMembers.Validate("No.");
                    SafariMembers."G/L Account" := ExpReqAllocLine."G/L Account";
                    SafariMembers."Time Period" := ExpReqAllocLine.Quantity;
                    SafariMembers.Validate("Time Period");
                    SafariMembers."Direct Unit Cost" := ExpReqAllocLine.Rate;
                    SafariMembers.Entitlement := ExpReqAllocLine.Total;
                    SafariMembers.Validate("Total Entitlement");
                    SafariMembers."Global Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                    SafariMembers."Global Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."Shortcut Dimension 3 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."Shortcut Dimension 4 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."Shortcut Dimension 5 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."Shortcut Dimension 6 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."Shortcut Dimension 7 Code", SafariMembers."Dimension Set Id");
                    DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."Shortcut Dimension 8 Code", SafariMembers."Dimension Set Id");
                    if SafariMembers.Insert() then begin
                        ExpReqAllocLine."imprest No" := SafariMembers."Imprest Memo No.";
                        ExpReqAllocLine.Modify();
                    end;
                until ExpReqAllocLine.Next() = 0;
            end;
        end;

        ImprestHeader.Reset();
        ImprestHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        if ImprestHeader.FindFirst() then begin
            EXRHeader."Imprest Created" := true;
            EXRHeader.Modify();
        end;
    end;

    //Create Other Imprests
    procedure CreateStandingSpecialImprestFromExpenditureRequest(var EXRHeader: Record "Expense Requisition")
    var
        CashSetUp: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo: Integer;
        Imprest, Imprest2 : Record Payments;
        ImprestLines: Record "PV Lines";
        Customer: Record Customer;
        ExpReqline, ExpReqline2 : Record "Expense Req. Allocation";
        ImprestDict: Dictionary of [Code[20], Code[20]];
        ImprestCreated: Boolean;
        DimensionCodes: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        PayMode: Record "Pay Mode";
        attachLink: Record Attachments;
        attachLink2: Record Attachments;
        entryNo: integer;

    begin
        if not (EXRHeader."Imprest Type" in [EXRHeader."Imprest Type"::"Special Imprest", EXRHeader."Imprest Type"::"Standing Imprest"]) then
            exit;

        CashSetUp.Get();
        CashSetUp.TestField("Special Imprest Nos");
        CashSetUp.TestField("Standing Imprest Nos");
        EXRHeader.GetFirstLineDimensions(DimensionCodes);
        Imprest.Reset();
        Imprest.SetRange("Source RecordId", EXRHeader.RecordId);
        if Imprest.FindFirst() then begin
            ExpReqline.Reset();
            ExpReqline.SetRange("Document No.", EXRHeader."No.");
            ExpReqline.SetRange(Type, ExpReqline.Type::Imprest);
            if ExpReqline.FindSet() then begin
                repeat
                    if not ImprestDict.ContainsKey(ExpreqLine."Employee No.") then begin
                        ImprestDict.Add(ExpReqline."Employee No.", ExpReqline."Employee No.");

                        Imprest2.Reset();
                        Imprest2.SetRange("Source RecordId", EXRHeader.RecordId);
                        Imprest2.SetRange("Source No", ExpReqline."Employee No.");
                        if Imprest2.FindFirst() then begin
                            if not Imprest2.Posted then begin

                                Imprest2.Date := Today;
                                Imprest2."Posting Date" := EXRHeader.Date;
                                Imprest2."Payment Narration" := EXRHeader.Description;
                                Imprest2."Shortcut Dimension 1 Code" := EXRHeader."Global Dimension 1 Code";
                                Imprest2."Shortcut Dimension 2 Code" := EXRHeader."Global Dimension 2 Code";
                                Imprest2."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpReqline.Total);

                                Imprest2.Validate("Shortcut Dimension 1 Code");
                                Imprest2.Validate("Shortcut Dimension 2 Code");

                                DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], Imprest2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], Imprest2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], Imprest2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], Imprest2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], Imprest2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], Imprest2."Dimension Set ID");
                                Imprest2."Strategic Plan" := EXRHeader."Corporate Strategy";
                                Imprest2."Reporting Year Code" := EXRHeader."Reporting Period";
                                Imprest2."Workplan Code" := EXRHeader.Workplan;
                                Imprest2."Activity Code" := EXRHeader."Activity Code";
                                Imprest2."Source No" := ExpReqline."Employee No.";
                                Imprest2."Account Type" := Imprest2."Account Type"::Employee;
                                Imprest2."Account No." := ExpReqline."Employee No.";
                                Imprest2."Expenditure Requisition Code" := EXRHeader."No.";
                                Imprest2."Paying Bank Account" := CashSetUp."Imprest Bank Account";
                                Imprest2.Validate("Paying Bank Account");
                                Imprest2.Modify();

                                ImprestLines.Reset();
                                ImprestLines.SetRange(No, Imprest2."No.");
                                ImprestLines.DeleteAll();

                                //Clear Lines
                                ExpReqline2.Reset();
                                ExpReqline2.SetRange("Document No.", EXRHeader."No.");
                                ExpReqline2.SetRange("Employee No.", ExpReqline."Employee No.");
                                ExpReqline2.SetRange(Type, ExpReqline2.Type::Imprest);
                                if ExpReqline2.FindSet() then begin

                                    repeat
                                        ImprestLines.reset;
                                        if ImprestLines.findset then
                                            LineNo := ImprestLines.count;
                                        // LineNo += 10000;
                                        ImprestLines.Init();
                                        ImprestLines."Line No" := LineNo + 1;
                                        ImprestLines.No := Imprest2."No.";
                                        ImprestLines."Account Type" := ImprestLines."Account Type"::Employee;
                                        ImprestLines."Account No" := ExpReqline2."Employee No.";
                                        ImprestLines.Validate("Account No");
                                        ImprestLines."Vote Item" := ExpReqline2."G/L Account";
                                        ImprestLines.Description := EXRHeader.Description;
                                        ImprestLines.Amount := ExpReqline2.Total;
                                        ImprestLines."Amount (LCY)" := ExpReqline2.Total;
                                        ImprestLines."Shortcut Dimension 1 Code" := ExpReqline2."Global Dimension 1 Code";
                                        ImprestLines."Shortcut Dimension 2 Code" := ExpReqline2."Global Dimension 2 Code";
                                        DimensionMgt.ValidateShortcutDimValues(1, ExpReqline2."Global Dimension 1 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(2, ExpReqline2."Global Dimension 2 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(3, ExpReqline2."Shortcut Dimension 3 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(4, ExpReqline2."Shortcut Dimension 4 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(5, ExpReqline2."Shortcut Dimension 5 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(6, ExpReqline2."Shortcut Dimension 6 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(7, ExpReqline2."Shortcut Dimension 7 Code", ImprestLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(8, ExpReqline2."Shortcut Dimension 8 Code", ImprestLines."Dimension Set ID");
                                        ExpReqline2."Imprest No" := Imprest."No.";
                                        if ImprestLines.Insert() then begin
                                            ExpReqline2.modify();
                                        end;
                                    until ExpReqline2.Next() = 0;
                                end;
                            end;
                        end else begin
                            Imprest2.Init();
                            Imprest2."Source RecordId" := EXRHeader.RecordId;
                            Imprest2.Date := Today;
                            Imprest2."Posting Date" := EXRHeader.Date;
                            Imprest2."Payment Narration" := EXRHeader.Description;
                            Imprest2."Expenditure Requisition Code" := EXRHeader."No.";
                            // Imprest2."Pay Mode" := PayMode.GetDefaultPayMode();
                            Imprest2."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpReqline.Total);
                            Imprest2."Shortcut Dimension 1 Code" := EXRHeader."Global Dimension 1 Code";
                            Imprest2."Shortcut Dimension 2 Code" := EXRHeader."Global Dimension 2 Code";
                            Imprest2.Validate("Shortcut Dimension 1 Code");
                            Imprest2.Validate("Shortcut Dimension 2 Code");

                            DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], Imprest2."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], Imprest2."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], Imprest2."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], Imprest2."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], Imprest2."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], Imprest2."Dimension Set ID");
                            Imprest2."Strategic Plan" := EXRHeader."Corporate Strategy";
                            Imprest2."Reporting Year Code" := EXRHeader."Reporting Period";
                            Imprest2."Workplan Code" := EXRHeader.Workplan;
                            Imprest2."Activity Code" := EXRHeader."Activity Code";
                            Imprest2."Source No" := ExpReqline."Employee No.";
                            Imprest2."Account Type" := Imprest2."Account Type"::Employee;
                            Imprest2."Account No." := ExpReqline."Employee No.";
                            Imprest2.Status := Imprest2.Status::Open;
                            case
                                EXRHeader."Imprest Type" of
                                EXRHeader."Imprest Type"::"Special Imprest":
                                    begin
                                        Imprest2."No." := NoSeriesMgt.GetNextNo(CashSetUp."Special Imprest Nos", Today, true);
                                        Imprest2."Payment Type" := Imprest."Payment Type"::"Special Imprest";
                                    end;
                                EXRHeader."Imprest Type"::"Standing Imprest":
                                    begin
                                        Imprest2."No." := NoSeriesMgt.GetNextNo(CashSetUp."Standing Imprest Nos", Today, true);
                                        Imprest2."Payment Type" := Imprest."Payment Type"::"Standing Imprest";
                                    end;
                            end;
                            Imprest2."Paying Bank Account" := CashSetUp."Imprest Bank Account";
                            Imprest2.Validate("Paying Bank Account");
                            if Imprest2.Insert() then begin
                                ExpreqLine."Imprest No" := Imprest2."No.";
                                ExpreqLine.Modify();
                            end;

                            ExpReqline2.Reset();
                            ExpReqline2.SetRange("Document No.", EXRHeader."No.");
                            ExpReqline2.SetRange("Employee No.", ExpReqline."Employee No.");
                            ExpReqline2.SetRange(Type, ExpReqline2.Type::Imprest);
                            if ExpReqline2.FindSet() then begin
                                repeat
                                    // LineNo += 10000;
                                    ImprestLines.reset;
                                    if ImprestLines.findset then
                                        LineNo := ImprestLines.count;
                                    // LineNo += 10000;
                                    ImprestLines.Init();
                                    ImprestLines."Line No" := LineNo + 1;
                                    // ImprestLines.Init();
                                    ImprestLines.No := Imprest2."No.";
                                    ImprestLines."Account Type" := ImprestLines."Account Type"::Employee;
                                    ImprestLines."Account No" := ExpReqline2."Employee No.";
                                    ImprestLines.Validate("Account No");
                                    ImprestLines.Description := EXRHeader.Description;
                                    ImprestLines.Amount := ExpReqline2.Total;
                                    ImprestLines."Vote Item" := ExpReqline2."G/L Account";
                                    ImprestLines."Shortcut Dimension 1 Code" := ExpReqline2."Global Dimension 1 Code";
                                    ImprestLines."Shortcut Dimension 2 Code" := ExpReqline2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqline2."Global Dimension 1 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqline2."Global Dimension 2 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqline2."Shortcut Dimension 3 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqline2."Shortcut Dimension 4 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqline2."Shortcut Dimension 5 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqline2."Shortcut Dimension 6 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqline2."Shortcut Dimension 7 Code", ImprestLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(8, ExpReqline2."Shortcut Dimension 8 Code", ImprestLines."Dimension Set ID");
                                    ExpReqline2."Imprest No" := Imprest."No.";
                                    ImprestLines.Insert();
                                until ExpReqline2.Next() = 0;
                            end;
                        end;
                    end;
                until ExpReqline.Next() = 0;
            end;

            //Delete Existing Lines
            Imprest2.Reset();
            Imprest2.SetRange("Source RecordId", EXRHeader.RecordId);
            Imprest2.SetRange(Posted, false);
            if Imprest2.FindSet() then begin
                repeat
                    ExpReqline.Reset();
                    ExpReqline.SetRange("Imprest No", Imprest2."No.");
                    ExpReqline.SetRange("Employee No.", Imprest2."Source No");
                    if not ExpReqline.FindFirst() then
                        Imprest2.Delete();
                until Imprest2.Next() = 0;
            end;
        end
        else begin
            CashSetUp.Get();
            CashSetUp.TestField("Special Imprest Nos");
            CashSetUp.TestField("Standing Imprest Nos");

            ExpReqline.Reset();
            ExpReqline.SetRange("Document No.", EXRHeader."No.");
            ExpReqline.SetRange(Type, ExpReqline.Type::Imprest);
            if ExpReqline.FindSet() then begin
                repeat
                    LineNo := 0;
                    if not ImprestDict.ContainsKey(ExpreqLine."Employee No.") then begin
                        ImprestDict.Add(ExpReqline."Employee No.", ExpReqline."Employee No.");
                        Imprest.Init();
                        Imprest."Source RecordId" := EXRHeader.RecordId;
                        Imprest.Date := Today;
                        Imprest."Posting Date" := EXRHeader.Date;
                        Imprest."Payment Narration" := EXRHeader.Description;
                        // Imprest."Pay Mode" := PayMode.GetDefaultPayMode();
                        Imprest."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpreqLine.Total);



                        Imprest."Shortcut Dimension 1 Code" := EXRHeader."Global Dimension 1 Code";
                        Imprest."Shortcut Dimension 2 Code" := EXRHeader."Global Dimension 2 Code";
                        Imprest.Validate("Shortcut Dimension 1 Code");
                        Imprest.Validate("Shortcut Dimension 2 Code");

                        DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], Imprest."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], Imprest."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], Imprest."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], Imprest."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], Imprest."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], Imprest."Dimension Set ID");
                        Imprest."Strategic Plan" := EXRHeader."Corporate Strategy";
                        Imprest."Reporting Year Code" := EXRHeader."Reporting Period";
                        Imprest."Workplan Code" := EXRHeader.Workplan;
                        Imprest."Expenditure Requisition Code" := EXRHeader."No.";
                        Imprest."Activity Code" := EXRHeader."Activity Code";
                        Imprest."Source No" := ExpReqline."Employee No.";
                        Imprest."Account Type" := Imprest."Account Type"::Employee;
                        Imprest."Account No." := ExpReqline."Employee No.";
                        Imprest.Status := Imprest.Status::Open;
                        case
                            EXRHeader."Imprest Type" of
                            EXRHeader."Imprest Type"::"Special Imprest":
                                begin
                                    Imprest."No." := NoSeriesMgt.GetNextNo(CashSetUp."Special Imprest Nos", Today, true);
                                    Imprest."Payment Type" := Imprest."Payment Type"::"Special Imprest";
                                end;
                            EXRHeader."Imprest Type"::"Standing Imprest":
                                begin
                                    Imprest."No." := NoSeriesMgt.GetNextNo(CashSetUp."Standing Imprest Nos", Today, true);
                                    Imprest."Payment Type" := Imprest."Payment Type"::"Standing Imprest";
                                end;
                        end;
                        Imprest."Paying Bank Account" := CashSetUp."Imprest Bank Account";
                        Imprest.Validate("Paying Bank Account");
                        if (Imprest.Insert()) then begin
                            ExpreqLine."Imprest No" := Imprest."No.";
                            ExpreqLine.Modify();


                            attachLink.reset();
                            attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                            if attachLink.findSet() then
                                repeat
                                    attachLink2.reset();
                                    if attachLink2.FindLast() then
                                        entryNo := attachLink2.LineNo + 1
                                    else
                                        entryNo := 1;
                                    attachLink2.init;
                                    attachlink2.Copy(attachLink);
                                    attachLink2.LineNo := entryNo;
                                    attachLink2.Document_No := Imprest."No.";
                                    attachlink2.insert();
                                until attachLink.next = 0;
                        end;
                        ExpReqline2.Reset();
                        ExpReqline2.SetRange("Document No.", EXRHeader."No.");
                        ExpReqline2.SetRange("Employee No.", ExpReqline."Employee No.");
                        ExpReqline2.SetRange(Type, ExpReqline2.Type::Imprest);
                        if ExpReqline2.FindSet() then begin
                            repeat
                                LineNo += 10000;
                                ImprestLines.reset;
                                if ImprestLines.findset then
                                    LineNo := ImprestLines.count;
                                // LineNo += 10000;
                                ImprestLines.Init();
                                ImprestLines."Line No" := LineNo + 1;
                                // ImprestLines.Init();
                                ImprestLines.No := Imprest."No.";
                                ImprestLines."Account Type" := ImprestLines."Account Type"::Employee;
                                ImprestLines."Account No" := ExpReqline2."Employee No.";
                                ImprestLines.Validate("Account No");
                                ImprestLines.Description := EXRHeader.Description;
                                ImprestLines.Amount := ExpReqline2.Total;
                                ImprestLines."Vote Item" := ExpReqline2."G/L Account";
                                ImprestLines."Shortcut Dimension 1 Code" := ExpReqline2."Global Dimension 1 Code";
                                ImprestLines."Shortcut Dimension 2 Code" := ExpReqline2."Global Dimension 2 Code";
                                DimensionMgt.ValidateShortcutDimValues(1, ExpReqline2."Global Dimension 1 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(2, ExpReqline2."Global Dimension 2 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(3, ExpReqline2."Shortcut Dimension 3 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, ExpReqline2."Shortcut Dimension 4 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, ExpReqline2."Shortcut Dimension 5 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, ExpReqline2."Shortcut Dimension 6 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, ExpReqline2."Shortcut Dimension 7 Code", ImprestLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(8, ExpReqline2."Shortcut Dimension 8 Code", ImprestLines."Dimension Set ID");
                                ExpReqline2."Imprest No" := Imprest."No.";
                                ImprestLines.Insert();
                            until ExpReqline2.Next() = 0;
                        end;
                    end;
                until ExpReqline.Next() = 0;
            end;
        end;
        EXRHeader."Imprest Created" := true;
        EXRHeader.Modify();
    end;

    local procedure Preview(var GenJournalLineSource: Record "Gen. Journal Line")
    var
        GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
    begin
        PreviewPost(GenJournalLineSource);
    end;

    procedure PreviewPost(var GenJournalLineSource: Record "Gen. Journal Line")
    var
        GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
    begin
        BindSubscription(GenJnlPost);
        GenJnlPostPreview.Preview(GenJnlPost, GenJournalLineSource);
    end;

    procedure CreateReceiptFromRefundVouchers(var Payments: Record Payments)
    var
        CashMgtSetUp: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLine: Record "Receipt Lines1";
        Dimensions: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        RcptTypes: Record "Receipts and Payment Types1";
        RcptTypeDetails: array[2] of Text;
    begin
        CashMgtSetUp.Get();
        Payments.CalcFields("Total Amount");
        DimensionMgt.GetShortcutDimensions(Payments."Dimension Set ID", Dimensions);
        if Payments."Refund Policy" in [Payments."Refund Policy"::"Court Collection", Payments."Refund Policy"::"Full Utilization", Payments."Refund Policy"::Forfeiture] then begin
            //Check if Created
            ReceiptHeader.Reset();
            ReceiptHeader.SetRange("Source RecordID", Payments.RecordId);
            if ReceiptHeader.FindFirst() then begin
                if not ReceiptHeader.Posted then begin
                    ReceiptHeader."Pay Mode" := Payments."Pay Mode";
                    ReceiptHeader."Received From" := Payments.Payee;
                    ReceiptHeader."Posted Date" := Today;
                    ReceiptHeader."Bank Code" := CashMgtSetUp."Revenue Receivable Account";
                    ReceiptHeader."Cheque No" := Payments."Cheque No";
                    ReceiptHeader."Cheque Date" := Payments.Date;
                    ReceiptHeader."On Behalf Of" := Payments.Payee;
                    ReceiptHeader."Shortcut Dimension 1 Code" := Dimensions[1];
                    ReceiptHeader."Shortcut Dimension 2 Code" := Dimensions[2];
                    ReceiptHeader."Global Dimension 1 Code" := Dimensions[1];
                    ReceiptHeader."Global Dimension 2 Code" := Dimensions[2];
                    ReceiptHeader."Dimension Set ID" := Payments."Dimension Set ID";
                    ReceiptHeader.Status := ReceiptHeader.Status::Released;
                    ReceiptHeader."Transaction DateTime" := CurrentDateTime;
                    ReceiptHeader."Payment Reference" := Payments."No.";
                    ReceiptHeader."Payment Reference No." := Payments."PRN No.";
                    ReceiptHeader."PRN No." := Payments."PRN No.";
                    ReceiptHeader.Modify();

                    ReceiptLine.Reset();
                    ReceiptLine.SetRange("Receipt No.", ReceiptHeader."No.");
                    ReceiptLine.DeleteAll();

                    ReceiptLine.Init();
                    ReceiptLine."Receipt No." := ReceiptHeader."No.";
                    ReceiptLine."Line No" := 10000;
                    case
                        Payments."Refund Policy" of
                        Payments."Refund Policy"::Forfeiture, Payments."Refund Policy"::"Court Collection":
                            begin
                                RcptTypes.Reset();
                                RcptTypes.SetRange(Forfeiture, true);
                                if RcptTypes.FindFirst() then begin
                                    RcptTypes.TestField("Deposit Account No.");
                                    RcptTypeDetails[1] := RcptTypes.Code;
                                    RcptTypeDetails[2] := RcptTypes."Deposit Account No.";
                                end else
                                    Error('Please a forfeiture transaction code under Receipts and Payments');
                            end;
                        Payments."Refund Policy"::"Full Utilization":
                            begin
                                RcptTypes.Reset();
                                RcptTypes.SetRange("Full Utilization", true);
                                if RcptTypes.FindFirst() then begin
                                    RcptTypes.TestField("Deposit Account No.");
                                    RcptTypeDetails[1] := RcptTypes.Code;
                                    RcptTypeDetails[2] := RcptTypes."Deposit Account No.";
                                end else
                                    Error('Please a Full Utilization transaction code under Receipts and Payments');
                            end;
                    end;
                    ReceiptLine."Transaction Type" := RcptTypeDetails[1];
                    ReceiptLine."Account Type" := ReceiptLine."Account Type"::"G/L Account";
                    ReceiptLine."Account No." := RcptTypeDetails[2];
                    ReceiptLine.Validate("Account No.");
                    ReceiptLine.Description := StrSubstNo('%1 from %2', Format(Payments."Refund Policy"), ReceiptHeader."Received From");
                    ReceiptLine.Amount := Payments."Total Amount";
                    ReceiptLine.Validate(Amount);
                    ReceiptLine."Shortcut Dimension 1 Code" := Dimensions[1];
                    ReceiptLine."Global Dimension 1 Code" := Dimensions[1];
                    ReceiptLine."Shortcut Dimension 2 Code" := Dimensions[2];
                    ReceiptLine."Global Dimension 2 Code" := Dimensions[2];
                    ReceiptLine."Shortcut Dimension 3 Code" := Dimensions[3];
                    ReceiptLine."Dimension Set ID" := Payments."Dimension Set ID";
                    ReceiptLine.Insert();
                end;

            end else begin
                ReceiptHeader.Init();
                ReceiptHeader."Receipt Type" := ReceiptHeader."Receipt Type"::Utilization;
                ReceiptHeader.Date := Today;
                ReceiptHeader."No." := '';
                ReceiptHeader."Posting Date" := Today;
                ReceiptHeader."Pay Mode" := Payments."Pay Mode";
                ReceiptHeader."Received From" := Payments.Payee;
                ReceiptHeader."Posted Date" := Today;
                ReceiptHeader."Bank Code" := CashMgtSetUp."Revenue Cash Book";
                ReceiptHeader.Validate("Bank Code");
                ReceiptHeader."Cheque No" := Payments."Cheque No";
                ReceiptHeader."Cheque Date" := Payments.Date;
                ReceiptHeader."On Behalf Of" := Payments.Payee;
                ReceiptHeader."Shortcut Dimension 1 Code" := Dimensions[1];
                ReceiptHeader."Shortcut Dimension 2 Code" := Dimensions[2];
                ReceiptHeader."Global Dimension 1 Code" := Dimensions[1];
                ReceiptHeader."Global Dimension 2 Code" := Dimensions[2];
                ReceiptHeader."Dimension Set ID" := Payments."Dimension Set ID";
                ReceiptHeader.Status := ReceiptHeader.Status::Released;
                ReceiptHeader."Transaction DateTime" := CurrentDateTime;
                ReceiptHeader."Payment Reference" := Payments."No.";
                ReceiptHeader."Payment Reference No." := Payments."PRN No.";
                ReceiptHeader."PRN No." := Payments."PRN No.";
                ReceiptHeader."Case No." := Payments."Case No.";
                ReceiptHeader."Case Title" := Payments."Case Description";
                ReceiptHeader."Source RecordID" := Payments.RecordId;
                ReceiptHeader.Insert(true);

                //Add Lines
                ReceiptLine.Init();
                ReceiptLine."Receipt No." := ReceiptHeader."No.";
                ReceiptLine."Line No" := 10000;
                case
                    Payments."Refund Policy" of
                    Payments."Refund Policy"::Forfeiture, Payments."Refund Policy"::"Court Collection":
                        begin
                            RcptTypes.Reset();
                            RcptTypes.SetRange(Forfeiture, true);
                            if RcptTypes.FindFirst() then begin
                                RcptTypes.TestField("Deposit Account No.");
                                RcptTypeDetails[1] := RcptTypes.Code;
                                RcptTypeDetails[2] := RcptTypes."Deposit Account No.";
                            end else
                                Error('Please a forfeiture transaction code under Receipts and Payments');
                        end;
                    Payments."Refund Policy"::"Full Utilization":
                        begin
                            RcptTypes.Reset();
                            RcptTypes.SetRange("Full Utilization", true);
                            if RcptTypes.FindFirst() then begin
                                RcptTypes.TestField("Deposit Account No.");
                                RcptTypeDetails[1] := RcptTypes.Code;
                                RcptTypeDetails[2] := RcptTypes."Deposit Account No.";
                            end else
                                Error('Please a Full Utilization transaction code under Receipts and Payments');
                        end;
                end;
                ReceiptLine."Transaction Type" := RcptTypeDetails[1];
                ReceiptLine."Account Type" := ReceiptLine."Account Type"::"G/L Account";
                ReceiptLine."Account No." := RcptTypeDetails[2];
                ReceiptLine.Validate("Account No.");
                ReceiptLine.Description := StrSubstNo('%1 from %2', Format(Payments."Refund Policy"), ReceiptHeader."Received From");
                ReceiptLine.Amount := Payments."Total Amount";
                ReceiptLine.Validate(Amount);
                ReceiptLine."Shortcut Dimension 1 Code" := Dimensions[1];
                ReceiptLine."Global Dimension 1 Code" := Dimensions[1];
                ReceiptLine."Shortcut Dimension 2 Code" := Dimensions[2];
                ReceiptLine."Global Dimension 2 Code" := Dimensions[2];
                ReceiptLine."Shortcut Dimension 3 Code" := Dimensions[3];
                ReceiptLine."Dimension Set ID" := Payments."Dimension Set ID";
                ReceiptLine.Insert();
            end;
            ReceiptHeader.Reset();
            ReceiptHeader.SetRange("Source RecordID", Payments.RecordId);
            if ReceiptHeader.FindFirst() then begin
                Payments."Source PV No." := ReceiptHeader."No.";
                Payments.Modify();
            end;
            Commit();
        end;
    end;

    procedure CreateRetentionMvtReceipt(var PaymentVoucher: Record Payments)
    var
        CashSetUp: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dimensions: array[8] of Code[20];
        BankAcc: Record "Bank Account";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLine: Record "Receipt Lines1";
        PayRcptTypes: Record "Receipts and Payment Types1";
        Details: array[3] of Text;
        DimensionMgt: Codeunit DimensionManagement;
        ReceivingBank: Code[20];
        LineAccDetails: array[3] of Text;
    begin
        PaymentVoucher.GetLinesAccount(PaymentVoucher."Source PV No.", LineAccDetails);
        PaymentVoucher.CalcFields("Total Amount", "Total Amount LCY");
        DimensionMgt.GetShortcutDimensions(PaymentVoucher."Dimension Set ID", Dimensions);
        ReceivingBank := BankAcc.GetBankCode(BankAcc.Type::Deposit, Dimensions[1], Dimensions[2]);

        PayRcptTypes.GetReceiptPaymenTypeDetails(Details, 2, 2);
        if Details[1] = '' then
            Error('There is no Retention Code defined under Receipt and Payment Types. Please correct to proceed!');
        if Details[2] = '' then
            Error('Please define account no for %1 code under Receipt and Payment Types. Please correct to proceed!');

        if PaymentVoucher."Retention Receipt No." <> '' then begin
            //Check Posted if ! Update
            ReceiptHeader.Reset;
            ReceiptHeader.SetRange("No.", PaymentVoucher."Retention Receipt No.");
            if ReceiptHeader.FindFirst() then begin
                if not ReceiptHeader.Posted then begin
                    ReceiptHeader."Global Dimension 1 Code" := Dimensions[1];
                    ReceiptHeader."Global Dimension 2 Code" := Dimensions[2];
                    ReceiptHeader."Shortcut Dimension 1 Code" := Dimensions[1];
                    ReceiptHeader."Shortcut Dimension 2 Code" := Dimensions[2];
                    ReceiptHeader."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                    ReceiptHeader."Bank Code" := ReceivingBank;
                    ReceiptHeader.Validate("Bank Code");
                    ReceiptHeader.Date := Today;
                    ReceiptHeader."Posting Date" := PaymentVoucher."Posting Date";
                    ReceiptHeader."Posted Date" := PaymentVoucher."Posting Date";
                    ReceiptHeader."Cheque Date" := PaymentVoucher."Posting Date";
                    ReceiptHeader."Cheque No" := PaymentVoucher."Source PV No.";
                    ReceiptHeader."Pay Mode" := PaymentVoucher."Pay Mode";
                    ReceiptHeader.Cashier := PaymentVoucher."Created By";
                    ReceiptHeader."On Behalf Of" := LineAccDetails[2];
                    ReceiptHeader."Received From" := LineAccDetails[2];
                    ReceiptHeader."Transaction DateTime" := CurrentDateTime;
                    ReceiptHeader."Payment Reference" := StrSubstNo('Retention Receipt for Receipt %1', PaymentVoucher."Source PV No.");
                    ReceiptHeader.Status := ReceiptHeader.Status::Released;
                    ReceiptHeader.Modify();

                    ReceiptLine.Reset;
                    ReceiptLine.SetRange("Receipt No.", ReceiptHeader."No.");
                    ReceiptLine.DeleteAll();

                    ReceiptLine.Init();
                    ReceiptLine."Receipt No." := ReceiptHeader."No.";
                    ReceiptLine."Line No" := 10000;
                    ReceiptLine."Transaction Type" := Details[1];
                    ReceiptLine."Account Type" := ReceiptLine."Account Type"::"G/L Account";
                    ReceiptLine."Account No." := Details[2];
                    ReceiptLine.Validate("Account No.");
                    ReceiptLine.Description := StrSubstNo('Retention Receipt for Receipt %1', PaymentVoucher."Source PV No.");
                    ReceiptLine."Shortcut Dimension 1 Code" := Dimensions[1];
                    ReceiptLine."Shortcut Dimension 2 Code" := Dimensions[2];
                    ReceiptLine."Shortcut Dimension 3 Code" := Dimensions[3];
                    ReceiptLine."Global Dimension 1 Code" := Dimensions[1];
                    ReceiptLine."Global Dimension 2 Code" := Dimensions[2];
                    ReceiptLine."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
                    ReceiptLine.Amount := PaymentVoucher."Total Amount LCY";
                    ReceiptLine.Validate(Amount);
                    ReceiptLine.Insert();
                end;
            end;

        end else begin  // Create Recipt
            CashSetUp.Get();
            CashSetUp.TestField("Receipt Nos");
            ReceiptHeader.Init();
            ReceiptHeader."Receipt Type" := ReceiptHeader."Receipt Type"::"Retention Receipt";
            ReceiptHeader."No." := NoSeriesMgt.GetNextNo(CashSetUp."Receipt Nos", Today, true);
            ReceiptHeader."Global Dimension 1 Code" := Dimensions[1];
            ReceiptHeader."Global Dimension 2 Code" := Dimensions[2];
            ReceiptHeader."Shortcut Dimension 1 Code" := Dimensions[1];
            ReceiptHeader."Shortcut Dimension 2 Code" := Dimensions[2];
            ReceiptHeader."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
            ReceiptHeader."Bank Code" := ReceivingBank;
            ReceiptHeader.Validate("Bank Code");
            ReceiptHeader.Date := Today;
            ReceiptHeader."Posting Date" := PaymentVoucher."Posting Date";
            ReceiptHeader."Posted Date" := PaymentVoucher."Posting Date";
            ReceiptHeader."Cheque Date" := PaymentVoucher."Posting Date";
            ReceiptHeader."Cheque No" := PaymentVoucher."Source PV No.";
            ReceiptHeader."Pay Mode" := PaymentVoucher."Pay Mode";
            ReceiptHeader.Cashier := PaymentVoucher."Created By";
            ReceiptHeader."On Behalf Of" := LineAccDetails[2];
            ReceiptHeader."Received From" := CopyStr(LineAccDetails[2], 1, MaxStrLen(ReceiptHeader."Received From"));
            ReceiptHeader."Transaction DateTime" := CurrentDateTime;
            ReceiptHeader."Payment Reference" := StrSubstNo('Retention Receipt for Receipt %1', PaymentVoucher."Source PV No.");
            ReceiptHeader.Status := ReceiptHeader.Status::Released;
            ReceiptHeader."Source RecordID" := PaymentVoucher."Source RecordId";
            ReceiptHeader.Insert();

            //Add Lines
            ReceiptLine.Init();
            ReceiptLine."Receipt No." := ReceiptHeader."No.";
            ReceiptLine."Line No" := 10000;
            ReceiptLine."Transaction Type" := Details[1];
            ReceiptLine."Account Type" := ReceiptLine."Account Type"::"G/L Account";
            ReceiptLine."Account No." := Details[2];
            ReceiptLine.Validate("Account No.");
            ReceiptLine.Description := StrSubstNo('Retention Receipt for Receipt %1', PaymentVoucher."Source PV No.");
            ReceiptLine."Shortcut Dimension 1 Code" := Dimensions[1];
            ReceiptLine."Shortcut Dimension 2 Code" := Dimensions[2];
            ReceiptLine."Shortcut Dimension 3 Code" := Dimensions[3];
            ReceiptLine."Global Dimension 1 Code" := Dimensions[1];
            ReceiptLine."Global Dimension 2 Code" := Dimensions[2];
            ReceiptLine."Dimension Set ID" := PaymentVoucher."Dimension Set ID";
            ReceiptLine.Amount := PaymentVoucher."Total Amount LCY";
            ReceiptLine.Validate(Amount);
            ReceiptLine.Insert();
        end;

        //Update Payment Vocuher
        ReceiptHeader.Reset();
        ReceiptHeader.SetRange("Source RecordID", PaymentVoucher.RecordId);
        if ReceiptHeader.FindFirst() then begin
            PaymentVoucher."Retention Receipt No." := ReceiptHeader."No.";
            PaymentVoucher.Modify();
        end;
    end;

    procedure AggregateDimensions(PriorityDimensionCodes: array[8] of Code[20]; LowerPriorityDimension: array[8] of Code[20];
                              var NewDimensionCodes: array[8] of Code[20]) DimensionSetId: Integer
    var
        I: Integer;
        DimensionMgt: Codeunit DimensionManagement;
    begin
        Clear(NewDimensionCodes);
        CopyArray(NewDimensionCodes, PriorityDimensionCodes, 1);
        for i := 1 to ArrayLen(NewDimensionCodes) do begin
            if NewDimensionCodes[I] = '' then
                NewDimensionCodes[I] := LowerPriorityDimension[I];
            DimensionMgt.ValidateShortcutDimValues(I, NewDimensionCodes[I], DimensionSetId);
        end;
    end;

    procedure SuggestRevenueSweepLines(var SweepHeader: Record Payments)
    var
        PvLines: Record "PV Lines";
        RcptPayTypes: Record "Receipts and Payment Types1";
        Details: array[3] of Text;
        LineNo: Integer;
        BankAccLedgerQ: Query "Bank Acc Ledger Per Dimension";
        DimensionValues: Record "Dimension Value";
        Dimensions: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
    begin
        SweepHeader.TestField("Posting Date");
        SweepHeader.TestField("Payment Narration");
        SweepHeader.TestField("Paying Bank Account");

        RcptPayTypes.GetReceiptPaymenTypeDetails(Details, 3, 2);
        if Details[1] = '' then
            Error('There is no Exchequer Transaction Code setup under receipts and payments. Please setup to continue');
        if Details[2] = '' then
            Error('There is no account defined for transaction code %1 under receipts and payments. Please setup to continue', Details[1]);

        //Clear Lines
        PvLines.Reset();
        PvLines.SetRange(No, SweepHeader."No.");
        PvLines.DeleteAll();

        clear(BankAccLedgerQ);
        BankAccLedgerQ.SetRange(BankAccLedgerQ.Posting_Date, 0D, SweepHeader."Posting Date");
        BankAccLedgerQ.SetRange(BankAccLedgerQ.Reversed, false);
        BankAccLedgerQ.SetRange(BankAccLedgerQ.Bank_Account_No_, SweepHeader."Paying Bank Account");
        BankAccLedgerQ.Open();
        while BankAccLedgerQ.Read() do begin
            if BankAccLedgerQ.Amount__LCY_ <> 0 then begin
                clear(Dimensions);
                DimensionMgt.GetShortcutDimensions(BankAccLedgerQ.Dimension_Set_ID, Dimensions);
                LineNo += 100;
                PvLines.Init();
                PvLines."Line No" := LineNo;
                PvLines.No := SweepHeader."No.";
                PvLines.Type := Details[1];
                PvLines."Account Type" := PvLines."Account Type"::Vendor;
                PvLines."Account No" := Details[2];
                PvLines.Validate("Account No");
                PvLines.Description := StrSubstNo('Revenue account sweep for amounts as at %1 for %2 - %3 and %4 - %5', SweepHeader."Posting Date",
                                                SweepHeader.FieldCaption("Shortcut Dimension 1 Code"), Dimensions[1], SweepHeader.FieldCaption("Shortcut Dimension 2 Code"),
                                                Dimensions[2]);
                PvLines."Amount To Refund" := BankAccLedgerQ.Amount__LCY_;
                PvLines.Amount := BankAccLedgerQ.Amount__LCY_;
                PVLines.Validate(Amount);
                PvLines."Shortcut Dimension 1 Code" := Dimensions[1];
                PvLines."Shortcut Dimension 2 Code" := Dimensions[2];
                PvLines."Shortcut Dimesnion 4 Code" := Dimensions[4];
                PvLines."Dimension Set ID" := BankAccLedgerQ.Dimension_Set_ID;
                PvLines.Insert();
            end;
        end;
    end;

    procedure CreatePurchaseInvoiceFromEXRHeader(var EXRHeader: Record "Expense Requisition")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        LineNo: Integer;
        ExpReqAllocLine, ExpReqAllocLine2 : Record "Expense Req. Allocation";
        ExpReqLine: Record "Expense Requisition Line";
        PurchInvHeader: Record "Purch. Inv. Header";
        DimensionMgt: Codeunit DimensionManagement;
        VendorDict: Dictionary of [Text, Text];
        PurchPaySetUp: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ProcSetUp: Record "Procurement Setup";
        attachLink: Record Attachments;
        attachLink2: Record Attachments;
        entryNo: integer;
        DimensionCodes: array[8] of Code[20];
    begin
        if not (EXRHeader."Requires Direct Payment" and (EXRHeader."Direct Payment Type" = EXRHeader."Direct Payment Type"::"Non Staff Claim")) then
            exit;

        ProcSetUp.Get();
        PurchPaySetUp.Get;
        PurchPaySetUp.TestField("Invoice Nos.");
        EXRHeader.GetFirstLineDimensions(DimensionCodes);
        //Check if Exists
        PurchHeader.Reset();
        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice);
        if PurchHeader.FindFirst() then begin
            //Update
            clear(VendorDict);
            //Create
            ExpReqAllocLine.Reset;
            ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
            ExpReqAllocLine.Setrange(Type, ExpReqAllocLine.Type::"Direct Expense");
            if ExpReqAllocLine.FindSet() then begin
                repeat
                    if not VendorDict.ContainsKey(ExpReqAllocLine.Supplier) then begin
                        PurchHeader.Reset();
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice);
                        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
                        PurchHeader.SetRange("Buy-from Vendor No.", ExpReqAllocLine.Supplier);
                        if PurchHeader.FindFirst() then begin
                            PurchHeader."Source RecordID" := EXRHeader.RecordId;
                            PurchHeader."Posting Date" := EXRHeader.Date;
                            PurchHeader."Posting Description" := EXRHeader.Description;
                            PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader.Validate("Vendor No.");
                            PurchHeader.Validate("Buy-from Vendor No.");
                            PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if PurchHeader."Document Date" = 0D then
                                PurchHeader."Document Date" := EXRHeader.Date;
                            PurchHeader."Due Date" := EXRHeader.Date;
                            PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                            PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                            PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                            DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                            PurchHeader.Status := PurchHeader.Status::Open;
                            PurchHeader.Modify();

                            PurchLine.Reset();
                            PurchLine.SetRange("Document No.", PurchHeader."No.");
                            PurchLine.SetRange("Document Type", PurchLine."Document Type"::Invoice);
                            PurchLine.DeleteAll();

                            ExpReqAllocLine2.Reset();
                            ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                            ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                            ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                            if ExpReqAllocLine2.FindSet() then begin
                                LineNo := 0;
                                repeat
                                    LineNo += 10000;
                                    PurchLine.Init;
                                    PurchLine."Document No." := PurchHeader."No.";
                                    PurchLine."Document Type" := PurchLine."Document Type"::Invoice;
                                    PurchLine."Line No." := LineNo;
                                    PurchLine.Type := PurchLine.Type::"G/L Account";
                                    PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                    PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                    PurchLine.Validate("No.");
                                    PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                    PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine.Validate(Quantity);
                                    PurchLine.Validate("Direct Unit Cost");
                                    PurchLine.Validate("Unit Cost");
                                    if PurchLine."Gen. Prod. Posting Group" = '' then
                                        PurchLine.Validate("Gen. Prod. Posting Group", ProcSetUp."Default General Product PG");
                                    PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                    PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                    PurchLine.Insert();
                                until ExpReqAllocLine2.Next() = 0;
                            end;
                            PurchHeader.Status := PurchHeader.Status::Released;
                            PurchHeader.Modify();
                        end else begin
                            PurchHeader.Init();
                            PurchHeader."Source RecordID" := EXRHeader.RecordId;
                            PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice;
                            PurchHeader."No." := NoSeriesMgt.GetNextNo(PurchPaySetUp."Invoice Nos.", Today, True);
                            PurchHeader."Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader.Validate("Vendor No.");
                            PurchHeader.Validate("Buy-from Vendor No.");
                            PurchHeader."Posting Date" := EXRHeader.Date;
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if PurchHeader."Document Date" = 0D then
                                PurchHeader."Document Date" := EXRHeader.Date;
                            PurchHeader."Due Date" := EXRHeader.Date;
                            PurchHeader."Posting Description" := EXRHeader.Description;
                            PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                            PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                            PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                            DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                            PurchHeader.Status := PurchHeader.Status::Open;
                            PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if (PurchHeader.Insert(true)) then begin
                                ExpReqAllocLine."Imprest No" := PurchHeader."No.";
                                ExpReqAllocLine.Modify();

                                attachLink.reset();
                                attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                                if attachLink.findSet() then
                                    repeat
                                        attachLink2.reset();
                                        if attachLink2.FindLast() then
                                            entryNo := attachLink2.LineNo + 1
                                        else
                                            entryNo := 1;

                                        attachLink2.init;
                                        attachlink2.Copy(attachLink);
                                        attachLink2.LineNo := entryNo;
                                        attachLink2.Document_No := PurchHeader."No.";
                                        attachlink2.insert();
                                    until attachLink.next = 0;

                            end;

                            ExpReqAllocLine2.Reset();
                            ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                            ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                            ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                            if ExpReqAllocLine2.FindSet() then begin
                                LineNo := 0;
                                repeat
                                    LineNo += 10000;
                                    PurchLine.Init;
                                    PurchLine."Document No." := PurchHeader."No.";
                                    PurchLine."Document Type" := PurchLine."Document Type"::Invoice;
                                    PurchLine."Line No." := LineNo;
                                    PurchLine.Type := PurchLine.Type::"G/L Account";
                                    PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                    PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                    PurchLine.Validate("No.");
                                    PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                    PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine.Validate(Quantity);
                                    PurchLine.Validate("Unit Cost");
                                    PurchLine.Validate("Direct Unit Cost");
                                    if PurchLine."Gen. Prod. Posting Group" = '' then
                                        PurchLine."Gen. Prod. Posting Group" := PurchLine."Gen. Prod. Posting Group";
                                    PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                    PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                    PurchLine.Insert();
                                until ExpReqAllocLine2.Next() = 0;
                            end;
                            PurchHeader.Status := PurchHeader.Status::Released;
                            PurchHeader.Modify();
                        end;
                    end;
                until ExpReqAllocLine.Next() = 0;
            end;

            //Delete Removed Employees
            PurchHeader.Reset();
            PurchHeader.SetRange("Source RecordId", ExrHeader.RecordId);
            if PurchHeader.FindSet() then begin
                repeat
                    ExpReqAllocLine2.Reset();
                    ExpReqAllocLine2.SetRange("Document No.", ExrHeader."No.");
                    ExpReqAllocLine2.SetRange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                    ExpReqAllocLine2.SetRange(Supplier, PurchHeader."Vendor No.");
                    if not ExpReqAllocLine2.FindFirst() then
                        PurchHeader.Delete();
                until PurchHeader.Next() = 0;
            end;
        end else begin
            clear(VendorDict);
            //Create
            ExpReqAllocLine.Reset;
            ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
            ExpReqAllocLine.Setrange(Type, ExpReqAllocLine.Type::"Direct Expense");
            if ExpReqAllocLine.FindSet() then begin
                repeat
                    if not VendorDict.ContainsKey(ExpReqAllocLine.Supplier) then begin
                        VendorDict.Add(ExpReqAllocLine.Supplier, ExpReqAllocLine.Supplier);
                        PurchHeader.Init();
                        PurchHeader."Source RecordID" := EXRHeader.RecordId;
                        PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice;
                        PurchHeader."No." := NoSeriesMgt.GetNextNo(PurchPaySetUp."Invoice Nos.", Today, True);
                        PurchHeader."Vendor No." := ExpReqAllocLine.Supplier;
                        PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                        PurchHeader.Validate("Vendor No.");
                        PurchHeader.Validate("Buy-from Vendor No.");
                        PurchHeader."Posting Date" := EXRHeader.Date;
                        PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                        if PurchHeader."Document Date" = 0D then
                            PurchHeader."Document Date" := EXRHeader.Date;
                        PurchHeader."Due Date" := EXRHeader.Date;
                        PurchHeader."Posting Description" := EXRHeader.Description;
                        PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                        PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                        PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                        DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                        PurchHeader.Status := PurchHeader.Status::Open;
                        PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                        PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                        if (PurchHeader.Insert()) then begin
                            ExpReqAllocLine."Imprest No" := PurchHeader."No.";
                            ExpReqAllocLine.modify();
                            attachLink.reset();
                            attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                            if attachLink.findSet() then
                                repeat
                                    attachLink2.reset();
                                    if attachLink2.FindLast() then
                                        entryNo := attachLink2.LineNo + 1
                                    else
                                        entryNo := 1;

                                    attachLink2.init;
                                    attachlink2.Copy(attachLink);
                                    attachLink2.LineNo := entryNo;
                                    attachLink2.Document_No := PurchHeader."No.";
                                    attachlink2.insert();
                                until attachLink.next = 0;

                        end;
                        ExpReqAllocLine2.Reset();
                        ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                        ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                        ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                        if ExpReqAllocLine2.FindSet() then begin
                            LineNo := 0;
                            repeat
                                LineNo += 10000;
                                PurchLine.Init;
                                PurchLine."Document No." := PurchHeader."No.";
                                PurchLine."Document Type" := PurchLine."Document Type"::Invoice;
                                PurchLine."Line No." := LineNo;
                                PurchLine.Type := PurchLine.Type::"G/L Account";
                                PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                PurchLine.Validate("No.");
                                PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                PurchLine.Validate(Quantity);
                                PurchLine.Validate("Unit Cost");
                                PurchLine.Validate("Direct Unit Cost");
                                if PurchLine."Gen. Prod. Posting Group" = '' then
                                    PurchLine.Validate("Gen. Prod. Posting Group", ProcSetUp."Default General Product PG");
                                PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                PurchLine.Insert();
                            until ExpReqAllocLine2.Next() = 0;
                        end;
                        PurchHeader.Status := PurchHeader.Status::Released;
                        PurchHeader.Modify();
                    end;
                until ExpReqAllocLine.Next() = 0;
            end;
        end;

        PurchHeader.Reset();
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice);
        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        if PurchHeader.FindSet() then begin
            EXRHeader."Purch Inv. Created" := true;
            EXRHeader."Created INV No" := PurchHeader."No.";
            EXRHeader.Modify();
        end;
    end;


    procedure CreatePurchaseOrderFromEXRHeader(var EXRHeader: Record "Expense Requisition")
    var
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        LineNo: Integer;
        ExpReqAllocLine, ExpReqAllocLine2 : Record "Expense Req. Allocation";
        ExpReqLine: Record "Expense Requisition Line";
        PurchInvHeader: Record "Purch. Inv. Header";
        DimensionMgt: Codeunit DimensionManagement;
        VendorDict: Dictionary of [Text, Text];
        PurchPaySetUp: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ProcSetUp: Record "Procurement Setup";
        attachLink: Record Attachments;
        attachLink2: Record Attachments;
        entryNo: integer;
        DimensionCodes: array[8] of Code[20];
    begin
        if not (EXRHeader."Requires Direct Payment" and (EXRHeader."Direct Payment Type" = EXRHeader."Direct Payment Type"::"Non Staff Claim")) then
            exit;

        ProcSetUp.Get();
        PurchPaySetUp.Get;
        PurchPaySetUp.TestField("Invoice Nos.");
        EXRHeader.GetFirstLineDimensions(DimensionCodes);
        //Check if Exists
        PurchHeader.Reset();
        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::order);
        if PurchHeader.FindFirst() then begin
            //Update
            clear(VendorDict);
            //Create
            ExpReqAllocLine.Reset;
            ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
            ExpReqAllocLine.Setrange(Type, ExpReqAllocLine.Type::"Direct Expense");
            if ExpReqAllocLine.FindSet() then begin
                repeat
                    if not VendorDict.ContainsKey(ExpReqAllocLine.Supplier) then begin
                        PurchHeader.Reset();
                        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
                        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
                        PurchHeader.SetRange("Buy-from Vendor No.", ExpReqAllocLine.Supplier);
                        if PurchHeader.FindFirst() then begin
                            PurchHeader."Source RecordID" := EXRHeader.RecordId;
                            PurchHeader."Posting Date" := EXRHeader.Date;
                            PurchHeader."Posting Description" := EXRHeader.Description;
                            PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader.Validate("Vendor No.");
                            PurchHeader.Validate("Buy-from Vendor No.");
                            PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if PurchHeader."Document Date" = 0D then
                                PurchHeader."Document Date" := EXRHeader.Date;
                            PurchHeader."Due Date" := EXRHeader.Date;
                            PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                            PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                            PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                            DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                            PurchHeader.Status := PurchHeader.Status::Open;
                            if PurchHeader.Modify() then begin
                                ExpReqAllocLine."imprest No" := PurchHeader."No.";
                                ExpReqAllocLine.modify();
                            end;



                            PurchLine.Reset();
                            PurchLine.SetRange("Document No.", PurchHeader."No.");
                            PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                            PurchLine.DeleteAll();

                            ExpReqAllocLine2.Reset();
                            ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                            ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                            ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                            if ExpReqAllocLine2.FindSet() then begin
                                LineNo := 0;
                                repeat
                                    LineNo += 10000;
                                    PurchLine.Init;
                                    PurchLine."Document No." := PurchHeader."No.";
                                    PurchLine."Document Type" := PurchLine."Document Type"::Order;
                                    PurchLine."Line No." := LineNo;
                                    PurchLine.Type := PurchLine.Type::"G/L Account";
                                    PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                    PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                    PurchLine.Validate("No.");
                                    PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                    PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine.Validate(Quantity);
                                    PurchLine.Validate("Direct Unit Cost");
                                    PurchLine.Validate("Unit Cost");
                                    if PurchLine."Gen. Prod. Posting Group" = '' then
                                        PurchLine.Validate("Gen. Prod. Posting Group", ProcSetUp."Default General Product PG");
                                    PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                    PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                    PurchLine.Insert();
                                until ExpReqAllocLine2.Next() = 0;
                            end;
                            PurchHeader.Status := PurchHeader.Status::Released;
                            PurchHeader.Modify();
                        end else begin
                            PurchHeader.Init();
                            PurchHeader."Source RecordID" := EXRHeader.RecordId;
                            PurchHeader."Document Type" := PurchHeader."Document Type"::Order;
                            PurchHeader."No." := NoSeriesMgt.GetNextNo(PurchPaySetUp."Invoice Nos.", Today, True);
                            PurchHeader."Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                            PurchHeader.Validate("Vendor No.");
                            PurchHeader.Validate("Buy-from Vendor No.");
                            PurchHeader."Posting Date" := EXRHeader.Date;
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if PurchHeader."Document Date" = 0D then
                                PurchHeader."Document Date" := EXRHeader.Date;
                            PurchHeader."Due Date" := EXRHeader.Date;
                            PurchHeader."Posting Description" := EXRHeader.Description;
                            PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                            PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                            PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                            DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                            PurchHeader.Status := PurchHeader.Status::Open;
                            PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                            PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                            if (PurchHeader.Insert(true)) then begin
                                ExpReqAllocLine."Imprest No" := PurchHeader."No.";
                                ExpReqAllocLine.modify();

                                attachLink.reset();
                                attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                                if attachLink.findSet() then
                                    repeat
                                        attachLink2.reset();
                                        if attachLink2.FindLast() then
                                            entryNo := attachLink2.LineNo + 1
                                        else
                                            entryNo := 1;

                                        attachLink2.init;
                                        attachlink2.Copy(attachLink);
                                        attachLink2.LineNo := entryNo;
                                        attachLink2.Document_No := PurchHeader."No.";
                                        attachlink2.insert();
                                    until attachLink.next = 0;

                            end;

                            ExpReqAllocLine2.Reset();
                            ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                            ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                            ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                            if ExpReqAllocLine2.FindSet() then begin
                                LineNo := 0;
                                repeat
                                    LineNo += 10000;
                                    PurchLine.Init;
                                    PurchLine."Document No." := PurchHeader."No.";
                                    PurchLine."Document Type" := PurchLine."Document Type"::Order;
                                    PurchLine."Line No." := LineNo;
                                    PurchLine.Type := PurchLine.Type::"G/L Account";
                                    PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                    PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                    PurchLine.Validate("No.");
                                    PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                    PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                    PurchLine.Validate(Quantity);
                                    PurchLine.Validate("Unit Cost");
                                    PurchLine.Validate("Direct Unit Cost");
                                    if PurchLine."Gen. Prod. Posting Group" = '' then
                                        PurchLine."Gen. Prod. Posting Group" := PurchLine."Gen. Prod. Posting Group";
                                    PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                    PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                    PurchLine.Insert();
                                until ExpReqAllocLine2.Next() = 0;
                            end;
                            PurchHeader.Status := PurchHeader.Status::Released;
                            PurchHeader.Modify();
                        end;
                    end;
                until ExpReqAllocLine.Next() = 0;
            end;

            //Delete Removed Employees
            PurchHeader.Reset();
            PurchHeader.SetRange("Source RecordId", ExrHeader.RecordId);
            if PurchHeader.FindSet() then begin
                repeat
                    ExpReqAllocLine2.Reset();
                    ExpReqAllocLine2.SetRange("Document No.", ExrHeader."No.");
                    ExpReqAllocLine2.SetRange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                    ExpReqAllocLine2.SetRange(Supplier, PurchHeader."Vendor No.");
                    if not ExpReqAllocLine2.FindFirst() then
                        PurchHeader.Delete();
                until PurchHeader.Next() = 0;
            end;
        end else begin
            clear(VendorDict);
            //Create
            ExpReqAllocLine.Reset;
            ExpReqAllocLine.SetRange("Document No.", EXRHeader."No.");
            ExpReqAllocLine.Setrange(Type, ExpReqAllocLine.Type::"Direct Expense");
            if ExpReqAllocLine.FindSet() then begin
                repeat
                    if not VendorDict.ContainsKey(ExpReqAllocLine.Supplier) then begin
                        VendorDict.Add(ExpReqAllocLine.Supplier, ExpReqAllocLine.Supplier);
                        PurchHeader.Init();
                        PurchHeader."Source RecordID" := EXRHeader.RecordId;
                        PurchHeader."Document Type" := PurchHeader."Document Type"::Order;
                        PurchHeader."No." := NoSeriesMgt.GetNextNo(PurchPaySetUp."Invoice Nos.", Today, True);
                        PurchHeader."Vendor No." := ExpReqAllocLine.Supplier;
                        PurchHeader."Buy-from Vendor No." := ExpReqAllocLine.Supplier;
                        PurchHeader.Validate("Vendor No.");
                        PurchHeader.Validate("Buy-from Vendor No.");
                        PurchHeader."Posting Date" := EXRHeader.Date;
                        PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                        if PurchHeader."Document Date" = 0D then
                            PurchHeader."Document Date" := EXRHeader.Date;
                        PurchHeader."Due Date" := EXRHeader.Date;
                        PurchHeader."Posting Description" := EXRHeader.Description;
                        PurchHeader."Shortcut Dimension 1 Code" := ExpReqAllocLine."Global Dimension 1 Code";
                        PurchHeader."Shortcut Dimension 2 Code" := ExpReqAllocLine."Global Dimension 2 Code";
                        PurchHeader."Shortcut Dimension 3 Code" := ExpReqAllocLine."Shortcut Dimension 3 Code";
                        DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine."Global Dimension 1 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine."Global Dimension 2 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine."SHortcut Dimension 3 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine."SHortcut Dimension 4 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine."SHortcut Dimension 5 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine."SHortcut Dimension 6 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine."SHortcut Dimension 7 Code", PurchHeader."Dimension Set ID");
                        DimensionMgt.ValidateShortcutDimValues(8, ExpReqAllocLine."SHortcut Dimension 8 Code", PurchHeader."Dimension Set ID");
                        PurchHeader.Status := PurchHeader.Status::Open;
                        PurchHeader."Vendor Invoice No." := ExpReqAllocLine."Supplier Invoice No.";
                        PurchHeader."Document Date" := ExpReqAllocLine."Supplier Invoice Date";
                        if (PurchHeader.Insert()) then begin
                            ExpReqAllocLine."imprest No" := PurchHeader."No.";
                            attachLink.reset();
                            attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                            if attachLink.findSet() then
                                repeat
                                    attachLink2.reset();
                                    if attachLink2.FindLast() then
                                        entryNo := attachLink2.LineNo + 1
                                    else
                                        entryNo := 1;

                                    attachLink2.init;
                                    attachlink2.Copy(attachLink);
                                    attachLink2.LineNo := entryNo;
                                    attachLink2.Document_No := PurchHeader."No.";
                                    attachlink2.insert();
                                until attachLink.next = 0;

                        end;
                        ExpReqAllocLine2.Reset();
                        ExpReqAllocLine2.SetRange("Document No.", EXRHeader."No.");
                        ExpReqAllocLine2.Setrange(Type, ExpReqAllocLine2.Type::"Direct Expense");
                        ExpReqAllocLine2.Setrange(Supplier, ExpReqAllocLine.Supplier);
                        if ExpReqAllocLine2.FindSet() then begin
                            LineNo := 0;
                            repeat
                                LineNo += 10000;
                                PurchLine.Init;
                                PurchLine."Document No." := PurchHeader."No.";
                                PurchLine."Document Type" := PurchLine."Document Type"::Order;
                                PurchLine."Line No." := LineNo;
                                PurchLine.Type := PurchLine.Type::"G/L Account";
                                PurchLine."No." := ExpReqAllocLine2."G/L Account";
                                PurchLine.Description := ExpreqAllocLine2."Expense Description";
                                PurchLine.Validate("No.");
                                PurchLine.Quantity := ExpReqAllocLine2.Quantity;
                                PurchLine."Unit Cost" := ExpReqAllocLine2.Rate;
                                PurchLine."Direct Unit Cost" := ExpReqAllocLine2.Rate;
                                PurchLine.Validate(Quantity);
                                PurchLine.Validate("Unit Cost");
                                PurchLine.Validate("Direct Unit Cost");
                                if PurchLine."Gen. Prod. Posting Group" = '' then
                                    PurchLine.Validate("Gen. Prod. Posting Group", ProcSetUp."Default General Product PG");
                                PurchLine."Shortcut Dimension 1 Code" := ExpReqAllocLine2."Global Dimension 1 Code";
                                PurchLine."Shortcut Dimension 2 Code" := ExpReqAllocLine2."Global Dimension 2 Code";
                                DimensionMgt.ValidateShortcutDimValues(1, ExpReqAllocLine2."Global Dimension 1 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(2, ExpReqAllocLine2."Global Dimension 2 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(3, ExpReqAllocLine2."SHortcut Dimension 3 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, ExpReqAllocLine2."SHortcut Dimension 4 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, ExpReqAllocLine2."SHortcut Dimension 5 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, ExpReqAllocLine2."SHortcut Dimension 6 Code", PurchLine."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, ExpReqAllocLine2."SHortcut Dimension 7 Code", PurchLine."Dimension Set ID");
                                PurchLine.Insert();
                            until ExpReqAllocLine2.Next() = 0;
                        end;
                        PurchHeader.Status := PurchHeader.Status::Released;
                        PurchHeader.Modify();
                    end;
                until ExpReqAllocLine.Next() = 0;
            end;
        end;

        PurchHeader.Reset();
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        PurchHeader.SetRange("Source RecordID", EXRHeader.RecordId);
        if PurchHeader.FindSet() then begin
            EXRHeader."Purch Inv. Created" := true;
            EXRHeader."Created INV No" := PurchHeader."No.";
            EXRHeader.Modify();
        end;
    end;

    procedure CreateStaffClaimFromExpenditureReq(var ExrHeader: Record "Expense Requisition")
    var
        LineNo: Integer;
        StaffClaim, StaffClaim2 : Record Payments;
        StaffClaimLines: Record "PV Lines";
        ExpenseReqLines: Record "Expense Requisition Line";
        ExpReqAlloc, ExpReqAlloc2 : Record "Expense Req. Allocation";
        EmployeeDict: Dictionary of [Code[20], Code[20]];
        CashSetUp: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionMgt: Codeunit DimensionManagement;
        PayMode: Record "Pay Mode";
        PaymentPV: Record Payments;
        attachLink: Record Attachments;
        attachLink2: Record Attachments;
        DimensionCodes: array[8] of Code[20];
        entryNo: integer;
    begin
        if not (ExrHeader."Requires Direct Payment" and (ExrHeader."Direct Payment Type" = ExrHeader."Direct Payment Type"::"Staff Claim")) then
            exit;

        CashSetUp.Get();
        CashSetUp.TestField("Staff Claim Nos.");
        CashSetUp.TestField("Imprest Bank Account");
        EXRHeader.GetFirstLineDimensions(DimensionCodes);
        StaffClaim.Reset();
        StaffClaim.SetRange("Source RecordId", ExrHeader.RecordId);
        if StaffClaim.FindFirst() then begin
            //Update 
            ExpReqAlloc.Reset();
            ExpReqAlloc.SetRange("Document No.", ExrHeader."No.");
            ExpReqAlloc.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
            if ExpReqAlloc.FindSet() then begin
                repeat
                    if not EmployeeDict.ContainsKey(ExpReqAlloc."Employee No.") then begin
                        EmployeeDict.Add(ExpReqAlloc."Employee No.", ExpReqAlloc."Employee No.");
                        //Check if exists 
                        StaffClaim2.Reset();
                        StaffClaim2.SetRange("Source RecordId", ExrHeader.RecordId);
                        StaffClaim2.SetRange("Source No", ExpReqAlloc."Employee No.");
                        if StaffClaim2.FindFirst() then begin
                            if not StaffClaim2.Posted then begin
                                StaffClaim2.Date := ExrHeader.Date;
                                StaffClaim2."Payment Type" := StaffClaim2."Payment Type"::"Staff Claim";
                                StaffClaim2."Posting Date" := ExrHeader.Date;
                                StaffClaim2."Account Type" := StaffClaim."Account Type"::Employee;
                                StaffClaim2."Account No." := ExpReqAlloc."Employee No.";
                                StaffClaim2."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpReqAlloc.Total);
                                StaffClaim2.Validate("Account No.");
                                StaffClaim2."Shortcut Dimension 1 Code" := ExrHeader."Global Dimension 1 Code";
                                StaffClaim2."Shortcut Dimension 2 Code" := ExrHeader."Global Dimension 2 Code";
                                StaffClaim2.Validate("Shortcut Dimension 1 Code");
                                StaffClaim2.Validate("Shortcut Dimension 2 Code");
                                StaffClaim2."Source No" := ExpReqAlloc."Employee No.";
                                StaffClaim2."Source RecordId" := ExrHeader.RecordId;
                                StaffClaim2.Payee := ExpReqAlloc2.Payee;
                                StaffClaim2."Payment Narration" := ExrHeader.Description;
                                StaffClaim2."Strategic Plan" := ExrHeader."Corporate Strategy";
                                StaffClaim2."Reporting Year Code" := ExrHeader."Reporting Period";
                                StaffClaim2."Workplan Code" := ExrHeader.Workplan;
                                StaffClaim2."Activity Code" := ExrHeader."Activity Code";
                                StaffClaim2."Expenditure Requisition Code" := ExrHeader."No.";
                                StaffClaim2.Status := StaffClaim.Status::Open;
                                StaffClaim2."Paying Bank Account" := CashSetUp."Imprest Bank Account";
                                StaffClaim2.Validate("Paying Bank Account");

                                DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], StaffClaim2."Dimension Set ID");
                                StaffClaim2.Modify();

                                StaffClaimLines.Reset();
                                StaffClaimLines.SetRange(No, StaffClaim2."No.");
                                StaffClaimLines.DeleteAll();

                                ExpReqAlloc2.Reset();
                                ExpReqAlloc2.SetRange("Document No.", ExrHeader."No.");
                                ExpReqAlloc2.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
                                ExpReqAlloc2.SetRange("Employee No.", ExpReqAlloc."Employee No.");
                                if ExpReqAlloc2.FindSet() then begin
                                    repeat
                                        LineNo += 10000;
                                        StaffClaimLines.Init();
                                        StaffClaimLines.No := StaffClaim2."No.";
                                        StaffClaimLines."Line No" := LineNo;

                                        StaffClaimLines.Type := ExpReqAlloc2."Vote Item";
                                        //Validate bankdetails kk
                                        StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::Employee;
                                        StaffClaimLines."Account No" := ExpReqAlloc2."Employee No.";
                                        StaffClaimLines.Validate("Account No");
                                        // StaffClaimLines.Validate(Type);
                                        StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::"G/L Account";
                                        StaffClaimLines."Account No" := ExpReqAlloc2."G/L Account";
                                        StaffClaimLines.Validate("Account No");
                                        StaffClaimLines.Description := ExrHeader.Description;
                                        StaffClaimLines.Amount := ExpReqAlloc2.Total;
                                        StaffClaimLines.Validate(Amount);
                                        PaymentPV.Reset();
                                        PaymentPV.SetRange("No.", StaffClaim2."No.");
                                        if PaymentPV.FindFirst() then begin
                                            StaffClaimLines."Payee Account No." := StaffClaim2."Payee Bank Account";
                                            // StaffClaimLines."Payee Account Name" := StaffClaim2.Payee;
                                            StaffClaimLines."Payee Bank Acc Name" := StaffClaim2.Payee;
                                            StaffClaimLines."Payee Bank Code" := StaffClaim2."Payee Bank Code";
                                            StaffClaimLines."Payee Bank Branch Code" := StaffClaim2."Payee Bank Branch";

                                        end;

                                        StaffClaimLines."Shortcut Dimension 1 Code" := ExpReqAlloc2."Global Dimension 1 Code";
                                        StaffClaimLines."Shortcut Dimension 2 Code" := ExpReqAlloc2."Global Dimension 2 Code";
                                        DimensionMgt.ValidateShortcutDimValues(1, ExpReqAlloc2."Global Dimension 1 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(2, ExpReqAlloc2."Global Dimension 2 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(3, ExpReqAlloc2."Shortcut Dimension 3 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(4, ExpReqAlloc2."Shortcut Dimension 4 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(5, ExpReqAlloc2."Shortcut Dimension 5 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(6, ExpReqAlloc2."Shortcut Dimension 6 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(7, ExpReqAlloc2."Shortcut Dimension 7 Code", StaffClaimLines."Dimension Set ID");
                                        DimensionMgt.ValidateShortcutDimValues(8, ExpReqAlloc2."Shortcut Dimension 8 Code", StaffClaimLines."Dimension Set ID");
                                        StaffClaimLines.Insert();
                                        ExpReqAlloc2."Imprest No" := StaffClaim2."No.";
                                        ExpReqAlloc2.Modify();
                                    until ExpReqAlloc2.Next() = 0;
                                end;
                            end;
                        end else begin
                            ExpReqAlloc2.Reset();
                            ExpReqAlloc2.SetRange("Document No.", ExrHeader."No.");
                            ExpReqAlloc2.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
                            ExpReqAlloc2.SetRange("Employee No.", ExpReqAlloc."Employee No.");
                            if ExpReqAlloc2.FindSet() then begin
                                //Craete Header
                                StaffClaim2.Init();
                                StaffClaim2."Document Type" := StaffClaim."Document Type"::"Staff Claims";
                                StaffClaim2."Payment Type" := StaffClaim2."Payment Type"::"Staff Claim";
                                StaffClaim2.Date := ExrHeader.Date;
                                StaffClaim2."Posting Date" := ExrHeader.Date;
                                StaffClaim2."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpReqAlloc2.Total);
                                StaffClaim2."Account Type" := StaffClaim."Account Type"::Employee;
                                StaffClaim2."Account No." := ExpReqAlloc2."Employee No.";
                                StaffClaim2.Validate("Account No.");
                                StaffClaim2."Shortcut Dimension 1 Code" := ExrHeader."Global Dimension 1 Code";
                                StaffClaim2."Shortcut Dimension 2 Code" := ExrHeader."Global Dimension 2 Code";
                                StaffClaim2.Validate("Shortcut Dimension 1 Code");
                                StaffClaim2.Validate("Shortcut Dimension 2 Code");
                                StaffClaim2."Source No" := ExpReqAlloc2."Employee No.";
                                StaffClaim2."Source RecordId" := ExrHeader.RecordId;
                                StaffClaim2.Payee := ExpReqAlloc2.Payee;
                                StaffClaim2."Payment Narration" := ExrHeader.Description;
                                StaffClaim2."Strategic Plan" := ExrHeader."Corporate Strategy";
                                StaffClaim2."Reporting Year Code" := ExrHeader."Reporting Period";
                                StaffClaim2."Workplan Code" := ExrHeader.Workplan;
                                StaffClaim2."Activity Code" := ExrHeader."Activity Code";
                                StaffClaim2."Expenditure Requisition Code" := ExrHeader."No.";
                                StaffClaim2.Status := StaffClaim.Status::Open;
                                StaffClaim2."No." := NoSeriesMgt.GetNextNo(CashSetUp."Staff Claim Nos.", Today, true);
                                StaffClaim2."Paying Bank Account" := CashSetUp."Imprest Bank Account";

                                StaffClaim2.Validate("Paying Bank Account");
                                DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], StaffClaim2."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], StaffClaim2."Dimension Set ID");
                                if StaffClaim2.Insert() then begin

                                    attachLink.reset();
                                    attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                                    if attachLink.findSet() then
                                        repeat
                                            attachLink2.reset();
                                            if attachLink2.FindLast() then
                                                entryNo := attachLink2.LineNo + 1
                                            else
                                                entryNo := 1;


                                            attachLink2.init;
                                            attachlink2.Copy(attachLink);
                                            attachLink2.LineNo := entryNo;
                                            attachLink2.Document_No := StaffClaim2."No.";
                                            attachlink2.insert();
                                        until attachLink.next = 0;

                                end;
                                repeat
                                    LineNo += 10000;
                                    StaffClaimLines.Init();
                                    StaffClaimLines.No := StaffClaim2."No.";
                                    StaffClaimLines."Line No" := LineNo;
                                    // StaffClaimLines."Payment Mode1" := StaffClaim2."Pay Mode";
                                    // StaffClaimLines."Payment Mode" := StaffClaim2."Pay Mode";
                                    StaffClaimLines."Posted Date" := ExrHeader.Date;
                                    StaffClaimLines.Type := ExpReqAlloc2."Vote Item";
                                    StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::Employee;
                                    StaffClaimLines."Account No" := ExpReqAlloc2."Employee No.";
                                    StaffClaimLines.Validate("Account No");

                                    // StaffClaimLines.Validate(Type);
                                    StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::"G/L Account";
                                    StaffClaimLines."Account No" := ExpReqAlloc2."G/L Account";
                                    StaffClaimLines.Validate("Account No");
                                    StaffClaimLines.Description := ExrHeader.Description;
                                    StaffClaimLines.Amount := ExpReqAlloc2.Total;
                                    StaffClaimLines.Validate(Amount);
                                    PaymentPV.Reset();
                                    PaymentPV.SetRange("No.", StaffClaim2."No.");
                                    if PaymentPV.FindFirst() then begin
                                        StaffClaimLines."Payee Account No." := StaffClaim2."Payee Bank Account";
                                        StaffClaimLines."Payee Account Type" := StaffClaimLines."Payee Account Type"::"Bank Account";
                                        StaffClaimLines.Validate(StaffClaimLines."Payee Account No.");
                                        StaffClaimLines."Payee Bank Acc Name" := StaffClaim2.Payee;
                                        StaffClaimLines."Payee Bank Code" := StaffClaim2."Payee Bank Code";
                                        StaffClaimLines."Payee Bank Branch Code" := StaffClaim2."Payee Bank Branch";

                                        // StaffClaimLines."Payee Account Name" := StaffClaim2.Payee;
                                        // StaffClaimLines."Payee Bank Acc Name" := StaffClaim2.Payee;
                                        // StaffClaimLines."Payee Bank Code" := StaffClaim2."Payee Bank Code";
                                        // StaffClaimLines."Payee Bank Branch Code" := StaffClaim2."Payee Bank Branch";

                                    end;

                                    StaffClaimLines."Shortcut Dimension 1 Code" := ExpReqAlloc2."Global Dimension 1 Code";
                                    StaffClaimLines."Shortcut Dimension 2 Code" := ExpReqAlloc2."Global Dimension 2 Code";
                                    DimensionMgt.ValidateShortcutDimValues(1, ExpReqAlloc2."Global Dimension 1 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(2, ExpReqAlloc2."Global Dimension 2 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(3, ExpReqAlloc2."Shortcut Dimension 3 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(4, ExpReqAlloc2."Shortcut Dimension 4 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(5, ExpReqAlloc2."Shortcut Dimension 5 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(6, ExpReqAlloc2."Shortcut Dimension 6 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(7, ExpReqAlloc2."Shortcut Dimension 7 Code", StaffClaimLines."Dimension Set ID");
                                    DimensionMgt.ValidateShortcutDimValues(8, ExpReqAlloc2."Shortcut Dimension 8 Code", StaffClaimLines."Dimension Set ID");
                                    StaffClaimLines.Insert();
                                    ExpReqAlloc2."Imprest No" := StaffClaim."No.";
                                    ExpReqAlloc2.Modify();
                                until ExpReqAlloc2.Next() = 0;
                            end;
                        end;
                    end;
                until ExpReqAlloc.Next() = 0;
            end;

            //Delete Removed Employees
            StaffClaim2.Reset();
            StaffClaim2.SetRange("Source RecordId", ExrHeader.RecordId);
            StaffClaim2.SetRange(Posted, false);
            if StaffClaim2.FindSet() then begin
                repeat
                    ExpReqAlloc.Reset();
                    ExpReqAlloc.SetRange("Document No.", ExrHeader."No.");
                    ExpReqAlloc.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
                    ExpReqAlloc.SetRange("Employee No.", StaffClaim2."Source No");
                    if not ExpReqAlloc.FindFirst() then
                        StaffClaim2.Delete();
                until StaffClaim2.Next() = 0;
            end;
        end else begin // Create
            ExpReqAlloc.Reset();
            ExpReqAlloc.SetRange("Document No.", ExrHeader."No.");
            ExpReqAlloc.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
            if ExpReqAlloc.FindSet() then begin
                repeat
                    LineNo := 0;
                    if not EmployeeDict.ContainsKey(ExpReqAlloc."Employee No.") then begin
                        EmployeeDict.Add(ExpReqAlloc."Employee No.", ExpReqAlloc."Employee No.");
                        ExpReqAlloc2.Reset();
                        ExpReqAlloc2.SetRange("Document No.", ExrHeader."No.");
                        ExpReqAlloc2.SetRange(Type, ExpReqAlloc.Type::"Staff Claim");
                        ExpReqAlloc2.SetRange("Employee No.", ExpReqAlloc."Employee No.");
                        if ExpReqAlloc2.FindSet() then begin
                            //Craete Header
                            StaffClaim.Init();
                            StaffClaim."Document Type" := StaffClaim."Document Type"::"Staff Claims";
                            StaffClaim."Payment Type" := StaffClaim2."Payment Type"::"Staff Claim";
                            StaffClaim.Date := ExrHeader.Date;
                            StaffClaim."Pay Mode" := PayMode.GetDefaultClaimsPaymode(ExpReqAlloc2.Total);
                            StaffClaim."Posting Date" := ExrHeader.Date;
                            StaffClaim."Account Type" := StaffClaim."Account Type"::Employee;
                            StaffClaim."Account No." := ExpReqAlloc2."Employee No.";
                            StaffClaim.Validate("Account No.");
                            StaffClaim."Shortcut Dimension 1 Code" := ExrHeader."Global Dimension 1 Code";
                            StaffClaim."Shortcut Dimension 2 Code" := ExrHeader."Global Dimension 2 Code";
                            StaffClaim.Validate("Shortcut Dimension 1 Code");
                            StaffClaim.Validate("Shortcut Dimension 2 Code");
                            StaffClaim."Source No" := ExpReqAlloc2."Employee No.";
                            StaffClaim."Source RecordId" := ExrHeader.RecordId;
                            StaffClaim.Payee := ExpReqAlloc2.Payee;
                            StaffClaim."Payment Narration" := ExrHeader.Description;
                            StaffClaim."Strategic Plan" := ExrHeader."Corporate Strategy";
                            StaffClaim."Reporting Year Code" := ExrHeader."Reporting Period";
                            StaffClaim."Workplan Code" := ExrHeader.Workplan;
                            StaffClaim."Activity Code" := ExrHeader."Activity Code";
                            StaffClaim."Expenditure Requisition Code" := ExrHeader."No.";
                            StaffClaim.Status := StaffClaim.Status::Open;

                            StaffClaim."No." := NoSeriesMgt.GetNextNo(CashSetUp."Staff Claim Nos.", Today, true);
                            StaffClaim."Paying Bank Account" := CashSetUp."Imprest Bank Account";
                            StaffClaim.Validate("Paying Bank Account");
                            DimensionMgt.ValidateShortcutDimValues(3, DimensionCodes[3], StaffClaim."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(4, DimensionCodes[4], StaffClaim."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(5, DimensionCodes[5], StaffClaim."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(6, DimensionCodes[6], StaffClaim."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(7, DimensionCodes[7], StaffClaim."Dimension Set ID");
                            DimensionMgt.ValidateShortcutDimValues(8, DimensionCodes[8], StaffClaim."Dimension Set ID");
                            // StaffClaim.Insert();
                            if StaffClaim.Insert() then begin
                                attachLink.reset();
                                attachLink.setRange(attachLink.Document_No, ExrHeader."No.");
                                if attachLink.findSet() then
                                    repeat
                                        attachLink2.reset();
                                        if attachLink2.FindLast() then
                                            entryNo := attachLink2.LineNo + 1
                                        else
                                            entryNo := 1;


                                        attachLink2.init;
                                        attachlink2.Copy(attachLink);
                                        attachLink2.LineNo := entryNo;
                                        attachLink2.Document_No := StaffClaim."No.";
                                        attachlink2.insert();
                                    until attachLink.next = 0;

                            end;
                            repeat
                                LineNo += 10000;
                                StaffClaimLines.Init();
                                StaffClaimLines.No := StaffClaim."No.";
                                StaffClaimLines."Line No" := LineNo;
                                StaffClaimLines.Type := ExpReqAlloc2."Vote Item";
                                StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::Employee;
                                StaffClaimLines."Account No" := ExpReqAlloc2."Employee No.";
                                StaffClaimLines.Validate("Account No");
                                // StaffClaimLines.Validate(Type);
                                StaffClaimLines."Account Type" := StaffClaimLines."Account Type"::"G/L Account";
                                StaffClaimLines."Account No" := ExpReqAlloc2."G/L Account";
                                StaffClaimLines.Validate("Account No");
                                StaffClaimLines.Description := ExrHeader.Description;
                                StaffClaimLines.Amount := ExpReqAlloc2.Total;
                                StaffClaimLines.Validate(Amount);
                                PaymentPV.Reset();
                                PaymentPV.SetRange("No.", StaffClaim2."No.");
                                if PaymentPV.FindFirst() then begin
                                    StaffClaimLines."Payee Account No." := StaffClaim2."Payee Bank Account";
                                    // StaffClaimLines."Payee Account Name" := StaffClaim2.Payee;
                                    StaffClaimLines."Payee Bank Acc Name" := StaffClaim2.Payee;
                                    StaffClaimLines."Payee Bank Code" := StaffClaim2."Payee Bank Code";
                                    StaffClaimLines."Payee Bank Branch Code" := StaffClaim2."Payee Bank Branch";

                                end;
                                StaffClaimLines."Shortcut Dimension 1 Code" := ExpReqAlloc2."Global Dimension 1 Code";
                                StaffClaimLines."Shortcut Dimension 2 Code" := ExpReqAlloc2."Global Dimension 2 Code";
                                DimensionMgt.ValidateShortcutDimValues(1, ExpReqAlloc2."Global Dimension 1 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(2, ExpReqAlloc2."Global Dimension 2 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(3, ExpReqAlloc2."Shortcut Dimension 3 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(4, ExpReqAlloc2."Shortcut Dimension 4 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(5, ExpReqAlloc2."Shortcut Dimension 5 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(6, ExpReqAlloc2."Shortcut Dimension 6 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(7, ExpReqAlloc2."Shortcut Dimension 7 Code", StaffClaimLines."Dimension Set ID");
                                DimensionMgt.ValidateShortcutDimValues(8, ExpReqAlloc2."Shortcut Dimension 8 Code", StaffClaimLines."Dimension Set ID");
                                StaffClaimLines.Insert();
                                ExpReqAlloc2."Imprest No" := StaffClaim."No.";
                                ExpReqAlloc2.Modify();
                            until ExpReqAlloc2.Next() = 0;
                        end;
                    end;
                until ExpReqAlloc.Next() = 0;
            end;
        end;

        StaffClaim.Reset();
        StaffClaim.SetRange("Source RecordId", ExrHeader.RecordId);
        if StaffClaim.FindFirst() then begin
            ExrHeader."Staff Claim Created" := true;
            ExrHeader.Modify();
        end;
    end;

    procedure InvoicePurchaseOrderOnExpenseRequisitionApproval(Var PurchaseHeader: Record "Purchase Header")
    begin
        // Codeunit.run(codeunit::"Purch.-Post", PurchaseHeader);
        Codeunit.run(codeunit::"Purch.-Post",PurchaseHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure "Purch.-Post (Yes/No)_OnBeforeConfirmPost"(var PurchaseHeader: Record "Purchase Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer)
    begin
        //HideDialog := true;
        //NewConfirmPost(PurchaseHeader);
    end;

    local procedure NewConfirmPost(var PurchaseHeader: Record "Purchase Header"): Boolean
    var
        Selection: Integer;
        ConfirmManagement: Codeunit "Confirm Management";
        ShipInvoiceQst: Label '&Ship,&Invoice,Ship &and Invoice';
        PostConfirmQst: Label 'Do you want to post the %1?', Comment = '%1 = Document Type';
        ReceiveInvoiceQst: Label '&Receive,&Invoice,Receive &and Invoice';
        NothingToPostErr: Label 'There is nothing to post.';
    begin
        case PurchaseHeader."Document Type" of
            PurchaseHeader."Document Type"::Order:
                begin
                    Selection := StrMenu(ShipInvoiceQst, 2);
                    PurchaseHeader.Ship := Selection in [1, 3];
                    PurchaseHeader.Invoice := Selection in [2, 3];
                    if Selection = 0 then
                        exit(false);
                end;
            PurchaseHeader."Document Type"::"Return Order":
                begin
                    Selection := StrMenu(ReceiveInvoiceQst, 1);
                    if Selection = 0 then
                        exit(false);
                    PurchaseHeader.Receive := Selection in [1, 3];
                    PurchaseHeader.Invoice := Selection in [2, 3];
                end
            else
                if not ConfirmManagement.GetResponseOrDefault(
                     StrSubstNo(PostConfirmQst, LowerCase(Format(PurchaseHeader."Document Type"))), true)
                then
                    exit(false);
        end;
        PurchaseHeader."Print Posted Documents" := false;
        exit(true);
    end;

    procedure ModifyTaxPv(docNo: Code[20]): Boolean;
    var
        payments: Record "Payments";
        isModified: Boolean;

    begin
        isModified := false;
        payments.reset();
        payments.setRange("No.", docNo);

        if payments.FindFirst() then begin
            payments."Archive Document" := true;
            if payments.Modify() then begin
                isModified := true;
            end;
        end;
        exit(isModified);

    end;

    procedure isTaxReversed(docNo: Code[20]): Boolean;

    var
        glEntry: Record "G/L Entry";

    begin

        glEntry.reset();
        glEntry.setRange("Document No.", docNo);
        glEntry.setRange(reversed, true);
        if glEntry.FindFirst() then begin
            exit(true)
        end;
        exit(false);

    end;


    procedure checkIFAttachmentExists(docNo: Code[20])
    var
        attachment: Record Attachments;

    begin

        attachment.reset;
        attachment.SetRange(Document_No, docNo);
        if not attachment.FindFirst() then
            Error('Kindly Attach the document');

    end;

    procedure checkIFEmployee(accNo: Code[20]): Boolean

    var
        emp: Record Employee;


    begin

        emp.reset();
        emp.setRange("No.", accNo);
        if emp.findFirst() then
            exit(true);

        exit(false);

    end;







}