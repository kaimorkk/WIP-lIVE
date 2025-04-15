// Codeunit 52193437 "Loan Management"
// {

//     trigger OnRun()
//     begin
//         LoanRepayment(LoansR);
//     end;

//     var
//         LoanApproved: Record Loans;
//         i: Integer;
//         LoanType: Record "Loan Product Types";
//         PeriodDueDate: Date;
//         ScheduleRep: Record "Loan Repayment Schedule";
//         RunningDate: Date;
//         G: Integer;
//         IssuedDate: Date;
//         GracePeiodEndDate: Date;
//         InstalmentEnddate: Date;
//         GracePerodDays: Integer;
//         InstalmentDays: Integer;
//         NoOfGracePeriod: Integer;
//         NewSchedule: Record "Loan Repayment Schedule";
//         RSchedule: Record "Loan Repayment Schedule";
//         GP: Text[30];
//         ScheduleCode: Code[20];
//         PreviewShedule: Record "Loan Repayment Schedule";
//         PeriodInterval: Code[10];
//         CustomerRecord: Record Customer;
//         Gnljnline: Record "Gen. Journal Line";
//         Jnlinepost: Codeunit "Gen. Jnl.-Post Line";
//         CumInterest: Decimal;
//         NewPrincipal: Decimal;
//         PeriodPrRepayment: Decimal;
//         GenBatch: Record "Gen. Journal Batch";
//         LineNo: Integer;
//         GnljnlineCopy: Record "Gen. Journal Line";
//         NewLNApplicNo: Code[10];
//         Cust: Record Customer;
//         LoanApp: Record Loans;
//         TestAmt: Decimal;
//         CustRec: Record Customer;
//         CustPostingGroup: Record "Customer Posting Group";
//         GenSetUp: Record "Sales & Receivables Setup";
//         PChargesx: Record "Precious Insurance Brokers";
//         TCharges: Decimal;
//         LAppCharges: Record "Loan Application Charges";
//         //Loans: Record Loans;
//         LoanAmount: Decimal;
//         InterestRate: Decimal;
//         RepayPeriod: Integer;
//         LBalance: Decimal;
//         RunDate: Date;
//         InstalNo: Decimal;
//         RepayInterval: DateFormula;
//         TotalMRepay: Decimal;
//         LInterest: Decimal;
//         LPrincipal: Decimal;
//         RepayCode: Code[40];
//         GrPrinciple: Integer;
//         GrInterest: Integer;
//         QPrinciple: Decimal;
//         QCounter: Integer;
//         InPeriod: DateFormula;
//         InitialInstal: Integer;
//         InitialGraceInt: Integer;
//         GenJournalLine: Record "Gen. Journal Line";
//         FOSAComm: Decimal;
//         BOSAComm: Decimal;
//         GLPosting: Codeunit "Gen. Jnl.-Post Line";
//         LoanTopUp: Record "Loans Top up";
//         Vend: Record Vendor;
//         BOSAInt: Decimal;
//         TopUpComm: Decimal;
//         DActivity: Code[20];
//         DBranch: Code[20];
//         UsersID: Record User;
//         TotalTopupComm: Decimal;
//         Notification: Codeunit Mail;
//         CustE: Record Customer;
//         DocN: Text[50];
//         DocM: Text[100];
//         DNar: Text[250];
//         DocF: Text[50];
//         MailBody: Text[250];
//         ccEmail: Text[250];
//         LoanG: Record "Loan Guarantors";
//         SpecialComm: Decimal;
//         SetUp: Record "General Set-Up";
//         BatchTopUpAmount: Decimal;
//         BatchTopUpComm: Decimal;
//         STO: Record "Standing Orders";
//         TextDateFormula2: Text[30];
//         TextDateFormula1: Text[30];
//         DateFormula2: DateFormula;
//         DateFormula1: DateFormula;
//         insurance: Decimal;
//         "Paying Bank": Record "Cheque Disbursment Table";
//         "Processing Charges": Decimal;
//         chaqueamount: Decimal;
//         CHECK: Report Check;
//         TEXTNUMBERS: array[2] of Text[80];
//         PAYINGBANK: Record "Bank Account";
//         PAYINGBANK2: Text[30];
//         checkreport: Report Check;
//         numbertext: Text[90];
//         LOANSAPP: Record Loans;
//         "Cheque Disbursment Table": Record "Cheque Disbursment Table";
//         BatchTopUpAmountINT: Decimal;
//         UserMgt: Codeunit "User Setup Management";
//         SalesInfoPaneMgt: Codeunit "Sales Info-Pane Management";
//         ApprovalMgt: Codeunit "Approvals Mgmt.";
//         LoanPosting: Record Loans;
//         BosaSetup: Record "Bosa Setup";
//         PayRec: Record Payments1;
//         PayRecLines: Record "Payment Lines";
//         OBalance: Decimal;
//         OInterest: Decimal;
//         TotalRecovered: Decimal;
//         LoansR: Record Loans;
//         LoanAllocation: Decimal;
//         LGurantors: Record "Loan Guarantors FOSA";
//         LGuran: Record "Loan Guarantors";
//         DefaulterType: Code[20];
//         LastWithdrawalDate: Date;
//         AccountType: Record "Account Types";
//         ReplCharge: Decimal;
//         LoanRec: Integer;
//         ChargeAmount: Decimal;
//         LoanToped: Code[20];
//         PayInterval: DateFormula;
//         Text001: label 'Please recover the loans from the members shares before recovering from gurantors.';
//         Text002: label 'Are you absolutely sure you want to recover the loans from the guarantors as loans?';
//         Text003: label 'LoanAllocation %1';
//         LoanNoRecov: Code[10];


//     procedure PostLoan(var LoanRec: Record Loans; LoanTopUp: Record "Loans Top up")
//     begin
//         BosaSetup.Reset;
//         if BosaSetup.Find('-') then begin

//             with LoanPosting do begin
//                 if Posted = true then
//                     Error('Loan already posted.');

//                 if Confirm('Are you sure you want to post this Loan?', true) = false then
//                     exit;
//                 /*"Cheque Disbursment Table".RESET;
//                 "Cheque Disbursment Table".SETRANGE("Cheque Disbursment Table"."Loan Number","Loan  No.");
//                 IF "Cheque Disbursment Table".FIND('-') THEN
//                 "Cheque Disbursment Table".CALCSUMS("Cheque Disbursment Table"."Cheque Amount");
//                  chaqueamount:= "Cheque Disbursment Table"."Cheque Amount";
//                 IF  chaqueamount > "Approved Amount" THEN
//                 ERROR('CHEQUE AMOUNT IS GREATER THAN APPROVED AMOUNT');*/

//                 GenJournalLine.Reset;
//                 GenJournalLine.SetRange("Journal Template Name", BosaSetup."Loan Journal Template");
//                 GenJournalLine.SetRange("Journal Batch Name", PayRec.No);
//                 GenJournalLine.DeleteAll;

//                 SetUp.Get();
//                 GenSetUp.Get();

//                 DActivity := '';
//                 DBranch := '';

//                 if Cust.Get("Member No.") then
//                     DBranch := Cust."Customer Posting Group";

//                 TCharges := 0;
//                 TopUpComm := 0;
//                 TotalTopupComm := 0;
//                 "Processing Charges" := 0;
//                 BatchTopUpAmountINT := 0;

//                 if Posted = true then
//                     Error('Loan has already been posted. - ' + "Loan No.");


//                 CalcFields("Top Up Amount");


//                 RunningDate := "Loan Disbursement Date";

//                 //Generate and post Approved Loan Amount
//                 if not GenBatch.Get(BosaSetup."Loan Journal Template", PayRec.No) then begin
//                     GenBatch.Init;
//                     GenBatch."Journal Template Name" := BosaSetup."Loan Journal Template";
//                     GenBatch.Name := PayRec.No;
//                     GenBatch.Insert;
//                 end;
//                 LineNo := PayRecLines."Line No" + 10000;
//                 GenJournalLine.Init;
//                 GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                 GenJournalLine."Journal Batch Name" := PayRec.No;
//                 GenJournalLine."Line No." := LineNo;
//                 GenJournalLine."Account Type" := PayRecLines."account type"::Customer;
//                 GenJournalLine."Account No." := PayRecLines."Account No";
//                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                 GenJournalLine."Document No." := PayRecLines."Loan No.";
//                 GenJournalLine."Posting Date" := PayRec."Payment Date";
//                 GenJournalLine.Description := PayRecLines.Name;
//                 GenJournalLine.Amount := ROUND("Approved Amount", 1.0);
//                 GenJournalLine.Validate(GenJournalLine.Amount);
//                 GenJournalLine."Transaction Type" := PayRecLines."transaction type"::Loan;
//                 GenJournalLine."Loan No" := PayRecLines."Loan No.";
//                 GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");

//                 if GenJournalLine.Amount <> 0 then
//                     GenJournalLine.Insert;


//                 //Offsetting Other Loans
//                 if "Top Up Amount" > 0 then begin
//                     LoanTopUp.Reset;
//                     LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                     if LoanTopUp.Find('-') then begin
//                         repeat
//                             //Principle
//                             LineNo := PayRecLines."Line No" + 10000;
//                             GenJournalLine.Init;
//                             GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                             GenJournalLine."Journal Batch Name" := PayRec.No;
//                             GenJournalLine."Line No." := LineNo;
//                             GenJournalLine."Document No." := PayRecLines."Loan No.";
//                             GenJournalLine."Posting Date" := PayRec."Payment Date";
//                             //GenJournalLine."External Document No.":="Loan  No.";
//                             GenJournalLine."Account Type" := PayRecLines."account type"::Customer;
//                             GenJournalLine."Account No." := PayRecLines."Account No";
//                             PayRecLines.Validate(PayRecLines."Account No");
//                             GenJournalLine.Description := 'Off Set By - ' + PayRecLines."Loan No.";
//                             GenJournalLine.Amount := ROUND(LoanTopUp."Principle Top Up", 1.0) * -1;
//                             BatchTopUpAmount := BatchTopUpAmount + GenJournalLine.Amount * -1;
//                             GenJournalLine.Validate(GenJournalLine.Amount);
//                             //GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Share Contribution";
//                             GenJournalLine."Loan No" := LoanTopUp."Loan Top Up";
//                             GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                             //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
//                             if GenJournalLine.Amount <> 0 then
//                                 GenJournalLine.Insert;
//                         until LoanTopUp.Next = 0;
//                     end;
//                 end;

//                 //interst in loan ofsetted
//                 if "Top Up Amount" > 0 then begin
//                     LoanTopUp.Reset;
//                     LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                     if LoanTopUp.Find('-') then begin
//                         repeat
//                             //Principle
//                             LineNo := PayRecLines."Line No" + 10000;
//                             GenJournalLine.Init;
//                             GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                             GenJournalLine."Journal Batch Name" := PayRec.No;
//                             GenJournalLine."Line No." := LineNo;
//                             GenJournalLine."Document No." := PayRecLines."Loan No.";
//                             GenJournalLine."Posting Date" := PayRec."Payment Date";
//                             //GenJournalLine."External Document No.":="Loan  No.";
//                             GenJournalLine."Account Type" := PayRecLines."account type"::Customer;
//                             GenJournalLine."Account No." := PayRecLines."Account No";
//                             PayRecLines.Validate(PayRecLines."Account No");
//                             GenJournalLine.Description := 'Off Set By - ' + PayRecLines."Loan No.";
//                             GenJournalLine.Amount := ROUND(LoanTopUp."Principle Top Up", 1.0) * -1;
//                             BatchTopUpAmountINT := BatchTopUpAmountINT + GenJournalLine.Amount * -1;
//                             //GenJournalLine.VALIDATE(GenJournalLine.Amount);
//                             //GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::Withdrawal;
//                             GenJournalLine."Transaction Type" := PayRecLines."transaction type"::Loan;
//                             GenJournalLine."Loan No" := LoanTopUp."Loan Top Up";
//                             GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                             //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
//                             if GenJournalLine.Amount <> 0 then
//                                 GenJournalLine.Insert;
//                         until LoanTopUp.Next = 0;
//                     end;
//                 end;

//                 //Commision on Loan Offsetted

//                 if "Top Up Amount" > 0 then begin
//                     LoanTopUp.Reset;
//                     LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                     LoanTopUp.SetRange(LoanTopUp."Charge Top Up Commission", true);
//                     if LoanTopUp.Find('-') then begin
//                         repeat
//                             if LoanType.Get("Loan Product Type") then begin
//                                 if LoanTopUp."Charge Top Up Commission" = true then
//                                     LineNo := PayRecLines."Line No" + 10000;
//                                 GenJournalLine.Init;
//                                 GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                                 GenJournalLine."Journal Batch Name" := PayRec.No;
//                                 GenJournalLine."Line No." := LineNo;
//                                 GenJournalLine."Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                                 GenJournalLine."Account No." := LoanType."Top Up Commision Account";
//                                 //GenJournalLine.VALIDATE(GenJournalLine."Account No.");
//                                 GenJournalLine."Document No." := PayRecLines."Loan No.";
//                                 GenJournalLine."Posting Date" := PayRec."Payment Date";
//                                 GenJournalLine.Description := 'Commision on Loan Top Up';
//                                 TopUpComm := (LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision" / 100);
//                                 BatchTopUpComm := (BatchTopUpComm + TopUpComm);
//                                 GenJournalLine.Amount := ROUND(BatchTopUpComm, 1.0) * -1;
//                                 GenJournalLine."External Document No." := "Loan No.";
//                                 GenJournalLine.Validate(GenJournalLine.Amount);
//                                 GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                 if GenJournalLine.Amount <> 0 then
//                                     GenJournalLine.Insert;
//                             end;
//                         //END;
//                         until LoanTopUp.Next = 0;
//                     end;
//                 end;
//                 //Commision On Processing Fee
//                 if "Top Up Amount" > 0 then begin
//                     LoanTopUp.Reset;
//                     LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                     if LoanTopUp.Find('-') then begin
//                         repeat
//                             if LoanType.Get("Loan Product Type") then begin
//                                 if LoanTopUp."Charge Top Up Commission" = true then
//                                     if LoanType."Top Up Commision" > 0 then begin
//                                         LineNo := PayRecLines."Line No" + 10000;
//                                         GenJournalLine.Init;
//                                         GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                                         GenJournalLine."Journal Batch Name" := PayRec.No;
//                                         GenJournalLine."Line No." := LineNo;
//                                         GenJournalLine."Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                                         GenJournalLine."Account No." := LoanType."Processing  Account";
//                                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                                         GenJournalLine."Document No." := PayRecLines."Loan No.";
//                                         GenJournalLine."Posting Date" := PayRec."Payment Date";
//                                         GenJournalLine.Description := 'Commision on Processing Loan';
//                                         GenJournalLine.Amount := ROUND(500, 1.0) * -1;
//                                         "Processing Charges" := "Processing Charges" + GenJournalLine.Amount * -1;
//                                         GenJournalLine."External Document No." := "Loan No.";
//                                         GenJournalLine.Validate(GenJournalLine.Amount);
//                                         GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                                         //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
//                                         if GenJournalLine.Amount <> 0 then
//                                             GenJournalLine.Insert;
//                                     end;
//                             end;
//                         until LoanTopUp.Next = 0;
//                     end;
//                 end;


//                 //Product Charges
//                 PChargesx.Reset;
//                 PChargesx.SetRange(PChargesx."Peroid In Months", Installments);
//                 if PChargesx.Find('-') then begin
//                     repeat
//                         LineNo := PayRecLines."Line No" + 10000;
//                         GenJournalLine.Init;
//                         GenJournalLine."Journal Template Name" := BosaSetup."Loan Journal Template";
//                         GenJournalLine."Journal Batch Name" := PayRec.No;
//                         GenJournalLine."Line No." := LineNo;
//                         GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
//                         GenJournalLine."Account No." := "Member No.";
//                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                         GenJournalLine."Document No." := "Loan No.";
//                         GenJournalLine."External Document No." := PayRecLines."Loan No.";
//                         GenJournalLine."Posting Date" := PayRec."Payment Date";
//                         GenJournalLine.Description := PayRecLines.Name;
//                         if "charge Insurance" = false then begin
//                             if ("Approved Amount" * PChargesx."Rate %" / 1000) < 20 then
//                                 GenJournalLine.Amount := -20
//                             else
//                                 GenJournalLine.Amount := (ROUND("Approved Amount" * PChargesx."Rate %" / 1000, 1.0) * -1);
//                         end;
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         //GenJournalLine."Transaction Type":=GenJournalLine."Transaction Type"::"Interest Due";
//                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                         GenJournalLine."Loan No" := "Loan No.";
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         GenJournalLine."Shortcut Dimension 1 Code" := PayRec."Activity Code";
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                         if GenJournalLine.Amount <> 0 then
//                             GenJournalLine.Insert;
//                         TCharges := TCharges + (GenJournalLine.Amount) * -1;
//                     until PChargesx.Next = 0;
//                 end;


//                 /*END;//Post New
//                 IF CONFIRM ('Are you sure you want to post the loan ') = TRUE THEN BEGIN
//                 GenJournalLine.RESET;
//                 GenJournalLine.SETRANGE("Journal Template Name",BosaSetup."Loan Journal Template");
//                 GenJournalLine.SETRANGE("Journal Batch Name",PayRec.No);
//                 IF GenJournalLine.FIND('-') THEN BEGIN
//                 CODEUNIT.RUN(CODEUNIT::Codeunit39004273,GenJournalLine);
//                 END;
//                 LoanPosting."Issued Date":=LoanPosting."Loan Disbursement Date";
//                 LoanPosting.Posted:=TRUE;
//                 LoanPosting.MODIFY;
//                 //End OF Posting New
//                 MESSAGE('Loan posted successfully.');
//                 END ELSE
//                 EXIT; */

//             end;
//         end;

//     end;


//     procedure DisburseLoan(var LoanRec: Record Loans; var LoanTopUp: Record "Loans Top up")
//     var
//         PayRecLines: Record "Payment Lines";
//         PayRec: Record Payments1;
//     begin
//         with LoanApproved do begin

//             if "Total Loan Guaranteed" < 0 then
//                 Error('PLEASE ENSURE LOAN HAS ALL GUARANTERS');

//             if Confirm('Are you sure you want to Disburse this Loan?', true) = false then
//                 exit;
//             "Cheque Disbursment Table".Reset;
//             "Cheque Disbursment Table".SetRange("Cheque Disbursment Table"."Loan Number", "Loan No.");
//             if "Cheque Disbursment Table".Find('-') then
//                 "Cheque Disbursment Table".CalcSums("Cheque Disbursment Table"."Cheque Amount");
//             chaqueamount := "Cheque Disbursment Table"."Cheque Amount";
//             if chaqueamount > "Approved Amount" then
//                 Error('CHEQUE AMOUNT IS GREATER THAN APPROVED AMOUNT');

//             PayRecLines.Reset;
//             PayRecLines.SetRange(PayRecLines.No, PayRecLines.No);

//             SetUp.Get();
//             GenSetUp.Get();

//             DActivity := '';
//             DBranch := '';

//             if Cust.Get("Member No.") then
//                 DBranch := Cust."Customer Posting Group";

//             TCharges := 0;
//             TopUpComm := 0;
//             TotalTopupComm := 0;
//             "Processing Charges" := 0;
//             BatchTopUpAmountINT := 0;
//             if Loans.Status <> Loans.Status::Approved then
//                 Error('Loan status must be Approved for you to Disbursed. - ' + "Loan No.");

//             if Posted = true then
//                 Error('Loan has already been Disbursed. - ' + "Loan No.");

//             CalcFields("Top Up Amount");

//             RunningDate := "Loan Disbursement Date";

//             //Generate and Disburse Approved Loan Amount
//             if not GenBatch.Get('General', 'LOANS') then begin
//                 GenBatch.Init;
//                 GenBatch."Journal Template Name" := 'General';
//                 GenBatch.Name := 'LOANS';
//                 GenBatch.Insert;
//             end;

//             LoanRec.Reset;
//             LoanRec.SetRange(LoanRec."Loan No.", LoanRec."Loan No.");
//             if LoanRec.Find('-') then begin

//                 repeat
//                     LineNo := LineNo + 10000;
//                     PayRecLines.Init;
//                     PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                     PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                     PayRecLines."Account No" := Loans."Member No.";
//                     PayRecLines.Validate(PayRecLines."Account No");
//                     PayRecLines.Description := "Client Name" + ' ' + "Member No.";
//                     PayRecLines.Amount := ROUND("Approved Amount", 1.0);
//                     PayRecLines.Validate(PayRecLines.Amount);
//                     PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                     PayRecLines."Loan No." := Loans."Loan No.";
//                     PayRecLines."Loan Product Type Code" := Loans."Loan Product Type";

//                     if PayRecLines.Amount <> 0 then
//                         PayRecLines.Insert;

//                     /////
//                     //Offsetting Other Loans
//                     if "Top Up Amount" > 0 then begin
//                         LoanTopUp.Reset;
//                         LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                         if LoanTopUp.Find('-') then begin
//                             repeat
//                                 //Principle
//                                 PayRecLines.Init;
//                                 PayRecLines.No := PayRec.No;
//                                 PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                                 PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                                 PayRecLines."Account No" := LoanRec."Member No.";
//                                 PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                                 PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                                 PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                                 PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                                 PayRecLines.Amount := ROUND(LoanTopUp."Principle Top Up", 1.0) * -1;
//                                 PayRecLines.Validate(PayRecLines.Amount);
//                                 PayRec."Activity Code" := DBranch;
//                                 PayRec.Validate(PayRec."Activity Code");
//                                 if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                     if PayRecLines.Amount <> 0 then
//                                         PayRecLines.Insert(true);
//                             until LoanTopUp.Next = 0;
//                         end;
//                     end;

//                     //interst in loan ofsetted
//                     if "Top Up Amount" > 0 then begin
//                         LoanTopUp.Reset;
//                         LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                         if LoanTopUp.Find('-') then begin
//                             repeat
//                                 //Principle
//                                 PayRecLines.Init;
//                                 PayRecLines.No := PayRec.No;
//                                 PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                                 PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                                 PayRecLines."Account No" := LoanRec."Member No.";
//                                 PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                                 PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                                 PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                                 PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                                 PayRecLines.Amount := ROUND(LoanTopUp."Principle Top Up", 1.0) * -1;
//                                 BatchTopUpAmountINT := BatchTopUpAmountINT + PayRecLines.Amount * -1;
//                                 PayRecLines.Validate(PayRecLines.Amount);
//                                 PayRec."Activity Code" := DBranch;
//                                 PayRec.Validate(PayRec."Activity Code");
//                                 if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                     if PayRecLines.Amount <> 0 then
//                                         PayRecLines.Insert(true);
//                             until LoanTopUp.Next = 0;
//                         end;
//                     end;


//                     //Commision on Loan Offsetted

//                     if "Top Up Amount" > 0 then begin
//                         LoanTopUp.Reset;
//                         LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                         LoanTopUp.SetRange(LoanTopUp."Charge Top Up Commission", true);
//                         if LoanTopUp.Find('-') then begin
//                             repeat
//                                 if LoanType.Get("Loan Product Type") then begin
//                                     if LoanTopUp."Charge Top Up Commission" = true then
//                                         if LoanType."Top Up Commision" > 0 then begin
//                                             PayRecLines.Init;
//                                             PayRecLines.No := PayRec.No;
//                                             PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                                             PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                                             PayRecLines."Account No" := LoanRec."Member No.";
//                                             PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                                             PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                                             PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                                             PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                                             TopUpComm := (LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision" / 100);
//                                             BatchTopUpComm := (BatchTopUpComm + TopUpComm);
//                                             PayRecLines.Amount := ROUND(BatchTopUpComm, 1.0) * -1;
//                                             PayRecLines.Validate(PayRecLines.Amount);
//                                             PayRec."Activity Code" := DBranch;
//                                             PayRec.Validate(PayRec."Activity Code");
//                                         end;
//                                 end;
//                                 if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                     if PayRecLines.Amount <> 0 then
//                                         PayRecLines.Insert(true);
//                             until LoanTopUp.Next = 0;
//                         end;
//                     end;


//                     //Commision On Processing Fee
//                     if "Top Up Amount" > 0 then begin
//                         LoanTopUp.Reset;
//                         LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                         if LoanTopUp.Find('-') then begin
//                             repeat
//                                 if LoanType.Get("Loan Product Type") then begin
//                                     if LoanTopUp."Charge Top Up Commission" = true then
//                                         if LoanType."Top Up Commision" > 0 then begin
//                                             PayRecLines.Init;
//                                             PayRecLines.No := PayRec.No;
//                                             PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                                             PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                                             PayRecLines."Account No" := LoanRec."Member No.";
//                                             PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                                             PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                                             PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                                             PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                                             //TopUpComm:=(LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision"/100);
//                                             //BatchTopUpComm:=(BatchTopUpComm+TopUpComm);
//                                             PayRecLines.Amount := ROUND(500, 1.0) * -1;
//                                             "Processing Charges" := "Processing Charges" + PayRecLines.Amount * -1;
//                                             PayRecLines.Validate(PayRecLines.Amount);
//                                             PayRec."Activity Code" := DBranch;
//                                             PayRec.Validate(PayRec."Activity Code");
//                                         end;
//                                 end;
//                                 if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                     if PayRecLines.Amount <> 0 then
//                                         PayRecLines.Insert(true);
//                             until LoanTopUp.Next = 0;
//                         end;
//                     end;


//                     //




//                     //Product Charges
//                     PChargesx.Reset;
//                     PChargesx.SetRange(PChargesx."Peroid In Months", Installments);
//                     if PChargesx.Find('-') then begin
//                         repeat
//                             PayRecLines.Init;
//                             PayRecLines.No := PayRec.No;
//                             PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                             PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                             PayRecLines."Account No" := LoanRec."Member No.";
//                             PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                             PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//                             PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                             PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                             if "charge Insurance" = false then begin
//                                 if ("Approved Amount" * PChargesx."Rate %" / 1000) < 20 then
//                                     PayRecLines.Amount := -20
//                                 else
//                                     PayRecLines.Amount := (ROUND("Approved Amount" * PChargesx."Rate %" / 1000, 1.0) * -1);
//                             end;
//                             BatchTopUpAmountINT := BatchTopUpAmountINT + PayRecLines.Amount * -1;
//                             PayRecLines.Validate(PayRecLines.Amount);
//                             PayRec."Activity Code" := DBranch;
//                             PayRec.Validate(PayRec."Activity Code");
//                             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                 if PayRecLines.Amount <> 0 then
//                                     PayRecLines.Insert(true);
//                             TCharges := TCharges + (PayRecLines.Amount) * -1;
//                         until PChargesx.Next = 0;
//                         //END;

//                         // END;


//                     end;
//                 until PayRec.Next = 0;
//                 PayRec.Insert;
//             end;
//         end;
//     end;


//     procedure PostFosaLoan(var FosaLoan: Record Loans)
//     var
//         FosaSetup: Record "Fosa Setup";
//         PCharges: Record "Product Charges";
//         Loans2: Record Loans;
//         MinAmnt: Decimal;
//         MaxAmnt: Decimal;
//         LoanRec: Record Loans;
//     begin
//         FosaSetup.Reset;
//         if FosaSetup.Find('-') then begin

//             with FosaLoan do begin

//                 GenSetUp.Get();
//                 TCharges := 0;
//                 TopUpComm := 0;

//                 DActivity := '';
//                 DBranch := '';
//                 if Cust.Get("Member No.") then begin
//                     DActivity := Cust."Global Dimension 1 Code";
//                     DBranch := Cust."Global Dimension 2 Code";
//                 end;

//                 TestField("Account No");
//                 TestField("Requested Amount");
//                 TestField("Loan Types");

//                 if "Loan Status" <> "loan status"::Disbursement then
//                     Error('Loan status must be Approved for you to post Loan');

//                 if Posted = true then
//                     Error('Loan has already been posted.');

//                 CalcFields("Top Up Amount");
//                 if "Top Up Amount" = 0 then begin
//                     LoanApp.Reset;
//                     LoanApp.SetRange(LoanApp."Member No.", "Member No.");
//                     LoanApp.SetRange(LoanApp."Loan Product Type", "Loan Product Type");
//                     LoanApp.SetRange(LoanApp.Posted, true);
//                     /*IF LoanApp.FIND('-') THEN BEGIN
//                         REPEAT
//                         LoanApp.CALCFIELDS(LoanApp."Outstanding Balance");
//                             IF LoanApp."Outstanding Balance" > 0 THEN
//                             ERROR('Account holder has an oustanding similar loan product.');
//                         UNTIL LoanApp.NEXT = 0;
//                     END;*/
//                 end;


//                 if Confirm('Are you sure you want to post this loan?', true) = false then
//                     exit;

//                 GenJournalLine.Reset;
//                 GenJournalLine.SetRange("Journal Template Name", FosaSetup."Loans Template");
//                 GenJournalLine.SetRange("Journal Batch Name", FosaLoan."Loan No.");
//                 GenJournalLine.DeleteAll;

//                 if "Loan Disbursement Date" = 0D then
//                     Error('You must specify Loan Disbursement Date');
//                 RunningDate := "Loan Disbursement Date";

//                 //Generate and post Approved Loan Amount
//                 if not GenBatch.Get(FosaSetup."Loans Template", FosaLoan."Loan No.") then begin
//                     GenBatch.Init;
//                     GenBatch."Journal Template Name" := FosaSetup."Loans Template";
//                     GenBatch.Name := FosaLoan."Loan No.";
//                     GenBatch.Insert;
//                 end;



//                 if ((FosaLoan."Class Code" <> FosaSetup."Staff Class")) then
//                     if ((FosaLoan."Class Code" <> FosaSetup."Share Holders Class")) then begin
//                         PCharges.Reset;
//                         PCharges.SetRange(PCharges."Product Code", "Loan Product Type");
//                         if PCharges.Find('-') then begin
//                             repeat

//                                 PCharges.TestField(PCharges."G/L Account");
//                                 MinAmnt := PCharges."Min Amount";
//                                 MaxAmnt := PCharges."Max Amount";

//                                 LineNo := LineNo + 10000;
//                                 GenJournalLine.Init;
//                                 GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                 GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                 GenJournalLine."Line No." := LineNo;
//                                 GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
//                                 GenJournalLine."Account No." := "Account No";
//                                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                                 GenJournalLine."Document No." := "Loan No.";
//                                 GenJournalLine."Posting Date" := "Issued Date";
//                                 GenJournalLine.Description := PCharges.Description;//+' - '+FosaLoan."Account No";

//                                 //************************************
//                                 //AND ("Approved Amount" > MinAmnt)   (MinAmnt > 0)
//                                 if (("Approved Amount" > MinAmnt) and ("Approved Amount" <= MaxAmnt)) then begin
//                                     if (PCharges."Use Perc" and (PCharges.IsInsurance = false)) then begin
//                                         GenJournalLine.Amount := ("Approved Amount" * PCharges.Percentage / 100) + PCharges.Amount;
//                                     end else
//                                         GenJournalLine.Amount := PCharges.Amount;

//                                     if (("Approved Amount" > 5000) and (Installments > 12) and ("Loan Types" = "loan types"::"Personal Loan")) then begin
//                                         if (PCharges.IsInsurance and (PCharges."Short term Insuarance" = false)) then
//                                             GenJournalLine.Amount := ("Approved Amount" * PCharges.Percentage / 100) * Installments / 12;
//                                     end else begin
//                                         if (PCharges.IsInsurance and (PCharges."Short term Insuarance" = true)) then
//                                             GenJournalLine.Amount := ("Approved Amount" * PCharges.Percentage / 100) * Installments / 12;
//                                     end;
//                                 end;


//                                 if (MinAmnt = 0) and (MaxAmnt = 0) then begin
//                                     if PCharges."Use Perc" = true then begin
//                                         GenJournalLine.Amount := ("Approved Amount" * PCharges.Percentage / 100) + PCharges.Amount;
//                                     end else begin
//                                         GenJournalLine.Amount := PCharges.Amount;
//                                     end;
//                                 end;


//                                 GenJournalLine."Loan No" := "Loan No.";
//                                 GenJournalLine.Validate(GenJournalLine.Amount);
//                                 GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                                 GenJournalLine."Bal. Account No." := PCharges."G/L Account";
//                                 GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                 GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                 if GenJournalLine.Amount <> 0 then
//                                     GenJournalLine.Insert;
//                             until PCharges.Next = 0;

//                         end;
//                     end;


//                 //IF Top Up
//                 if "Top Up Amount" > 0 then begin
//                     LineNo := LineNo + 10000;

//                     GenJournalLine.Init;
//                     GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                     GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                     GenJournalLine."Line No." := LineNo;
//                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Vendor;
//                     GenJournalLine."Account No." := "Account No";
//                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                     GenJournalLine."Document No." := "Loan No.";
//                     GenJournalLine."Posting Date" := "Issued Date";
//                     GenJournalLine.Description := "Loan Product Type Name" + ' Top Up';
//                     GenJournalLine.Amount := "Approved Amount" * -1;
//                     GenJournalLine."External Document No." := "Cheque No.";
//                     GenJournalLine.Validate(GenJournalLine.Amount);
//                     GenJournalLine."Loan No" := "Loan No.";
//                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                     if GenJournalLine.Amount <> 0 then
//                         GenJournalLine.Insert;

//                 end;



//                 if LoanType.Get("Loan Product Type") then begin
//                     if LoanType.Action = LoanType.Action::"Off Set Commitments" then begin
//                         LineNo := LineNo + 10000;

//                         GenJournalLine.Init;
//                         GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                         GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                         GenJournalLine."Line No." := LineNo;
//                         GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
//                         GenJournalLine."Account No." := LoanType."BOSA Account";
//                         GenJournalLine.Validate("Account No.");
//                         GenJournalLine."Document No." := "Loan No.";
//                         GenJournalLine."Posting Date" := "Issued Date";
//                         GenJournalLine.Description := 'Loan Off Set - ' + LoanTopUp."Loan Top Up";
//                         GenJournalLine.Amount := ("Approved Amount" - "Personal Loan Off-set") * -1;
//                         GenJournalLine."External Document No." := "Cheque No.";
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                         GenJournalLine."Loan No" := "Loan No.";
//                         GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                         GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                         if GenJournalLine.Amount <> 0 then
//                             GenJournalLine.Insert;

//                         //Personal Loan Off Set
//                         LineNo := LineNo + 10000;
//                         GenJournalLine.Init;
//                         GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                         GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                         GenJournalLine."Line No." := LineNo;
//                         GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
//                         /*GenJournalLine."Account No.":=LoanType."BOSA Personal Loan Account";*///Check Why it is removed
//                         GenJournalLine.Validate("Account No.");
//                         GenJournalLine."Document No." := "Loan No.";
//                         GenJournalLine."Posting Date" := "Issued Date";
//                         GenJournalLine.Description := 'Loan Off Set - ' + LoanTopUp."Loan Top Up";
//                         GenJournalLine.Amount := "Personal Loan Off-set" * -1;
//                         GenJournalLine."External Document No." := "Cheque No.";
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                         GenJournalLine."Loan No" := "Loan No.";
//                         GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                         GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                         if GenJournalLine.Amount <> 0 then
//                             GenJournalLine.Insert;

//                     end else begin
//                         ////////////////////////////////////////////
//                         if "Top Up Amount" > 0 then begin
//                             LoanTopUp.Reset;
//                             LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                             if LoanTopUp.Find('-') then begin
//                                 repeat
//                                     //Principle
//                                     LineNo := LineNo + 10000;
//                                     GenJournalLine.Init;
//                                     GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                     GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                     GenJournalLine."Line No." := LineNo;
//                                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                     GenJournalLine."Account No." := "Member No.";
//                                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                                     GenJournalLine."Document No." := "Loan No.";
//                                     GenJournalLine."Posting Date" := "Issued Date";
//                                     GenJournalLine.Description := 'Off Set By - ' + "Loan No.";
//                                     GenJournalLine.Amount := LoanTopUp."Principle Top Up" * -1;
//                                     GenJournalLine."External Document No." := "Cheque No.";
//                                     GenJournalLine.Validate(GenJournalLine.Amount);
//                                     GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Loan Repayment";
//                                     GenJournalLine."Loan No" := LoanTopUp."Loan Top Up";
//                                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                     if GenJournalLine.Amount <> 0 then
//                                         GenJournalLine.Insert;

//                                     LineNo := LineNo + 10000;
//                                     GenJournalLine.Init;
//                                     GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                     GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                     GenJournalLine."Line No." := LineNo;
//                                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Vendor;
//                                     GenJournalLine."Account No." := "Account No";
//                                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                                     GenJournalLine."Document No." := "Loan No.";
//                                     GenJournalLine."Posting Date" := "Issued Date";
//                                     Loans2.Reset;
//                                     Loans2.SetRange(Loans2."Loan No.", LoanTopUp."Loan Top Up");
//                                     if Loans2.Find('-') then
//                                         GenJournalLine.Description := CopyStr('Off Set of oustanding ' + Loans2."Loan Product Type Name", 1, 50);
//                                     GenJournalLine.Amount := LoanTopUp."Principle Top Up";
//                                     GenJournalLine."External Document No." := "Cheque No.";
//                                     GenJournalLine.Validate(GenJournalLine.Amount);
//                                     GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Loan Repayment";
//                                     GenJournalLine."Loan No" := LoanTopUp."Loan Top Up";
//                                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                     if GenJournalLine.Amount <> 0 then
//                                         GenJournalLine.Insert;


//                                     //Interest (Reversed if top up)
//                                     if LoanType.Get("Loan Product Type") then begin
//                                         LineNo := LineNo + 10000;
//                                         GenJournalLine.Init;
//                                         GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                         GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                         GenJournalLine."Line No." := LineNo;
//                                         GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                         GenJournalLine."Account No." := "Member No.";
//                                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                                         GenJournalLine."Document No." := "Loan No.";
//                                         GenJournalLine."Posting Date" := "Issued Date";
//                                         Loans2.Reset;
//                                         Loans2.SetRange(Loans2."Loan No.", LoanTopUp."Loan Top Up");
//                                         if Loans2.Find('-') then
//                                             GenJournalLine.Description := CopyStr('Interest Due reversed on top up ' + Loans2."Loan Product Type Name", 1, 50);

//                                         //GenJournalLine.Description:='Interest Due reversed on top up ' + "Loan Product Type";
//                                         GenJournalLine.Amount := LoanTopUp."Interest Top Up" * -1;
//                                         GenJournalLine."External Document No." := "Cheque No.";
//                                         GenJournalLine.Validate(GenJournalLine.Amount);
//                                         GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                                         GenJournalLine."Bal. Account No." := LoanType."Accrued Interest Account";
//                                         GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
//                                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
//                                         GenJournalLine."Loan No" := LoanTopUp."Loan Top Up";
//                                         GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                         GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                         if GenJournalLine.Amount <> 0 then
//                                             GenJournalLine.Insert;


//                                     end;

//                                     //Commision
//                                     if LoanType.Get("Loan Product Type") then begin
//                                         if LoanType."Top Up Commision" > 0 then begin
//                                             LineNo := LineNo + 10000;
//                                             GenJournalLine.Init;
//                                             GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                             GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                             GenJournalLine."Line No." := LineNo;
//                                             GenJournalLine."Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                                             GenJournalLine."Account No." := LoanType."Top Up Commision Account";
//                                             GenJournalLine.Validate(GenJournalLine."Account No.");
//                                             GenJournalLine."Document No." := "Loan No.";
//                                             GenJournalLine."Posting Date" := "Issued Date";
//                                             GenJournalLine.Description := 'Commision on Loan Top Up';
//                                             TopUpComm := (LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision" / 100);
//                                             GenJournalLine.Amount := TopUpComm * -1;
//                                             GenJournalLine."External Document No." := "Cheque No.";
//                                             GenJournalLine.Validate(GenJournalLine.Amount);
//                                             GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                             GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                             if GenJournalLine.Amount <> 0 then
//                                                 GenJournalLine.Insert;


//                                             LineNo := LineNo + 10000;
//                                             GenJournalLine.Init;
//                                             GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                                             GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                                             GenJournalLine."Line No." := LineNo;
//                                             GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Vendor;
//                                             GenJournalLine."Account No." := "Account No";
//                                             GenJournalLine.Validate(GenJournalLine."Account No.");
//                                             GenJournalLine."Document No." := "Loan No.";
//                                             GenJournalLine."Posting Date" := "Issued Date";
//                                             GenJournalLine.Description := 'Commision on Loan Top Up';
//                                             GenJournalLine.Amount := TopUpComm;
//                                             GenJournalLine."External Document No." := "Cheque No.";
//                                             GenJournalLine.Validate(GenJournalLine.Amount);
//                                             GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                             GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                             if GenJournalLine.Amount <> 0 then
//                                                 GenJournalLine.Insert;




//                                         end;
//                                     end;



//                                 until LoanTopUp.Next = 0;

//                             end;



//                             ////////////////////////////////////////////
//                         end else begin
//                             LineNo := LineNo + 10000;

//                             GenJournalLine.Init;
//                             GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                             GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                             GenJournalLine."Line No." := LineNo;
//                             GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
//                             GenJournalLine."Account No." := "Account No";
//                             GenJournalLine.Validate(GenJournalLine."Account No.");
//                             GenJournalLine."Document No." := "Loan No.";
//                             GenJournalLine."Posting Date" := "Issued Date";
//                             GenJournalLine.Description := "Loan Product Type Name";
//                             GenJournalLine.Amount := "Approved Amount" * -1;
//                             GenJournalLine."External Document No." := "Cheque No.";
//                             GenJournalLine.Validate(GenJournalLine.Amount);
//                             GenJournalLine."Loan No" := "Loan No.";
//                             GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                             GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                             if GenJournalLine.Amount <> 0 then
//                                 GenJournalLine.Insert;

//                         end;
//                     end;
//                 end;

//                 //Principle Loan Amount
//                 LineNo := LineNo + 10000;
//                 GenJournalLine.Init;
//                 GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                 GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                 GenJournalLine."Line No." := LineNo;
//                 GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
//                 GenJournalLine."Account No." := "Member No.";
//                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                 GenJournalLine."Document No." := "Loan No.";
//                 GenJournalLine."Posting Date" := "Issued Date";
//                 GenJournalLine.Description := 'Principal Amount';
//                 GenJournalLine.Amount := "Approved Amount";
//                 GenJournalLine.Validate(GenJournalLine.Amount);
//                 GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                 GenJournalLine."Loan No" := "Loan No.";
//                 GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                 GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                 if GenJournalLine.Amount <> 0 then
//                     GenJournalLine.Insert;


//                 /*
//                 //IF Top Up
//                 IF "Top Up Amount" > 0 THEN BEGIN
//                     LineNo:=LineNo+10000;
//                     GenJournalLine.INIT;
//                     GenJournalLine."Journal Template Name":=FosaSetup."Loans Template";
//                     GenJournalLine."Journal Batch Name":=FosaLoan."Loan  No.";
//                     GenJournalLine."Line No.":=LineNo;
//                     GenJournalLine."Account Type":=GenJournalLine."Account Type"::Vendor;
//                     GenJournalLine."Account No.":="Account No";
//                     GenJournalLine.VALIDATE(GenJournalLine."Account No.");
//                     GenJournalLine."Document No.":="Loan  No.";
//                     GenJournalLine."Posting Date":="Issued Date";
//                     GenJournalLine.Description:="Loan Product Type Name" + ' Top Up - '+LoanTopUp."Loan Top Up";
//                     GenJournalLine.Amount:="Approved Amount"*-1;
//                     GenJournalLine."External Document No.":="Cheque No.";
//                     GenJournalLine.VALIDATE(GenJournalLine.Amount);
//                     GenJournalLine."Loan No":="Loan  No.";
//                     GenJournalLine."Shortcut Dimension 1 Code":=DActivity;
//                     GenJournalLine."Shortcut Dimension 2 Code":=DBranch;
//                     GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
//                     GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
//                     IF GenJournalLine.Amount<>0 THEN
//                     GenJournalLine.INSERT;

//                 END;
//                 */

//                 //Pass interest due entry for the month
//                 GenJournalLine.Init;
//                 GenJournalLine."Journal Template Name" := FosaSetup."Loans Template";
//                 GenJournalLine."Journal Batch Name" := FosaLoan."Loan No.";
//                 GenJournalLine."Line No." := 10000 + GenJournalLine."Line No.";
//                 GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
//                 GenJournalLine."Account No." := "Member No.";
//                 GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Due";
//                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                 GenJournalLine."Document No." := "Loan No.";
//                 GenJournalLine."Posting Date" := "Issued Date";
//                 GenJournalLine.Description := 'Interest Due';
//                 GenJournalLine.Amount := ("Approved Amount" * Interest) / 1200;
//                 GenJournalLine.Validate(GenJournalLine.Amount);
//                 GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
//                 if LoanType.Get("Loan Product Type") then
//                     GenJournalLine."Bal. Account No." := LoanType."Received Interest Account";
//                 GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
//                 GenJournalLine."Loan No" := "Loan No.";
//                 GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                 GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");

//                 if GenJournalLine.Amount <> 0 then
//                     GenJournalLine.Insert;

//                 //Post New
//                 GenJournalLine.Reset;
//                 GenJournalLine.SetRange("Journal Template Name", FosaSetup."Loans Template");
//                 GenJournalLine.SetRange("Journal Batch Name", FosaLoan."Loan No.");
//                 if GenJournalLine.Find('-') then begin
//                     Codeunit.Run(Codeunit::"Gen. Jnl.-Post B 1", GenJournalLine);


//                     if "Top Up Amount" > 0 then begin
//                         LoanTopUp.Reset;
//                         LoanTopUp.SetRange(LoanTopUp."Loan No.", "Loan No.");
//                         if LoanTopUp.Find('-') then begin
//                             LoanToped := LoanTopUp."Loan Top Up";

//                             Loans2.Reset;
//                             Loans2.SetRange(Loans2."Loan No.", LoanToped);
//                             if Loans2.Find('-') then begin
//                                 Loans2."Fully Paid" := true;
//                                 Loans2.Modify;
//                             end;
//                         end;
//                     end;


//                 end;


//                 Posted := true;
//                 Modify;


//                 Message('Loan posted successfully.');
//             end;


//         end;

//     end;


//     procedure RecoverLoanFosa(var Acc: Record Vendor)
//     begin
//         with Acc do begin

//             OBalance := 0;
//             OInterest := 0;

//             TestField("BOSA Account No");

//             if Cust.Get("BOSA Account No") then begin
//                 if (Cust."Current Shares" * -1) > 0 then
//                     Error('Please recover the loans from the members shares before recovering from gurantors.');
//             end;

//             if Confirm('Are you absolutely sure you want to recover the loans from the guarantors as loans?') = false then
//                 exit;

//             //delete journal line
//             Gnljnline.Reset;
//             Gnljnline.SetRange("Journal Template Name", 'GENERAL');
//             Gnljnline.SetRange("Journal Batch Name", 'LOANS');
//             Gnljnline.DeleteAll;
//             //end of deletion

//             TotalRecovered := 0;

//             DActivity := "Global Dimension 1 Code";
//             DBranch := "Global Dimension 2 Code";

//             LoansR.Reset;
//             LoansR.SetRange(LoansR."Account No", "No.");
//             LoansR.SetRange(LoansR.Source, LoansR.Source::FOSA);
//             if LoansR.Find('-') then begin
//                 repeat
//                     LoansR.CalcFields(LoansR."Outstanding Balance", LoansR."Oustanding Interest", LoansR."No. Of Guarantors-FOSA");
//                     if LoansR."Outstanding Balance" > 0 then
//                         OBalance := OBalance + LoansR."Outstanding Balance";
//                     if LoansR."Oustanding Interest" > 0 then
//                         OInterest := OInterest + LoansR."Oustanding Interest";

//                 until LoansR.Next = 0;
//             end;



//             LoansR.Reset;
//             LoansR.SetRange(LoansR."Account No", "No.");
//             LoansR.SetRange(LoansR.Source, LoansR.Source::FOSA);
//             if LoansR.Find('-') then begin
//                 repeat
//                     LoansR.CalcFields(LoansR."Outstanding Balance", LoansR."Oustanding Interest", LoansR."No. Of Guarantors-FOSA");
//                     if LoansR."Outstanding Balance" > 0 then
//                         OBalance := OBalance + LoansR."Outstanding Balance";
//                     if LoansR."Oustanding Interest" > 0 then
//                         OInterest := OInterest + LoansR."Oustanding Interest";
//                     //No Shares recovery
//                     if LoansR."Recovered Balance" = 0 then begin
//                         LoansR."Recovered Balance" := LoansR."Outstanding Balance";
//                     end;

//                     LoansR."Guarantor Amount" := LoansR."Outstanding Balance";
//                     LoansR.Modify;


//                     if ((LoansR."Outstanding Balance" + LoansR."Oustanding Interest") > 0) and (LoansR."No. Of Guarantors-FOSA" > 0) then begin
//                         DefaulterType := 'DFTL FOSA';

//                         //LoanAllocation:=ROUND((LoansR."Outstanding Balance"+LoansR."Oustanding Interest")/LoansR."No. Of Guarantors-FOSA",0.01);
//                         LoanAllocation := ROUND((LoansR."Outstanding Balance") / LoansR."No. Of Guarantors-FOSA", 0.01) +
//                                         ROUND((LoansR."Oustanding Interest") / LoansR."No. Of Guarantors-FOSA", 0.01);

//                         LGurantors.Reset;
//                         LGurantors.SetRange(LGurantors."Loan No", LoansR."Loan No.");
//                         //LGurantors.SETRANGE(LGurantors.Substituted,FALSE);
//                         if LGurantors.Find('-') then begin
//                             repeat

//                                 Loans.Reset;
//                                 Loans.SetRange(Loans."Account No", LGurantors."Account No.");
//                                 Loans.SetRange(Loans."Loan Product Type", DefaulterType);
//                                 Loans.SetRange(Loans.Posted, false);
//                                 if Loans.Find('-') then
//                                     Loans.DeleteAll;


//                                 Loans.Init;
//                                 Loans."Loan No." := '';
//                                 Loans.Source := Loans.Source::FOSA;
//                                 Loans."Account No" := LGurantors."Account No.";
//                                 Loans."Loan Product Type" := DefaulterType;
//                                 Loans.Validate(Loans."Account No");
//                                 Loans."Application Date" := Today;
//                                 Loans.Validate(Loans."Loan Product Type");
//                                 if (LoansR."Approved Amount" > 0) and (LoansR.Installments > 0) then
//                                     Loans.Installments := ROUND((LoansR."Outstanding Balance")
//                                                               / (LoansR."Approved Amount" / LoansR.Installments), 1, '>');

//                                 //IF LoansR."Loan Repayment" > 0 THEN
//                                 //Loans.Installments:=ROUND((LoansR."Outstanding Balance")
//                                 //                          /(LoansR."Loan Repayment"-((LoansR."Outstanding Balance"*LoansR.Interest)/1200)),1,'>');
//                                 Loans."Requested Amount" := LoanAllocation;
//                                 Loans."Approved Amount" := LoanAllocation;
//                                 Loans.Validate(Loans."Approved Amount");
//                                 Loans."Loan Status" := Loans."loan status"::Disbursement;
//                                 Loans."Issued Date" := Today;
//                                 Loans."Loan Disbursement Date" := Today;
//                                 if Vend.Get(LGurantors."Account No.") then
//                                     Loans."BOSA No" := Vend."BOSA Account No";
//                                 //Loans."Recovered Loan":=LoansR."Loan  No.";
//                                 Loans.Insert(true);

//                                 Loans.Reset;
//                                 Loans.SetRange(Loans."Account No", LGurantors."Account No.");
//                                 Loans.SetRange(Loans."Loan Product Type", DefaulterType);
//                                 Loans.SetRange(Loans.Posted, false);
//                                 if Loans.Find('-') then begin

//                                     LineNo := LineNo + 10000;

//                                     GenJournalLine.Init;
//                                     GenJournalLine."Journal Template Name" := 'GENERAL';
//                                     GenJournalLine."Journal Batch Name" := 'LOANS';
//                                     GenJournalLine."Line No." := LineNo;
//                                     GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                                     GenJournalLine."Posting Date" := Today;
//                                     GenJournalLine."External Document No." := LoansR."Loan No.";
//                                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                     GenJournalLine."Account No." := LGurantors."Account No.";
//                                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                                     GenJournalLine.Description := 'Principle Amount';
//                                     GenJournalLine.Amount := LoanAllocation;
//                                     GenJournalLine.Validate(GenJournalLine.Amount);
//                                     GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                                     GenJournalLine."Loan No" := Loans."Loan No.";
//                                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                     if GenJournalLine.Amount <> 0 then
//                                         GenJournalLine.Insert;


//                                     Loans.Posted := true;
//                                     Loans.Modify;


//                                     //Off Set BOSA Loans

//                                     //Principle
//                                     LineNo := LineNo + 10000;

//                                     GenJournalLine.Init;
//                                     GenJournalLine."Journal Template Name" := 'GENERAL';
//                                     GenJournalLine."Journal Batch Name" := 'LOANS';
//                                     GenJournalLine."Line No." := LineNo;
//                                     GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                                     GenJournalLine."Posting Date" := Today;
//                                     GenJournalLine."External Document No." := Loans."Loan No.";
//                                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                     GenJournalLine."Account No." := LoansR."Member No.";
//                                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                                     GenJournalLine.Description := 'Cleared by Guarantor loan: ' + Loans."Loan No.";
//                                     GenJournalLine.Amount := -ROUND(LoansR."Outstanding Balance" / LoansR."No. Of Guarantors-FOSA", 0.01);
//                                     GenJournalLine.Validate(GenJournalLine.Amount);
//                                     GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Loan Repayment";
//                                     GenJournalLine."Loan No" := LoansR."Loan No.";
//                                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                     if GenJournalLine.Amount <> 0 then
//                                         GenJournalLine.Insert;


//                                     //Interest
//                                     LineNo := LineNo + 10000;

//                                     GenJournalLine.Init;
//                                     GenJournalLine."Journal Template Name" := 'GENERAL';
//                                     GenJournalLine."Journal Batch Name" := 'LOANS';
//                                     GenJournalLine."Line No." := LineNo;
//                                     GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                                     GenJournalLine."Posting Date" := Today;
//                                     GenJournalLine."External Document No." := Loans."Loan No.";
//                                     GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                     GenJournalLine."Account No." := LoansR."Member No.";
//                                     GenJournalLine.Validate(GenJournalLine."Account No.");
//                                     GenJournalLine.Description := 'Cleared by Guarantor loan: ' + Loans."Loan No.";
//                                     GenJournalLine.Amount := -ROUND(LoansR."Oustanding Interest" / LoansR."No. Of Guarantors-FOSA", 0.01);
//                                     GenJournalLine.Validate(GenJournalLine.Amount);
//                                     GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
//                                     GenJournalLine."Loan No" := LoansR."Loan No.";
//                                     GenJournalLine."Shortcut Dimension 1 Code" := DActivity;
//                                     GenJournalLine."Shortcut Dimension 2 Code" := DBranch;
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                     GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                     if GenJournalLine.Amount <> 0 then
//                                         GenJournalLine.Insert;


//                                     LoansR.Advice := true;
//                                     LoansR.Modify;

//                                 end;

//                             until LGurantors.Next = 0;
//                         end;
//                     end;

//                 until LoansR.Next = 0;
//             end;


//             //"Defaulted Loans Recovered":=TRUE;
//             Modify;


//             //Post
//             GenJournalLine.Reset;
//             GenJournalLine.SetRange("Journal Template Name", 'GENERAL');
//             GenJournalLine.SetRange("Journal Batch Name", 'LOANS');
//             if GenJournalLine.Find('-') then begin
//                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post B", GenJournalLine);
//             end;



//             Message('Loan recovery posted successfully.');

//         end;
//     end;


//     procedure RecoverLoanBosa(var Memb: Record Customer)
//     begin
//         with Memb do begin

//             BosaSetup.Get;

//             CalcFields("Deposit Contribution");
//             if Abs("Deposit Contribution") > 0 then
//                 Error(Text001);
//             if Confirm(Text002) = false then
//                 exit;



//             //delete journal line
//             Gnljnline.Reset;
//             Gnljnline.SetRange("Journal Template Name", BosaSetup."Payments Journal Template");
//             Gnljnline.SetRange("Journal Batch Name", 'LOANS');
//             Gnljnline.DeleteAll;
//             //end of deletion

//             TotalRecovered := 0;
//             DActivity := "Global Dimension 1 Code";
//             DBranch := "Global Dimension 2 Code";
//             CalcFields("Oustanding Balance", "Accrued Interest", "Deposit Contribution");



//             LoansR.Reset;
//             LoansR.SetRange(LoansR."Member No.", "No.");
//             LoansR.SetRange(LoansR.Source, LoansR.Source::BOSA);
//             if LoansR.Find('-') then begin
//                 repeat

//                     LoansR.CalcFields(LoansR."Outstanding Balance", LoansR."Oustanding Interest", LoansR."No. Of Guarantors");
//                     if ((LoansR."Outstanding Balance" + LoansR."Oustanding Interest") > 0) and (LoansR."No. Of Guarantors" > 0) then begin



//                         LGuran.Reset;
//                         LGuran.SetRange(LGuran."Loan No", LoansR."Loan No.");
//                         LGuran.SetRange(LGuran.Substituted, false);
//                         if LGuran.Find('-') then begin

//                             repeat
//                                 LoanAllocation := ((LGuran."Amount Guaranteed" / LoansR."Approved Amount")
//                                 * LoansR."Outstanding Balance");
//                                 Message(Text003, LoanAllocation);

//                                 Loans.Reset;
//                                 Loans.SetRange("Member No.", LGuran."Member No");
//                                 Loans.SetRange(Loans.Posted, false);
//                                 if Loans.Find('-') then
//                                     Loans.DeleteAll;


//                                 Loans."Loan No." := '';
//                                 Loans.Source := Loans.Source::BOSA;
//                                 Loans."Member No." := LGuran."Member No";
//                                 Loans.Validate("Member No.");
//                                 if LoanG.Get(LGuran."Loan No") then
//                                     if LoanType.Get(LGuran."Loan No") then
//                                         Loans."Loan Product Type" := LoanType.Code;
//                                 Loans."Application Date" := Today;
//                                 Loans.Validate("Loan Product Type");
//                                 Loans."Requested Amount" := LoanAllocation;
//                                 Loans.Validate(Loans."Requested Amount");
//                                 Loans."Approved Amount" := LoanAllocation;
//                                 Loans."Loan Status" := Loans."loan status"::Disbursement;
//                                 Loans.Status := Loans.Status::Approved;
//                                 Loans."Issued Date" := Today;
//                                 Loans."Loan Disbursement Date" := Today;
//                                 Loans."Batch No." := "Batch No.";
//                                 Loans.Insert(true);

//                                 LoanNoRecov := Loans."Loan No.";


//                                 LineNo := LineNo + 10000;
//                                 GenJournalLine.Init;
//                                 GenJournalLine."Journal Template Name" := BosaSetup."Payments Journal Template";
//                                 GenJournalLine."Journal Batch Name" := 'LOANS';
//                                 GenJournalLine."Line No." := LineNo;
//                                 GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                                 GenJournalLine."Posting Date" := Today;
//                                 GenJournalLine."External Document No." := LoansR."Loan No.";
//                                 GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                                 GenJournalLine."Account No." := LGuran."Member No";
//                                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                                 GenJournalLine.Description := 'Principle Amount';
//                                 GenJournalLine.Amount := LoanAllocation;
//                                 GenJournalLine.Validate(GenJournalLine.Amount);
//                                 GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::Loan;
//                                 GenJournalLine."Sacco Transaction Type" := GenJournalLine."sacco transaction type"::Loan;
//                                 GenJournalLine."Loan No" := Loans."Loan No.";
//                                 if LoanType.Get(Loans."Loan Product Type") then
//                                     GenJournalLine."Posting Group" := LoanType."Loan Posting Group";
//                                 GenJournalLine."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                 GenJournalLine."Shortcut Dimension 2 Code" := '';
//                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                 if GenJournalLine.Amount <> 0 then
//                                     GenJournalLine.Insert;
//                             //END Loans
//                             until LGuran.Next = 0;
//                         end;
//                         //Off Set BOSA Loans

//                         //Principle
//                         LineNo := LineNo + 10000;

//                         GenJournalLine.Init;
//                         GenJournalLine."Journal Template Name" := BosaSetup."Payments Journal Template";
//                         GenJournalLine."Journal Batch Name" := 'LOANS';
//                         GenJournalLine."Line No." := LineNo;
//                         GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                         GenJournalLine."Posting Date" := Today;
//                         GenJournalLine."External Document No." := Loans."Loan No.";
//                         GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                         GenJournalLine."Account No." := LoansR."Member No.";
//                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                         GenJournalLine.Description := 'Cleared by Guarantor';
//                         GenJournalLine.Amount := -Abs(LoansR."Outstanding Balance");
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Loan Repayment";
//                         GenJournalLine."Sacco Transaction Type" := GenJournalLine."sacco transaction type"::Repayment;
//                         GenJournalLine."Loan No" := LoansR."Loan No.";
//                         if LoanType.Get(Loans."Loan Product Type") then
//                             GenJournalLine."Posting Group" := LoanType."Loan Posting Group";
//                         GenJournalLine."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                         GenJournalLine."Shortcut Dimension 2 Code" := '';
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                         if GenJournalLine.Amount <> 0 then
//                             GenJournalLine.Insert;


//                         //Interest
//                         LineNo := LineNo + 10000;
//                         GenJournalLine.Init;
//                         GenJournalLine."Journal Template Name" := BosaSetup."Payments Journal Template";
//                         GenJournalLine."Journal Batch Name" := 'LOANS';
//                         GenJournalLine."Line No." := LineNo;
//                         GenJournalLine."Document No." := 'GL-' + LoansR."Member No.";
//                         GenJournalLine."Posting Date" := Today;
//                         GenJournalLine."External Document No." := Loans."Loan No.";
//                         GenJournalLine."Account Type" := GenJournalLine."bal. account type"::Customer;
//                         GenJournalLine."Account No." := LoansR."Member No.";
//                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                         GenJournalLine.Description := 'Interest Cleared by Guarantor';
//                         GenJournalLine.Amount := -ROUND(Abs(LoansR."Oustanding Interest"), 0.01);
//                         GenJournalLine.Validate(GenJournalLine.Amount);
//                         GenJournalLine."Transaction Type" := GenJournalLine."transaction type"::"Interest Paid";
//                         GenJournalLine."Sacco Transaction Type" := GenJournalLine."sacco transaction type"::Other;
//                         GenJournalLine."Loan No" := LoansR."Loan No.";
//                         if LoanType.Get(Loans."Loan Product Type") then
//                             GenJournalLine."Posting Group" := LoanType."Interest Receivd Posting Group";
//                         GenJournalLine."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                         GenJournalLine."Shortcut Dimension 2 Code" := '';
//                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                         if GenJournalLine.Amount <> 0 then
//                             GenJournalLine.Insert;
//                         //LoansR.Advice:=TRUE;

//                     end;
//                 until LoansR.Next = 0;
//             end;
//             //"Defaulted Loans Recovered":=TRUE;



//             //Post New
//             GenJournalLine.Reset;
//             GenJournalLine.SetRange("Journal Template Name", BosaSetup."Payments Journal Template");
//             GenJournalLine.SetRange("Journal Batch Name", 'LOANS');
//             if GenJournalLine.Find('-') then begin
//                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post B", GenJournalLine);

//                 LoansR.Reset;
//                 LoansR.SetRange(LoansR."Member No.", "No.");
//                 LoansR.SetRange(LoansR.Source, LoansR.Source::BOSA);
//                 if LoansR.Find('-') then begin
//                     repeat
//                         LGuran.Reset;
//                         LGuran.SetRange(LGuran."Loan No", LoansR."Loan No.");
//                         LGuran.SetRange(LGuran.Substituted, false);
//                         if LGuran.Find('-') then begin
//                             repeat
//                                 Loans.Reset;
//                                 Loans.SetRange("Loan No.", LoanNoRecov);
//                                 Loans.SetRange("Member No.", LGuran."Member No");
//                                 if Loans.Find('-') then begin
//                                     Loans.Posted := true;
//                                     Loans.Modify;
//                                 end;
//                             until LGuran.Next = 0;
//                         end;

//                         LoansR.Advice := true;
//                         LoansR.Modify;
//                     until LoansR.Next = 0;

//                 end;
//                 "Defaulted Loans Recovered" := true;
//                 Modify;
//             end;



//             Message('Loan recovery posted successfully.');

//         end;
//     end;


//     procedure LoanRepayment(var LoanRec: Record Loans)
//     var
//         "member name": Text[100];
//         StaffNo: Code[20];
//         Cust: Record Customer;
//         Gnljnline: Record "Gen. Journal Line";
//         GenBatches: Record "Gen. Journal Batch";
//         "GL Account": Record "G/L Account";
//         LoanApp: Record Charges;
//         MonthlyInt: Decimal;
//         PayLine: Record "Payment Lines";
//         Rsched: Record "Loan Repayment Schedule";
//         Rschedule: Record "Loan Repayment Schedule";
//         LoanTypes: Record "Loan Product Types";
//         BosaSetup: Record "Bosa Setup";
//         CMSetup: Record CMSetup;
//         CHEQUE: Code[50];
//         GLEntry: Record "G/L Entry";
//         LoanRecNo: Code[20];
//         MemberRecNo: Code[20];
//         FosaSetup: Record "Fosa Setup";
//         Acc: Record Vendor;
//         AvailableBal: Decimal;
//         InterestAmnt: Decimal;
//         LRepayment: Decimal;
//         NewAvailBal: Decimal;
//         Nextmonth: Date;
//         ActualIntAmnt: Decimal;
//         PrincipalAmnt: Decimal;
//     begin
//         BosaSetup.Get;

//         FosaSetup.Reset;
//         if FosaSetup.Find('-') then begin


//             with LoanRec do begin

//                 LoanRec.Reset;
//                 LoanRec.SetRange(LoanRec.Status, LoanRec.Status::Approved);
//                 //LoanRec.SETRANGE(LoanRec."Loan Status",LoanRec."Loan Status"::Approved);
//                 LoanRec.SetRange(LoanRec."Fully Paid", false);
//                 LoanRec.SetRange(LoanRec.Posted, true);
//                 if LoanRec.Find('-') then begin
//                     repeat

//                         Rschedule.Reset;
//                         Rschedule.SetCurrentkey(Rschedule."Instalment No", Rschedule."Repayment Code");
//                         Rschedule.SetRange(Rschedule."Loan No.", LoanRec."Loan No.");
//                         Rschedule.SetRange(Rschedule."Fully Paid", false);
//                         Rschedule.SetRange(Rschedule."Repayment Date", Today);
//                         if Rschedule.Find('-') then begin

//                             if Acc.Get(LoanRec."Account No") then begin
//                                 Acc.CalcFields(Acc.Balance, Acc."Uncleared Cheques", Acc."ATM Transactions", Acc."Minimum Balance");
//                                 AvailableBal := (Acc.Balance - (Acc."Uncleared Cheques" + Acc."ATM Transactions" + Acc."Minimum Balance"));


//                                 Gnljnline.Reset;
//                                 Gnljnline.SetRange("Journal Template Name", FosaSetup."Loans Repayment Template");
//                                 Gnljnline.SetRange("Journal Batch Name", LoanRec."Loan No.");
//                                 Gnljnline.DeleteAll;
//                                 //end of deletion

//                                 GenBatches.Reset;
//                                 GenBatches.SetRange(GenBatches."Journal Template Name", FosaSetup."Loans Repayment Template");
//                                 GenBatches.SetRange(GenBatches.Name, LoanRec."Loan No.");
//                                 if GenBatches.Find('-') = false then begin
//                                     GenBatches.Init;
//                                     GenBatches."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                     GenBatches.Name := LoanRec."Loan No.";
//                                     GenBatches.Description := 'Loan Repayment';
//                                     GenBatches.Validate(GenBatches."Journal Template Name");
//                                     GenBatches.Validate(GenBatches.Name);
//                                     //GenBatches.CalcSums(GenBatches."Total Amount");
//                                     GenBatches.Insert;
//                                 end;

//                                 InterestAmnt := Rschedule."Monthly Interest";
//                                 NewAvailBal := AvailableBal - InterestAmnt;
//                                 LRepayment := Rschedule."Principal Repayment";


//                                 if AvailableBal > 0 then begin

//                                     CalcFields(LoanRec."Oustanding Interest", LoanRec."Outstanding Balance");

//                                     //Interest Repayment Receipt
//                                     if LoanRec."Oustanding Interest" > 0 then begin

//                                         if AvailableBal > InterestAmnt then
//                                             ActualIntAmnt := InterestAmnt
//                                         else
//                                             ActualIntAmnt := AvailableBal;

//                                         //******************************************
//                                         /*Gnljnline.INIT;
//                                         Gnljnline."Posting Date":=Rschedule."Repayment Date";
//                                         Gnljnline."Document No.":=LoanRec."Loan  No.";
//                                         Gnljnline."Line No.":=10000 + Gnljnline."Line No.";
//                                         Gnljnline."Journal Template Name":=FosaSetup."Loans Repayment Template";
//                                         Gnljnline."Journal Batch Name":=LoanRec."Loan  No.";
//                                         Gnljnline."Account Type":=Gnljnline."Account Type"::Customer;
//                                         Gnljnline."Account No.":=LoanRec."Member No.";
//                                         Gnljnline.VALIDATE(Gnljnline."Account No.");
//                                         Gnljnline.Description:='Interest Repayment on Loan';
//                                         Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Interest Paid";
//                                         Gnljnline.Amount:=ActualIntAmnt*-1;
//                                         Gnljnline.VALIDATE(Gnljnline.Amount);
//                                         //Gnljnline."Loan No":=LoanRec."Loan  No.";
//                                         Gnljnline."Shortcut Dimension 1 Code":=BosaSetup."Global Dimension 1 Code";
//                                         Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
//                                         Gnljnline."Shortcut Dimension 2 Code":=Acc."Global Dimension 2 Code";
//                                         Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
//                                         Gnljnline."External Document No.":="Cheque No.";
//                                         IF Gnljnline.Amount<>0 THEN
//                                         Gnljnline.INSERT;*/
//                                         //******************************************

//                                         if LoanTypes.Get(LoanRec."Loan Product Type") then begin

//                                             Gnljnline.Init;
//                                             Gnljnline."Posting Date" := Rschedule."Repayment Date";
//                                             Gnljnline."Document No." := LoanRec."Loan No.";
//                                             Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
//                                             Gnljnline."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                             Gnljnline."Journal Batch Name" := LoanRec."Loan No.";
//                                             Gnljnline."Account Type" := Gnljnline."account type"::"G/L Account";
//                                             Gnljnline."Account No." := LoanTypes."Loan Account";
//                                             Gnljnline.Validate(Gnljnline."Account No.");
//                                             Gnljnline.Description := 'Interest Paid on' + ' - ' + Format(Today);
//                                             Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Interest Paid";
//                                             Gnljnline.Amount := ActualIntAmnt * 1;
//                                             Gnljnline.Validate(Gnljnline.Amount);
//                                             Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
//                                             //Gnljnline."Loan No" := LoanRec."Loan No.";
//                                             Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                             Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
//                                             Gnljnline."Shortcut Dimension 2 Code" := Acc."Global Dimension 2 Code";
//                                             Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
//                                             Gnljnline."External Document No." := "Cheque No.";
//                                             if Gnljnline.Amount <> 0 then
//                                                 Gnljnline.Insert;
//                                         end;

//                                         Gnljnline.Init;
//                                         Gnljnline."Posting Date" := Rschedule."Repayment Date";
//                                         Gnljnline."Document No." := LoanRec."Loan No.";
//                                         Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
//                                         Gnljnline."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                         Gnljnline."Journal Batch Name" := LoanRec."Loan No.";
//                                         Gnljnline."Account Type" := Gnljnline."account type"::Customer;
//                                         Gnljnline."Account No." := LoanRec."Member No.";
//                                         Gnljnline.Validate(Gnljnline."Account No.");
//                                         Gnljnline.Description := 'Interest Repayment on Loan';
//                                         Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Interest Paid";
//                                         Gnljnline.Amount := ActualIntAmnt * -1;
//                                         Gnljnline.Validate(Gnljnline.Amount);
//                                         //Gnljnline."Loan No" := LoanRec."Loan No.";
//                                         Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
//                                         Gnljnline."Shortcut Dimension 2 Code" := Acc."Global Dimension 2 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
//                                         Gnljnline."External Document No." := "Cheque No.";
//                                         if Gnljnline.Amount <> 0 then
//                                             Gnljnline.Insert;


//                                     end;


//                                     //Principal and Interest Amount Repayment
//                                     if LoanRec."Outstanding Balance" > 0 then begin


//                                         if NewAvailBal > LRepayment then
//                                             PrincipalAmnt := LRepayment
//                                         else
//                                             PrincipalAmnt := NewAvailBal;


//                                         //******************************************
//                                         /*Gnljnline.INIT;
//                                         Gnljnline."Posting Date":=Rschedule."Repayment Date";
//                                         Gnljnline."Document No.":=LoanRec."Loan  No.";
//                                         Gnljnline."Line No.":=10000 + Gnljnline."Line No.";
//                                         Gnljnline."Journal Template Name":=FosaSetup."Loans Repayment Template";
//                                         Gnljnline."Journal Batch Name":=LoanRec."Loan  No.";
//                                         Gnljnline."Account Type":=Gnljnline."Account Type"::Customer;
//                                         Gnljnline."Account No.":=LoanRec."Member No.";
//                                         Gnljnline.VALIDATE(Gnljnline."Account No.");
//                                         Gnljnline.Description:='Principle Amount';
//                                         Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Loan Repayment";
//                                         Gnljnline.Amount:=PrincipalAmnt*-1;
//                                         Gnljnline.VALIDATE(Gnljnline.Amount);
//                                         //Gnljnline."Loan No":=LoanRec."Loan  No.";
//                                         Gnljnline."Shortcut Dimension 1 Code":=BosaSetup."Global Dimension 1 Code";
//                                         Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
//                                         Gnljnline."Shortcut Dimension 2 Code":=Acc."Global Dimension 2 Code";
//                                         Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
//                                         Gnljnline."External Document No.":="Cheque No.";
//                                         IF Gnljnline.Amount<>0 THEN
//                                         Gnljnline.INSERT;*/
//                                         //******************************************

//                                         Gnljnline.Init;
//                                         Gnljnline."Posting Date" := Rschedule."Repayment Date";
//                                         Gnljnline."Document No." := LoanRec."Loan No.";
//                                         Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
//                                         Gnljnline."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                         Gnljnline."Journal Batch Name" := LoanRec."Loan No.";
//                                         Gnljnline."Account Type" := Gnljnline."account type"::Customer;
//                                         Gnljnline."Account No." := LoanRec."Member No.";
//                                         Gnljnline.Validate(Gnljnline."Account No.");
//                                         Gnljnline.Description := 'L-Repayment Amount' + ' - ' + Format(LRepayment + InterestAmnt);
//                                         Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Loan Repayment";
//                                         Gnljnline.Amount := (PrincipalAmnt + ActualIntAmnt) * -1;
//                                         Gnljnline.Validate(Gnljnline.Amount);
//                                         //Gnljnline."Loan No" := LoanRec."Loan No.";
//                                         Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
//                                         Gnljnline."Shortcut Dimension 2 Code" := Acc."Global Dimension 2 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
//                                         Gnljnline."External Document No." := "Cheque No.";
//                                         if Gnljnline.Amount <> 0 then
//                                             Gnljnline.Insert;


//                                     end;


//                                     //Debit Interest Amount and Principal Amount from Funding Account
//                                     Gnljnline.Init;
//                                     Gnljnline."Posting Date" := Rschedule."Repayment Date";
//                                     Gnljnline."Document No." := LoanRec."Loan No.";
//                                     Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
//                                     Gnljnline."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                     Gnljnline."Journal Batch Name" := LoanRec."Loan No.";
//                                     Gnljnline."Account Type" := Gnljnline."account type"::Vendor;
//                                     Gnljnline."Account No." := LoanRec."Account No";
//                                     Gnljnline.Validate(Gnljnline."Account No.");
//                                     Gnljnline.Description := 'L-Repayment Install No' + ' - ' + Format(Rschedule."Instalment No");
//                                     Gnljnline.Amount := (PrincipalAmnt + ActualIntAmnt);
//                                     Gnljnline.Validate(Gnljnline.Amount);
//                                     //Gnljnline."Loan No" := LoanRec."Loan No.";
//                                     Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
//                                     Gnljnline."Shortcut Dimension 2 Code" := Acc."Global Dimension 2 Code";
//                                     Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");
//                                     Gnljnline."External Document No." := "Cheque No.";
//                                     if Gnljnline.Amount <> 0 then
//                                         Gnljnline.Insert;




//                                     //Pass interest due entry for the next month
//                                     if Rschedule."Instalment No" < LoanRec.Installments then begin
//                                         Nextmonth := CalcDate('+1M', Today);
//                                         Gnljnline.Init;
//                                         Gnljnline."Journal Template Name" := FosaSetup."Loans Repayment Template";
//                                         Gnljnline."Journal Batch Name" := LoanRec."Loan No.";
//                                         Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
//                                         Gnljnline."Account Type" := Gnljnline."account type"::Customer;
//                                         Gnljnline."Account No." := LoanRec."Member No.";
//                                         Gnljnline."Transaction Type" := Gnljnline."transaction type"::"Interest Due";
//                                         Gnljnline.Validate(Gnljnline."Account No.");
//                                         Gnljnline."Document No." := "Loan No.";
//                                         Gnljnline."Posting Date" := Today;
//                                         Gnljnline.Description := 'Interest Due' + ' - ' + Format(Nextmonth);

//                                         Rsched.Reset;
//                                         Rsched.SetCurrentkey(Rsched."Instalment No", Rsched."Repayment Code");
//                                         Rsched.SetRange(Rsched."Loan No.", LoanRec."Loan No.");
//                                         Rsched.SetRange(Rsched."Fully Paid", false);
//                                         Rsched.SetRange(Rsched."Repayment Date", Nextmonth);
//                                         if Rsched.Find('-') then begin
//                                             Gnljnline.Amount := Rsched."Monthly Interest";
//                                             Gnljnline.Validate(Gnljnline.Amount);
//                                         end;

//                                         Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
//                                         if LoanTypes.Get(LoanRec."Loan Product Type") then
//                                             Gnljnline."Bal. Account No." := LoanTypes."Received Interest Account";
//                                         Gnljnline.Validate(Gnljnline."Bal. Account No.");
//                                         //Gnljnline."Loan No" := LoanRec."Loan No.";
//                                         Gnljnline."Shortcut Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 1 Code");
//                                         Gnljnline."Shortcut Dimension 2 Code" := Acc."Global Dimension 2 Code";
//                                         Gnljnline.Validate(Gnljnline."Shortcut Dimension 2 Code");

//                                         if Gnljnline.Amount <> 0 then
//                                             Gnljnline.Insert;
//                                     end;


//                                     Gnljnline.Reset;
//                                     Gnljnline.SetRange("Journal Template Name", FosaSetup."Loans Repayment Template");
//                                     Gnljnline.SetRange("Journal Batch Name", LoanRec."Loan No.");
//                                     Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
//                                     GLEntry.Reset;
//                                     GLEntry.SetRange(GLEntry."Document No.", LoanRec."Loan No.");
//                                     GLEntry.SetRange(GLEntry.Reversed, false);
//                                     if GLEntry.FindFirst then begin
//                                     end;



//                                 end;
//                                 //ELSE  {IF AvailableBal < 0 THEN} BEGIN

//                                 /*IF AvailableBal > InterestAmnt THEN
//                                 ActualIntAmnt:=InterestAmnt*-1
//                                 ELSE
//                                 ActualIntAmnt:=AvailableBal*-1;

//                             Gnljnline.INIT;
//                             Gnljnline."Posting Date":=Rschedule."Repayment Date";
//                             Gnljnline."Document No.":=LoanRec."Loan  No.";
//                             Gnljnline."Line No.":=10000 + Gnljnline."Line No.";
//                             Gnljnline."Journal Template Name":=FosaSetup."Loans Repayment Template";
//                             Gnljnline."Journal Batch Name":=LoanRec."Loan  No.";
//                             Gnljnline."Account Type":=Gnljnline."Account Type"::Customer;
//                             Gnljnline."Account No.":=LoanRec."Member No.";
//                             Gnljnline.VALIDATE(Gnljnline."Account No.");
//                             Gnljnline.Description:='Bad Debt Interest'+' - '+FORMAT(ActualIntAmnt);
//                             Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Interest Due";
//                             Gnljnline.Amount:=ActualIntAmnt*-1;
//                             Gnljnline.VALIDATE(Gnljnline.Amount);
//                             Gnljnline."Bal. Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
//                             IF LoanTypes.GET(LoanRec."Loan Product Type") THEN BEGIN
//                             Gnljnline."Bal. Account No.":=LoanTypes."Loan Bad Interest Account";
//                             END;
//                             Gnljnline.VALIDATE(Gnljnline."Bal. Account No.");
//                             //Gnljnline."Loan No":=LoanRec."Loan  No.";
//                             Gnljnline."Shortcut Dimension 1 Code":=BosaSetup."Global Dimension 1 Code";
//                             Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
//                             Gnljnline."Shortcut Dimension 2 Code":=Acc."Global Dimension 2 Code";
//                             Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");
//                             Gnljnline."External Document No.":="Cheque No.";
//                             IF Gnljnline.Amount<>0 THEN
//                             Gnljnline.INSERT;  */



//                                 //Interest for next month
//                                 /*  IF Rschedule."Instalment No" < LoanRec.Installments THEN BEGIN
//                                     Nextmonth:=CALCDATE('+1M',TODAY);
//                                     Gnljnline.INIT;
//                                     Gnljnline."Journal Template Name":=FosaSetup."Loans Repayment Template";
//                                     Gnljnline."Journal Batch Name":=LoanRec."Loan  No.";
//                                     Gnljnline."Line No.":=10000 + Gnljnline."Line No.";
//                                     Gnljnline."Account Type":=Gnljnline."Account Type"::Customer;
//                                     Gnljnline."Account No.":=LoanRec."Member No.";
//                                     Gnljnline."Transaction Type":=Gnljnline."Transaction Type"::"Interest Due";
//                                     Gnljnline.VALIDATE(Gnljnline."Account No.");
//                                     Gnljnline."Document No.":="Loan  No.";
//                                     Gnljnline."Posting Date":=TODAY;
//                                     Gnljnline.Description:='Interest Due'+' - '+FORMAT(Nextmonth);

//                                     Rsched.RESET;
//                                     Rsched.SETCURRENTKEY(Rsched."Instalment No",Rsched."Repayment Code");
//                                     Rsched.SETRANGE(Rsched."Loan No.",LoanRec."Loan  No.");
//                                     Rsched.SETRANGE(Rsched.Paid,FALSE);
//                                     Rsched.SETRANGE(Rsched."Repayment Date",Nextmonth);
//                                     IF Rsched.FIND('-') THEN BEGIN
//                                     Gnljnline.Amount:=Rsched."Monthly Interest";
//                                     Gnljnline.VALIDATE(Gnljnline.Amount);
//                                     END;

//                                     Gnljnline."Bal. Account Type":=Gnljnline."Bal. Account Type"::"G/L Account";
//                                     IF LoanTypes.GET(LoanRec."Loan Product Type") THEN
//                                     Gnljnline."Bal. Account No.":=LoanTypes."Loan Interest Account";
//                                     Gnljnline.VALIDATE(Gnljnline."Bal. Account No.");
//                                     //Gnljnline."Loan No":=LoanRec."Loan  No.";
//                                     Gnljnline."Shortcut Dimension 1 Code":=BosaSetup."Global Dimension 1 Code";
//                                     Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 1 Code");
//                                     Gnljnline."Shortcut Dimension 2 Code":=Acc."Global Dimension 2 Code";
//                                     Gnljnline.VALIDATE(Gnljnline."Shortcut Dimension 2 Code");

//                                     IF Gnljnline.Amount<>0 THEN
//                                     Gnljnline.INSERT;
//                                     END;*/

//                                 //END;




//                                 //ELSE
//                                 //For Previous Payments where there was no enough balance

//                                 /* //Post Transaction
//                                  {IF CONFIRM('Are you sure you want to post')= TRUE THEN BEGIN}

//                                  Gnljnline.RESET;
//                                  Gnljnline.SETRANGE("Journal Template Name",FosaSetup."Loans Repayment Template");
//                                  Gnljnline.SETRANGE("Journal Batch Name",LoanRec."Loan  No.");
//                                  CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Gnljnline);
//                                      GLEntry.RESET;
//                                      GLEntry.SETRANGE(GLEntry."Document No.",LoanRec."Loan  No.");
//                                      GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
//                                      IF GLEntry.FINDFIRST THEN BEGIN
//                                      END;

//                                  {END ELSE
//                                  EXIT;}*/



//                             end;
//                             Rschedule."Actual Installment Paid" := Abs(PrincipalAmnt + ActualIntAmnt);
//                             Rschedule."Actual Principal Paid" := Abs(PrincipalAmnt);
//                             Rschedule."Actual Interest Paid" := Abs(ActualIntAmnt);
//                             Rschedule."Actual Loan Repayment Date" := Today;
//                             if (Rschedule."Principal Repayment" = Abs(PrincipalAmnt)) and
//                             (Rschedule."Monthly Interest" = Abs(ActualIntAmnt)) then begin
//                                 Rschedule."Closed Date" := Today;
//                                 Rschedule."Fully Paid" := true;
//                             end else begin
//                                 Rschedule."Remaining Debt" := Rschedule."Monthly Repayment" - PrincipalAmnt;
//                             end;

//                             Rschedule.Modify;


//                             LoanRec."Remaining Installments" := Rschedule."Instalment No";
//                             LoanRec.Modify;
//                         end;

//                     until LoanRec.Next = 0;



//                 end;

//             end;


//         end;

//     end;


//     procedure RepaymentSchedule(var RepaySchedule: Record Loans)
//     begin
//         //IF Posted=TRUE THEN
//         //ERROR('Loan has been posted, Can only preview schedule');
//         with RepaySchedule do begin

//             QCounter := 0;
//             QCounter := 3;
//             Evaluate(InPeriod, '1Q');
//             GrPrinciple := "Grace Period - Principle (M)";
//             GrInterest := "Grace Period - Interest (M)";
//             InitialGraceInt := "Grace Period - Interest (M)";

//             Loans.Reset;
//             Loans.SetRange(Loans."Loan No.", "Loan No.");
//             if Loans.Find('-') then begin

//                 if Loans.Status = Loans.Status::Released then
//                     TestField("Loan Disbursement Date");

//                 TestField("Repayment Start Date");

//                 RSchedule.Reset;
//                 RSchedule.SetRange(RSchedule."Loan No.", "Loan No.");
//                 RSchedule.DeleteAll;

//                 LoanAmount := Loans."Approved Amount";
//                 /*IF Loans."Use Special Interest Rate" THEN BEGIN
//                 TESTFIELD("Special Interest Rate");
//                 InterestRate:="Special Interest Rate";
//                 END ELSE*/
//                 InterestRate := Loans.Interest;

//                 RepayPeriod := Loans.Installments;
//                 InitialInstal := Loans.Installments + "Grace Period - Principle (M)";
//                 LBalance := Loans."Approved Amount";
//                 RunDate := "Repayment Start Date";//"Loan Disbursement Date";
//                 RunDate := CalcDate('-1M', RunDate);
//                 InstalNo := 0;
//                 Evaluate(RepayInterval, '1M');

//                 repeat
//                     InstalNo := InstalNo + 1;
//                     //RunDate:=CALCDATE("Instalment Period",RunDate);
//                     RunDate := CalcDate('1M', RunDate);


//                     if "Repayment Method" = "repayment method"::Amortised then begin
//                         /*IF Loans."Use Special Interest Rate" THEN
//                         TESTFIELD("Special Interest Rate");*/

//                         TestField(Installments);
//                         TotalMRepay := ROUND((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 0.05, '>');
//                         LInterest := ROUND(LBalance / 100 / 12 * InterestRate, 0.05, '>');
//                         LPrincipal := TotalMRepay - LInterest;
//                     end;

//                     if "Repayment Method" = "repayment method"::"Straight Line" then begin
//                         /*IF Loans."Use Special Interest Rate" THEN
//                         TESTFIELD("Special Interest Rate");*/

//                         TestField(Interest);
//                         TestField(Installments);
//                         LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
//                         LInterest := ROUND((InterestRate / 12 / 100) * LoanAmount, 0.05, '>');
//                         //Grace Period Interest
//                         LInterest := ROUND((LInterest * InitialInstal) / (InitialInstal - InitialGraceInt), 0.05, '>');
//                     end;

//                     if "Repayment Method" = "repayment method"::"Reducing Balance" then begin
//                         /*IF Loans."Use Special Interest Rate" THEN
//                         TESTFIELD("Special Interest Rate");*/

//                         TestField(Installments);
//                         LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
//                         LInterest := ROUND((InterestRate / 12 / 100) * LBalance, 0.05, '>');
//                     end;

//                     if "Repayment Method" = "repayment method"::Constants then begin
//                         TestField("Loan Repayment");
//                         if LBalance < "Loan Repayment" then
//                             LPrincipal := LBalance
//                         else
//                             LPrincipal := "Loan Repayment";
//                         /*IF Loans."Use Special Interest Rate" THEN BEGIN
//                         TESTFIELD("Special Interest Rate");
//                         LInterest:="Special Interest Rate";
//                         END ELSE*/
//                         LInterest := Interest;
//                     end;


//                     //Grace Period
//                     if GrPrinciple > 0 then begin
//                         LPrincipal := 0
//                     end else begin
//                         if "Instalment Period" <> InPeriod then
//                             LBalance := LBalance - LPrincipal;

//                     end;

//                     if GrInterest > 0 then
//                         LInterest := 0;

//                     GrPrinciple := GrPrinciple - 1;
//                     GrInterest := GrInterest - 1;
//                     //Grace Period

//                     //Q Principle
//                     if "Instalment Period" = InPeriod then begin
//                         //ADDED
//                         if GrPrinciple <> 0 then
//                             GrPrinciple := GrPrinciple - 1;
//                         if QCounter = 1 then begin
//                             QCounter := 3;
//                             LPrincipal := QPrinciple + LPrincipal;
//                             if LPrincipal > LBalance then
//                                 LPrincipal := LBalance;
//                             LBalance := LBalance - LPrincipal;
//                             QPrinciple := 0;
//                         end else begin
//                             QCounter := QCounter - 1;
//                             QPrinciple := QPrinciple + LPrincipal;
//                             //IF QPrinciple > LBalance THEN
//                             //QPrinciple:=LBalance;
//                             LPrincipal := 0;
//                         end

//                     end;
//                     //Q Principle


//                     Evaluate(RepayCode, Format(InstalNo));

//                     RSchedule.Init;
//                     RSchedule."Repayment Code" := RepayCode;
//                     RSchedule."Loan No." := "Loan No.";
//                     RSchedule."Loan Amount" := LoanAmount;
//                     RSchedule."Instalment No" := InstalNo;
//                     RSchedule."Repayment Date" := RunDate;
//                     RSchedule."Member No." := "Member No.";
//                     RSchedule."Loan Category" := "Loan Product Type";
//                     RSchedule."Monthly Repayment" := LInterest + LPrincipal;
//                     RSchedule."Monthly Interest" := LInterest;
//                     RSchedule."Principal Repayment" := LPrincipal;
//                     //RSchedule."Settling Account No.":="Account No";
//                     RSchedule."Member Name" := "Client Name";
//                     //RSchedule."Class Code":="Class Code";
//                     RSchedule.Insert;
//                     Commit;

//                 until LBalance < 1

//             end;


//             LoanApp.Reset;
//             LoanApp.SetRange(LoanApp."Loan No.", "Loan No.");
//             if LoanApp.Find('-') then
//                 Report.Run(51507249, true, false, LoanApp);




//         end;

//     end;
// }

