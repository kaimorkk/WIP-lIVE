Table 52193692 PaymentsX1
{
    DrillDownPageID = "Payment Voucher Card";
    LookupPageID = "Payment Voucher Card";

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get;
                    /*
                    IF "Payment Type"="Payment Type"::"0" THEN BEGIN
                      NoSeriesMgt.TestManual(GenLedgerSetup."Withholding Agent");
                    END
                    ELSE BEGIN
                      NoSeriesMgt.TestManual(GenLedgerSetup."Default Bank Account");
                    END;
                    */
                    "No. Series" := '';
                end;

            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; Type; Code[20])
        {

            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                /*
                RecPayTypes.RESET;
                RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::"2");
                
                IF RecPayTypes.FIND('-') THEN BEGIN
                Grouping:=RecPayTypes."Default Grouping";
                END;
                
                IF RecPayTypes.FIND('-') THEN BEGIN
                "Account Type":=RecPayTypes."Account Type";
                "Transaction Name":=RecPayTypes.Description;
                "Investment Type":=RecPayTypes."Investment Type";
                "Investment Transcation Type":=RecPayTypes."Investment Transcation Type";
                "No. Of Units Required":=RecPayTypes."No. Of Units Required";
                "VAT Code":=RecPayTypes."VAT Code";
                "Calculate Interest":=RecPayTypes."Calculate Interest";
                IF RecPayTypes."Account Type"=RecPayTypes."Account Type"::"0" THEN BEGIN
                //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                "Account No.":=RecPayTypes."G/L Account";
                
                IF "Account No."<>'' THEN
                VALIDATE("Account No.");
                END;
                
                
                END;
                 */
                //VALIDATE("Account No.");

            end;
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Modes1".Code;
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
            //TableRelation = Table50120;
        }
        field(8; "Bank Code"; Code[20])
        {
            //TableRelation = Table50006.Field6;

            trigger OnValidate()
            begin
                /*
                KBABanks.RESET;
                KBABanks.SETRANGE(KBABanks."Microlan Bank","Bank Code");
                IF KBABanks.FIND('-') THEN
                "Bank Code":=KBABanks."KBA Code";
                 IF xRec."Bank Code"<>'' THEN
                 BEGIN
                 IF "KBA Branch Code"<>'' THEN
                 ERROR('Delete the KBA Branch code before changing the Bank Code');
                 END
                 */

            end;
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[20])
        {
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset" where("Asset Type" = field("Investment Type"))
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer, "account type"::Vendor, "account type"::"IC Partner"]
                then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := '';
                                "Control Ac" := "Account No.";
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                Payee := Cust.Name;
                                "VAT Code" := Cust."KBA Branch Code";
                                "Withholding Tax Code" := Cust."Withholding Tax Code";
                                "Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
                                "Control Ac" := Cust."Customer Posting Group";
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                Payee := Vend.Name;
                                "VAT Code" := Vend."KBA Code";
                                "Withholding Tax Code" := Vend."KBA Branch Code";
                                "Global Dimension 1 Code" := Vend."Global Dimension 1 Code";
                                "Control Ac" := Vend."Vendor Posting Group";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
                                "Control Ac" := BankAcc."Bank Acc. Posting Group";

                            end;
                        "account type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;
                                // "VAT Code":=FA."Fixed Asset Type";
                                //"Withholding Tax Code":=FA."Max. Carrying Capacity";
                                "Global Dimension 1 Code" := FA."Global Dimension 1 Code";
                            end;
                    end;
            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
        }
        field(20; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := ROUND(Amount, 1);
            end;
        }
        field(21; Remarks; Text[100])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "VAT Code"; Code[20])
        {
            //TableRelation = Table50122;
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            //TableRelation = Table50122;
        }
        field(25; "VAT Amount"; Decimal)
        {
        }
        field(26; "Withholding Tax Amount"; Decimal)
        {
        }
        field(27; "Net Amount"; Decimal)
        {
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No." where(rrrr = field("Bank Type"));
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(31; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(32; "PO/INV No"; Code[20])
        {
        }
        field(33; "Bank Account No"; Code[20])
        {
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Cancelled;
        }
        field(36; Select; Boolean)
        {
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(41; "Apply to"; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Vendor No." where("Vendor No." = field("Account No."));
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(44; "No. Of Units"; Decimal)
        {
        }
        field(45; "Investment No"; Code[20])
        {
            TableRelation = "Fixed Asset" where("Asset Type" = field("Investment Type"));

            trigger OnValidate()
            begin
                if "Calculate Interest" then begin
                    if InvestmentRec.Get("Investment No") then begin
                        //"Interest Rate":=InvestmentRec."Rate %";
                        // "Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);

                    end;
                end;
            end;
        }
        field(46; "Investment Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(47; "Investment Transcation Type"; Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(48; "No. Of Units Required"; Boolean)
        {
        }
        field(49; Multiple; Boolean)
        {
        }
        field(50; "Interest Amount"; Decimal)
        {
        }
        field(51; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 6;

            trigger OnValidate()
            begin
                if "Calculate Interest" then begin
                    if InvestmentRec.Get("Investment No") then begin

                        //"Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);
                    end;
                end;
            end;
        }
        field(52; "Calculate Interest"; Boolean)
        {
        }
        field(53; "Control Ac"; Code[20])
        {
        }
        field(54; "Loan No"; Code[20])
        {
            //TableRelation = Table50211.Field1 where (Field15=field("Account No."));
        }
        field(55; "KBA Branch Code"; Code[13])
        {
            //TableRelation = Table50006.Field7 where (Field1=field("Bank Code"));

            trigger OnValidate()
            begin
                /*
               KBABanks.RESET;
               KBABanks.SETRANGE(KBABanks."KBA Code","Bank Code");
               KBABanks.SETRANGE(KBABanks."MicroLan Branch","KBA Branch Code");
               IF KBABanks.FIND('-') THEN
               "KBA Branch Code":=KBABanks."KBA Branch Code";
                 */

            end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');

        if Status <> Status::Pending then
            Error('The Payment Voucher cannot be modified');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get;
            /*
            IF "Payment Type"="Payment Type"::"0" THEN BEGIN
               GenLedgerSetup.TESTFIELD(GenLedgerSetup."Withholding Agent");
               NoSeriesMgt.InitSeries(GenLedgerSetup."Withholding Agent",xRec."No. Series",0D,No,"No. Series");
            END
            ELSE BEGIN
               GenLedgerSetup.TESTFIELD(GenLedgerSetup."Default Bank Account");
               NoSeriesMgt.InitSeries(GenLedgerSetup."Default Bank Account",xRec."No. Series",0D,No,"No. Series");
            END;
            */
        end;

        Date := Today;
        /*
        Cashier:=USERID;
        CashierLinks.RESET;
        CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
        IF CashierLinks.FIND('-') THEN BEGIN
        "Branch Code":=CashierLinks."Branch Code";
        "Cashier Bank Account":=CashierLinks."Bank Account No";
        END;
         */

    end;

    trigger OnModify()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');

        //IF Status<>Status::Pending THEN
        //ERROR('The Payment Voucher cannot be modified');
    end;

    trigger OnRename()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');

        if Status <> Status::Pending then
            Error('The Payment Voucher cannot be modified');
    end;

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        InvestmentRec: Record "Fixed Asset";
        KBABanks: Record "Pay Modes1";
        RecPayTypes: Record "Receipts and Payment Types1";
}

