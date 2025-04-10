Table 52193639 "Payments HeaderFin"
{
    //DrillDownPageID = UnknownPage51508029;
    //LookupPageID = UnknownPage51508029;

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                if "Payment Type" = "payment type"::MemberApplication then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(GLSetup."PV Nos");
                end;

                if "Payment Type" = "payment type"::FosaAccountApplication then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(GLSetup."Imprest Nos");

                end;

                if "Payment Type" = "payment type"::EmployerForm then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(GLSetup."Petty Cash Nos");
                end;
            end;
        }
        field(2; Date; Date)
        {

            trigger OnValidate()
            begin
                case "Payment Type" of
                    "payment type"::FosaAccountApplication:
                        begin
                            //Get the Imprest Deadline Date
                            if not CashMgt.Get then
                                Error(Text000);
                            CashMgt.TestField("Imprest Due Date");
                            if Date <> 0D then
                                "Imprest Deadline" := CalcDate(CashMgt."Imprest Due Date", Date);
                        end;
                end;
            end;
        }
        field(3; Type; Code[20])
        {
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(5; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                if "Cheque No" <> '' then begin
                    PV.Reset;
                    PV.SetRange(PV."Cheque No", "Cheque No");
                    if PV.Find('-') then begin
                        if PV."No." <> "No." then
                            Error('Cheque No. already exists');
                    end;
                end;
            end;
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Bank Code"; Code[20])
        {
        }
        field(8; Payee; Text[100])
        {
        }
        field(9; "On behalf of"; Text[100])
        {
        }
        field(10; Cashier; Code[20])
        {
        }
        field(11; Posted; Boolean)
        {
        }
        field(12; "Posted By"; Code[20])
        {
        }
        field(13; "Posted Date"; Date)
        {
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(16; "Time Posted"; Time)
        {
        }
        field(17; "Total Amount"; Decimal)
        {
            // CalcFormula = sum(Table51507716.Field21 where(Field1 = field("No.")));
            // FieldClass = FlowField;
        }
        field(18; "Paying Bank Account"; Code[20])
        {
            TableRelation = if ("Payment Type" = const("Payment Voucher")) "Bank Account" where(Type = const(Bank))
            else if ("Payment Type" = const(Imprest)) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else if ("Payment Type" = const("Petty Cash")) "Bank Account" where(Type = const("Petty Cash"));
        }
        field(19; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(20; "Payment Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,MemberApplication,Contributions,LoanApplication,TopUpForm,EmployerForm,FosaAccountApplication,Standing Orders,Cheque Requisition,Teller Request,Imprest Requisitioning,Imprest,Imprest Surrender,Purchase Requisition,Store Requisition,Payment Voucher,Staff Claim,Petty Cash';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",MemberApplication,Contributions,LoanApplication,TopUpForm,EmployerForm,FosaAccountApplication,"Standing Orders","Cheque Requisition","Teller Request","Imprest Requisitioning",Imprest,"Imprest Surrender","Purchase Requisition","Store Requisition","Payment Voucher","Staff Claim","Petty Cash";
        }
        field(21; Currency; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(22; "No. Series"; Code[20])
        {
        }
        field(23; "Account Type"; Option)
        {
            Editable = false;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(24; "Account No."; Code[20])
        {

            trigger OnLookup()
            begin

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if Page.RunModal(18, GLAccount) = Action::LookupOK then begin
                                "Account No." := GLAccount."No.";
                                "Account Name" := GLAccount.Name;
                            end;
                        end;
                    "account type"::Customer:
                        begin
                            if Page.RunModal(22, Customer) = Action::LookupOK then begin
                                "Account No." := Customer."No.";
                                "Account Name" := Customer.Name;
                                Payee := Customer.Name;
                            end;
                        end;
                    "account type"::Vendor:
                        begin
                            if Page.RunModal(27, Vendor) = Action::LookupOK then begin
                                "Account No." := Vendor."No.";
                                "Account Name" := Vendor.Name;
                                Payee := Vendor.Name;
                            end;
                        end;
                    /*"Account Type"::"Bank Account":
                    BEGIN
                     IF "Payment Type"="Payment Type"::"Petty Cash" THEN BEGIN
                     Bank.SETRANGE(Bank.Type,Bank.Type::"Petty Cash");
                     IF PAGE.RUNMODAL(371,Bank)=ACTION::LookupOK THEN BEGIN
                       "Account No.":=Bank."No.";
                       "Account Name":=Bank.Name;
                     END;
                    END ELSE BEGIN
                     IF PAGE.RUNMODAL(371,Bank)=ACTION::LookupOK THEN BEGIN
                       "Account No.":=Bank."No.";
                       "Account Name":=Bank.Name;
                     END;
                     END;
                     END;*/
                    "account type"::"Fixed Asset":
                        begin
                            if Page.RunModal(5601, FixedAsset) = Action::LookupOK then begin
                                "Account No." := FixedAsset."No.";
                                "Account Name" := FixedAsset.Description;
                            end;
                        end;
                end;

            end;
        }
        field(25; "Account Name"; Text[70])
        {
        }
        field(26; "Imprest Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; Surrendered; Boolean)
        {
        }
        field(28; "Applies- To Doc No."; Code[20])
        {

            trigger OnLookup()
            begin

                case "Account Type" of
                    "account type"::Customer:

                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                "Applies- To Doc No." := CustLedger."Document No.";

                            end;

                        end;
                end;
            end;
        }
        field(29; "Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines".Amount where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(30; "Original Document"; Option)
        {
            OptionCaption = ',Imprest,Staff Claim';
            OptionMembers = ,Imprest,"Staff Claim";
        }
        field(31; "PV Creation DateTime"; DateTime)
        {
        }
        field(32; "PV Creator ID"; Code[20])
        {
        }
        field(33; "Remaining Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Remaining Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(34; "Receipt Created"; Boolean)
        {
        }
        field(35; "Imprest Deadline"; Date)
        {
            Editable = false;
        }
        field(36; "Imprest Surrender Date"; Date)
        {
            Editable = false;
        }
        field(37; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Payment Type", "No.")
        {
        }
        key(Key3; "Posted Date", "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        GLSetup.Get();
        if "Payment Type" = "payment type"::"Payment Voucher" then begin
            GLSetup.TestField(GLSetup."PV Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(GLSetup."PV Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Imprest Requisitioning" then begin
            GLSetup.TestField(GLSetup."Imprest Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(GLSetup."Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
            //Assign Customer Account
            if UserSetup.Get(UserId) then begin
                UserSetup.TestField("Employee No.");
                if Customer.Get(UserSetup."Employee No.") then begin
                    "Account No." := Customer."No.";
                    "Account Name" := Customer.Name;
                end else
                    Error('Create an Imprest A/C for Employee No. %1 under the Finance Setup\Please contact system Administrator',
                            UserSetup."Employee No.");
            end;
        end;
        if "Payment Type" = "payment type"::"Petty Cash" then begin
            GLSetup.TestField(GLSetup."Petty Cash Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(GLSetup."Petty Cash Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Amt: Integer;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        UserSetup: Record "User Setup";
        PV: Record "Payments HeaderFin";
        CashMgt: Record CMSetup;
        Text000: label 'Cash management setup does''''nt exist';


    procedure PrintRecords(ShowRequestForm: Boolean)
    var
        ReportSelection: Record "Report Selections";
    begin
        with PV do begin
            Copy(Rec);
            ReportSelection.SetRange(Usage, ReportSelection.Usage::"P.Receipt");
            ReportSelection.SetFilter("Report ID", '<>0');
            ReportSelection.Find('-');
            repeat
                Report.RunModal(ReportSelection."Report ID", ShowRequestForm, false, PV);
            until ReportSelection.Next = 0;
        end;
    end;


    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Posted Date", "No.");
        NavigateForm.Run;
    end;
}

