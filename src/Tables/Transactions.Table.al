Table 52193497 Transactions
{
    DrillDownPageID = "Transactions List";
    LookupPageID = "Transactions List";

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    FosaSetup.Get();
                    NoSeriesMgt.TestManual(FosaSetup."Transaction Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Account No"; Code[20])
        {
            NotBlank = true;
            // TableRelation = Vendor where("Debtor Type" = const("FOSA Account"),
            //                               Status = filter(<> Closed));

            trigger OnValidate()
            begin
                //CHECK ACCOUNT ACTIVITY
                Account.Reset;
                if Account.Get("Account No") then begin
                    if Account.Status = Account.Status::"Pending Prepayment" then begin
                        Account.Status := Account.Status::Released;
                        Account.Modify;
                    end;
                    if Account.Status = Account.Status::Open then begin
                    end
                    else begin
                        if Account.Status <> Account.Status::Released then
                            Error('The account is not active and therefore cannot be transacted upon.');
                    end;

                    Account.CalcFields(Account.Balance);
                    "Account Name" := Account.Name;
                    Payee := Account.Name;
                    // "Account Type" := Account."Account Type";
                    "Currency Code" := Account."Currency Code";
                    // "Staff/Payroll No" := Account.staf;
                    "ID No" := Account."ID BRN";
                    //Picture := Account.Picture;
                    // Signature := Account.Signature;
                    // "Signing Instructions" := Account."Signing Instructions";
                    // if (Account.Balance <> 0) and (Account.Status = Account.Status::New) then begin
                    // Account.Status := Account.Status::Active;
                    //     Account.Modify;
                    // end;

                    "Book Balance" := Account.Balance;

                    // if Account."Account Category" = Account."account category"::Branch then
                    //     "Branch Transaction" := true;

                end;



                if AccountTypes.Get("Account Type") then begin
                    "Account Description" := AccountTypes.Description;
                    "Minimum Account Balance" := AccountTypes."Minimum Balance";
                    "Fee Below Minimum Balance" := AccountTypes."Fee Below Minimum Balance";
                    "Fee on Withdrawal Interval" := AccountTypes."Withdrawal Penalty";
                    "Don't Allow Transactions" := AccountTypes."Don't Allow Transactions";
                end;
            end;
        }
        field(3; "Account Name"; Text[200])
        {
        }
        field(4; "Transaction Type"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Transaction Types";

            trigger OnValidate()
            begin
                VarAmtHolder := 0;
                if TransactionTypes.Get("Transaction Type") then begin
                    "Transaction Mode" := TransactionTypes."Default Mode";
                    "Transaction Span" := TransactionTypes."Transaction Span";
                    "Transaction Description" := TransactionTypes.Description;
                end;

                Evaluate(Type, Format(TransactionTypes.Type));

                AccTypes.Reset;
                AccTypes.SetRange(Code, TransactionTypes."Account Type");
                if AccTypes.Find('-') then
                    if "Account No" <> '' then begin
                        Acc.SetRange("No.", "Account No");
                        // Acc.SetRange("Account Type", AccTypes.Code);
                        // if Acc.Find('-') then
                        //     AccNos := Acc."Account Type";
                        // AccTransNos := TransactionTypes."Account Type";

                        if AccNos = AccTransNos then begin

                            if "Transaction Category" = 'BANKERS CHEQUE' then begin
                                if "Bankers Cheque Type" = "bankers cheque type"::Company then begin
                                    TransactionCharges.Reset;
                                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                                    if TransactionCharges.Find('-') then begin

                                        repeat
                                            if TransactionCharges."Use Percentage" = true then begin
                                                if TransactionCharges."Charge Amount" = 0 then
                                                    Error('Percentage of amount cannot be zero.');
                                                VarAmtHolder := VarAmtHolder + (TransactionCharges."Charge Amount" / 100) * "Suspended Amount";
                                            end
                                            else begin
                                                VarAmtHolder := VarAmtHolder + TransactionCharges."Charge Amount";
                                            end;
                                        until TransactionCharges.Next = 0;
                                    end;

                                    if "Suspended Amount" <> 0 then begin
                                        Amount := "Suspended Amount" - VarAmtHolder;
                                    end
                                    else begin
                                        Amount := 0;
                                    end;

                                end;
                            end;
                        end else
                            Error('The Selected Account No, cannot perform the selected transaction');
                    end;

                Validate(Type);
            end;
        }
        field(5; Amount; Decimal)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Transaction Category" = 'BANKERS CHEQUE' then begin
                    if "Bankers Cheque Type" = "bankers cheque type"::Company then begin
                    end;
                end;
            end;
        }
        field(6; Cashier; Code[50])
        {
            Editable = false;
        }
        field(7; "Transaction Date"; Date)
        {
            Editable = true;

            trigger OnValidate()
            begin
                if "Transaction Mode" = "transaction mode"::Cash then begin
                    if ChequeTypes.Get("Cheque Type") then begin
                        CDays := ChequeTypes."Clearing  Days" + 1;

                        EMaturity := "Transaction Date";
                        if i < CDays then begin
                            repeat
                                EMaturity := CalcDate('1D', EMaturity);
                                if (Date2dwy(EMaturity, 1) <> 6) and (Date2dwy(EMaturity, 1) <> 7) then
                                    i := i + 1;

                            until i = CDays;
                        end;

                        "Expected Maturity Date" := EMaturity;

                    end;
                end;
            end;
        }
        field(8; "Transaction Time"; Time)
        {
            Editable = false;
        }
        field(9; Posted; Boolean)
        {
            Editable = true;
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "Account Type"; Code[20])
        {
            TableRelation = "Account Types".Code;
        }
        field(12; "Account Description"; Text[50])
        {
        }
        field(13; "Denomination Total"; Decimal)
        {
        }
        field(14; "Cheque Type"; Code[20])
        {
            TableRelation = "Cheque Types";

            trigger OnValidate()
            begin
                if ChequeTypes.Get("Cheque Type") then begin
                    Description := ChequeTypes.Description;
                    "Clearing Charges" := ChequeTypes."Clearing Charges";
                    "Clearing Days" := ChequeTypes."Clearing Days";

                    CDays := ChequeTypes."Clearing  Days" + 1;

                    EMaturity := "Transaction Date";
                    if i < CDays then begin
                        repeat
                            EMaturity := CalcDate('1D', EMaturity);
                            if (Date2dwy(EMaturity, 1) <> 6) and (Date2dwy(EMaturity, 1) <> 7) then
                                i := i + 1;

                        until i = CDays;
                    end;

                    "Expected Maturity Date" := EMaturity;

                end;
            end;
        }
        field(15; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                Validate("Cheque From Local Account");
            end;
        }
        field(16; "Cheque Date"; Date)
        {
        }
        field(17; Payee; Text[100])
        {
        }
        field(19; "Bank No"; Code[20])
        {
            TableRelation = "Bank Account"."No." where(Type = filter(Bank));
        }
        field(20; "Branch No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*BanksList.RESET;
                IF BanksList.GET("Branch No") THEN BEGIN
                "Branch Name":=BanksList."Bank Name";
                END;
                */

            end;
        }
        field(21; "Clearing Charges"; Decimal)
        {
        }
        field(22; "Clearing Days"; DateFormula)
        {
        }
        field(23; Description; Text[150])
        {
        }
        field(24; "Bank Name"; Text[150])
        {
        }
        field(25; "Branch Name"; Text[150])
        {
        }
        field(26; "Transaction Mode"; Option)
        {
            Caption = 'Payment Mode';
            OptionCaption = ' ,Cash,Cheque,EFT';
            OptionMembers = " ",Cash,Cheque,EFT;
        }
        field(27; Type; Option)
        {
            OptionCaption = ' ,Cash Deposit,Withdrawal,Cheque Deposit,ATM Cash Deposit,ATM Cheque Deposit,ATM Withdrawal,BOSA Receipt,BOSA Withdrawal,Bankers Cheque,Encashment,Other Withdrawal';
            OptionMembers = " ","Cash Deposit",Withdrawal,"Cheque Deposit","ATM Cash Deposit","ATM Cheque Deposit","ATM Withdrawal","BOSA Receipt","BOSA Withdrawal","Bankers Cheque",Encashment,"Other Withdrawal";

            trigger OnValidate()
            begin
                FosaCurrMngt.CoinsTotals(Rec);
            end;
        }
        field(31; "Transaction Description"; Text[100])
        {
        }
        field(32; "Minimum Account Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(33; "Fee Below Minimum Balance"; Decimal)
        {
        }
        field(34; "Normal Withdrawal Charge"; Decimal)
        {
        }
        field(36; Authorised; Option)
        {
            Editable = true;
            OptionMembers = No,Yes,Rejected,"No Charges";

            trigger OnValidate()
            begin
                "Withdrawal FrequencyAuthorised" := Authorised;
            end;
        }
        field(39; "Checked By"; Text[50])
        {
        }
        field(40; "Fee on Withdrawal Interval"; Decimal)
        {
        }
        field(41; Remarks; Text[250])
        {
        }
        field(42; Status; Option)
        {
            OptionMembers = Pending,Honoured,Stopped,Bounced;
        }
        field(43; "Date Posted"; Date)
        {
        }
        field(44; "Time Posted"; Time)
        {
        }
        field(45; "Posted By"; Text[50])
        {
        }
        field(46; "Expected Maturity Date"; Date)
        {
        }
        field(47; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(48; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(49; "Transaction Category"; Code[20])
        {
        }
        field(50; Deposited; Boolean)
        {
        }
        field(51; "Date Deposited"; Date)
        {
        }
        field(52; "Time Deposited"; Time)
        {
        }
        field(53; "Deposited By"; Text[50])
        {
        }
        field(54; "Post Dated"; Boolean)
        {
        }
        field(55; Select; Boolean)
        {
        }
        field(56; "Status Date"; Date)
        {
        }
        field(57; "Status Time"; Time)
        {
        }
        field(58; "Supervisor Checked"; Boolean)
        {
        }
        field(59; "Book Balance"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(60; "Notice No"; Code[20])
        {
        }
        field(61; "Notice Cleared"; Option)
        {
            OptionMembers = Pending,No,Yes,"No Charges";
        }
        field(62; "Schedule Amount"; Decimal)
        {
            CalcFormula = sum("Transaction Schedule Income".Amount where(No = field(No)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(63; "Has Schedule"; Boolean)
        {
        }
        field(64; Requested; Boolean)
        {
        }
        field(65; "Date Requested"; Date)
        {
        }
        field(66; "Time Requested"; Time)
        {
        }
        field(67; "Requested By"; Text[50])
        {
        }
        field(68; Overdraft; Boolean)
        {
        }
        field(69; "Cheque Processed"; Boolean)
        {
        }
        field(70; "Staff/Payroll No"; Text[20])
        {

            trigger OnValidate()
            begin
                /*Account.RESET;
                Account.SETRANGE(Account."Staff/Payroll No","Staff/Payroll No");
                
                IF Account.FIND('-')THEN BEGIN
                MESSAGE('its there');
                IF Account.Status=Account.Status::Dormant THEN BEGIN
                Account.Status:=Account.Status::Active;
                Account.MODIFY;
                END;
                IF Account.Status=Account.Status::New THEN BEGIN
                END
                ELSE BEGIN
                IF Account.Status<>Account.Status::Active THEN
                ERROR('The account is not active and therefore cannot be transacted upon.');
                END;
                END;
                
                
                IF Account.GET("Staff/Payroll No") THEN BEGIN
                "Account No":=Account."No.";
                "Account Name":=Account.Name;
                "Account Type":=Account."Account Type";
                "Currency Code":=Account."Currency Code";
                
                END;
                
                IF AccountTypes.GET("Account Type") THEN BEGIN
                "Account Description":=AccountTypes.Description;
                "Minimum Account Balance":=AccountTypes."Minimum Balance";
                "Fee Below Minimum Balance":=AccountTypes."Fee Below Minimum Balance";
                //"Normal Withdrawal Charge":=AccountTypes."Withdrawal Charge";
                "Fee on Withdrawal > Interval":=AccountTypes."Withdrawal Penalty";
                END;
                
                 */

            end;
        }
        field(71; "Cheque Transferred"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(72; "Expected Amount"; Decimal)
        {
        }
        field(73; "Line Totals"; Decimal)
        {
        }
        field(74; "Transfer Date"; Date)
        {
        }
        field(75; "BIH No"; Code[20])
        {
        }
        field(76; "Transfer No"; Code[20])
        {
        }
        field(77; Attached; Boolean)
        {
        }
        field(78; "BOSA Account No"; Code[20])
        {
            TableRelation = Customer."No.";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange(Cust."No.", "BOSA Account No");
                if Cust.Find('-') then begin

                    //CH"Reference No":=Cust."Staff No.";

                end;
            end;
        }
        field(79; "Salary Processing"; Option)
        {
            OptionMembers = " ",No,Yes;
        }
        field(80; "Expense Account"; Code[30])
        {
            //TableRelation = Table53163.Field1;
        }
        field(81; "Expense Description"; Text[150])
        {
        }
        field(82; "Company Code"; Code[30])
        {
            // //TableRelation = Employer."No.";
        }
        field(83; "Schedule Type"; Option)
        {
            OptionMembers = ,"Salary Processing",Contributions,"ATM EFT Transactions","Savings Loan Recoveries";
        }
        field(84; "Banked By"; Code[20])
        {
        }
        field(85; "Date Banked"; Date)
        {
        }
        field(86; "Time Banked"; Time)
        {
        }
        field(87; "Banking Posted"; Boolean)
        {
        }
        field(88; "Cleared By"; Code[50])
        {
        }
        field(89; "Date Cleared"; Date)
        {
        }
        field(90; "Time Cleared"; Time)
        {
        }
        field(91; "Clearing Posted"; Boolean)
        {
        }
        field(92; "Needs Approval"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(93; "ID Type"; Code[20])
        {
        }
        field(94; "ID No"; Code[50])
        {
        }
        field(95; "Reference No"; Code[20])
        {
        }
        field(96; "Refund Cheque"; Boolean)
        {
        }
        field(97; Imported; Boolean)
        {
        }
        field(98; "External Account No"; Code[30])
        {
        }
        field(99; "BOSA Transactions"; Decimal)
        {
            // CalcFormula = sum("Loan Off Set FOSA"."Amount Received" where("Transaction No" = field(No),
            //    "Member No" = field("BOSA Account No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(101; "Savers Total"; Decimal)
        {
            FieldClass = Normal;
        }
        field(102; "Mustaafu Total"; Decimal)
        {
            FieldClass = Normal;
        }
        field(103; "Junior Star Total"; Decimal)
        {
            FieldClass = Normal;
        }
        field(104; Printed; Boolean)
        {
        }
        field(105; "Account Type."; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(106; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type." = const("G/L Account")) "G/L Account"
            else if ("Account Type." = const(Customer)) Customer
            else if ("Account Type." = const(Vendor)) Vendor
            else if ("Account Type." = const("Bank Account")) "Bank Account"
            else if ("Account Type." = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type." = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin

                if "Account Type." in ["account type."::Customer, "account type."::Vendor, "account type."::
                "IC Partner"] then
                    case "Account Type." of
                        "account type."::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");


                            end;


                        "account type."::Customer:
                            begin
                                Cust.Get("Account No.");

                            end;
                        "account type."::Vendor:
                            begin
                                Vend.Get("Account No.");
                            end;
                        "account type."::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                            end;
                        "account type."::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                            end;
                    end;
            end;
        }
        field(107; "Withdrawal FrequencyAuthorised"; Option)
        {
            OptionMembers = No,Yes,Rejected;
        }
        field(108; "Frequency Needs Approval"; Option)
        {
            OptionMembers = " ",No,Yes;
        }
        field(109; "Special Advance No"; Code[20])
        {
        }
        field(110; "Bankers Cheque Type"; Option)
        {
            OptionMembers = Normal,Company;

            trigger OnValidate()
            begin
                if "Bankers Cheque Type" = "bankers cheque type"::Company then begin
                    GenLedgerSetup.Get;

                    GenLedgerSetup.TestField(GenLedgerSetup."Company Bankers Cheque Account");
                    "Account Type." := "account type."::"G/L Account";
                    "Account No." := GenLedgerSetup."Company Bankers Cheque Account";

                end else begin
                    "Account No." := '';
                end;
            end;
        }
        field(111; "Suspended Amount"; Decimal)
        {
        }
        field(112; "Transferred By EFT"; Boolean)
        {
        }
        field(113; "Banking User"; Code[20])
        {
        }
        field(114; "Company Text Name"; Code[20])
        {
        }
        field(115; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(116; "Total Salaries"; Integer)
        {
            FieldClass = Normal;
        }
        field(117; "EFT Transferred"; Boolean)
        {
        }
        field(118; "ATM Transactions Total"; Decimal)
        {
            FieldClass = Normal;
        }
        field(119; "Bank Code"; Code[20])
        {
            TableRelation = Banks.Code;

            trigger OnValidate()
            begin
                if BanksList.Get("Bank Code") then begin
                    "Bank Name" := BanksList."Bank Name";
                    "Branch Name" := BanksList.Branch;
                end;
            end;
        }
        field(120; "External Account Name"; Text[50])
        {
        }
        field(121; "Overdraft Limit"; Decimal)
        {
        }
        field(122; "Overdraft Allowed"; Boolean)
        {
        }
        field(123; "Available Balance"; Decimal)
        {
        }
        field(124; "Authorisation Requirement"; Text[50])
        {
        }
        field(125; "Bankers Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                if BRegister.Get("Bankers Cheque No") then begin
                    BRegister."Leaf Issued" := true;
                    BRegister.Modify;
                end;
            end;
        }
        field(126; "Transaction Span"; Option)
        {
            OptionCaption = 'FOSA,BOSA';
            OptionMembers = FOSA,BOSA;
        }
        field(127; "Uncleared Cheques"; Decimal)
        {
            CalcFormula = sum(Transactions.Amount where("Account No" = field("Account No"),
                                                         Posted = const(true),
                                                         "Cheque Processed" = const(false),
                                                         Type = const("Cheque Deposit")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(128; "Transaction Available Balance"; Decimal)
        {
        }
        field(129; "Branch Account"; Code[20])
        {
            // TableRelation = Vendor."No." where("Creditor Type" = const(Account),
            //                                     "Account Category" = const(Branch));

            trigger OnValidate()
            begin
                if Acc.Get("Branch Account") then
                    "FOSA Branch Name" := Acc.Name;
            end;
        }
        field(130; "Branch Transaction"; Boolean)
        {
        }
        field(131; "FOSA Branch Name"; Text[30])
        {
        }
        field(133; "Branch Refference"; Text[30])
        {
        }
        field(134; "Branch Account No"; Code[20])
        {
        }
        field(135; "Branch Transaction Date"; Date)
        {
        }
        field(136; "Post Attempted"; Boolean)
        {
        }
        field(137; "Transacting Branch"; Code[20])
        {
            Editable = false;
        }
        field(138; Signature; Blob)
        {
        }
        field(139; "Income Type"; Option)
        {
            OptionMembers = KTDA,Salary,Milk,Coffee,Other;
        }
        field(140; Commissions; Decimal)
        {
            FieldClass = Normal;
        }
        field(141; "Un Indentified Total"; Decimal)
        {
        }
        field(142; "Signing Instructions"; Text[150])
        {
        }
        field(143; "Withdraw Uncleared"; Boolean)
        {
        }
        field(144; Source; Option)
        {
            OptionCaption = ' ,FOSA Account,Bank,G/L Account';
            OptionMembers = " ","FOSA Account",Bank,"G/L Account";
        }
        field(145; "Source Number"; Code[20])
        {
            TableRelation = if (Source = filter("G/L Account")) "G/L Account"."No."
            else if (Source = filter(Bank)) "Bank Account"."No.";
            // else if (Source = const("FOSA Account")) Vendor."No." where("Debtor Type" = const("FOSA Account"));

            trigger OnValidate()
            begin
                Account.Reset;
                Account.SetRange(Account."No.", "Source Number");
                if Account.Find('-') then begin
                    "Account Name" := Account.Name;
                end;

                Banks.Reset;
                Banks.SetRange(Banks."No.", "Source Number");
                if Banks.Find('-') then begin
                    "Account Name" := Banks.Name;
                end;

                GLAcc.Reset;
                GLAcc.SetRange(GLAcc."No.", "Source Number");
                if GLAcc.Find('-') then begin
                    "Account Name" := GLAcc.Name;
                end;
            end;
        }
        field(146; "Don't Allow Transactions"; Boolean)
        {
        }
        field(147; "10 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(148; "20 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(149; "50 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(150; "100 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(151; "200 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(152; "1000 Maloti Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(153; "5 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(154; "10 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(155; "20 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(156; "50 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(157; "1 Loti"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(158; "2 Maloti"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(159; "Currency Denominational Totals"; Decimal)
        {
            CalcFormula = sum(Denominations.Totals where(Code = field(No)));
            Editable = false;
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                if (Type = Type::"Cash Deposit") or (Type = Type::Withdrawal) then begin
                    CalcFields("Currency Denominational Totals");
                    Amount := "Currency Denominational Totals";
                    Validate(Amount);
                end;
            end;

            trigger OnValidate()
            begin
                /*IF (Type = Type::"Cash Deposit") OR (Type = Type::Withdrawal) THEN BEGIN
                CALCFIELDS("Currency Denominational Totals");
                MESSAGE(FORMAT("Currency Denominational Totals"));
                 Amount:="Currency Denominational Totals";

                MESSAGE(FORMAT(Amount));
                END;*/

                if (Type = Type::"Cash Deposit") or (Type = Type::Withdrawal) then begin
                    CalcFields("Currency Denominational Totals");
                    Amount := "Currency Denominational Totals";
                    Validate(Amount);

                    Message(Format(Amount))
                end;

            end;
        }
        field(160; "5 Maloti"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(161; "10 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(162; "20 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(163; "50 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                 */

            end;
        }
        field(164; "100 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(165; "200 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                 */

            end;
        }
        field(166; "1000 Rand Notes"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                */

            end;
        }
        field(167; "5 Cents"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(168; "10 Cents"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(169; "20 Cents"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(170; "50 Cents"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(171; "1 Rand"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(172; "2 Rand"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(173; "5 Rand"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(174; "Special Service"; Boolean)
        {
        }
        field(175; "Commission Charge"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := "Schedule Amount" + "Commission Charge";
            end;
        }
        field(176; "Total Coinage"; Decimal)
        {
        }
        field(177; "Cheque From Local Account"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                // CheqReq.Reset;
                // CheqReq.SetRange(CheqReq."Account No.", "Account No");
                // CheqReq.SetRange(Status, CheqReq.Status::Released);
                // // CheqReq.SetRange(Issued, true);
                // if CheqReq.Find('-') then begin
                //     if CheqBook.Get(CheqReq."Cheque Book") then begin
                //         CheqBkLeaf.Reset;
                //         CheqBkLeaf.SetRange("Book No.", CheqReq."Cheque Book");
                //         CheqBkLeaf.SetRange("Banker Cheque No.", "Cheque No");
                //         CheqBkLeaf.SetRange(Transacted, false);
                //         if CheqBkLeaf.Blocked then
                //             Error('The Cheque No. %1 has been BLOCKED, the transaction will Terminate', "Cheque No");
                //     end;


                // end;
            end;
        }
        field(178; "Express Cheque"; Boolean)
        {
        }
        field(179; "Approval User Id"; Code[50])
        {
        }
        field(180; Cheque; Code[30])
        {
            // TableRelation = "Cheque Book- Leaf  Requisition" where("Account No." = field("Account No"));

            trigger OnValidate()
            begin
                // if CheqReq.Get(Cheque) then begin
                //     if CheqBook.Get(CheqReq."Cheque Book") then begin
                //         CheqBkLeaf.Reset;
                //         CheqBkLeaf.SetRange(CheqBkLeaf."Book No.", CheqReq."Cheque Book");
                //         CheqBkLeaf.SetRange(CheqBkLeaf.Blocked, false);
                //         CheqBkLeaf.SetRange(CheqBkLeaf.Transacted, false);
                //         if CheqBkLeaf.Find('-') then
                //             "Local Cheque No." := CheqBkLeaf."Banker Cheque No.";

                //     end;

                // end;
            end;
        }
        field(181; "Local Cheque No."; Code[30])
        {
        }
        field(182; "Charge Salary Commission"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Charge Salary Commission" then
                    "Charg External Loan Commission" := false;
            end;
        }
        field(183; "Charg External Loan Commission"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Charg External Loan Commission" then
                    "Charge Salary Commission" := false;
            end;
        }
        field(184; "1 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(185; "2 Lisente"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(186; "1 Cent"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(187; "2 Cents"; Integer)
        {

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
                FosaCurrMngt.CoinsTotals(Rec);*/

            end;
        }
        field(188; "Schedule Loan Amount"; Decimal)
        {
            CalcFormula = sum("Transaction Schedule Income".Amount where(No = field(No)));
            //   "Loan Repayment" = filter(true)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Transfer No")
        {
            SumIndexFields = Amount;
        }
        key(Key3; Type, "Transaction Date", Posted, "Transaction Category")
        {
            SumIndexFields = Amount;
        }
        key(Key4; "Account No", "Cheque Processed", Deposited, "Transaction Category")
        {
            SumIndexFields = Amount;
        }
        key(Key5; Deposited, Posted, "Transaction Category", "Transaction Date", "Has Schedule")
        {
            SumIndexFields = Amount;
        }
        key(Key6; Requested, "Transaction Category", "Transaction Date")
        {
            SumIndexFields = Amount;
        }
        key(Key7; "Account No", "Cheque Processed", Posted, Type)
        {
            SumIndexFields = Amount;
        }
        key(Key8; Posted, "Transaction Date", "Account No", Type)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if Type <> Type::Withdrawal then begin
            if Posted then begin
                Error('The transaction has been posted and therefore cannot be deleted.');
            end;
        end;

        if Deposited then begin
            Error('The cheque has already been deposited and therefore cannot be deleted.');
        end;
    end;

    trigger OnInsert()
    begin

        if No = '' then begin
            FosaSetup.Get();
            FosaSetup.TestField(FosaSetup."Transaction Nos.");
            NoSeriesMgt.InitSeries(FosaSetup."Transaction Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        Cashier := UserId;
        "Transaction Date" := Today;
        "Transaction Time" := Time;
        Status := Status::Pending;
        "Needs Approval" := "needs approval"::Yes;
        "Frequency Needs Approval" := "frequency needs approval"::Yes;

        if UsersID.Get(UserId) then
            "Transacting Branch" := UsersID.Branch;
    end;

    trigger OnModify()
    begin
        //******Calculation of Denominational totals code
        FosaCurrMngt."Denominational Totals"(Deno);
        //******
    end;

    trigger OnRename()
    begin
        if Type = Type::Withdrawal then begin
            if Posted then begin
                Error('The transaction has been posted and therefore cannot be modified.');
            end;
        end;

        if Deposited then begin
            Error('The cheque has already been deposited and therefore cannot be modified.');
        end;
    end;

    var
        FosaSetup: Record "Fosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Account: Record Vendor;
        AccountTypes: Record "Account Types";
        ChequeTypes: Record "Cheque Types";
        Banks: Record "Bank Account";
        BankBranches: Record "Bank Branch";
        PaymentMethod: Record "Payment Method";
        TransactionTypes: Record "Transaction Types";
        Denominations: Record Denominations;
        Cust: Record Customer;
        i: Integer;
        PublicHoliday: Integer;
        weekday: Integer;
        CDays: Integer;
        BanksList: Record Banks;
        GLAcc: Record "G/L Account";
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        FA: Record "Fixed Asset";
        GenLedgerSetup: Record "General Ledger Setup";
        TransactionCharges: Record "Transaction Charges";
        VarAmtHolder: Decimal;
        DimValue: Record "Dimension Value";
        EMaturity: Date;
        BRegister: Record "Banker Cheque Register";
        Acc: Record Vendor;
        UsersID: Record "User Setup";
        FosaCurrMngt: Codeunit "Fosa Currency Management";
        AccTypes: Record "Account Types";
        AccNos: Code[20];
        AccTransNos: Code[20];
        TransType: Option;
        AvailableBalance: Decimal;
        AccType: Code[20];
        // CheqReq: Record "Cheque Book- Leaf  Requisition";
        // CheqBook: Record "Cheque Book";
        CheqBkLeaf: Record "Banker Cheque Register";
        Deno: Record Denominations;


    procedure CalcAvailableBal()
    var
        UnClearedBalance: Decimal;
        TCharges: Decimal;
        MinAccBal: Decimal;
        FeeBelowMinBal: Decimal;
        AccountNo: Code[30];
        IntervalPenalty: Decimal;
        Charges: Record "Charges - FOSA";
        ATMTrans: Decimal;
        ATMBalance: Decimal;
        Uncleared: Boolean;
        AmountUncleared: Decimal;
        "IntervalG/LAcc": Code[20];
        TotalUnprocessed: Decimal;
        ChargesOnFD: Decimal;
        ChargeAmnt: Decimal;
    begin
        FosaSetup.Get;
        ATMBalance := 0;

        TCharges := 0;
        AvailableBalance := 0;
        MinAccBal := 0;
        TotalUnprocessed := 0;
        IntervalPenalty := 0;
        "IntervalG/LAcc" := '';

        if Account.Get("Account No") then begin
            // Account.CalcFields(Account.Balance, Account."Uncleared Cheques");

            AccountTypes.Reset;
            AccountTypes.SetRange(AccountTypes.Code, "Account Type");
            if AccountTypes.Find('-') then begin
                MinAccBal := AccountTypes."Minimum Balance";
                FeeBelowMinBal := AccountTypes."Fee Below Minimum Balance";


                //Check Withdrawal Interval
                if Account.Status <> Account.Status::Open then begin
                    if Type = Type::Withdrawal then begin
                        AccountTypes.Reset;
                        AccountTypes.SetRange(AccountTypes.Code, "Account Type");
                        if AccountTypes."Don't Allow Transactions" <> true then begin
                            // if Account."Last Withdrawal Date" <> 0D then begin
                            //     if CalcDate(AccountTypes."Withdrawal Interval", Account."Last Withdrawal Date") > Today then
                            //         IntervalPenalty := AccountTypes."Withdrawal Penalty";
                            //     "IntervalG/LAcc" := AccountTypes."Withdrawal Interval Account";
                            // end;
                        end else begin
                            IntervalPenalty := AccountTypes."Withdrawal Penalty";
                            "IntervalG/LAcc" := AccountTypes."Withdrawal Interval Account";



                        end;
                    end;
                    //Check Withdrawal Interval

                    //Fixed Deposit
                    ChargesOnFD := 0;
                    if AccountTypes."Fixed Deposit" = true then begin
                        // if Account."Expected Maturity Date" > Today then
                        //     ChargesOnFD := AccountTypes."Charge Closure Before Maturity";
                    end;
                    //Fixed Deposit


                    //Current Charges
                    TransactionCharges.Reset;
                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                    if TransactionCharges.Find('-') then begin
                        repeat
                            if TransactionCharges."Use Percentage" = true then begin
                                TransactionCharges.TestField("Percentage of Amount");
                                //TCharges:=TCharges+(TransactionCharges."Percentage of Amount"/100)*"Book Balance";
                            end else begin

                                if Amount > FosaSetup."Flat rate Charge on CW" then begin
                                    ChargeAmnt := Amount / FosaSetup."Amount Per Charge" * TransactionCharges."Charge Amount";
                                    TCharges := ChargeAmnt;
                                    /*IF ChargeAmnt > FosaSetup."Maximum Charge" THEN BEGIN
                                    TCharges:=FosaSetup."Maximum Charge";
                                    END ELSE
                                    TCharges:=ChargeAmnt;*/
                                end else
                                    TCharges := TransactionCharges."Charge Amount";


                            end;
                        until TransactionCharges.Next = 0;

                    end;


                    // TotalUnprocessed := Account."Uncleared Cheques";
                    // ATMBalance := Account."ATM Transactions";

                    //FD
                    if AccountTypes."Fixed Deposit" = false then begin
                        if Account.Balance < MinAccBal then
                            AvailableBalance := Account.Balance - FeeBelowMinBal - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance
                        else
                            AvailableBalance := Account.Balance - TCharges - IntervalPenalty - MinAccBal - TotalUnprocessed - ATMBalance;

                    end else begin
                        AvailableBalance := Account.Balance - TCharges - ChargesOnFD;
                    end;
                end;
                //FD

            end;
        end;

    end;
}

