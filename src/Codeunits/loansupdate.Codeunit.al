// Codeunit 52193453 "loans update"
// {

//     trigger OnRun()
//     begin
//         /*LoanRec.RESET;
//         //LoanRec.SETRANGE("Loan No.",'NORAES016563');
//         //LoanRec.SETRANGE(Posted,FALSE);
//         IF LoanRec.FIND('-') THEN BEGIN
//         REPEAT
//         //{LoanRec.CALCFIELDS("Outstanding Balance");
//         //IF LoanRec."Outstanding Balance" < 0 THEN BEGIN
//         LoanRec.Status:=LoanRec.Status::Approved;
//         LoanRec.MODIFY;
//         //END;}
//         //RepaymentSchedule(LoanRec);
//         //LoanRelease(LoanRec);
//         UNTIL
//         LoanRec.NEXT = 0;
//         END;
//         */

//     end;

//     var
//         LoanRec: Record Loans;
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
//         LoanRec1: Integer;
//         ChargeAmount: Decimal;
//         LoanToped: Code[20];
//         PayInterval: DateFormula;
//         LoanNoRecov: Code[10];
//         PaymentMgt: Codeunit "Payment Management";


//     procedure LoanRelease(var LoanRec: Record Loans)
//     var
//         PayRec: Record Payments1;
//         PayRecLines: Record "Payment Lines";
//         BatchTopUpAmountINT: Decimal;
//         LoanType: Record "Loan Product Types";
//         TopUpComm: Decimal;
//         BatchTopUpAmount: Decimal;
//         BatchTopUpComm: Decimal;
//         "Processing Charges": Decimal;
//         PCharges: Record "Product Charges";
//         TCharges: Decimal;
//         LoanTopUp: Record "Loans Top up";
//         Cust: Record Customer;
//         ChargesRec: Record "Product Charges";
//         Charge: Decimal;
//         TotalCharge: Decimal;
//         LRSchedule: Record "Loan Repayment Schedule";
//         LastPayDate1: Text[30];
//         LastPayDate: Date;
//         BosaSetup: Record "Bosa Setup";
//         PayTypes: Record "Receipts and Payments Types";
//         CustPost: Record "Customer Posting Group";
//         Text0001: label 'Loan Payment Voucher No %1 Has Been Created For Loan No %2!';
//         LGuaran: Record "Loan Guarantors";
//         GenSetup: Record "General Set-Up";
//         GLAcc: Record "G/L Account";
//     begin
//         BosaSetup.Get;

//         //MESSAGE(FORMAT(LoanRec.Source));
//         //MESSAGE(FORMAT(LoanRec."PV Created"));
//         //**********************************************************************
//         //PayRec.TRANSFERFIELDS(LoanRec); PVHeader
//         //**********************************************************************
//         if (LoanRec.Source = LoanRec.Source::BOSA) and (LoanRec."PV Created" = false) then begin

//             PayRec.Init;
//             PayRec.No := '';
//             PayRec."Payment To" := LoanRec."Client Name";
//             PayRec."Payment Date" := LoanRec."Application Date";
//             PayRec."Bank Account" := 'BANK-0002';
//             PayRec."Amount Paid" := LoanRec."Approved Amount";
//             PayRec."Payment Mode" := 'CASH';
//             PayRec.Remarks := 'Loan Disbursment';
//             if Cust.Get(LoanRec."Member No.") then begin
//                 PayRec."Employer Code" := Cust."Employer Code";
//                 PayRec."Employer Name" := Cust."Employer Name";
//             end;
//             PayRec.Insert(true);



//             //**********************************************************************
//             //PayRec.TRANSFERFIELDS(LoanRec); PVLines
//             //**********************************************************************
//             PayRecLines.Init;
//             PayRecLines.No := PayRec.No;
//             PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//             PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//             PayRecLines."Account No" := LoanRec."Member No.";
//             PayRecLines.Name := LoanRec."Client Name";
//             PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//             PayRecLines.Description := LoanRec."Loan Product Type Name";
//             PayRecLines."Transaction Type" := PayRecLines."transaction type"::Loan;
//             PayRecLines.Type := PayRecLines.Type::Loan;
//             PayRecLines."Transactions Code" := BosaSetup."Loan Transaction";
//             PayRecLines."Loan No." := LoanRec."Loan No.";
//             PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//             PayRecLines.Amount := LoanRec."Approved Amount";
//             PayRecLines.Validate(Amount);
//             PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//             PayRecLines.Validate("Global Dimension 1 Code");
//             if LoanType.Get(LoanRec."Loan Product Type") then
//                 PayRecLines."Posting Group" := LoanType."Loan Posting Group";
//             PayRecLines.Validate("Posting Group");
//             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                 PayRecLines.Insert(true);


//             //**********************************************************************
//             //Loan Refinance (LoanRec); PVLines
//             //**********************************************************************
//             LoanRec.CalcFields("Top Up Amount");
//             if LoanRec."Top Up Amount" > 0 then begin //Repaying the Topup Amount--Refinancing
//                 LoanTopUp.Reset;
//                 LoanTopUp.SetRange(LoanTopUp."Loan No.", LoanRec."Loan No.");
//                 if LoanTopUp.Find('-') then begin

//                     PayRecLines.Init;
//                     PayRecLines.No := PayRec.No;
//                     PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                     PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                     PayRecLines."Account No" := LoanRec."Member No.";
//                     PayRecLines.Name := LoanRec."Client Name";
//                     PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                     PayRecLines.Description := 'Off Setting Loan No - ' + LoanTopUp."Loan Top Up";
//                     PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Loan Repayment";
//                     PayRecLines.Type := PayRecLines.Type::Repayment;
//                     PayRecLines."Transactions Code" := BosaSetup."Loan Repayment Transaction";
//                     PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                     PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                     PayRecLines.Amount := LoanTopUp."Principle Top Up" * -1;
//                     PayRecLines.Validate(Amount);
//                     PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                     PayRecLines.Validate("Global Dimension 1 Code");
//                     if LoanType.Get(LoanRec."Loan Product Type") then
//                         PayRecLines."Posting Group" := LoanType."Loan Posting Group";
//                     PayRecLines.Validate("Posting Group");
//                     if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                         PayRecLines.Insert(true);


//                     //Interest (Paid if top up)
//                     PayRecLines.Init;
//                     PayRecLines.No := PayRec.No;
//                     PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                     PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                     PayRecLines."Account No" := LoanRec."Member No.";
//                     PayRecLines.Name := LoanRec."Client Name";
//                     PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                     PayRecLines.Description := CopyStr('Interest Paid on Refinanced Loan No. ' + LoanTopUp."Loan Top Up", 1, 50);
//                     PayRecLines.Amount := LoanTopUp."Interest Top Up" * -1;
//                     PayRecLines.Validate(Amount);
//                     PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Interest Paid";
//                     PayRecLines.Type := PayRecLines.Type::Repayment;
//                     PayRecLines."Transactions Code" := BosaSetup."Loan Repayment Transaction";
//                     PayRecLines."Loan No." := LoanTopUp."Loan Top Up";
//                     PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                     PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                     PayRecLines.Validate("Global Dimension 1 Code");
//                     if LoanType.Get(LoanRec."Loan Product Type") then
//                         PayRecLines."Posting Group" := BosaSetup."Posting Group - Interest Due";
//                     PayRecLines.Validate("Posting Group");
//                     if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                         PayRecLines.Insert(true);

//                     //Commision
//                     if LoanType.Get(LoanRec."Loan Product Type") then
//                         if LoanType."Top Up Commision" > 0 then begin
//                             PayRecLines.Init;
//                             PayRecLines.No := PayRec.No;
//                             PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                             PayRecLines."Account Type" := PayRecLines."account type"::Customer;
//                             PayRecLines."Account No" := LoanRec."Member No.";
//                             PayRecLines.Name := LoanRec."Client Name";
//                             PayRecLines."Staff No/Payroll No." := LoanRec."Staff No";
//                             PayRecLines.Description := 'Off Set By - ' + LoanRec."Loan No.";
//                             PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Loan Repayment";
//                             PayRecLines."Transactions Code" := BosaSetup."Loan Repayment Transaction";
//                             PayRecLines.Type := PayRecLines.Type::Repayment;
//                             PayRecLines."Loan No." := LoanRec."Loan No.";
//                             PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                             TopUpComm := (LoanTopUp."Principle Top Up") * (LoanType."Top Up Commision" / 100);
//                             PayRecLines.Amount := TopUpComm * -1;
//                             PayRecLines.Validate(Amount);
//                             PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                             PayRecLines.Validate("Global Dimension 1 Code");
//                             PayRecLines."Posting Group" := LoanType."Loan Posting Group";
//                             PayRecLines.Validate("Posting Group");
//                             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                 PayRecLines.Insert(true);
//                         end;

//                     //UNTIL LoanTopUp.NEXT = 0;
//                 end;
//             end;//Repaying the Topup Amount--Refinancing


//             //**********************************************************************
//             //Find Loan Charges
//             //**********************************************************************
//             LoanType.Reset;
//             LoanType.SetRange(LoanType.Code, LoanRec."Loan Product Type");
//             if LoanType.Find('-') then
//                 PCharges.SetRange(PCharges."Product Code", LoanType.Code);
//             if PCharges.Find('-') then begin
//                 //Get the Loan Charges plus the additional Percentage Charges
//                 repeat
//                     if (PCharges."Use Perc") and not (PCharges.IsInsurance) then begin
//                         // REPEAT
//                         if LoanRec."Approved Amount" = PCharges."Min Amount" then begin
//                             Charge := ((PCharges.Percentage / 100) * LoanRec."Approved Amount") + PCharges.Amount;
//                         end;
//                         if (LoanRec."Approved Amount" > PCharges."Min Amount") and (LoanRec."Approved Amount" < PCharges."Max Amount")
//                         then begin
//                             Charge := ((PCharges.Percentage / 100) * LoanRec."Approved Amount") + PCharges.Amount;
//                             PayRecLines.Amount := Charge;
//                         end;
//                         if LoanRec."Approved Amount" < PCharges."Min Amount" then begin
//                             Charge := ((PCharges.Percentage / 100) * LoanRec."Approved Amount") + PCharges.Amount;
//                         end;
//                         if LoanRec."Approved Amount" > PCharges."Max Amount" then begin
//                             Charge := ((PCharges.Percentage / 100) * LoanRec."Approved Amount") + PCharges.Amount;
//                         end;
//                         PayRecLines.Init;
//                         PayRecLines.No := PayRec.No;
//                         PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                         PayRecLines."Account Type" := PayRecLines."account type"::"G/L Account";//PayRecLines."Account Type"::Customer;
//                         PayRecLines."Account No" := PCharges."G/L Account";//LoanRec."Member No.";
//                         if GLAcc.Get(PCharges."G/L Account") then
//                             PayRecLines.Name := GLAcc.Name;//LoanRec."Client Name";
//                         PayRecLines.Description := PCharges.Description;
//                         PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Processing Fee";
//                         PayRecLines.Type := PayRecLines.Type::Other;
//                         PayRecLines."Transactions Code" := BosaSetup."Other Transactions";
//                         PayRecLines."Loan No." := LoanRec."Loan No.";
//                         PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                         PayRecLines.Amount := -Charge;
//                         PayRecLines.Validate(Amount);
//                         PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                         PayRecLines.Validate("Global Dimension 1 Code");
//                         /*PayRecLines."Posting Group":=PCharges."Customer Posting Group";
//                         PayRecLines.VALIDATE("Posting Group");*/
//                         if PayRecLines.Amount <> 0 then
//                             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                 PayRecLines.Insert(true);

//                     end;

//                     if (PCharges."Use Perc") and (PCharges.IsInsurance) then begin
//                         LoanRec.Insurance := ((PCharges.Percentage / 100) * LoanRec."Approved Amount");//* (LoanRec.Installments)/12);
//                         Charge := LoanRec.Insurance;
//                         PayRecLines.Init;
//                         PayRecLines.No := PayRec.No;
//                         PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                         PayRecLines."Account Type" := PayRecLines."account type"::"G/L Account";//PayRecLines."Account Type"::Customer;
//                         PayRecLines."Account No" := PCharges."G/L Account";//LoanRec."Member No.";
//                         if GLAcc.Get(PCharges."G/L Account") then
//                             PayRecLines.Name := GLAcc.Name;//LoanRec."Client Name";
//                         PayRecLines.Description := PCharges.Description;
//                         PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Processing Fee";
//                         PayRecLines.Type := PayRecLines.Type::Other;
//                         PayRecLines."Transactions Code" := BosaSetup."Other Transactions";
//                         PayRecLines."Loan No." := LoanRec."Loan No.";
//                         PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                         PayRecLines.Amount := -Charge;
//                         PayRecLines.Validate(Amount);
//                         PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                         PayRecLines.Validate("Global Dimension 1 Code");
//                         /*PayRecLines."Posting Group":=PCharges."Customer Posting Group";
//                         PayRecLines.VALIDATE("Posting Group");*/


//                         if PayRecLines.Amount <> 0 then
//                             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                 PayRecLines.Insert(true);
//                     end;

//                     if not (PCharges."Use Perc") and not (PCharges.IsInsurance) then begin
//                         Charge := PCharges.Amount;
//                         PayRecLines.Init;
//                         PayRecLines.No := PayRec.No;
//                         PayRecLines."Line No" := 1000 + PayRecLines."Line No";
//                         PayRecLines."Account Type" := PayRecLines."account type"::"G/L Account";//PayRecLines."Account Type"::Customer;
//                         PayRecLines."Account No" := PCharges."G/L Account";//LoanRec."Member No.";
//                         if GLAcc.Get(PCharges."G/L Account") then
//                             PayRecLines.Name := GLAcc.Name;//LoanRec."Client Name";
//                         PayRecLines.Description := PCharges.Description;
//                         PayRecLines."Transaction Type" := PayRecLines."transaction type"::"Processing Fee";
//                         PayRecLines.Type := PayRecLines.Type::Other;
//                         PayRecLines."Transactions Code" := BosaSetup."Other Transactions";
//                         PayRecLines."Loan No." := LoanRec."Loan No.";
//                         PayRecLines."Loan Product Type Code" := LoanRec."Loan Product Type";
//                         PayRecLines.Amount := -Charge;
//                         PayRecLines.Validate(Amount);
//                         PayRecLines."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
//                         PayRecLines.Validate("Global Dimension 1 Code");
//                         /*PayRecLines."Posting Group":=PCharges."Customer Posting Group";
//                         PayRecLines.VALIDATE("Posting Group");*/
//                         if PayRecLines.Amount <> 0 then
//                             if not PayRecLines.Get(PayRecLines.No, PayRecLines."Line No") then
//                                 PayRecLines.Insert(true);

//                     end;
//                 until PCharges.Next = 0;
//             end;


//             //MESSAGE((Text0001),PayRec.No,LoanRec."Loan No.");

//         end;

//         //**********************************************************************
//         //To Modify the Loans Guarantors
//         //**********************************************************************
//         LGuaran.Reset;
//         LGuaran.SetRange(LGuaran."Loan No", LoanRec."Loan No.");
//         if LGuaran.Find('-') then begin
//             repeat
//                 LGuaran."Guarantee Approved" := true;
//                 LGuaran.Modify(true);
//             until LGuaran.Next = 0;
//         end;


//         //**********************************************************************
//         //To Modify the Loans table
//         //**********************************************************************
//         LoanRec.Status := LoanRec.Status::Approved;
//         LoanRec."Loan Status" := LoanRec."loan status"::Disbursement;
//         LoanRec."Issued Date" := Today;
//         LoanRec."Date Approved" := Today;
//         LoanRec."PV Created" := true;

//         LastPayDate1 := Format(LoanRec.Installments);
//         LRSchedule.Reset;
//         LRSchedule.SetRange("Loan No.", LoanRec."Loan No.");
//         LRSchedule.SetRange("Repayment Code", LastPayDate1);
//         if LRSchedule.Find('-') then
//             LastPayDate := LRSchedule."Repayment Date";
//         LoanRec."Last Scheduled Pay Date" := LastPayDate;
//         LoanRec.Modify;

//         PaymentMgt.PostPayments(PayRec);

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


//             /*LoanApp.RESET;
//             LoanApp.SETRANGE(LoanApp."Loan No.","Loan No.");
//             IF LoanApp.FIND('-') THEN
//             REPORT.RUN(51507249,TRUE,FALSE,LoanApp);*/




//         end;

//     end;
// }

