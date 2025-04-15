Table 52193524 "Payment Voucher"
{

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get;
                    if "Payment Type" = "payment type"::Normal then begin
                        NoSeriesMgt.TestManual(GenLedgerSetup."Payment Vouchers No");
                    end
                    else begin

                        NoSeriesMgt.TestManual(GenLedgerSetup."Petty Cash Payments No");


                    end;
                    "No. Series" := '';
                    // User:=USERID;
                end;


                /*
                IF No = '' THEN BEGIN
                 SalesSetup.GET;
                 SalesSetup.TESTFIELD(SalesSetup."Reminder Nos.");
                 NoSeriesMgt.InitSeries(SalesSetup."Reminder Nos.",xRec."No. Series",0D, No,"No. Series");
                END;
                "Payment Date":=TODAY;
                Cashier:=USERID;
                
                */

            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; Type; Code[20])
        {
            TableRelation = RandPTypes.Code where(Type = filter(Payment));

            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                "User Remarks" := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then begin
                    Grouping := RecPayTypes."Default Grouping";
                end;

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;

                    if RecPayTypes."Account Type" = RecPayTypes."account type"::"G/L Account" then begin
                        RecPayTypes.TestField(RecPayTypes."Account No.");
                        "Account No." := RecPayTypes."Account No.";
                        Validate("Account No.");
                        //davy
                        GLAcc.Reset;
                        GLAcc.SetRange(GLAcc."No.", "Account No.");
                        GLAcc.SetRange(GLAcc."Income/Balance", GLAcc."income/balance"::"Balance Sheet");



                    end;


                end;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode".Code;
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(8; "Bank Code"; Code[20])
        {
            //TableRelation = Table39004324;
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; "Entered By"; Code[20])
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
            // else if ("Account Type" = const(Vendor)) Vendor where("Creditor Type" = const(" "))
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"
                ]
                then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := '';
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                //"VAT Code":=Cust."Default VAT Code";
                                // "Withholding Tax Code":=Cust."Default Withholding Tax Code";
                                "Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                //"VAT Code":=Vend."Default VAT Code";
                                //"Withholding Tax Code":=Vend."Default Withholding Tax Code";
                                "Global Dimension 1 Code" := Vend."Global Dimension 1 Code";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                // "VAT Code":=RecPayTypes."VAT Code";
                                // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := BankAcc."Global Dimension 1 Code";

                            end;
                    /*
                  "Account Type"::"Fixed Asset":
                    BEGIN
                      FA.GET("Account No.");
                      "Account Name":=FA.Description;
                      //"VAT Code":=FA."Default VAT Code";
                     //"Withholding Tax Code":=FA."Default Withholding Tax Code";
                       "Global Dimension 1 Code":=FA."Global Dimension 1 Code";
                    END;
                    */
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
            Editable = true;
        }
        field(17; "Date Posted"; Date)
        {
            Editable = false;
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
            Editable = false;
        }
        field(20; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount;
            end;
        }
        field(21; "User Remarks"; Text[250])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "VAT Code"; Code[20])
        {
            //TableRelation = Table39004322.Field1;

            trigger OnValidate()
            begin
                tarrifcodes.Reset;
                tarrifcodes.SetRange(tarrifcodes.Code, "VAT Code");
                if tarrifcodes.Find('-') then begin
                    "VAT Amount" := (Amount * (tarrifcodes.Percentage / 100)) / ((100 + tarrifcodes.Percentage) / 100);
                end;
                Modify;

                "Net Amount" := Amount - "VAT Amount" - "Withholding Tax Amount";
            end;
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tarriff Codes".Code;

            trigger OnValidate()
            begin
                tarrifcodes.Reset;
                tarrifcodes.SetRange(tarrifcodes.Code, "Withholding Tax Code");
                if tarrifcodes.Find('-') then begin
                    "Withholding Tax Amount" := Amount * (tarrifcodes.Percentage / 100);
                end;
                Modify;

                "Net Amount" := Amount - "VAT Amount" - "Withholding Tax Amount";
            end;
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
            TableRelation = "Bank Account"."No.";
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                Dimm.Reset;
                Dimm.SetRange(Dimm.Code, "Global Dimension 1 Code");
                if Dimm.Find('-') then begin
                    Dimm.TestField(Dimm.Blocked, false);
                    "Project Name" := Dimm.Name
                end else begin
                    "Project Name" := '';
                end;
            end;
        }
        field(31; "Branch Code"; Code[20])
        {
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
            OptionMembers = " ",Pending,Verified,Approved,Canceled;

            trigger OnValidate()
            begin
                PVApp.Reset;
                PVApp.SetRange(PVApp."User ID", UserId);
                PVApp.SetRange(PVApp.Status, Status);

                if PVApp.Find('-') = false then
                    Error('You do not have permission for this level of approval.');

                TestField("Pay Mode");

                if Confirm('Are you sure you would like to change status of the following document?', false) = false then begin
                    Status := xRec.Status;
                    exit
                end;

                if Status = Status::" " then begin
                    "Received By" := UserId;
                    "Received date" := Today;
                end;

                if Status = Status::Pending then begin
                    "Verified By" := UserId;
                    "Verified Date" := Today;
                end;

                if Status = Status::Verified then begin
                    "Approved By" := UserId;
                    "Approval Date" := Today;
                end;

                if Status = Status::Approved then begin
                    "Approved By" := UserId;
                    "Approval Date" := Today;
                end;
            end;
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
            OptionCaption = 'Normal,Petty Cash,Imprest,Advance,Travel';
            OptionMembers = Normal,"Petty Cash",Imprest,Advance,Travel;
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(41; "Apply to Doc No."; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Document No." where(Open = const(true),
                                                                        "Document Type" = const(Invoice));
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(43; "No of Units"; Decimal)
        {
        }
        field(44; "Surrender Date"; Date)
        {
        }
        field(45; Surrendered; Boolean)
        {
        }
        field(46; "Surrender Doc. No"; Code[20])
        {
        }
        field(47; "Vote Book"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(48; "Total Allocation"; Decimal)
        {
        }
        field(49; "Total Expenditure"; Decimal)
        {
        }
        field(50; "Total Commitments"; Decimal)
        {
        }
        field(51; Balance; Decimal)
        {
        }
        field(52; "Balance Less this Entry"; Decimal)
        {
        }
        field(53; "Applicant Designation"; Text[100])
        {
        }
        field(54; "Petty Cash"; Boolean)
        {
        }
        field(55; "HOP Remarks"; Text[100])
        {
        }
        field(56; "Finance Remarks"; Text[100])
        {
        }
        field(57; "Project Name"; Text[100])
        {
        }
        field(58; "HOP Approved By"; Code[30])
        {
        }
        field(59; "Finance Approved By"; Code[20])
        {
        }
        field(60; "HOP Status"; Option)
        {
            OptionCaption = ' ,Approve,Reject';
            OptionMembers = " ",Approve,Reject;
        }
        field(61; "Finance Status"; Option)
        {
            OptionCaption = ' ,Approve,Reject';
            OptionMembers = " ",Approve,Reject;
        }
        field(62; "GOK Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                Dimm.Reset;
                Dimm.SetRange(Dimm.Code, "GOK Code");
                if Dimm.Find('-') then begin
                    Dimm.TestField(Dimm.Blocked, false);
                    "GOK Account Name" := Dimm.Name
                end else begin
                    "GOK Account Name" := '';
                end;
            end;
        }
        field(63; "GOK Account Name"; Text[100])
        {
        }
        field(64; "FOLIO No."; Code[20])
        {
        }
        field(65; "HOP Approval Date"; Date)
        {
        }
        field(66; "Finance Approval Date"; Date)
        {
        }
        field(67; GPA; Boolean)
        {
        }
        field(68; "GPA Date"; Date)
        {
        }
        field(69; KPC; Boolean)
        {
        }
        field(70; "KPC Date"; Date)
        {
        }
        field(71; TAF; Boolean)
        {
        }
        field(72; "TAF Date"; Date)
        {
        }
        field(73; "GPA Posting"; Boolean)
        {
        }
        field(74; "GPA Posting Date"; Date)
        {
        }
        field(75; "Current Location"; Code[50])
        {
            CalcFormula = max("Movement Tracker".Station where("Document No." = field(No)));
            FieldClass = FlowField;
        }
        field(76; Approved; Boolean)
        {
        }
        field(77; "Cash Analysis"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(79; "FOSA Account"; Code[25])
        {
            // TableRelation = Vendor."No." where("Creditor Type" = const(Account));
        }
        field(80; Batched; Boolean)
        {
        }
        field(81; Dividends; Boolean)
        {
        }
        field(61010; "Received By"; Text[150])
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(61011; "Approved By"; Code[30])
        {
        }
        field(61012; "Approval Date"; Date)
        {
        }
        field(61013; "Verified By"; Code[30])
        {
        }
        field(61014; "Received date"; Date)
        {
        }
        field(61015; "Verified Date"; Date)
        {
        }
        field(61016; "Staff Number"; Code[30])
        {
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

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        RecPayTypes: Record RandPTypes;
        CashierLinks: Record "Cashier Link";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        Committed: Record "Commitment Entries";
        SingleMonth: Boolean;
        DateFrom: Date;
        DateTo: Date;
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        BudgetDate: Date;
        YrBudget: Decimal;
        BudgetDateTo: Date;
        BudgetAvailable: Decimal;
        GenLedSetup: Record "General Ledger Setup";
        "Total Budget": Decimal;
        CommitmentEntries: Record "Commitment Entries";
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        Dimm: Record "Dimension Value";
        VendLedgEntry: Record "Vendor Ledger Entry";
        tarrifcodes: Record "Tarriff Codes";
        MovementTracker: Record "Movement Tracker";
        EntryNumber: Integer;
        ApprovalsSetup: Record "Approvals Set Up";
        PVApp: Record "Payment Voucher Approval";
        PVouch: Record "Payment Voucher";
}

