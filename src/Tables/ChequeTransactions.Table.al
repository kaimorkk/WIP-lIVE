Table 52193580 "Cheque Transactions"
{
    // //DrillDownPageID = UnknownPage51507387;
    // //LookupPageID = UnknownPage51507387;

    fields
    {
        field(1; No; Code[30])
        {
            NotBlank = true;
            TableRelation = Transactions.No where(Type = filter("Cheque Deposit"),
                                                   "Cheque Transferred" = filter(No),
                                                   Posted = const(true));

            trigger OnValidate()
            begin
                TransactionsRec.Reset;
                TransactionsRec.SetRange(TransactionsRec.No, No);
                if TransactionsRec.Find('-') then begin
                    "Account No" := TransactionsRec."Account No";
                    "Account Name" := TransactionsRec."Account Name";
                    "Transaction Type" := TransactionsRec."Transaction Type";
                    Amount := TransactionsRec.Amount;
                    Cashier := TransactionsRec.Cashier;
                    "Transaction Date" := TransactionsRec."Transaction Date";
                    "Transaction Time" := TransactionsRec."Transaction Time";
                    //Posted:=TransactionsRec.Posted;
                    "Account Type" := TransactionsRec."Account Type";
                    "Account Description" := TransactionsRec."Account Description";
                    "Cheque Type" := TransactionsRec."Cheque Type";
                    "Cheque No" := TransactionsRec."Cheque No";
                    "Cheque Date" := TransactionsRec."Cheque Date";
                    Payee := TransactionsRec.Payee;
                    "Bank No" := TransactionsRec."Bank No";
                    "Branch No" := TransactionsRec."Branch No";
                    "Clearing Charges" := TransactionsRec."Clearing Charges";
                    "Clearing Days" := TransactionsRec."Clearing Days";
                    Description := TransactionsRec.Description;
                    "Transaction Description" := TransactionsRec."Transaction Description";
                    "Expected Maturity Date" := TransactionsRec."Expected Maturity Date";
                    "Transaction Category" := TransactionsRec."Transaction Category";
                    Deposited := TransactionsRec.Deposited;
                    "Date Deposited" := TransactionsRec."Date Deposited";
                    "Time Deposited" := TransactionsRec."Time Deposited";
                    "Deposited By" := TransactionsRec."Deposited By";
                    "Staff/Payroll No" := TransactionsRec."Staff/Payroll No";
                end;
            end;
        }
        field(2; "Account No"; Code[30])
        {
            NotBlank = true;
            // TableRelation = Vendor where("Debtor Type" = const("Vendor Account"),
            //                               "Status 2" = filter(<> Closed));

            trigger OnValidate()
            begin
                //CHECK ACCOUNT ACTIVITY
                Members.Reset;
                // if Members.Get("Account No") then begin
                //     if Members."Status 2" = Members."status 2"::Dormant then begin
                //         Members."Status 2" := Members."status 2"::Active;
                //         Members.Modify;
                //     end;
                //     if Members."Status 2" = Members."status 2"::New then begin
                //     end
                //     else begin
                //         if Members."Status 2" <> Members."status 2"::Active then
                //             Error('The account is not active and therefore cannot be transacted upon.');
                //     end;
                // end;


                if Members.Get("Account No") then begin
                    "Account Name" := Members.Name;
                    Payee := Members.Name;
                    // "Account Type" := Members."Account Type 2";
                    "Currency Code" := Members."Currency Code";
                    //"ID Type":=Members."Identification Document";
                    // "ID No" := Members."ID No.";
                end;

                if AccountTypes.Get("Account Type") then begin
                    "Account Description" := AccountTypes.Description;
                    "Minimum Account Balance" := AccountTypes."Minimum Balance";
                    "Fee Below Minimum Balance" := AccountTypes."Fee Below Minimum Balance";
                    //"Normal Withdrawal Charge":=AccountTypes."Withdrawal Charge";
                    "Fee on Withdrawal > Interval" := AccountTypes."Withdrawal Penalty";
                end;

                CalcFields("Book Balance");
            end;
        }
        field(3; "Account Name"; Text[200])
        {
        }
        field(4; "Transaction Type"; Code[30])
        {
            NotBlank = true;
            //TableRelation = Table53006 where (Field11=field("Account Type"));

            trigger OnValidate()
            begin
                VarAmtHolder := 0;
                if TransactionTypes.Get("Transaction Type") then begin
                    "Transaction Description" := TransactionTypes.Description;
                    //"Transaction Mode":=TransactionTypes."Default Mode";
                    Evaluate(Type, Format(TransactionTypes.Name));
                end;

                if "Transaction Category" = 'BANKERS CHEQUE' then begin
                    if "Bankers Cheque Type" = "bankers cheque type"::Company then begin
                        TransactionCharges.Reset;
                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                        if TransactionCharges.Find('-') then begin
                            ////////
                            repeat
                                if TransactionCharges."Use Percentage" = true then begin
                                    if TransactionCharges."Charge Amount" = 0 then
                                        Error('Percentage of amount cannot be zero.');
                                    VarAmtHolder := VarAmtHolder + (TransactionCharges."Charge Amount" / 100) * "Suspended Amount";
                                end
                                else begin
                                    VarAmtHolder := VarAmtHolder + TransactionCharges."Charge Amount";
                                end;
                            /////////
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
                end
            end;
        }
        field(6; Cashier; Code[30])
        {
        }
        field(7; "Transaction Date"; Date)
        {

            trigger OnValidate()
            begin
                if ChequeTypes.Get("Cheque Type") then begin
                    Description := ChequeTypes.Description;
                    "Clearing Charges" := ChequeTypes."Clearing Charges";
                    "Clearing Days" := ChequeTypes."Clearing Days";
                    "Expected Maturity Date" := CalcDate(ChequeTypes."Clearing Days", "Transaction Date");
                end;
            end;
        }
        field(8; "Transaction Time"; Time)
        {
        }
        field(9; Posted; Boolean)
        {
            Editable = true;
        }
        field(10; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "Account Type"; Code[30])
        {
            //TableRelation = Table53007.Field1;
        }
        field(12; "Account Description"; Text[50])
        {
        }
        field(13; "Denomination Total"; Decimal)
        {
        }
        field(14; "Cheque Type"; Code[30])
        {
            TableRelation = "Cheque Types";
        }
        field(15; "Cheque No"; Text[100])
        {
        }
        field(16; "Cheque Date"; Date)
        {
        }
        field(17; Payee; Text[100])
        {
        }
        field(19; "Bank No"; Code[30])
        {
            TableRelation = Banks;

            trigger OnValidate()
            begin
                /*IF Banks.GET("Bank No") THEN BEGIN
                "Bank Name":=Banks.Name;
                END;*/

            end;
        }
        field(20; "Branch No"; Code[30])
        {
            //TableRelation = Table53154;
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
        field(26; "Transaction Mode"; Code[30])
        {
            Caption = 'Payment Mode';
            //TableRelation = Table53024;
        }
        field(27; Type; Text[50])
        {
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
            OptionMembers = No,Yes,Rejected,"No Charges";
        }
        field(39; "Checked By"; Text[50])
        {
        }
        field(40; "Fee on Withdrawal > Interval"; Decimal)
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
        field(48; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(49; "Transaction Category"; Code[30])
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
        field(53; "Deposited By"; Text[30])
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
            CalcFormula = - sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" where("Vendor No." = field("Account No")));
            FieldClass = FlowField;
        }
        field(60; "Notice No"; Code[30])
        {
        }
        field(61; "Notice Cleared"; Option)
        {
            OptionMembers = Pending,No,Yes,"No Charges";
        }
        field(62; "Schedule Amount"; Decimal)
        {
            CalcFormula = sum("Transaction Schedule Income".Amount where(No = field(No)));
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
        field(67; "Requested By"; Text[30])
        {
        }
        field(68; Overdraft; Boolean)
        {
        }
        field(69; "Cheque Processed"; Boolean)
        {
        }
        field(70; "Staff/Payroll No"; Text[30])
        {

            trigger OnValidate()
            begin
                /*Members.RESET;
                Members.SETRANGE(Members."Staff/Payroll No","Staff/Payroll No");
                
                IF Members.FIND('-')THEN BEGIN
                MESSAGE('its there');
                IF Members.Status=Members.Status::Dormant THEN BEGIN
                Members.Status:=Members.Status::Active;
                Members.MODIFY;
                END;
                IF Members.Status=Members.Status::New THEN BEGIN
                END
                ELSE BEGIN
                IF Members.Status<>Members.Status::Active THEN
                ERROR('The account is not active and therefore cannot be transacted upon.');
                END;
                END;
                
                
                IF Members.GET("Staff/Payroll No") THEN BEGIN
                "Account No":=Members."No.";
                "Account Name":=Members.Name;
                "Account Type":=Members."Account Type";
                "Currency Code":=Members."Currency Code";
                
                END;
                
                IF AccountTypes.GET("Account Type") THEN BEGIN
                "Account Description":=AccountTypes.Description;
                "Minimum Account Balance":=AccountTypes."Minimum Balance";
                "Fee Below Minimum Balance":=AccountTypes."Fee Below Minimum Balance";
                //"Normal Withdrawal Charge":=AccountTypes."Withdrawal Charge";
                "Fee on Withdrawal > Interval":=AccountTypes."Withdrawal Penalty";
                END;
                
                CALCFIELDS("Book Balance");
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
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COMPANY'));
        }
        field(83; "Schedule Type"; Option)
        {
            OptionMembers = ,"Salary Processing",Contributions;
        }
        field(84; "Banked By"; Code[30])
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
        field(88; "Cleared By"; Code[30])
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
        field(93; "ID Type"; Code[30])
        {
        }
        field(94; "ID No"; Code[30])
        {
        }
        field(95; "Reference No"; Code[30])
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
            Editable = false;
        }
        field(100; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(101; "Savers Total"; Decimal)
        {
        }
        field(102; "Mustaafu Total"; Decimal)
        {
        }
        field(103; "Junior Star Total"; Decimal)
        {
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
        field(115; "Transfer Header No"; Code[20])
        {
            TableRelation = "Cheque Transfers Header".No;
        }
    }

    keys
    {
        key(Key1; No, "Transfer Header No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /*IF Type<>'Cheque Deposit' THEN BEGIN
        IF Posted THEN BEGIN
        ERROR('The transaction has been posted and therefore cannot be deleted.');
        END;
        END;
        
        ChequeTransfers.RESET;
        ChequeTransfers.SETRANGE(ChequeTransfers.No,"Transfer Header No");
        IF ChequeTransfers.FIND('-') THEN BEGIN
        ERROR('The transfer has already been done therefore the transaction cannot be deleted.')
        END;
        
        IF Deposited THEN BEGIN
        ERROR('The cheque has already been deposited and therefore cannot be deleted.');
        END;
          */

    end;

    trigger OnInsert()
    begin
        /*ChequeTransfers.RESET;
        ChequeTransfers.SETRANGE(ChequeTransfers.No,"Transfer Header No");
        IF ChequeTransfers.FIND('-') THEN BEGIN
        ERROR('The transfer has already been done therefore the transaction cannot be modified.')
        END;*/

    end;

    trigger OnModify()
    begin
        //IF Type<>'Cheque Deposit' THEN BEGIN
        ///IF Posted THEN BEGIN
        //ERROR('The transaction has been posted and therefore cannot be modified.');
        //END;
        //END;

        //IF Deposited THEN BEGIN
        //ERROR('The cheque has already been deposited and therefore cannot be modified.');
        //END;
        /*
        ChequeTransfers.RESET;
        ChequeTransfers.SETRANGE(ChequeTransfers.No,"Transfer Header No");
        IF ChequeTransfers.FIND('-') THEN BEGIN
        ERROR('The transfer has already been done therefore the transaction cannot be modified.')
        END;
          */

    end;

    trigger OnRename()
    begin
        if Type <> 'Cheque Deposit' then begin
            if Posted then begin
                Error('The transaction has been posted and therefore cannot be modified.');
            end;

        end;

        if Deposited then begin
            Error('The cheque has already been deposited and therefore cannot be modified.');
        end;

        /*ChequeTransfers.RESET;
        ChequeTransfers.SETRANGE(ChequeTransfers.No,"Transfer Header No");
        IF ChequeTransfers.FIND('-') THEN BEGIN
        ERROR('The transfer has already been done therefore the transaction cannot be renamed.')
        END;
         */

    end;

    var
        NoSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Members: Record Vendor;
        AccountTypes: Record "Account Types";
        ChequeTypes: Record "Cheque Types";
        Banks: Record "Bank Account";
        PaymentMethod: Record "Payment Method";
        TransactionTypes: Record "Transaction Types";
        Cust: Record Customer;
        i: Date;
        PublicHoliday: Integer;
        j: Integer;
        weekday: Integer;
        Days: Integer;
        K: Integer;
        y: Integer;
        GLAcc: Record "G/L Account";
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        FA: Record "Fixed Asset";
        // LoanApp: Record Loans;
        GenLedgerSetup: Record "General Ledger Setup";
        TransactionCharges: Record "Transaction Charges";
        VarAmtHolder: Decimal;
        DimValue: Record "Dimension Value";
        TransactionsRec: Record Transactions;
        ChequeTransfers: Record "Cheque Transfers Header";
}

