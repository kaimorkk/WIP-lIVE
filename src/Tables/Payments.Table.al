 
Table 52193679 "Payments"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin

                if "Payment Type" = "payment type"::"Payment Voucher" then begin

                    if "No." <> xRec."No." then begin
                        if ("PV Type" = "PV Type"::"Bounced Payments Voucher") then begin
                            // NoSeriesMgt.TestManual(CashMgt."Bounced Pvs Nos");

                        end
                        else begin
                            NoSeriesMgt.TestManual(CashMgt."PV Nos");

                        end;

                    end
                end;


                if "Payment Type" = "payment type"::Imprest then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Nos");

                end;
                if "Payment Type" = "payment type"::"Warrant Voucher" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Voucher Nos");

                end;
                if "Payment Type" = "payment type"::AIE then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."AIE Nos.");

                end;

                if "Payment Type" = "payment type"::"Petty Cash" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Petty Cash Nos");
                end;
                if "Payment Type" = "payment type"::"Petty Cash Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Petty Cash Surrender Nos");
                end;

                if "Payment Type" = "payment type"::"Imprest Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Imprest Surrender Nos");
                end;
                if "Payment Type" = "payment type"::"Staff Claim" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Staff Claim Nos.");
                end;

                if "Payment Type" = "payment type"::"Standing Imprest" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Standing Imprest Nos");
                end;

                if "Payment Type" = "payment type"::"Standing Imprest Surrender" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Standing Imprest Surrender Nos");
                end;
                if "Payment Type" = "payment type"::"Car Loan" then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(CashMgt."Car loan Nos");
                end;
            end;
        }
        field(2; Date; Date)
        {
            Editable = false;
            Caption = 'Date Created';
        }
        field(3; Type; Code[20])
        {
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(5; "Cheque No"; Code[50])
        {

            trigger OnValidate()
            begin
                /*
                IF "Cheque No"<>'' THEN BEGIN
                PV.RESET;
                PV.SETRANGE(PV."Cheque No","Cheque No");
                IF PV.FIND('-') THEN BEGIN
                IF PV."No." <> "No." THEN
                   ERROR(Text002);
                END;
                END;
                */

            end;
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Bank Code"; Code[20])
        {
        }
        field(8; Payee; Text[150])
        {

            trigger OnValidate()
            begin
                Payee := UpperCase(Payee);
            end;
        }
        field(9; "On behalf of"; Text[150])
        {

            trigger OnValidate()
            begin
                "On behalf of" := UpperCase("On behalf of");
            end;
        }
        field(10; "Created By"; Code[50])
        {
            Editable = true;
        }
        field(11; Posted; Boolean)
        {
            trigger OnValidate()
            begin
                if Posted then begin
                    "Posted By" := UserId;
                    "Posted Date" := Today;
                end;
            end;
        }
        field(12; "Posted By"; Code[50])
        {
        }
        field(13; "Posted Date"; Date)
        {
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(16; "Time Posted"; Time)
        {
        }
        field(17; "Total Amount LCY"; Decimal)
        {
            CalcFormula = sum("PV Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Paying Bank Account"; Code[20])
        {
            TableRelation = if ("Payment Type" = const("Payment Voucher")) "Bank Account" where(Type = filter(Bank | Revenue | Deposit | Recurrent | Development))
            else
            if ("Payment Type" = const(Imprest)) "Bank Account" where(Type = filter(Bank | "Petty Cash" | Recurrent | Development))
            else
            if ("Payment Type" = const("Petty Cash")) "Bank Account" where(Type = filter(Bank | "Petty Cash" | Development | Recurrent))
            else
            if ("Payment Type" = const("Bank Transfer")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = filter("Standing Imprest" | "Special Imprest" | "Staff Claim")) "Bank Account" where(Type = filter(Bank | "Petty Cash" | Development | Recurrent))
            else
            if ("Payment Type" = const("Salary Advance")) "Bank Account" where(Type = filter(Bank | "Petty Cash" | Recurrent | Development))
            else
            if ("Payment Type" = const("Standing Imprest Surrender")) "Bank Account" where(Type = filter(Bank | "Petty Cash" | Recurrent | Development))
            else
            if ("Payment Type" = const("Warrant Voucher")) "Bank Account" where(Type = filter(Bank | Recurrent | Development))
            else
            if ("Payment Type" = const("Payment Voucher"), "PV Type" = const(Refund)) "Bank Account" where(Type = filter(Revenue | Deposit | Recurrent | Development));

            trigger OnValidate()
            begin
                if Bank.Get("Paying Bank Account") then
                    "Bank Name" := Bank.Name;
            end;
        }
        field(19; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;

            trigger OnValidate()
            var
                // MemoryStream: dotnet MemoryStream;
                Ostream: OutStream;
                // Bytes: dotnet Array;
                // TempBlob: Codeunit "Temp Blob";
                InStream: InStream;
                OutStream: OutStream;
                HrEmp: Record Employee;
                EmpName: Text;
                B64: BigText;
                ByteCount: Integer;
                // Base64Convert: Codeunit "Base64 Convert";
                // QRCodeUnit: Codeunit QRCodeUnit;
                // Convert: dotnet Convert;
                OTP: Record Otp;
                ApprovalEntry: Record "Approval Entry";
                SharePointInteg: Codeunit "Sharepoint Integration";
                HrCodeunit: Codeunit HRPortal;
                base64Doc: Text;
                pvLines: Record "PV Lines";
                sumNetAmount: Integer;
                DocType: Enum SharepointDocumentType;
                docId: Text;

            // DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Full Refund Voucher');

            begin


                if status = status::"pending approval" then begin
                    checkBlanksOnLines(Rec."No.");
                end;


                if Status = Status::Released then begin
                    if ((Rec."PV Type" <> Rec."PV Type"::Refund) or (Rec."PV Type" <> Rec."PV Type"::Tax) or (Rec."Payment Type" <> Rec."Payment Type"::"Surrender")) then
                        insertSMSDetails(Rec);
                    if ("Document Type" = "document type"::Imprest) or ("Document Type" = "document type"::"Staff Claims") then begin
                        // Commitment.ImprestCommittment(Rec);

                    end;





                    if (("Document Type" = "document type"::"Payment Voucher") or
                    ("Document Type" = "document type"::"Staff Claims") or
                    ("Document Type" = "document type"::Imprest)) then begin

                        pvLines.reset();
                        pvLines.setRange(No, Rec."No.");

                        DocType := DocType::Voucher;
                        // base64Doc := HrCodeunit.GenerateVoucherReport2(Rec."No.");
                        docId := SharePointInteg.UploadDocument(base64Doc, Format(Rec."No.") + '.pdf', DocType, Rec."No.", Rec.RecordID, 'Payment_File', 57000, 'payment voucher');

                        if docId = '' then
                            Error('Failed to upload Document to Sharepoint')
                        else begin
                            Rec.documentID := docId;
                        end;
                    end;
                end else
                    if Status = Status::Rejected then begin
                        Testfield("Reasons to Reopen");
                        UserSetup.Get(UserID);
                        "Rejected By" := UserSetup."Employee No.";
                    end;

            end;
        }
        field(20; "Payment Type"; Option)
        {
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender,Standing Imprest,Salary Advance,Payment Voucher Reversal,Imprest Reversal,Staff Claim Reversal,Imprest Surrender Reversal,Petty Cash Reversal,Bank Transfer Reversal,Petty Cash Surrender Reversal,Surrender Reversal,Standing Imprest Reversal,Salary Advance Reversal,Standing Imprest Surrender,AIE,Warrant Voucher,Payment Schedule,Car Loan,Special Imprest';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,"Standing Imprest","Salary Advance","Payment Voucher Reversal","Imprest Reversal","Staff Claim Reversal","Imprest Surrender Reversal","Petty Cash Reversal","Bank Transfer Reversal","Petty Cash Surrender Reversal","Surrender Reversal","Standing Imprest Reversal","Salary Advance Reversal","Standing Imprest Surrender",AIE,"Warrant Voucher","Payment Schedule","Car Loan","Special Imprest";
        }
        field(21; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Posting Date")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestStatusOpen;
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(22; "No. Series"; Code[20])
        {
        }
        field(23; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee,Resource';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee,Resource;
        }
        field(24; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer."No." where("Customer Type" = filter(" "))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee
            else
            if ("Account Type" = const(Resource)) Resource;

            trigger OnValidate()
            var
                Details: array[2, 6] of Text;
                Resource: Record Resource;
            begin

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No.") then begin
                                "Account Name" := Customer.Name;
                                Payee := Customer.Name;
                            end;
                        end;
                    "account type"::Employee:
                        begin
                            if Emp.Get("Account No.") then begin
                                "Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                if (Emp."Payee Bank Acc Name" <> '') then
                                    Payee := Emp."Payee Bank Acc Name"
                                else
                                    Payee := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                "Date of Joining" := Emp."Employment Date";
                                Emp.CalcFields("Bank Branch Name", "Bank Name");
                                "Imprest Bank Account Number" := Emp."Bank Account No.";
                                "Imprest Bank Branch Name" := Emp."Bank Branch Name";
                                "Imprest Bank Name" := Emp."Bank Name";
                                "Directorate Code" := Emp."Directorate Code";
                                "Department Code" := Emp."Department Code";
                                Division := Emp.Division;
                                "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                                "Salary Scale" := Emp."Salary Scale";
                                Emp.GetEmployeeBankDetails(Emp."No.", Details);
                                if Details[2] [1] <> '' then begin
                                    validate("Payee Bank Code", Details[2] [1]);
                                    Validate("Payee Bank Branch", Details[2] [2]);
                                    Validate("Payee Bank Account", Details[2] [3]);
                                    Validate("Phone Number", Details[2] [4]);
                                    Validate("E-mail", Details[2] [5]);

                                end else begin
                                    validate("Payee Bank Code", Details[1] [1]);
                                    Validate("Payee Bank Branch", Details[1] [2]);
                                    Validate("Payee Bank Account", Details[1] [3]);
                                    Validate("Phone Number", Details[1] [4]);
                                    Validate("E-mail", Details[1] [5]);


                                end;
                            end
                            else begin
                                if Resource.get("Account No.") then begin
                                    "Account Name" := Resource.name;
                                    if (Resource."Payee Bank Acc Name" <> '') then
                                        Payee := Resource."Payee Bank Acc Name"
                                    else
                                        Payee := Resource.name;

                                    // "Date of Joining" := Emp."Employment Date";
                                    // Emp.CalcFields("Bank Branch Name", "Bank Name");

                                    "Imprest Bank Account Number" := Resource."Bank Account No.";
                                    "Imprest Bank Name" := Resource."Bank Name";
                                    "Imprest Bank Branch Name" := Resource."Branch Name";

                                    // "Directorate Code" := Emp."Directorate Code";
                                    // "Department Code" := Emp."Department Code";
                                    // Division := Emp.Division;
                                    "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                                    "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                                    // "Salary Scale" := Emp."Salary Scale";
                                end


                            end;
                        end;
                    "account type"::Resource:
                        begin
                            if Resource.get("Account No.") then begin
                                "Account Name" := Resource.name;
                                if (Resource."Payee Bank Acc Name" <> '') then
                                    Payee := Resource."Payee Bank Acc Name"
                                else
                                    Payee := Resource.name;



                                "Imprest Bank Account Number" := Resource."Bank Account No.";
                                "Imprest Bank Name" := Resource."Bank Name";
                                "Imprest Bank Branch Name" := Resource."Branch Name";
                                "Payee Bank Code" := Resource."Bank Code";


                                "Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
                                "Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
                            end


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
            TableRelation = "Vendor Ledger Entry"."Document No." where("Vendor No." = field("Account No."),
                                                                        Open = filter(true));
            trigger OnLookup()
            begin

                "Applies- To Doc No." := '';
                Amnt := 0;
                // VATAmount:=0;
                //"W/TAmount":=0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No.");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amnt := Amnt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amnt <> Amnt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if "Total Amount LCY" = 0 then
                                            "Total Amount LCY" := Amnt;
                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := CustLedger."Document No.";
                                    //Insert VAT where applicable
                                    //VATEntry.RESET;
                                    //VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    //IF VATEntry.FIND('-') THEN
                                    //"VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    //

                                end else begin
                                    if "Total Amount LCY" <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if "Total Amount LCY" = 0 then
                                        "Total Amount LCY" := Abs(CustLedger."Remaining Amount");
                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := CustLedger."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //Insert VAT where applicable
                                    /*
                                    VATEntry.RESET;
                                    VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                     IF VATEntry.FIND('-') THEN
                                       "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                    */

                                end;
                            end;
                            Validate("Total Amount LCY");
                        end;

                    "account type"::Vendor:
                        begin
                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No.");
                            VendLedger.SetRange(Open, true);
                            VendLedger.CalcFields("Remaining Amount");
                            VendLedger.CalcFields("Remaining Amt. (LCY)");
                            if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                                if VendLedger."Applies-to ID" <> '' then begin
                                    VendLedger1.Reset;
                                    VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                    VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No.");
                                    VendLedger1.SetRange(Open, true);
                                    VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                    if VendLedger1.Find('-') then begin
                                        repeat
                                            VendLedger1.CalcFields(VendLedger1."Remaining Amount");
                                            VendLedger1.CalcFields("Remaining Amt. (LCY)");
                                        //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");

                                        until VendLedger1.Next = 0;
                                    end;

                                    if "Total Amount LCY" <> "Total Amount LCY" then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if "Total Amount LCY" = 0 then
                                            "Total Amount LCY" := "Total Amount LCY";

                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end else begin
                                    if "Total Amount LCY" <> Abs(VendLedger."Remaining Amount") then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                                    if "Total Amount LCY" = 0 then begin
                                        if "Currency Code" = '' then begin
                                            "Total Amount LCY" := Abs(VendLedger."Remaining Amt. (LCY)");
                                        end else begin
                                            "Total Amount LCY" := Abs(VendLedger."Remaining Amount");
                                        end;
                                    end;

                                    Validate("Total Amount LCY");
                                    "Applies- To Doc No." := VendLedger."Document No.";
                                    //"External Document No.":=VendLedger."External Document No.";
                                    "Dimension Set ID" := VendLedger."Dimension Set ID";//added 13/02/2017
                                    Validate("Dimension Set ID");
                                    //MESSAGE('%1',"Dimension Set ID");

                                    //Insert VAT where applicable
                                    /*
                                   VATEntry.RESET;
                                   VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                                    IF VATEntry.FIND('-') THEN
                                      "VAT Code":=VATEntry."VAT Prod. Posting Group";
                                   //
                                   */
                                end;
                            end;
                            //"Total Amount":=ABS(VendLedger."Remaining Amount");
                            if "Currency Code" = '' then begin
                                "Total Amount LCY" := Abs(VendLedger."Remaining Amt. (LCY)");
                            end else begin
                                "Total Amount LCY" := Abs(VendLedger."Remaining Amount");
                            end;
                            //Insert VAT where applicable
                            /*
                           VATEntry.RESET;
                           VATEntry.SETRANGE("Transaction No.",VendLedger."Transaction No.");
                            IF VATEntry.FIND('-') THEN
                              "VAT Code":=VATEntry."VAT Prod. Posting Group";
                           //
                           */
                            Validate("Total Amount LCY");
                        end;
                end;

            end;
        }
        field(29; "Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines".Amount where(No = field("No.")));
            Editable = false;
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
        field(32; "PV Creator ID"; Code[50])
        {
        }
        field(33; "Remaining Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Remaining Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Receipt Created"; Boolean)
        {
        }
        field(35; "Imprest Deadline"; Date)
        {
            Editable = true;
        }
        field(36; "Surrender Date"; Date)
        {
            Editable = true;
        }
        field(37; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(38; "Imprest Type"; Option)
        {
            OptionCaption = 'Normal,Project Imprest';
            OptionMembers = Normal,"Project Imprest";
        }
        field(39; Project; Code[20])
        {
            TableRelation = Job where(Status = filter(<> Completed),
                                       "Record Type" = filter(Job));

            trigger OnValidate()
            begin
                /*"Shortcut Dimension 2 Code":=Project;
                VALIDATE("Shortcut Dimension 2 Code");
                IF JobRec.GET(Project) THEN BEGIN
                 JobRec.CALCFIELDS("Project Budget","Actual Project Costs",
                 "PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
                 "Project Description":=JobRec.Description;
                 "Project Budget":=JobRec."Project Budget";
                 "Actual Project Costs":=JobRec."Actual Project Costs";
                 "PO Commitments":=JobRec."PO Commitments";
                 "PRN Commitments":=JobRec."PRN Commitments";
                 "Store Requisition Commitments":=JobRec."Store Requisition Commitments";
                 "Imprest Application Commitment":=JobRec."Imprest Application Commitment";
                  "Total Budget Commitments":="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
                 "Available Funds":="Project Budget"-"Actual Project Costs"-"Total Budget Commitments";
                
                END;*/

            end;
        }
        field(40; "Project Description"; Text[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field(Project)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Travel Date"; Date)
        {

        }
        field(42; Cashier; Text[50])
        {
        }
        field(43; "Total Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(68; "Payment Release Date"; Date)
        {
        }
        field(69; "No. Printed"; Integer)
        {
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender,"Staff Claims","Salary Advance","Standing Imprest","Standing Imprest Surrender","Payment Schedule","Warrant Voucher","Bounced Payment Voucher";
        }
        field(81; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(82; "Departure Date"; Date)
        {
        }
        field(85; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            var
                ExpReq: Record "Expense Requisition";
            begin
                /*
                TESTFIELD(Status,Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1,"Shortcut Dimension 3 Code") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

                CalcFields("Final Approver Status");
                CalcFields("Open Approver Count");
                CalcFields("Cancelled Approver Count");
                if ("Final Approver Status" = "Final Approver Status"::Approved) and ("Open Approver Count" = 0) then
                    Status := Status::Released;
                // if "Cancelled Approver Count" > 0 then
                //     Status := Status::Open;                

            end;
        }
        field(86; "Cheque Type"; Option)
        {
            OptionMembers = " ","Computer Check","Manual Check";
        }
        field(88; "Payment Narration"; Text[2048])
        {
        }
        field(89; "Total VAT Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."VAT Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(90; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."W/Tax Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(91; "Total Net Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Net Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(92; "Total Payment Amount LCY"; Decimal)
        {
            CalcFormula = sum("PV Lines"."NetAmount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(93; "Total Retention Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Retention  Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(95; "Posting Date"; Date)
        {
        }
        field(96; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(97; "Job Task Name"; Text[200])
        {
            CalcFormula = lookup("Job Task".Description where("Job No." = field(Project),
                                                               "Job Task No." = field("Job Task No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(98; "Actual Amount Spent"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Actual Spent" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(99; "Cash Receipt Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Cash Receipt Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(100; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(103; "Phone Number"; Code[15])
        {
        }
        field(104; "Date of Reporting"; Date)
        {
        }
        field(105; "Imprest Issue Date"; Date)
        {
        }
        field(106; "Imprest Issue Doc. No"; Code[20])
        {
            FieldClass = Normal;
            TableRelation = Payments."No." where("Payment Type" = filter(Imprest | "Standing Imprest" | "Special Imprest"), Posted = const(true),
                                                  Surrendered = const(false),
                                                  "Account No." = field("Account No."), Reversed = const(false));

            trigger OnValidate()
            var
                DimensionCodes: array[8] of Code[20];
                DimensionMgt: Codeunit "Dimension Buffer Management";
            begin
                ImpSurrLines.Reset;
                ImpSurrLines.SetRange(No, "No.");
                ImpSurrLines.DeleteAll;

                ImpHeader.Reset;
                ImpHeader.SetRange("Imprest Issue Doc. No", Rec."Imprest Issue Doc. No");
                if ImpHeader.FindSet then begin
                    repeat

                        if ImpHeader."No." <> Rec."No." then
                            if ImpHeader."Payment Type" = ImpHeader."payment type"::"Surrender" then
                                Error('Imprest has already been Selected in another document %1', ImpHeader."No.");
                    until ImpHeader.Next = 0;
                end;


                ImpHeader.Reset;
                ImpHeader.SetRange(ImpHeader."No.", "Imprest Issue Doc. No");
                if ImpHeader.FindFirst then
                    if ImpHeader."Payment Type" = ImpHeader."payment type"::"Imprest Surrender" then
                        Error('Imprest has already been Surrendered');


                if ImpHeader.Get("Imprest Issue Doc. No") then begin
                    // DimensionMgt.GetShortcutDimensions(ImpHeader."Dimension Set ID", DimensionCodes);
                    "Account Type" := ImpHeader."Account Type";
                    "Account No." := ImpHeader."Account No.";
                    "Bank Code" := ImpHeader."Paying Bank Account";
                    Validate("Account No.");
                    "Pay Mode" := "Pay Mode";
                    "Paying Bank Account" := ImpHeader."Paying Bank Account";
                    Validate("Paying Bank Account");
                    "Currency Code" := ImpHeader."Currency Code";
                    "Currency Factor" := ImpHeader."Currency Factor";
                    "Reference No." := ImpHeader."Reference No.";
                    "Shortcut Dimension 1 Code" := DimensionCodes[1];
                    "Shortcut Dimension 2 Code" := DimensionCodes[2];
                    "Shortcut Dimension 3 Code" := DimensionCodes[3];
                    "Shortcut Dimension 4 Code" := DimensionCodes[4];
                    "Shortcut Dimension 5 Code" := DimensionCodes[5];
                    "Shortcut Dimension 6 Code" := DimensionCodes[6];
                    "Dimension Set ID" := ImpHeader."Dimension Set ID";
                    "Strategic Plan" := ImpHeader."Strategic Plan";
                    "Reporting Year Code" := ImpHeader."Reporting Year Code";
                    "Workplan Code" := ImpHeader."Workplan Code";
                    "Activity Code" := ImpHeader."Activity Code";
                    "Expenditure Requisition Code" := ImpHeader."Expenditure Requisition Code";
                    case ImpHeader."Payment Type" of
                        ImpHeader."Payment Type"::Imprest:
                            begin
                                ImpLines.Reset;
                                ImpLines.SetRange(ImpLines.No, ImpHeader."No.");
                                if ImpLines.FindSet() then
                                    repeat
                                        ImpSurrLines.Init;
                                        ImpSurrLines.No := "No.";
                                        ImpSurrLines."Applies- to Doc. No." := ImpLines.No;
                                        ImpSurrLines."Line No" := ImpLines."Line No";
                                        ImpSurrLines."Account Type" := ImpLines."Account Type";
                                        ImpSurrLines."Account No." := ImpLines."Account No.";
                                        ImpSurrLines."Account Name" := ImpLines."Account Name";
                                        ImpSurrLines.Purpose := ImpLines.Purpose;
                                        ImpSurrLines."Global Dimension 1 Code" := ImpLines."Global Dimension 1 Code";
                                        ImpSurrLines."Global Dimension 2 Code" := ImpLines."Global Dimension 2 Code";
                                        ImpSurrLines."Dimension Set ID" := ImpLines."Dimension Set ID";
                                        ImpSurrLines.Amount := ImpLines.Amount;

                                        if not ImpSurrLines.Get(ImpSurrLines.No, ImpSurrLines."Line No") then
                                            ImpSurrLines.Insert;

                                    until ImpLines.Next = 0;

                            end;
                        ImpHeader."Payment Type"::"Standing Imprest", ImpHeader."Payment Type"::"Special Imprest":
                            begin
                                PVLines.reset();
                                PVLines.SetRange(No, ImpHeader."No.");
                                if PVLines.FindSet() then
                                    repeat
                                        ImpSurrLines.Init;
                                        ImpSurrLines.No := "No.";
                                        ImpSurrLines."Applies- to Doc. No." := PVLines.No;
                                        ImpSurrLines."Line No" := PVLines."Line No";
                                        ImpSurrLines."Account Type" := ImpSurrLines."Account Type"::"G/L Account";
                                        ImpSurrLines.Validate("Account No.", PVLines."Vote Item");
                                        ImpSurrLines."Account Name" := PVLines."Account Name";
                                        ImpSurrLines.Purpose := CopyStr(PVLines.Description, 1, MaxStrlen(ImpSurrLines.Purpose));
                                        ImpSurrLines."Global Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                                        ImpSurrLines."Global Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                                        ImpSurrLines."Dimension Set ID" := PVLines."Dimension Set ID";
                                        ImpSurrLines.Amount := PVLines.Amount;

                                        if not ImpSurrLines.Get(ImpSurrLines.No, ImpSurrLines."Line No") then
                                            ImpSurrLines.Insert;

                                    until PVLines.Next() = 0;
                            end;

                    end;


                end;
            end;
        }
        field(107; "Date Surrendered"; Date)
        {
        }
        field(108; "Surrendered By"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(109; "Actual Petty Cash Amount Spent"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Actual Spent" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(110; "Shortcut Dimension 5 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                // //ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(111; "Remaining Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Remaining Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(112; "Receipted Petty Cash Amount"; Decimal)
        {
            CalcFormula = sum("Petty Cash Lines"."Cash Receipt Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(113; "Imprest Memo Surrender No"; Code[20])
        {
            TableRelation = "Imprest Memo" where(Status = filter(Released),
                                                  Posted = filter(true),
                                                  Surrendered = const(true));

            trigger OnValidate()
            begin
                //Ushindi...Insert default Imprest Memo details
                ImpMemo.Reset;
                ImpMemo.SetRange(ImpMemo."No.", "Imprest Memo Surrender No");
                if ImpMemo.Find('-') then begin
                    Project := ImpMemo.Project;
                    Validate(Project);
                    "Project Description" := ImpMemo."Project Description";
                    "Shortcut Dimension 1 Code" := ImpMemo."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := ImpMemo."Global Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");
                    "Shortcut Dimension 3 Code" := ImpMemo."Shortcut Dimension 3 Code";
                    Validate("Shortcut Dimension 3 Code");
                    "Shortcut Dimension 4 Code" := ImpMemo."Shortcut Dimension 4 Code";
                    Validate("Shortcut Dimension 4 Code");
                    "Shortcut Dimension 5 Code" := ImpMemo."Shortcut Dimension 5 Code";
                    Validate("Shortcut Dimension 5 Code");

                end;
                //End...Ushindi
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                // ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(50000; "VAT Wthheld six %"; Decimal)
        {
            CalcFormula = sum("PV Lines"."VAT Withheld Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Bank Name"; Text[50])
        {
            CalcFormula = lookup("Bank Account".Name where("No." = field("Paying Bank Account")));
            Caption = 'Bank Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Project Budget"; Decimal)
        {
            Caption = 'Total Project Budget';
            Editable = false;
        }
        field(50003; "Actual Project Costs"; Decimal)
        {
            Editable = false;
        }
        field(50004; "PO Commitments"; Decimal)
        {
            Caption = 'Purchase Order Commitments';
            Editable = false;
        }
        field(50005; "PRN Commitments"; Decimal)
        {
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
        }
        field(50006; "Store Requisition Commitments"; Decimal)
        {
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
        }
        field(50007; "Imprest Application Commitment"; Decimal)
        {
            Caption = 'Imprest Applications Commitments';
            Editable = false;
        }
        field(50008; "Total Budget Commitments"; Decimal)
        {
        }
        field(50009; "Available Funds"; Decimal)
        {
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
            // Caption = 'Geographical Name';
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
        }
        field(50015; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
            // Caption = 'Administrative Unit Name';
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(2);
        }
        field(50016; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Division Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 4 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Notification Sent"; Boolean)
        {
        }
        field(50019; "DateTime Sent"; DateTime)
        {
        }
        field(50020; "Destination Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 5 Code")));
            FieldClass = FlowField;
        }
        field(56002; Reversed; Boolean)
        {
            CalcFormula = lookup("G/L Entry".Reversed where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(57000; "Imprest Memo No"; Code[20])
        {
            TableRelation = "Imprest Memo" where(Status = filter(Released),
                                                  Posted = filter(true),
                                                  "Document Type" = const("Imprest Memo"));

            trigger OnValidate()
            begin
                //Ushindi...Insert default Imprest Memo details
                ImpMemo.Reset;
                ImpMemo.SetRange(ImpMemo."No.", "Imprest Memo No");
                if ImpMemo.Find('-') then begin
                    Project := ImpMemo.Project;
                    Validate(Project);
                    "Project Description" := ImpMemo."Project Description";
                    "Shortcut Dimension 1 Code" := ImpMemo."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := ImpMemo."Global Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");
                    "Shortcut Dimension 3 Code" := ImpMemo."Shortcut Dimension 3 Code";
                    Validate("Shortcut Dimension 3 Code");
                    "Shortcut Dimension 4 Code" := ImpMemo."Shortcut Dimension 4 Code";
                    Validate("Shortcut Dimension 4 Code");
                    "Shortcut Dimension 5 Code" := ImpMemo."Shortcut Dimension 5 Code";
                    Validate("Shortcut Dimension 5 Code");

                end;
                //End...Ushindi
            end;
        }
        field(57001; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                // if "Currency Factor" <> xRec."Currency Factor" then
                //     UpdatePurchLinesByFieldNo(FieldNo("Currency Factor"), CurrFieldNo <> 0);
            end;
        }
        field(57009; "Job Group"; Code[20])
        {
        }
        field(57010; "Resources Total Amount"; Decimal)
        {
            CalcFormula = sum("Payment Entries".Amount where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57011; "Resources Total WTax"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."W/Tax Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57012; "Resources Total Net"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."Net Amount" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57013; "No. of Resources"; Integer)
        {
            CalcFormula = count("Payment Entries" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57014; "Car loan"; Boolean)
        {
            Description = 'Car Loan';
        }
        field(57015; "Interest Amount"; Decimal)
        {
            Description = 'Car Loan';

            trigger OnValidate()
            begin
                if "Car loan" = true then begin
                    "Total Loan Amount" := "Salary Advance" + "Interest Amount";
                end;
            end;
        }
        field(57016; "Total Loan Amount"; Decimal)
        {
            Description = 'Car Loan';
        }
        field(57017; "Paying Bank No."; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(57018; "Imprest Amount LCY"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Amount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57019; "Actual Amount Spent LCY"; Decimal)
        {
            CalcFormula = sum("Imprest Lines"."Actual Spent LCY" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(57020; "Resources Total Other Costs"; Decimal)
        {
            CalcFormula = sum("Payment Entries"."Other Costs" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57021; "Loan Vendor"; Code[30])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Loan Vendor");
                if Vendor.FindFirst then begin
                    "Loan Vendor Name" := Vendor.Name;
                end
            end;
        }
        field(57022; "Loan Vendor Name"; Text[100])
        {
            Editable = false;
        }
        field(57023; "Recovery Month"; Date)
        {
            TableRelation = "Payroll PeriodX";

            trigger OnValidate()
            begin
                PayrollPeriodX.Reset;
                PayrollPeriodX.SetRange("Starting Date", "Recovery Month");
                if PayrollPeriodX.FindFirst then begin
                    "Recovery Start Month" := PayrollPeriodX.Name;
                end
            end;
        }
        field(57024; Vote; Code[20])
        {
            Caption = 'Vote';
        }

        field(57025; Programme; Code[100])
        {
            Caption = 'Programme';

        }
        field(57026; Class; Code[100])
        {
            Caption = 'Class';

        }
        field(57027; "Approved WorkPlan"; Code[100])
        {
            Caption = 'Approved WorkPlan';
        }
        field(69000; "Imprest Bank Account Number"; Code[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69001; "Imprest Bank Name"; Text[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69002; "Imprest Bank Branch Name"; Text[100])
        {
            Description = '//Ushindi....Pick Imprest Account Bank Details';
            Editable = true;
        }
        field(69004; "Vendor Bank"; Text[30])
        {
        }
        field(69005; "Vendor Bank Branch"; Text[30])
        {
            FieldClass = Normal;
        }
        field(69006; "Vendor Bank Account"; Code[10])
        {
            CalcFormula = lookup(Vendor.Tel where("No." = field("Account No.")));
            FieldClass = FlowField;
        }
        field(69007; "Advance Recovery"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Advance Recovery" where(No = field("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(69008; "Total Net Pay"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Total Net Pay" where(No = field("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Net Pay" := "Total Net Amount" - "Advance Recovery";
            end;
        }
        field(69009; Test; Decimal)
        {
        }
        field(69010; "Used Claim"; Boolean)
        {
        }
        field(69011; "Amount Paid"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Amount Paid" where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(69012; "PV Remaining Amount"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Remaining Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Part Payment"; Boolean)
        {
        }
        field(69014; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(69015; "Reasons to Reopen"; Text[100])
        {
        }
        field(69016; "Payment processed"; Boolean)
        {
        }
        field(69017; "Imprest Created"; Boolean)
        {
        }
        field(69018; Imprest; Integer)
        {
        }
        field(69019; "Converted By"; Code[100])
        {
        }
        field(69020; "Date converted"; Date)
        {
        }
        field(69021; "Time converted"; Time)
        {
        }
        field(69022; "Vote Item"; Code[20])
        {
            // TableRelation = "Budget Commitment";
        }
        field(69023; "Vote Amount"; Decimal)
        {
        }
        field(69024; Commitments; Decimal)
        {
        }
        field(69025; "Actual Amount"; Decimal)
        {
        }
        field(69026; "Available Amount"; Decimal)
        {
            FieldClass = Flowfield;
            CalcFormula = sum("Receipts Header1"."Remaining Amount" where("Shortcut Dimension 2 Code" = field("Shortcut Dimension 2 Code"),
                                                    Closed = filter(false),
                                                    Posted = filter(true)));
            Editable = false;
        }
        field(69027; "Reference No."; Code[20])
        {
        }
        field(69028; Selected; Boolean)
        {
        }
        field(69029; Job; Code[50])
        {
            TableRelation = Job;
        }
        field(69030; "Job Task No"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job Task No");
                if TaskRec.Find('-') then begin
                    // TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", TaskRec.Commitments);
                    // "Job Task Name" := TaskRec.Description;
                    // "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                    // "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" + TaskRec.Commitments);
                end;
            end;
        }
        field(69031; "Job Name"; Text[250])
        {
        }
        field(69032; "Send for Posting"; Boolean)
        {
        }
        field(69033; "Standing Imprest Type"; Option)
        {
            OptionCaption = 'Annual Requisition,Reimbursement Requisition,Project Standing Imprest';
            OptionMembers = "Annual Requisition","Reimbursement Requisition","Project Standing Imprest";
        }
        field(69038; "Salary Advance"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Car loan" = false then begin
                    if ("Salary Advance" <> 0) and ("No of months deducted" <> 0) then begin
                        "Monthly Installment" := ROUND("Salary Advance" / "No of months deducted", 1, '>');
                    end;
                end;

                if "Car loan" = true then begin
                    SalaryScales.Reset;
                    SalaryScales.SetRange(Scale, "Salary Scale");
                    if SalaryScales.FindFirst then begin
                        if "Salary Advance" > SalaryScales."Maximum Car Loan" then begin
                            Error('Car Loan Amount applied is more that the allowed for your Job Grade: Maximum Grade Amount is %1', SalaryScales."Maximum Car Loan");
                        end;
                    end;
                end;
            end;
        }
        field(69039; "Salary Last Drawn"; Decimal)
        {
        }
        field(69040; "Date of Joining"; Date)
        {
        }
        field(69041; "No of months deducted"; Decimal)
        {

            trigger OnValidate()
            begin
                if ("Salary Advance" <> 0) and ("No of months deducted" <> 0) then begin
                    if "Salary Advance" <> 0 then begin
                        if "Car loan" = false then begin
                            if "No of months deducted" > 12 then
                                Error('Maximum Salary Advance Period is 12 Months');
                        end;
                    end;
                    if "Car loan" = true then
                        "Monthly Installment" := ROUND("Total Loan Amount" / "No of months deducted", 1, '>')
                    else
                        "Monthly Installment" := ROUND("Salary Advance" / "No of months deducted", 1, '>');
                end;
            end;
        }
        field(69042; "Amount Pending"; Decimal)
        {
        }
        field(69043; "Recovery Start Month"; Text[50])
        {
        }
        field(69044; "Monthly Installment"; Decimal)
        {
        }
        field(69045; Purpose; Text[250])
        {
        }
        field(69046; Remarks; Text[200])
        {
        }
        field(69047; Comments; Text[200])
        {
        }
        field(69048; "Amount Approved"; Decimal)
        {
        }
        field(69049; "Effective from Month"; Text[50])
        {
        }
        field(69050; "Float Reimbursement"; Boolean)
        {
        }
        field(69051; Destination; Text[100])
        {
        }
        field(69052; Finance; Boolean)
        {
        }
        field(69053; "Imprest Voucher Amount"; Decimal)
        {
            CalcFormula = sum("Imprest Voucher Lines".Amount where(No = field("No.")));
            FieldClass = FlowField;
        }
        field(69055; "Reversed By"; Text[30])
        {
        }
        field(69056; "Reversal Date"; Date)
        {
        }
        field(69057; "Posting Group Code"; Code[30])
        {
            TableRelation = "Employee Posting GroupX" where(Resources = const(true));

            trigger OnValidate()
            begin
                if EmployeePostingGroup.Get("Posting Group Code") then
                    "Posting Group" := EmployeePostingGroup.Description;
            end;
        }
        field(69058; "Posting Group"; Text[50])
        {
        }
        field(69059; "Imprest Voucher Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Imprest Voucher Lines"."Amount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69060; Recouped; Boolean)
        {
        }
        field(70014; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; HOD; Boolean)
        {
        }
        field(70021; Select; Boolean)
        {
        }
        field(70022; banked; Boolean)
        {
        }
        field(70023; "Commitments."; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field(Job),
                                                                  "Job Task No" = field("Job Task No"),
                                                                  Type = const(Committed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70024; "Job Task Budget"; Decimal)
        {
        }
        field(70025; "Job Task Remaining Amount"; Decimal)
        {
        }
        field(70026; "Funding Source"; Code[100])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6), Blocked = const(false));

            trigger OnValidate()
            begin
                // //ValidateShortcutDimCode(6, "Funding Source");
            end;
        }
        field(70027; "Archive Document"; Boolean)
        {
        }
        field(70028; "Original Document No"; Code[20])
        {
        }
        field(70029; "Regional Manager"; Code[50])
        {
            TableRelation = Employee."No." where("Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                                                  "Regional Manager" = filter(true));

            trigger OnValidate()
            begin
                if Employee.Get("Regional Manager") then
                    "Regional Manager Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(70030; "Regional Manager Name"; Text[250])
        {
        }
        field(70031; "Surrender Due Date"; Date)
        {
        }
        field(70032; "Surrender  Doc. No"; Code[20])
        {
            TableRelation = Payments."No." where("Payment Type" = const(Surrender),
                                                  "Account No." = field("Account No."));
        }
        field(70033; "File No."; Code[50])
        {
        }
        field(70034; "File No. Series"; Code[20])
        {
        }
        field(70035; "Salary Payment"; Boolean)
        {
        }
        field(70036; Budgeted; Boolean)
        {
        }
        field(70037; "Payroll Deduction Code"; Code[20])
        {
            TableRelation = DeductionsX;
        }
        field(70038; "Recovery From"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(70039; "Board PAYE"; Decimal)
        {

        }
        field(70040; "PV Voucher Type"; Option)
        {
            OptionCaption = ' ,Create New PV,Append To Exist';
            OptionMembers = " ","Create New PV","Append To Exist";
        }
        field(70041; "PV No"; Code[30])
        {
            Editable = false;
            TableRelation = if ("PV Voucher Type" = const("Append To Exist")) Payments."No." where("Payment Type" = const("Payment Voucher"),
                                                                                               Posted = const(false));

        }
        field(70042; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;

            trigger OnValidate()
            begin
                /*IF Scale.GET("Salary Scale") THEN
                 Halt:=Scale."Maximum Pointer";*/

            end;
        }

        field(70043; "Court Station"; Text[50])
        {
            Caption = 'Court Station';
            DataClassification = CustomerContent;
        }

        field(70044; "Refund To"; Code[50])
        {
            Caption = 'Refund To';
            DataClassification = CustomerContent;
            TableRelation = Customer where("Account Type" = filter(Litigant));

            trigger OnValidate()
            var
                Customer: Record Customer;
                PvLines: Record "PV Lines";
            begin
                Customer.Reset();
                Customer.SetRange("No.", Rec."Refund To");
                if Customer.findset() then begin
                    Rec.Payee := Customer.Name;
                    Rec."Payee Contact" := Customer.Contact;
                    Rec."Payee Bank Account" := Customer."Bank Account Number";
                    Rec."Payee Bank Name" := Customer."Bank Name";
                    Rec."Payee Bank Branch" := Customer."Bank Branch";
                    Rec."Payee Branch Name" := Customer."Bank Branch Name";
                end;

                //Insert Lines
                PvLines.Reset();
                PvLines.Init();
                PvLines.No := Rec."No.";
                PvLines."Line No" := 0;
                PvLines."Account Type" := PvLines."Account Type"::Customer;
                PvLines."Account No" := Rec."Refund To";
                PvLines.Validate("Account No");
                if not PvLines.Insert() then
                    PvLines.modify();
            end;
        }

        field(70045; "PV Type"; Enum "PV Type")
        {
            Caption = 'PV Type';
            DataClassification = CustomerContent;
        }
        field(70046; "Payee Contact"; Code[50])
        {
            Caption = 'Payee Contact';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70047; "Deposit Receipt No."; Code[50])
        {
            Caption = 'Deposit Receipt No.';
            DataClassification = CustomerContent;
            TableRelation = "Receipts Header1"."No." where(Posted = const(true));

            trigger OnValidate()
            var
                ReceiptsH: Record "Receipts Header1";
            begin
                ReceiptsH.Reset();
                ReceiptsH.SetRange(ReceiptsH."No.", "Deposit Receipt No.");
                if ReceiptsH.FindSet() then begin
                    ReceiptsH.CalcFields(Amount);
                    Rec."PRN No." := ReceiptsH."PRN No.";
                    Rec."Case No." := ReceiptsH."Case No.";
                    Rec."Case Description" := ReceiptsH."Case Title";
                    Rec."Deposit Amount" := ReceiptsH.Amount;
                    Rec."Paying Bank Account" := ReceiptsH."Bank Code";
                end;
            end;
        }
        field(70048; "Case No."; code[50])
        {
            Caption = 'Case No.';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(70049; "Case Description"; Code[1000])
        {
            Caption = 'Case Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70050; "PRN No."; Code[50])
        {
            Caption = 'PRN No.';
            DataClassification = CustomerContent;
        }

        field(70051; "Refund Policy"; Enum "Refund Policy")
        {
            Caption = 'Refund Policy';
            DataClassification = CustomerContent;
        }

        field(70052; "Total Amount To Utilize"; Decimal)
        {
            Caption = 'Total Amount to Utilize';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = sum("PV Lines"."Amount To Utilize" where(No = field("No.")));
            Editable = false;
        }

        field(70053; "Total Amount To Refund"; Decimal)
        {
            Caption = 'Total Amount to Refund';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = sum("PV Lines"."Amount To Refund" where(No = field("No.")));
            Editable = false;
        }

        field(70054; "Deposit Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Deposit Amount';
        }
        field(70055; "Invoice Item ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            var
                sharepointInteg: codeunit "Sharepoint Integration";
            begin

                if (Format("Invoice Item ID") <> '') then begin
                    "court order" := sharepointInteg.getCtsOrder("Invoice Item ID", 'court_order', Format("No."));
                    "cts receipt" := sharepointInteg.getCtsOrder("Invoice Item ID", 'receipt', Format("No."));
                    "CTS ID" := sharepointInteg.getCtsOrder("Invoice Item ID", 'id_no', Format("No."));
                end;
            end;
        }

        field(70056; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70057; "Strategic Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(70058; "Reporting Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CSP Planned Years"."Annual Year Code" where("CSP Code" = field("Strategic Plan"));
        }
        field(70059; "Workplan Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Annual Strategy Workplan".No where("Planning Budget Type" = filter(Supplementary | "Supplementary 2"), "Budget Posted to G/L" = const(true), "Strategy Plan ID" = field("Strategic Plan"),
                            "Year Reporting Code" = field("Reporting Year Code"), "Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"),
                             "Global Dimension 2 Code" = field("Shortcut Dimension 2 Code"));
            trigger OnValidate()
            var
                AWP: Record "Annual Strategy Workplan";
            begin
                if AWP.Get("Workplan Code") then
                    "Resource Req. No." := AWP."Resource Req. No";
            end;
        }
        field(70060; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Activity".Code where("Strategic Plan ID" = field("Resource Req. No."));
        }
        field(70061; "Resource Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if (xRec."Resource Req. No." <> Rec."Resource Req. No.") and (xRec."Resource Req. No." <> '') then
                    Validate("Activity Code", '');
            end;
        }
        field(70062; "Source PV No."; Code[20])
        {
            //Applicable for Tax and Retention PVS
            DataClassification = ToBeClassified;
        }
        field(70063; "Invoice ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70064; "Rejected By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70065; Filename; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70066; "Bank Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70067; "Payee Bank Name"; Text[100])
        {
        }
        field(70068; "Payee Bank Branch"; Code[100])
        {
            trigger OnValidate()
            var
                PRBankBranches: Record "PR Bank Branches";
            begin
                if PRBankBranches.Get("Payee Bank Branch", "Payee Bank Code") then
                    "Payee Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(70069; "Payee Branch Name"; Text[100])
        {
        }
        field(70070; "Payee Bank Account"; Code[100])
        {
        }
        field(70071; "Expenditure Requisition Code"; Code[20])
        {
            TableRelation = "Expense Requisition"."No." where("Global Dimension 1 Code" = field("Shortcut Dimension 1 Code"), "Global Dimension 2 Code" = field("Shortcut Dimension 2 Code"),
                                                               "Corporate Strategy" = field("Strategic Plan"), "Reporting Period" = field("Reporting Year Code"), "Activity Code" = field("Activity Code"),
                                                               "Approval Status" = const(Released), Status = const(Committed));

            trigger OnValidate()
            var
                EXR: Record "Expense Requisition";
            begin

            end;
        }

        field(70072; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(70073; "Source RecordId"; RecordId)
        {
            DataClassification = ToBeClassified;
        }
        field(70074; "Source No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70075; "Folio No."; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(70076; "Volume No."; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(70077; Attachment; Blob)
        {
        }
        field(70078; "File Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70079; "Retention Receipt No."; Code[20])
        {
        }
        field(70080; "Cancelled By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70081; "Cancelled Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70082; Cancelled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70083; "EFT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70084; "Payee Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                PRBanks: Record "PR Bank Accounts";
            begin
                if PRBanks.Get("Payee Bank Code") then
                    "Payee Bank Name" := PRBanks."Bank Name";
                "Pay Mode" := CheckUpdateIFT("No.", "Payee Bank Code", "Pay Mode");
            end;
        }
        field(70085; "Supplier Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70086; "Doc Check List Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Payment Document Check List"."No.";
            Caption = 'Document Check List Code';
            trigger OnValidate()
            var
                // DocCheckMgt: Codeunit "Payment Documents Check Mgt";
            begin
                // DocCheckMgt.GenerateDocAttachment(Rec.RecordId, true, "Doc Check List Code");
            end;
        }
        field(70087; "Sender QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }

        field(70088; "OTP Code"; Text[20])
        {

        }

        field(70089; "OTP Datetime"; DateTime)
        {
        }

        field(70090; "Sender Id"; Code[20])
        {
            trigger OnValidate()
            var
                // MemoryStream: dotnet MemoryStream;
                Ostream: OutStream;
                // Bytes: dotnet Array;
                TempBlob: Codeunit "Temp Blob";
                InStream: InStream;
                OutStream: OutStream;
                HrEmp: Record Employee;
                EmpName: Text;
                B64: BigText;
                ByteCount: Integer;
                Base64Convert: Codeunit "Base64 Convert";
                // QRCodeUnit: Codeunit QRCodeUnit;
                // Convert: dotnet Convert;
                OTP: Record Otp;
                ApprovalEntry: Record "Approval Entry";

            begin
                if Status = Status::Released then begin
                    // if ("Document Type" = "document type"::Imprest) or ("Document Type" = "document type"::"Staff Claims") then begin
                    //     // Commitment.ImprestCommittment(Rec);
                    // end;
                end else
                    if Status = Status::Rejected then begin
                        Testfield("Reasons to Reopen");
                        UserSetup.Get(UserID);
                        "Rejected By" := UserSetup."Employee No.";
                    end
                    else
                        if Status = Status::"Pending Approval" then begin
                            if not Rec."Sender QR Code".HasValue() then begin

                                ApprovalEntry.Reset();
                                ApprovalEntry.setrange(ApprovalEntry."Document No.", Rec."No.");
                                ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
                                if ApprovalEntry.find('-') then
                                    OTP.Reset();
                                OTP.SetRange(OTP."Document No", Rec."No.");
                                OTP.SetRange(OTP."User ID", ApprovalEntry."Sender ID");
                                OTP.SetRange(OTP."OTP Type", OTP."OTP Type"::Initiator);
                                if OTP.FindLast() then
                                    if UserSetup.Get(ApprovalEntry."Sender ID") then
                                        if Emp.Get(UserSetup."Employee No.") then EmpName := '; Initiator: ' + Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                                // B64 := QRCodeUnit.GenerateApprovalQRCode(57000, "No.", EmpName, CurrentDateTime, OTP."OTP Code", Emp."Phone No.");
                                // Bytes := Convert.FromBase64String(B64);
                                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                                Rec."Sender QR Code".CreateOutStream(OutStream);
                                Base64Convert.FromBase64(Format(B64), OutStream);
                                Rec.Modify();
                            end;
                        end;
            end;
        }

        field(70091; "court order"; Text[300])
        {
            Caption = 'Court Order';

        }

        field(70092; "cts receipt"; Text[300])
        {
            Caption = 'Cts Receipt';
        }

        field(70093; "CTS ID"; Text[300])
        {
            Caption = 'Identification';
        }

        field(70094; sentToSharepoint; Boolean)
        {
            Caption = 'Sent To Sharepoint';
        }

        field(70095; ErrorMessage; Text[2000])
        {

        }

        field(70096; documentID; Text[200])
        {

        }
        field(70097; "Committed Amount"; Decimal)
        {
            Editable = false;
        }
        field(70098; "AIE Receipt"; Code[20])
        {
            Editable = false;
        }
        field(70099; "Total Committed Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(Payments."Committed Amount" where("AIE Receipt" = field("AIE Receipt"), "Shortcut Dimension 2 Code" = field("Shortcut Dimension 2 Code")));
        }

        field(70100; "E-mail"; Code[100])
        {
            DataClassification = ToBeClassified;
        }

        field(70101; ValidatedBankName; Text[250])
        {
            DataClassification = ToBeClassified;

        }

        field(70102; Eslip; Text[250])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                payments: Record Payments;
            begin
                if xRec.Eslip <> '' then
                    if Rec.isTaxValidated then
                        Error('You are not allowed to edit this field');
                if Rec.Eslip <> '' then begin
                    payments.reset();
                    payments.setRange(Eslip, Rec.Eslip);
                    if payments.findFirst() then
                        Error('The eslip has been used in tax voucher %1', payments."No.");
                end;
            end;

        }

        field(70103; "Bounced Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender,Standing Imprest,Salary Advance,Payment Voucher Reversal,Imprest Reversal,Staff Claim Reversal,Imprest Surrender Reversal,Petty Cash Reversal,Bank Transfer Reversal,Petty Cash Surrender Reversal,Surrender Reversal,Standing Imprest Reversal,Salary Advance Reversal,Standing Imprest Surrender,AIE,Warrant Voucher,Payment Schedule,Car Loan,Special Imprest,""';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,"Standing Imprest","Salary Advance","Payment Voucher Reversal","Imprest Reversal","Staff Claim Reversal","Imprest Surrender Reversal","Petty Cash Reversal","Bank Transfer Reversal","Petty Cash Surrender Reversal","Surrender Reversal","Standing Imprest Reversal","Salary Advance Reversal","Standing Imprest Surrender",AIE,"Warrant Voucher","Payment Schedule","Car Loan","Special Imprest"," ";
            trigger OnValidate()
            var
                pvLines: Record "PV Lines";
                ImprestLines: Record "Imprest Lines";
            begin
                if "Bounced Payment Doc. No" <> '' then begin

                    Payee := '';
                    "Payee Bank Name" := '';
                    "Total Net Amount" := 0;
                    "Total Amount" := 0;
                    "Imprest Amount" := 0;
                    "Bounced Pv Type" := "Bounced Pv Type"::" ";
                    "Bounced Payment Doc. No" := '';
                    "Paying Bank Account" := '';
                    "Payment Narration" := '';
                    pvLines.reset();
                    pvLines.SetRange(No, Rec."No.");
                    if pvLines.FindSet() then
                        repeat
                            pvLines.delete();
                        until pvLines.next = 0;
                    ImprestLines.Reset();
                    ImprestLines.SetRange(No, Rec."No.");
                    if ImprestLines.FindSet() then
                        repeat
                            ImprestLines.Delete();
                        until ImprestLines.Next() = 0;

                end;
            end;
        }

        field(70110; BankPaymentRef; Code[200])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     outwardBuffer: Record "Outward Payment Buffer";
            // begin
            //     outwardBuffer.reset();
            //     outwardBuffer.setRange(RetrievalNumber, Rec."No.");
            //     outwardBuffer.setFilter("ftReference", '<>%1', '');
            //     if outwardBuffer.FindFirst() then begin
            //         BankPaymentRef := outwardBuffer.ftReference;
            //     end;


            // end;
        }
        field(70111; bouncedPaymentDate; Date)
        {
            Caption = 'Bounced Payment Date';
        }
        
          field(70112; "VAT Code"; Code[40])
        {
            Caption = 'Bounced Payment Date';
        }

        // field(70104; "Bounced Payment Doc. No"; Code[20])
        // {
        //     // TableRelation = Payments."No." where("Payment Type" = field("Bounced Payment Type"), Reversed = const(true));
        //     TableRelation = Payments."No." where("Payment Type" = field("Bounced Payment Type"), Reversed = const(true));
        //     trigger OnValidate()
        //     var
        //         recPayment: record payments;
        //         pvLines: array[3] of Record "PV Lines";
        //         entryNumber: integer;
        //     begin

        //         // Delete existing PV Lines associated with this document
        //         pvLines[2].Reset();
        //         pvLines[2].SetRange(No, Rec."No.");
        //         if pvLines[2].FindSet() then
        //             repeat
        //                 pvLines[2].Delete();
        //             until pvLines[2].Next() = 0;

        //         if recPayment.get("Bounced Payment Doc. No") then begin
        //             "Payment Type" := recPayment."Payment Type";
        //             Payee := recPayment.Payee;
        //             "Payee Bank Name" := recPayment."Payee Bank Name";
        //             "Total Net Amount" := recPayment."Total Net Amount";
        //             "Payment Narration" := recPayment."Payment Narration";
        //             "Paying Bank Account" := recPayment."Paying Bank Account";
        //             //get updated bank details for bounced payments

        //             pvLines[1].reset();
        //             pvLines[1].SetRange(No, "Bounced Payment Doc. No");
        //             if pvLines[1].FindSet() then begin

        //                 repeat
        //                     pvLines[2].reset();
        //                     if pvLines[2].Find('-') then
        //                         entryNumber := pvLines[2].Count() + 1
        //                     else
        //                         entryNumber := 1;
        //                     pvLines[2].init();
        //                     pvLines[2].TransferFields(pvLines[1]);
        //                     pvLines[2]."EFT Code" := '';
        //                     pvLines[2]."Line No" := entryNumber;
        //                     pvLines[2].No := Rec."No.";
        //                     pvLines[2]."Bounced Pv No" := recPayment."No.";
        //                     pvLines[2]."Bounced Payment Type" := Rec."Bounced Payment Type";
        //                     if (recPayment."Bounced Payment Type" = recPayment."Bounced Payment Type"::"payment voucher") then
        //                         pvLines[2]."PV Type" := Rec."PV Type";
        //                     pvLines[2].insert();
        //                 until pvLines[1].next = 0
        //             end;

        //         end;


        //     end;


        // }
        field(70104; "Bounced Payment Doc. No"; Code[20])
        {
            Caption = 'Bounced Payment Doc. No';
            trigger OnValidate()
            var
                recPayment: Record Payments;
                pvLines: array[3] of Record "PV Lines";
                entryNumber: Integer;
                attachLink: Record Attachments;
                attachLink2: Record Attachments;
                entryNo: integer;
                ImprestLines: array[3] of Record "Imprest Lines";
                paymentsRec: Record Payments;
                receiptsAccNo: Code[50];
                ReceiptLines: Record "Receipt Lines1";
                ReceiptHeader: Record "Receipts Header1";
                receiptType: Option;

            begin

                // isPaymentProcessed("Bounced Payment Doc. No");
                // isReceiptPosted("Bounced Payment Doc. No");
                paymentsRec.reset();
                paymentsRec.setRange("No.", "Bounced Payment Doc. No");
                // paymentsRec.setRange(Reversed, true);

                //get receipt account number and account Type

                ReceiptHeader.reset();
                ReceiptHeader.setRange("Bounced Payment Doc", "Bounced Payment Doc. No");
                ReceiptHeader.SetRange(Posted, true);
                if Not ReceiptHeader.FindFirst() then
                    Error('Post the Receipt: ' + ReceiptHeader."No.");
                receiptLines.reset();
                receiptLines.setRange("Receipt No.", ReceiptHeader."No.");
                if receiptLines.FindFirst() then begin
                    receiptsAccNo := receiptLines."Account No.";
                    receiptType := receiptLines."Account Type";
                end;




                if paymentsRec.FindFirst() then begin

                    if ("Bounced Payment Type" = "Bounced Payment Type"::imprest) then begin
                        ImprestLines[2].Reset();
                        ImprestLines[2].SetRange(No, Rec."No.");
                        if ImprestLines[2].FindSet() then
                            repeat
                                ImprestLines[2].Delete();
                            until ImprestLines[2].Next() = 0;

                        ImprestLines[1].Reset();
                        ImprestLines[1].SetRange(No, "Bounced Payment Doc. No");
                        if ImprestLines[1].FindSet() then begin
                            repeat
                                ImprestLines[2].Reset();
                                if ImprestLines[2].Find('-') then
                                    entryNumber := pvLines[2].Count() + 1
                                else
                                    entryNumber := 1;

                                ImprestLines[2].Init();
                                ImprestLines[2].TransferFields(ImprestLines[1]);
                                ImprestLines[2]."Line No" := entryNumber;
                                ImprestLines[2].No := Rec."No.";
                                ImprestLines[2]."Bounced Pv No" := recPayment."No.";
                                ImprestLines[2]."Bounced Payment Type" := Rec."Bounced Payment Type";
                                ImprestLines[2]."Account No." := receiptsAccNo;
                                ImprestLines[2]."Account Type" := receiptType;




                                ImprestLines[2].Insert();
                            until ImprestLines[1].Next() = 0;
                        end;
                    end
                    else begin
                        pvLines[2].Reset();
                        pvLines[2].SetRange(No, Rec."No.");
                        if pvLines[2].FindSet() then
                            repeat
                                pvLines[2].Delete();
                            until pvLines[2].Next() = 0;
                        //get updated details for the lines
                        pvLines[1].Reset();
                        pvLines[1].SetRange(No, "Bounced Payment Doc. No");
                        if pvLines[1].FindSet() then begin
                            repeat
                                pvLines[2].Reset();
                                if pvLines[2].Find('-') then
                                    entryNumber := pvLines[2].Count() + 1
                                else
                                    entryNumber := 1;

                                pvLines[2].Init();
                                pvLines[2].TransferFields(pvLines[1]);
                                pvLines[2]."EFT Code" := '';
                                pvLines[2]."Line No" := entryNumber;
                                pvLines[2].No := Rec."No.";
                                pvLines[2]."Bounced Pv No" := recPayment."No.";
                                pvLines[2]."Bounced Payment Type" := Rec."Bounced Payment Type";
                                ImprestLines[2]."Account No." := receiptsAccNo;
                                pvLines[2]."Account Type" := receiptType;
                                pvLines[2]."Account No" := receiptsAccNo;



                                // pvLines[2]."Account No" := 

                                if recPayment."Bounced Payment Type" = recPayment."Bounced Payment Type"::"payment voucher" then begin
                                    pvLines[2]."PV Type" := Rec."PV Type";
                                    pvLines[2]."Bounced Pv Type" := Rec."Bounced Pv Type";
                                end;

                                pvLines[2].Insert();
                            until pvLines[1].Next() = 0;
                        end;

                    end;
                    isBouncedUsed := false;

                    attachLink.reset();
                    attachLink.setRange(attachLink.Document_No, Rec."No.");
                    if attachLink.findSet() then
                        repeat
                            attachlink.Delete();
                        until attachLink.next = 0;
                    if recPayment.Get("Bounced Payment Doc. No") then begin
                        "Payment Type" := recPayment."Payment Type";
                        Payee := recPayment.Payee;
                        "Payee Bank Name" := recPayment."Payee Bank Name";
                        "Payment Narration" := recPayment."Payment Narration";
                        "Paying Bank Account" := recPayment."Paying Bank Account";
                        "Pay Mode" := recPayment."Pay Mode";
                        isBouncedUsed := true;
                        "Payee Bank Account" := recPayment."Payee Bank Account";
                        "Payee Bank Code" := recPayment."Payee Bank Code";
                        Payee := recPayment.Payee;
                        "Payee Bank Name" := recPayment."Payee Bank Name";
                        "Payee Bank Branch" := recPayment."Payee Bank Branch";
                        "Payee Branch Name" := recPayment."Payee Branch Name";
                        recPayment.calcFields("Total Amount", "Total Net Amount", "Imprest Amount");
                        "Total Net Amount" := recPayment."Total Net Amount";
                        "Imprest Amount" := recPayment."Imprest Amount";
                        "Total Amount" := recPayment."Total Amount";
                        attachLink.reset();
                        attachLink.setRange(attachLink.Document_No, "Bounced Payment Doc. No");
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
                                attachLink2.Document_No := Rec."No.";
                                attachlink2.insert();
                            until attachLink.next = 0;



                    end;
                end
                // else
                //     Error('Payment has not been reversed!')
            end;

            trigger OnLookup()
            var
                recPayment: Record Payments;
                staffClaims: Integer;
                normalPvs: Integer;
                refunds: integer;
                standingImprest: integer;
                imprest: integer;
                // OutwardPaymentBuffer: Record "Outward Payment Buffer";
                Receipts: Record "Receipts Header1";
                receiptList: Integer;

            begin
                staffClaims := 57112; // Page ID for Staff Claims
                normalPvs := 57000;   // Page ID for Normal PVs
                standingImprest := 57153; //page id for imprest
                refunds := 50283; // page id for refunds
                imprest := 57055;
                receiptList := 50551;


                Receipts.Reset();
                Receipts.setRange("Receipt Type", Receipts."Receipt Type"::"RD Receipts");
                Receipts.SetRange(Posted, true);
                Receipts.SetRange(ReceiptProcessed, false);
                if Page.RunModal(receiptList, Receipts) = Action::LookupOK then begin
                    "Bounced Payment Doc. No" := Receipts."Bounced Payment Doc";
                    validate("Bounced Payment Doc. No");
                end;


                // if Rec."Bounced Payment Type" <> Rec."Bounced Payment Type"::" " then begin
                //     recPayment.SetRange("Payment Type", Rec."Bounced Payment Type");
                //     recPayment.SetRange(Reversed, true);
                //     recPayment.SetRange(isBouncedUsed, false);


                //     if Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Staff Claim" then begin
                //         if Page.RunModal(staffClaims, recPayment) = Action::LookupOK then begin
                //             "Bounced Payment Doc. No" := recPayment."No.";
                //             Validate("Bounced Payment Doc. No");
                //             // Validate(BankPaymentRef);


                //         end;
                //     end;
                //     if ((Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Payment Voucher") and (Rec."Bounced Pv Type" = Rec."Bounced Pv Type"::Normal)) then begin
                //         if Page.RunModal(normalPvs, recPayment) = Action::LookupOK then begin
                //             "Bounced Payment Doc. No" := recPayment."No.";
                //             Validate("Bounced Payment Doc. No");

                //         end;
                //     end;
                //     if Rec."Bounced Pv Type" = Rec."Bounced Pv Type"::Refund then begin
                //         if Page.RunModal(refunds, recPayment) = Action::LookupOK then begin
                //             "Bounced Payment Doc. No" := recPayment."No.";
                //             Validate("Bounced Payment Doc. No");

                //         end;
                //     end;
                //     if Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Standing Imprest" then begin
                //         if Page.RunModal(standingImprest, recPayment) = Action::LookupOK then begin
                //             "Bounced Payment Doc. No" := recPayment."No.";
                //             Validate("Bounced Payment Doc. No");


                //         end;
                //     end;
                //     if Rec."Bounced Payment Type" = Rec."Bounced Payment Type"::"Imprest" then begin
                //         if Page.RunModal(imprest, recPayment) = Action::LookupOK then begin
                //             "Bounced Payment Doc. No" := recPayment."No.";
                //             Validate("Bounced Payment Doc. No");
                //         end;
                //     end;
                // end else begin
                //     Message('Bounced Payment Type is empty. Please select a valid type before looking up documents.');
                // end;

            end;




        }

        field(70105; "Bounced Pv Type"; Enum "PV Type")
        {

        }

        field(70106; isVisible; Boolean)
        {

        }

        field(70115; isBouncedUsed; Boolean)
        {

        }

        field(70116; isTaxValidated; Boolean)
        {

        }

        field(70117; relatedTaxPv; Text[80])
        {

        }

        field(70120; taxType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "VAT Withheld","Total Withholding tax";
        }

        field(70121; "BouncedPaymenttype"; Option)
        {
            OptionMembers = "",Bounced,Failed;
            Caption = 'Payment Type';
        }
        field(70122; "Return Date"; Date)
        {
            trigger OnValidate()
            begin
                case "Payment Type" of
                    "payment type"::Imprest:
                        begin
                            //Get the Imprest Deadline Date
                            if not CashMgt.Get then
                                Error(Text000);
                            CashMgt.TestField("Imprest Due Date");
                            if "Return Date" <> 0D then
                                "Imprest Deadline" := CalcDate(CashMgt."Imprest Due Date", "Return Date");
                        end;
                end;
            end;
        }
        field(70123; "Imprest Recovered"; Boolean)
        {

        }

        field(70124; Retried; Boolean)
        {
            Caption = 'Payment Retried';
        }
        field(70125; "Tax Obligation"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70126; "Total Excl. VAT"; Decimal)
        {
            CalcFormula = sum("PV Lines"."Amount Excluding VAT" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70134778; "Final Approver Status"; Enum "Approval Status")
        {
            FieldClass = FlowField;
            CalcFormula = max("Approval Entry".Status where("Document No." = field("No.")));
        }
        field(70134789; "Open Approver Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Document No." = field("No."), Status = filter(Open)));
        }
        field(70134779; "Final Approver Seq No"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = max("Approval Entry"."Sequence No." where("Document No." = field("No.")));
        }
        field(70134790; "Cancelled Approver Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Document No." = field("No."), Status = filter(Rejected)));
        }
        field(800000; "Withholding Tax Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(86000; "Eft Generated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }







    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "PV Type")
        {
        }
        Key(Key3; "Payment Type", "PV Type", Status)
        {
        }
        key(Key4; "Payment Type", "PV Type", Posted)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        Error('You are not allowed to delete');
    end;

    trigger OnInsert()
    var
        WorkplanMgt: Codeunit "Workplan Management";
        PayMode: Record "Pay Mode";
        DefaultDimensions, CurrDimensions : array[8] of Code[20];
        // //DefaultDimensionRec: Record "Default Dimension Custom";
     begin
    //     //Default User Dimensions
    //     if UserSetup.Get(UserId) then begin
    //         if "Shortcut Dimension 1 Code" = '' then
    //             "Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
    //         if "Shortcut Dimension 2 Code" = '' then
    //             "Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 2 Code";
    //     end;
    //     Validate("Shortcut Dimension 1 Code");
    //     Validate("Shortcut Dimension 2 Code");
    //     //Default Corporate Strategy
    //     if "Strategic Plan" = '' then
    //         "Strategic Plan" := WorkplanMgt.GetCurrentCorporateStrategy();

    //     if "Reporting Year Code" = '' then
    //         "Reporting Year Code" := WorkplanMgt.GetCurrentStrategyImplementationYear("Strategic Plan");
    //     //Get Plan 
    //     if "Workplan Code" = '' then begin
    //         if ("Shortcut Dimension 1 Code" <> '') and ("Shortcut Dimension 2 Code" <> '') and ("Strategic Plan" <> '') and ("Reporting Year Code" <> '') then
    //             "Workplan Code" := WorkplanMgt.GetCurrentWorkplan("Strategic Plan", "Reporting Year Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    //         Validate("Workplan Code");
    //     end;

    //     //Default payMode
    //     // if "Pay Mode" = '' then
    //         // "Pay Mode" := PayMode.GetDefaultPayMode();

    //     CashMgt.Get();
    //     if "Payment Type" = "payment type"::"Payment Voucher" then begin
    //         CashMgt.TestField("PV Nos");

    //         case
    //             "PV Type" of
    //             "PV Type"::Refund:
    //                 begin
    //                     IF "No." = '' then
    //                         NoSeriesMgt.InitSeries(CashMgt."Refund Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //                     case
    //                         // "Refund Policy" of
    //                         // "Refund Policy"::Forfeiture:
    //                         //     //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Forfeiture Voucher", DefaultDimensions);
    //                         // "Refund Policy"::"Full Refund":
    //                         //     //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Refund Voucher", DefaultDimensions);
    //                         // "Refund Policy"::"Full Utilization":
    //                         //     //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Utilization Voucher", DefaultDimensions);
    //                     end;
    //                 end;
    //         //     "PV Type"::Normal:
    //         //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Payment Voucher", DefaultDimensions);
    //         //     "PV Type"::Tax:
    //         //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Tax Payment Voucher", DefaultDimensions);
    //         //     "PV Type"::Retention:
    //         //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Retention Movement", DefaultDimensions);
    //         //     "PV Type"::"Retention Payment":
    //         //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Retention Payment Voucher", DefaultDimensions);
    //         //     "PV Type"::Payroll:
    //         //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Payroll Payment Voucher", DefaultDimensions);
    //         //     "PV Type"::"Revenue Sweep Voucher":
    //         //         begin
    //         //             if "No." = '' then begin
    //         //                 CashMgt.Testfield("Revenue Sweep Nos");
    //         //                 NoSeriesMgt.InitSeries(CashMgt."Revenue Sweep Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         //             end;
    //         //             "Paying Bank Account" := GetBankAccount();
    //         //             Validate("Paying Bank Account");
    //         //         end;
    //         //     "PV Type"::"Bounced Payments Voucher":
    //         //         begin
    //         //             if "No." = '' then begin
    //         //                 CashMgt.Testfield("Bounced Pvs Nos");
    //         //                 NoSeriesMgt.InitSeries(CashMgt."Bounced Pvs Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         //             end;
    //         //         end;
    //         // end;
    //         // if "No." = '' then
    //         //     NoSeriesMgt.InitSeries(CashMgt."PV Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         // /* IF "File No."='' THEN
    //         //     NoSeriesMgt.InitSeries(CashMgt."PV File Numbering",xRec."File No. Series",0D,"File No.","File No. Series");*/
    //         // CheckAccountsInitiator;
    //         // if ("Paying Bank Account" = '') and ("Shortcut Dimension 1 Code" <> '') and ("Shortcut Dimension 2 Code" <> '') then
    //         //     "Paying Bank Account" := GetBankAccount();
    //         // Validate("Paying Bank Account");
    //     end;


    //     if "Payment Type" = "payment type"::Imprest then begin
    //         if (CashMgt."Lock Imprest Application" = true) and (UserSetup."Accounts User" = false) then
    //             Error(Text011);
    //         CashMgt.TestField("Imprest Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         if "Paying Bank Account" = '' then
    //             "Paying Bank Account" := CashMgt."Imprest Bank Account";
    //         Validate("Paying Bank Account");

    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Safari Imprest", DefaultDimensions);
    //     end;
    //     if "Payment Type" = "payment type"::AIE then begin
    //         CashMgt.TestField("AIE Nos.");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."AIE Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    //     end;
    //     if "Payment Type" = "payment type"::"Payment Schedule" then begin
    //         CashMgt.TestField("Payment Schedule Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Payment Schedule Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //     end;
    //     if "Payment Type" = "payment type"::"Petty Cash" then begin
    //         CashMgt.TestField("Petty Cash Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Petty Cash Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Petty Cash", DefaultDimensions);
    //     end;
    //     if "Payment Type" = "payment type"::"Warrant Voucher" then begin
    //         CashMgt.TestField("Imprest Voucher Nos");
    //         CheckAccountsInitiator;
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Imprest Voucher Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //     end;
    //     if "Payment Type" = "payment type"::"Staff Claim" then begin
    //         CashMgt.TestField(CashMgt."Staff Claim Nos.");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Staff Claim Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    //         if "Paying Bank Account" = '' then
    //             "Paying Bank Account" := CashMgt."Imprest Bank Account";
    //         Validate("Paying Bank Account");
    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Staff Claim", DefaultDimensions);
    //     end;

    //     if "Payment Type" = "payment type"::Surrender then begin
    //         CashMgt.TestField(CashMgt."Imprest Surrender Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Imprest Surrender Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Imprest Surrender", DefaultDimensions);
    //     end;

    //     if "Payment Type" = "payment type"::"Bank Transfer" then begin
    //         CashMgt.TestField(CashMgt."Bank Transfer Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Bank Transfer Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Bank Transfer", DefaultDimensions);
    //     end;

    //     if "Payment Type" = "payment type"::"Standing Imprest" then begin
    //         CashMgt.TestField(CashMgt."Standing Imprest Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");

    //         if "Paying Bank Account" = '' then
    //             "Paying Bank Account" := CashMgt."Imprest Bank Account";
    //         Validate("Paying Bank Account");
    //         // //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Standing Imprest", DefaultDimensions);
    //     end;

    //     if "Payment Type" = "payment type"::"Standing Imprest Surrender" then begin
    //         CashMgt.TestField(CashMgt."Standing Imprest Surrender Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Surrender Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //         //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Standing Imprest Surrender", DefaultDimensions);
    //     end;

    //     if "Payment Type" = "payment type"::"Salary Advance" then begin
    //         CashMgt.TestField(CashMgt."Salary Advance Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Salary Advance Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //     end;

    //     if "Payment Type" = "payment type"::"Car Loan" then begin
    //         CashMgt.TestField(CashMgt."Car loan Nos");
    //         if "No." = '' then
    //             NoSeriesMgt.InitSeries(CashMgt."Car loan Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //     end;

    //     if "Payment Type" = "Payment Type"::"Special Imprest" then begin
    //         if "No." = '' then begin
    //             CashMgt.TestField("Special Imprest Nos");
    //             NoSeriesMgt.InitSeries(CashMgt."Special Imprest Nos", xRec."No. Series", 0D, "No.", "No. Series");
    //             if "Paying Bank Account" = '' then
    //                 "Paying Bank Account" := CashMgt."Imprest Bank Account";
    //             Validate("Paying Bank Account");
    //             //DefaultDimensionRec.GetDimensionCodes(//DefaultDimensionRec."Document Type"::"Special Imprest", DefaultDimensions);
    //         end;
    //     end;
    //     //Daudi for reversal Document
    //     CheckDocumentType;
    //     //End of reversal Documents


    //     if GuiAllowed then "Created By" := UserId;
    //     Date := Today;

    //     if "Payment Type" = "payment type"::Imprest then begin
    //         //Insert User ID and Imprest Account No/Mapping
    //         UserSetup.Reset;
    //         if not UserSetup.Get(UserId) then
    //             Error('%1 is not defined under the User Setup, Please check!', UserId);
    //         if UserSetup.Get(UserId) then begin
    //             UserSetup.TestField(UserSetup."Resource No");
    //             UserSetup.TestField(UserSetup."Employee No.");
    //             UserSetup.TestField(UserSetup."Imprest Account");
    //             UserSetup.TestField(UserSetup."Employee Name");
    //             "Account Type" := "account type"::Customer;
    //             "Account No." := UserSetup."Imprest Account";
    //             "Account Name" := UserSetup."Employee Name";
    //             Payee := UserSetup."Employee Name";
    //         end;
    //     end;
    //     /*
    //      //Track Customer Imprest Account Bank details and Outstanding Balance
    //     Customer.RESET;
    //     Customer.SETRANGE(Customer."No.","Account No.");
    //     IF Customer.FIND('-') THEN
    //       BEGIN
    //         //Track Customer Imprest Bank Details
    //         Customer.TESTFIELD(Customer."Employee's Bank");
    //         Customer.TESTFIELD(Customer."Bank Branch");
    //         Customer.TESTFIELD(Customer."Bank Account Number");
    //         Customer.CALCFIELDS(Customer."Bank Name");
    //         Customer.CALCFIELDS(Customer."Bank Branch Name");
    //         "Imprest Bank Account Number":=Customer."Bank Account Number";
    //         "Imprest Bank Branch Name":=Customer."Bank Branch Name";
    //         "Imprest Bank Name":=Customer."Bank Name";
    //         "Bank Code":=Customer."Employee's Bank";


    //         //Track Customer Balance
    //          Customer.CALCFIELDS(Customer."Balance (LCY)");
    //          IF Customer."Balance (LCY)" >0 THEN ERROR(Text006,"Account No.",Customer."Balance (LCY)");
    //         // IF Customer."Balance (LCY)"<>0 THEN ERROR(Text006,"Account No.",Customer."Balance (LCY)");
    //       END;

    //     END;//End for Payment Type: Imprest Code
    //     */
    //     /*
    //     Vendor.RESET;
    //     Vendor.SETRANGE(Vendor."No.","Account No.");
    //     IF Vendor.FIND('-') THEN

    //         BEGIN

    //           Vendor.TESTFIELD(Vendor."Vendor's Bank");
    //           Vendor.TESTFIELD(Vendor."Bank Name");
    //           Vendor.TESTFIELD(Vendor.Email);
    //           Vendor.TESTFIELD(Vendor."Bank Branch Name");
    //           Vendor.TESTFIELD(Vendor.Tel);
    //           "Vendor Bank":=Vendor."Bank Name";
    //           "Vendor Bank Account":=Vendor.Tel;
    //           "Vendor Bank Branch":=Vendor."Bank Branch Name";
    //           MODIFY;

    //           END;
    //     */


    //     if (GuIAllowed()) then begin
    //         if UsersRec.Get(UserId) then begin
    //             if UsersRec."Portal User" = false then begin //exempt the portal user name
    //                 if "Account Type" = "account type"::Employee then begin
    //                     "Account No." := UsersRec."Employee No.";
    //                     Validate("Account No.");
    //                 end;
    //             end;
    //         end;
    //     end;
    //     //Update Dimensions
    //     DimMgt.GetShortcutDimensions("Dimension Set ID", CurrDimensions);
    //     // "Dimension Set ID" := PayPost.AggregateDimensions(CurrDimensions, DefaultDimensions, CurrDimensions);
    //     "Shortcut Dimension 1 Code" := CurrDimensions[1];
    //     "Shortcut Dimension 2 Code" := CurrDimensions[2];
    //     "Shortcut Dimension 3 Code" := CurrDimensions[3];
    //     "Shortcut Dimension 4 Code" := CurrDimensions[4];
    //     "Shortcut Dimension 5 Code" := CurrDimensions[5];
    //     "Shortcut Dimension 6 Code" := CurrDimensions[6];
      end;

    trigger OnRename()
    begin
        // if (Status <> Status::Open) then
        //    Error(Text010);
    end;

    var
        PayPost: Codeunit "Payment- Post";
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
        PV: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        Text003: label 'There''s no open entry for attaching from an imprest memo for Employee %1';
        Text004: label 'There''s no Approved Imprest Memo under project %1';
        JobRec: Record Job;
        DimMgt: Codeunit DimensionManagement;
        PurchLines: Record "PV Lines";
        PurchLine: Record "PV Lines";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        ImpHeader: Record Payments;
        ImpLines: Record "Imprest Lines";
        // ImpLines: Record "Imprest Voucher Lines";
        ImpSurrLines: Record "Imprest Lines";
        Text005: label 'Another Project Imprest Requistion No %1 you created is still Open, Please check or reuse it!';
        Text006: label 'Your Imprest account %1 has an Outstanding Balance of %2, Please check or followup on the related surrender!';
        ImpMemo: Record "Imprest Memo";
        Text007: label 'There''s no Surrendered Imprest Memo under project %1';
        cshma: Record "Cash Management Setup";
        Text008: label 'You cannot delete a record once created. Kindly modify the record and reuse it.';
        Text009: label 'You can not edit a posted document. This will create conflicting entries.';
        Text010: label 'You cannot Rename  a document that is pending approval or fully approved.';
        Text011: label 'You are not allowed to raise an Imprest. Contact accounts and finance team';
        Text0005: label 'Project Imprest Surrender No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0004: label 'Payment Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0003: label 'Petty Cash  Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Amnt: Decimal;
        VATEntry: Record "VAT Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Emp: Record Employee;
        Commitment: Codeunit "Procurement Processing";
        TaskRec: Record "Job Task";
        Employee: Record Employee;
        EmployeeBank: Record "Employee Bank AccountX";
        UsersRec: Record "User Setup";
        EmployeePostingGroup: Record "Employee Posting GroupX";
        StatusCheckSuspended: Boolean;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Confirmed: Boolean;
        Text022: label 'Do you want to update the exchange rate?';
        HideValidationDialog: Boolean;
        PayrollPeriodX: Record "Payroll PeriodX";
        SalaryScales: Record "Salary Scales";
        DimensionValue: Record "Dimension Value";
        PVLines: Record "PV Lines";

    procedure AttachLines(var CurrRec: Record Payments)
    var
        ImpLines: Record "Imprest Lines";
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        ImpMemo: Record "Imprest Memo";
    begin

        ImpLines.Reset;
        ImpLines.SetRange(No, CurrRec."No.");
        if ImpLines.FindLast then
            LineNo := ImpLines."Line No" + 1
        else
            LineNo := 1000;
        //Ushindi
        CurrRec.TestField("Imprest Memo No");
        //Ushindi
        CurrRec.TestField(Project);

        ImpMemo.Reset;
        //Ushindi
        ImpMemo.SetRange("No.", CurrRec."Imprest Memo No");
        //Ushindi
        ImpMemo.SetRange(Project, CurrRec.Project);
        ImpMemo.SetRange(Posted, true);
        if ImpMemo.Find('-') then begin
            repeat
                //Fetch Imprest Line based on Employee
                ProjectMembers.Reset;
                ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
                ProjectMembers.SetRange("No.", CurrRec."Account No.");
                ProjectMembers.SetRange(Posted, true);
                ProjectMembers.SetRange(Linked, false);
                if ProjectMembers.Find('-') then begin
                    //Update the header
                    CurrRec."Imprest Type" := CurrRec."imprest type"::"Project Imprest";
                    CurrRec."Project Description" := ImpMemo."Project Description";
                    CurrRec.Modify;
                    //
                    repeat
                        if not ProjectMembers."Project Lead" then//Check whether Project lead or not
                          begin
                            LineNo := LineNo + 1000;
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Linked) then
                                ImpLines.Insert;

                        end else begin
                            LineNo := LineNo + 1000;
                            //Insert Personell Costs
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Amount LCY" := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Linked) then
                                ImpLines.Insert;
                            //Insert Machinery Costs
                            ProjectMembers2.Reset;
                            ProjectMembers2.SetRange(ProjectMembers2."Imprest Memo No.", CurrRec."Imprest Memo No");
                            ProjectMembers2.SetRange(Type, ProjectMembers2.Type::Machine);
                            ProjectMembers2.SetRange(Posted, true);
                            ProjectMembers2.SetRange(Linked, false);
                            if ProjectMembers2.FindSet() then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := ProjectMembers2."Tasks to Carry Out";
                                    ImpLines.Amount := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Amount LCY" := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Work Type" := ProjectMembers2."Work Type";
                                    ImpLines."Resource No." := ProjectMembers2."No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := ProjectMembers2."Task No.";
                                    ImpLines."Job Task Description" := ProjectMembers2."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    ProjectMembers2.Linked := true;
                                    ProjectMembers2.Modify;
                                until ProjectMembers2.Next = 0;
                            //Insert Casuals
                            Casuals.Reset;
                            Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                            Casuals.SetRange(Posted, true);
                            Casuals.SetRange(Linked, false);
                            if Casuals.FindSet() then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := Casuals.Activity;
                                    ImpLines.Amount := Casuals.Amount;
                                    ImpLines."Amount LCY" := Casuals.Amount;
                                    ImpLines."Work Type" := Casuals."Work Type";
                                    ImpLines."Resource No." := Casuals."Resource No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := Casuals."Task No.";
                                    ImpLines."Job Task Description" := Casuals."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    Casuals.Linked := true;
                                    Casuals.Modify;
                                until Casuals.Next = 0;
                            //
                            //Insert Other Costs
                            OtherCosts.Reset;
                            OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                            OtherCosts.SetRange(Posted, true);
                            OtherCosts.SetRange(Linked, false);
                            if OtherCosts.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines."Account No." := OtherCosts."No.";
                                    ImpLines.Description := OtherCosts.Description;
                                    ImpLines.Amount := OtherCosts."Line Amount";
                                    ImpLines."Amount LCY" := OtherCosts."Line Amount";
                                    ImpLines."Work Type" := OtherCosts."Work Type";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Task No." := OtherCosts."Task No.";
                                    ImpLines."Job Task Description" := OtherCosts."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    OtherCosts.Linked := true;
                                    OtherCosts.Modify;
                                until OtherCosts.Next = 0;
                            //
                        end;
                        ProjectMembers.Linked := true;
                        ProjectMembers.Modify;
                    until ProjectMembers.Next = 0;
                end else
                    Error(Text003, CurrRec."No.");
            until ImpMemo.Next = 0;
        end else
            Error(Text004);
    end;

    procedure OpenEntries(CurrRec: Record Payments): Boolean
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casuals: Record Casuals;
    begin
        ProjectMembers.Reset;
        ProjectMembers.SetRange("No.", CurrRec."Account No.");
        //Ushindi
        ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
        //Ushindi
        ProjectMembers.SetRange(Posted, true);
        ProjectMembers.SetRange(Linked, false);
        if ProjectMembers.Find('-') then
            exit(true)
        else begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", CurrRec."Account No.");
            //Ushindi
            ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo No");
            //Ushindi
            ProjectMembers.SetRange(Posted, true);
            ProjectMembers.SetRange(Linked, true);
            if ProjectMembers.Find('-') then begin
                repeat
                    Casuals.Reset;
                    Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    Casuals.SetRange(Posted, true);
                    Casuals.SetRange(Linked, false);
                    if Casuals.Find('-') then
                        exit(true);
                    //Other Costs
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    OtherCosts.SetRange(Posted, true);
                    OtherCosts.SetRange(Linked, false);
                    if OtherCosts.Find('-') then
                        exit(true);

                until ProjectMembers.Next = 0;
            end;

            exit(false);
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //IF "No." <> '' THEN
        //  MODIFY;

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure GetCurrency()
    begin
        /*
          CurrencyCode := "Currency Code";
        
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision
        END ELSE
          IF CurrencyCode <> Currency.Code THEN BEGIN
            Currency.GET(CurrencyCode);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        */
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin

        // Update all lines with changed dimensions.

        if NewParentDimSetID = OldParentDimSetID then
            exit;
        if not Confirm(Text051) then
            exit;

        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        PurchLine.LockTable;
        if PurchLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if PurchLine."Dimension Set ID" <> NewDimSetID then begin
                    PurchLine."Dimension Set ID" := NewDimSetID;
                    DimMgt.UpdateGlobalDimFromDimSetID(
                      PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
                    PurchLine.Modify;
                end;
            until PurchLine.Next = 0;
    end;


    procedure PurchLinesExist(): Boolean
    begin
        PurchLine.Reset;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SetRange(PurchLine.No, "No.");
        exit(PurchLine.FindFirst);
    end;

    procedure UpdateLineDimensions(DimensionSetId: Integer)
    var
        DimensionCodes: array[8] of Code[20];
        PVLines: Record "PV Lines";
        DimensionMgt: Codeunit DimensionManagement;
    begin
        DimensionMgt.GetShortcutDimensions(DimensionSetId, DimensionCodes);
        PvLines.Reset();
        PVLines.SetRange(No, "No.");
        if PVLines.FindSet() then begin
            repeat
                PvLines."Shortcut Dimension 1 Code" := DimensionCodes[1];
                PvLines."Shortcut Dimension 2 Code" := DimensionCodes[2];
                PVLines."Shortcut Dimesnion 4 Code" := DimensionCodes[4];
                PVLines."Dimension Set ID" := DimensionSetId;
                PVLines.Modify();
            until PVLines.Next() = 0;
        end;
    end;

    procedure GetLinesAccount(PvNo: Code[20]; var AccDetails: array[3] of Text)
    var
        PVLines: Record "PV Lines";
    begin
        PVLines.Reset();
        PVLines.SetRange(No, PvNo);
        if PVLines.FindFirst() then begin
            AccDetails[1] := Format(PvLines."Account Type");
            AccDetails[2] := PvLines."Account No";
            AccDetails[3] := PVLines."Account Name";
        end;
    end;


    procedure AttachSurrLines(var CurrRec: Record Payments)
    var
        ImpLines: Record "Imprest Lines";
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        ImpMemo: Record "Imprest Memo";
    begin

        ImpLines.Reset;
        ImpLines.SetRange(No, CurrRec."No.");
        if ImpLines.FindLast then
            LineNo := ImpLines."Line No" + 1
        else
            LineNo := 1000;
        //Ushindi
        CurrRec.TestField("Imprest Memo Surrender No");
        //Ushindi
        CurrRec.TestField(Project);

        ImpMemo.Reset;
        //Ushindi
        ImpMemo.SetRange("No.", CurrRec."Imprest Memo Surrender No");
        //Ushindi
        ImpMemo.SetRange(Project, CurrRec.Project);
        ImpMemo.SetRange(Surrendered, true);
        ImpMemo.SetRange(Posted, true);
        if ImpMemo.Find('-') then begin
            repeat
                //Fetch Imprest Line based on Employee
                ProjectMembers.Reset;
                ProjectMembers.SetRange("Imprest Memo No.", ImpMemo."No.");
                ProjectMembers.SetRange("No.", CurrRec."Account No.");
                ProjectMembers.SetRange(Posted, true);
                if ProjectMembers.Find('-') then begin
                    //Update the header
                    CurrRec."Imprest Type" := CurrRec."imprest type"::"Project Imprest";
                    CurrRec."Project Description" := ImpMemo."Project Description";
                    CurrRec.Modify;
                    //
                    repeat
                        if not ProjectMembers."Project Lead" then//Check whether Project lead or not
                          begin
                            LineNo := LineNo + 1000;
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Actual Spent" := ProjectMembers."Actual Spent";
                            ImpLines.Validate("Actual Spent");
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Job Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Surrendered) then
                                ImpLines.Insert;

                        end else begin
                            LineNo := LineNo + 1000;
                            //Insert Personell Costs
                            ImpLines.Init;
                            ImpLines.No := CurrRec."No.";
                            ImpLines."Line No" := LineNo;
                            ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                            ImpLines.Description := ProjectMembers."Tasks to Carry Out";
                            ImpLines.Amount := ProjectMembers.Entitlement;
                            ImpLines."Actual Spent" := ProjectMembers."Actual Spent";
                            ImpLines.Validate("Actual Spent");
                            ImpLines."Amount LCY" := ProjectMembers.Entitlement;
                            ImpLines."Work Type" := ProjectMembers."Work Type";
                            ImpLines."Resource No." := ProjectMembers."No.";
                            //Ushindi...Track Job Task No
                            ImpLines."Job Task No." := ProjectMembers."Task No.";
                            ImpLines."Job Task Description" := ProjectMembers."Job Task Description";
                            //Ushindi
                            if not (ImpLines.Get(ImpLines.No, ImpLines."Line No")) and (not ProjectMembers.Surrendered) then
                                ImpLines.Insert;
                            //Insert Machinery Costs
                            ProjectMembers2.Reset;
                            ProjectMembers2.SetRange(Type, ProjectMembers2.Type::Machine);
                            ProjectMembers2.SetRange("Imprest Memo No.", ImpMemo."No.");
                            ProjectMembers2.SetRange(Posted, true);
                            ProjectMembers2.SetRange(Surrendered, false);
                            if ProjectMembers2.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := ProjectMembers2."Tasks to Carry Out";
                                    ImpLines.Amount := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Amount LCY" := ProjectMembers2."Expected Maintenance Cost";
                                    ImpLines."Actual Spent" := ProjectMembers2."Actual Maintanance Costs";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := ProjectMembers2."Work Type";
                                    ImpLines."Resource No." := ProjectMembers2."No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := ProjectMembers2."Task No.";
                                    ImpLines."Job Task Description" := ProjectMembers2."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    ProjectMembers2.Surrendered := true;
                                    ProjectMembers2.Modify;
                                until ProjectMembers2.Next = 0;
                            //Insert Casuals
                            Casuals.Reset;
                            Casuals.SetRange("Imprest Memo No.", ImpMemo."No.");
                            Casuals.SetRange(Posted, true);
                            Casuals.SetRange(Surrendered, false);
                            if Casuals.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines.Description := Casuals.Activity;
                                    ImpLines.Amount := Casuals.Amount;
                                    ImpLines."Amount LCY" := Casuals.Amount;
                                    ImpLines."Actual Spent" := Casuals."Actual Amount";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := Casuals."Work Type";
                                    ImpLines."Resource No." := Casuals."Resource No.";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := Casuals."Task No.";
                                    ImpLines."Job Task Description" := Casuals."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    Casuals.Surrendered := true;
                                    Casuals.Modify;
                                until Casuals.Next = 0;
                            //
                            //Insert Other Costs
                            OtherCosts.Reset;
                            OtherCosts.SetRange("Imprest Memo No.", ImpMemo."No.");
                            OtherCosts.SetRange(Posted, true);
                            OtherCosts.SetRange(Surrendered, false);
                            if OtherCosts.Find('-') then
                                repeat
                                    LineNo := LineNo + 1000;
                                    ImpLines.Init;
                                    ImpLines.No := CurrRec."No.";
                                    ImpLines."Line No" := LineNo;
                                    ImpLines."Account Type" := ImpLines."account type"::"G/L Account";
                                    ImpLines."Account No." := OtherCosts."No.";
                                    ImpLines.Description := OtherCosts.Description;
                                    ImpLines.Amount := OtherCosts."Line Amount";
                                    ImpLines."Amount LCY" := OtherCosts."Line Amount";
                                    ImpLines."Actual Spent" := OtherCosts."Actual Line Amount";
                                    ImpLines.Validate("Actual Spent");
                                    ImpLines."Work Type" := OtherCosts."Work Type";
                                    //Ushindi...Track Job Task No
                                    ImpLines."Job Task No." := OtherCosts."Task No.";
                                    ImpLines."Job Task Description" := OtherCosts."Job Task Description";
                                    //Ushindi
                                    if not ImpLines.Get(ImpLines.No, ImpLines."Line No") then
                                        ImpLines.Insert;
                                    OtherCosts.Surrendered := true;
                                    OtherCosts.Modify;
                                until OtherCosts.Next = 0;
                            //
                        end;
                        ProjectMembers.Surrendered := true;
                        ProjectMembers.Modify;
                    until ProjectMembers.Next = 0;
                end else
                    Error(Text003, CurrRec."No.");
            until ImpMemo.Next = 0;
        end else
            Error(Text007);
    end;


    procedure OpenSurrEntries(CurrRec: Record Payments): Boolean
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casuals: Record Casuals;
    begin
        ProjectMembers.Reset;
        ProjectMembers.SetRange("No.", CurrRec."Account No.");
        //Ushindi
        ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo Surrender No");
        //Ushindi
        ProjectMembers.SetRange(Posted, true);
        ProjectMembers.SetRange(Surrendered, false);
        if ProjectMembers.Find('-') then
            exit(true)
        else begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", CurrRec."Account No.");
            //Ushindi
            ProjectMembers.SetRange(ProjectMembers."Imprest Memo No.", CurrRec."Imprest Memo Surrender No");
            //Ushindi
            ProjectMembers.SetRange(Posted, true);
            ProjectMembers.SetRange(Surrendered, true);
            if ProjectMembers.Find('-') then begin
                repeat
                    Casuals.Reset;
                    Casuals.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    Casuals.SetRange(Posted, true);
                    Casuals.SetRange(Surrendered, false);
                    if Casuals.Find('-') then
                        exit(true);
                    //Other Costs
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", ProjectMembers."Imprest Memo No.");
                    OtherCosts.SetRange(Posted, true);
                    OtherCosts.SetRange(Surrendered, false);
                    if OtherCosts.Find('-') then
                        exit(true);

                until ProjectMembers.Next = 0;
            end;

            exit(false);
        end;
    end;

    local procedure CheckDocumentType()
    begin
        CashMgt.Get();
        if "Payment Type" = "payment type"::"Payment Voucher Reversal" then begin
            CashMgt.TestField("PV Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."PV Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Imprest Reversal" then begin
            if (CashMgt."Lock Imprest Application" = true) and (UserSetup."Accounts User" = false) then
                Error(Text011);
            CashMgt.TestField("Imprest Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");

        end;
        if "Payment Type" = "payment type"::"Petty Cash Reversal" then begin
            CashMgt.TestField("Petty Cash Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Petty Cash Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Payment Type" = "payment type"::"Staff Claim Reversal" then begin
            CashMgt.TestField(CashMgt."Staff Claim Reversal Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Staff Claim Reversal Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;



        if "Payment Type" = "payment type"::"Surrender Reversal" then begin
            CashMgt.TestField(CashMgt."Imprest Surrender Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Imprest Surrender Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Bank Transfer Reversal" then begin
            CashMgt.TestField(CashMgt."Bank Transfer Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Bank Transfer Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        if "Payment Type" = "payment type"::"Standing Imprest Reversal" then begin
            CashMgt.TestField(CashMgt."Standing Imprest Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Standing Imprest Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Payment Type" = "payment type"::"Salary Advance Reversal" then begin
            CashMgt.TestField(CashMgt."Salary Advance Reversal Nos");
            if "No." = '' then
                NoSeriesMgt.InitSeries(CashMgt."Salary Advance Reversal Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure SuspendStatusCheck(Suspend: Boolean)
    begin
        StatusCheckSuspended := Suspend;
    end;

    local procedure RevalidateDimensions()
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        if "Dimension Set ID" = 0 then begin
            DimensionManagement.ValidateShortcutDimValues(1, "Shortcut Dimension 1 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(3, "Shortcut Dimension 3 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(4, "Shortcut Dimension 4 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(5, "Shortcut Dimension 5 Code", "Dimension Set ID");
            DimensionManagement.ValidateShortcutDimValues(6, "Shortcut Dimension 6 Code", "Dimension Set ID");
            Modify();
            Commit();
        end;
    end;

    procedure ShowEditDimension(Editable: Boolean)
    var
        DimensionManagement: Codeunit DimensionManagement;
        DimensionCodes: array[8] of Code[20];
        NewDimensionSetId: Integer;
    begin
        RevalidateDimensions();
        if Editable then begin
            NewDimensionSetId := DimensionManagement.EditDimensionSet("Dimension Set ID", 'Dimensions');
            if NewDimensionSetId <> "Dimension Set ID" then begin
                DimensionManagement.GetShortcutDimensions(NewDimensionSetId, DimensionCodes);
                "Dimension Set ID" := NewDimensionSetId;
                "Shortcut Dimension 1 Code" := DimensionCodes[1];
                "Shortcut Dimension 2 Code" := DimensionCodes[2];
                "Shortcut Dimension 3 Code" := DimensionCodes[3];
                "Shortcut Dimension 4 Code" := DimensionCodes[4];
                "Shortcut Dimension 5 Code" := DimensionCodes[5];
                "Shortcut Dimension 6 Code" := DimensionCodes[6];
                Rec.Modify();
            end;
        end else begin
            DimensionManagement.ShowDimensionSet("Dimension Set ID", 'Dimensions');
        end;
    end;

    procedure CheckDimensions(DimensionSetId: Integer)
    var
        Error001: Label 'The value for dimension %1 must be defined.Please add to proceed!';
        ShortcutDimensions: array[8] of Code[20];
        DimensionMgt: Codeunit DimensionManagement;
        Dimensions: Record "Dimension Value";
    begin
        DimensionMgt.GetShortcutDimensions(DimensionSetId, ShortcutDimensions);
        if ShortcutDimensions[1] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(1));
        if ShortcutDimensions[2] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(2));
        if ShortcutDimensions[3] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(3));
        if ShortcutDimensions[4] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(4));
        if ShortcutDimensions[5] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(5));
        if ShortcutDimensions[6] = '' then
            Error(Error001, Dimensions.GetDimensionCaption(6));
    end;

    procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        ConfirmManagement: Codeunit "Confirm Management";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if "Posting Date" <> 0D then
                CurrencyDate := "Posting Date"
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");

            end else begin
                // if ConfirmManagement.ConfirmProcess(
                //      StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate), true)
                // then begin
                //     UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                //     UpdateCurrencyFactor;
                // end else
                //     RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;

        OnAfterUpdateCurrencyFactor(Rec, GetHideValidationDialog);
    end;

    local procedure ConfirmUpdateCurrencyFactor(): Boolean
    begin
        if GetHideValidationDialog or not GuiAllowed then
            Confirmed := true
        else
            Confirmed := Confirm(Text022, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
        exit(Confirmed);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var Payments: Record Payments; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        "Posting Date" := xRec."Posting Date";
        Modify;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateCurrencyFactor(var Payment: Record Payments; HideValidationDialog: Boolean)
    begin
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnAfterValidateType(var PurchaseLine: Record "Purchase Line"; TempPurchaseLine: Record "Purchase Line" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeInsertPayments(var PurchaseLine: Record "Purchase Line"; var TempPurchaseLine: Record "Purchase Line" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeTempPaymentsInsert(var TempPurchaseLine: Record "Purchase Line" temporary; PurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateBuyFromVendorNoBeforeRecreateLines(var PurchaseHeader: Record "Purchase Header"; CallingFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRecreatePaymentsOnBeforeConfirm(var Payments: Record Payments; xPayments: Record Payments; ChangedFieldName: Text[100]; HideValidationDialog: Boolean; var Confirmed: Boolean; var IsHandled: Boolean)
    begin
    end;

    procedure UpdatePurchLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        PurchLineReserve: Codeunit "Purch. Line-Reserve";
        Question: Text[250];
    begin
    end;

    procedure GetBankAccount(): Code[20]
    var
        BankAcc: Record "Bank Account";
    begin
        case
            "Payment Type" of
            "Payment Type"::"Payment Voucher":
                begin
                    case
                        "PV Type" of
                        "PV Type"::"Retention Payment":
                            begin
                                exit(BankAcc.GetBankCode(BankAcc.Type::Deposit, Rec."Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code"));
                            end;
                        "PV Type"::Normal, "PV Type"::Tax, "PV Type"::Retention:
                            begin
                                exit(BankAcc.GetBankCode(BankAcc.Type::Recurrent, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code"));
                            end;
                        "PV Type"::"Revenue Sweep Voucher":
                            exit(BankAcc.GetBankCode(BankAcc.Type::Revenue, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code"))
                    end;
                end;
        end;
    end;

    procedure ValidatePVOnSendApproval(PaymentVoucher: Record Payments)
    var
        PayReceiptTypes: Record "Receipts and Payment Types1";
        BankAcc: Record "Bank Account";
        PayRcptDetails: array[3] of Text;
        Vendor: Record Vendor;
        VendorBankAcc: Record "Vendor Bank Account";
        VendorPostingGroup: Record "Vendor Posting Group";
        CashSetUp: Record "Cash Management Setup";
    begin
        //Validate the Payment for Generation of Payment Vouchers(Tax and Retention PVS)
        PaymentVoucher.TestField("Paying Bank Account");
        PaymentVoucher.TestField("Posting Date");
        PaymentVoucher.TestField("Payment Narration");
        PaymentVoucher.CalcFields("Total Retention Amount", "Total Witholding Tax Amount", "Total Amount");
        if PaymentVoucher."Total Retention Amount" + PaymentVoucher."Total Witholding Tax Amount" <> 0 then begin //Validate Tax Payment Vendor
            PayReceiptTypes.GetReceiptPaymenTypeDetails(PayRcptDetails, 0, PayReceiptTypes.Type::Payment);
            if PayRcptDetails[1] = '' then
                Error('There is no Tax Code setup for Tax Payments under Payments and Receipts');
            if PayRcptDetails[2] = '' then
                Error('Please specify the Vendor for Tax Payment code %1 under Payments and Receipts', PayRcptDetails[1]);

            Vendor.Get(PayRcptDetails[2]);
            Vendor.TestField("Preferred Bank Account Code");
            if VendorBankAcc.Get(Vendor."No.", Vendor."Preferred Bank Account Code") then begin
                VendorBankAcc.TestField("Bank Code");
                VendorBankAcc.TestField("Bank Branch No.");
                VendorBankAcc.TestField("Bank Account No.");
            end;
        end;

        //Retention Accounts
        if PaymentVoucher."Total Retention Amount" <> 0 then begin
            Clear(PayRcptDetails);
            //Retention 
            PayReceiptTypes.GetReceiptPaymenTypeDetails(PayRcptDetails, 2, PayReceiptTypes.Type::Payment);
            if PayRcptDetails[1] = '' then
                Error('There is no Retention Movement Code setup for Retention Movement under Payments and Receipts');

            if PayRcptDetails[2] = '' then
                Error('Please define the Account No (Receivables A/c) for %1 under Payments and Receipts', PayRcptDetails[1]);

            //Retention  Movement
            Clear(PayRcptDetails);
            PayReceiptTypes.GetReceiptPaymenTypeDetails(PayRcptDetails, 1, PayReceiptTypes.Type::Payment);
            if PayRcptDetails[1] = '' then
                Error('There is no Retention Code setup for Retentions under Payments and Receipts');

            if PayRcptDetails[3] = '' then
                Error('Please define the Vendor Posting for %1 under Payments and Receipts', PayRcptDetails[1]);

            if VendorPostingGroup.Get(PayRcptDetails[3]) then
                VendorPostingGroup.TestField("Payables Account");
        end;
    end;

    procedure IsPVPosted(PvNo: Code[20]): Boolean
    var
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        Payments: Record Payments;
    begin
        if Payments.Get(PvNo) then begin
            BankLedgerEntry.Reset();
            BankLedgerEntry.SetRange("Bank Account No.", Payments."Paying Bank Account");
            BankLedgerEntry.SetRange("Document No.", Payments."No.");
            BankLedgerEntry.SetRange(Reversed, false);
            if BankLedgerEntry.FindSet() then
                exit(true);
        end;
    end;


    procedure CheckAccountsInitiator()
    begin
        // if not UserSetup."Initiator Accounts" then
        //     error('You do not have rights to create this document. Please contact the system administrator');
    end;

    procedure GetBase64Content(DocAttachment: Record Payments) Base64Content: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
        ReadingDataSkippedMsg: Label 'Loading field %1 will be skipped because there was an error when reading the data.\To fix the current data, contact your administrator.\Alternatively, you can overwrite the current data by entering data in the field.', Comment = '%1=field caption';
    begin
        DocAttachment.CalcFields(Attachment);
        if not DocAttachment.Attachment.HasValue then
            error('Blob does not have a value');
        DocAttachment.Attachment.CreateInStream(InStream, TEXTENCODING::UTF8);
        if not TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), Base64Content) then
            Message(ReadingDataSkippedMsg, FieldCaption(Attachment));
    end;

    Procedure ImportAttachment(DocAttachment: Record Payments): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        TempOutstream: OutStream;
        RecRef: RecordRef;
        Instr: InStream;
        FileName: Text;
        Bit64InputValue: Text;
        "File Name": Text;
        "File Extension": Text;
    begin
        Bit64InputValue := GetBase64Content(DocAttachment);
        if Bit64InputValue = '' then begin
            exit('Could not find text representation');
        end;
        Clear(DocAttachment.Attachment);
        RecRef.Open(Database::Payments);
        RecRef.GetTable(DocAttachment);
        TempBlob.CreateOutStream(TempOutstream);
        Base64Convert.FromBase64(Bit64InputValue, TempOutstream);
        DocAttachment.Attachment.CreateOutstream(TempOutstream);
        TempBlob.ToRecordRef(RecRef, DocAttachment.FieldNo(Attachment));
        RecRef.SetTable(DocAttachment);
        FileName := DocAttachment."No." + '.pdf';
        DocAttachment.CalcFields(Attachment);
        if not DocAttachment.Attachment.HasValue then
            exit;
        TempBlob.CreateInStream(Instr);
        if DownloadFromStream(Instr, 'Downloading', '', '', FileName) then begin
            //Clear(DocAttachment.Attachment);
            // DocAttachment.Modify();
            exit('Retrival successful');
        end;
        RecRef.Close();
    end;

    procedure SetBase64(Base64Text: Text)
    var
        OutStream: OutStream;
    begin
        Clear(Attachment);
        Attachment.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(Base64Text);
        Modify();
    end;

    procedure validatebanks(): Boolean;
    var
        PvLines: Record "PV Lines";
        Payment: Record "Payments";

        IsBankValid: Text;
        // OutwardPayment: Codeunit OutwardPayment;
        Progress: Dialog;
        Text00: Label 'Validating Bank Account For ....#';
        Text01: Label 'Validating Amount For the Selected Paymode ....#';
        ValidBankName: Text;
        validPayeeBankAccName: Text;
        ValidkcbBankAccName: Text;
        Counter: Integer;
        isValid: Boolean;
        TotalNetAmount: Decimal;
        paymodeTable: Record "Pay Mode";
        EFPay: Code[10];
        PLPay: Code[10];
        EFAmount: Decimal;
        PLAmount: Decimal;
        payeeBankAccName: Text;
        kcbBankAccName: Text;
        smsSetup: Record "SMS Setup";
        PRBankAcc: Record "PR Bank Accounts";
        SkipBankValidationList: List of [Code[10]];
        BankCode: Code[10];




    begin
        isValid := true;
        smsSetup.get();
        Payment.Reset();
        Payment.SetRange("No.", Rec."No.");

        //get bypassed bank code
        if (smsSetup.ByPassValidation = true) then begin

            PRBankAcc.reset();
            PRBankAcc.setRange(ByPassValidation, true);
            if (PRBankAcc.FindSet()) then
                repeat
                    BankCode := PRBankAcc."Bank Code";
                    if not SkipBankValidationList.Contains(BankCode) then skipBankValidationList.Add(BankCode);
                until PRBankAcc.Next = 0;
        end;

        if Payment.FindFirst() then begin
            if (Payment."Pay Mode" = 'MO') then begin
                isValid := true;
            end
            else begin
                paymodeTable.Reset;
                paymodeTable.setRange("Code", 'EF');
                paymodeTable.FindFirst();
                // paymodeTable.TestField(paymodeTable.Threshold);

                EFPay := paymodeTable."Code";
                // EFAmount := paymodeTable.Threshold;
                paymodeTable.Reset;
                paymodeTable.setRange("Code", 'PL');
                paymodeTable.FindFirst();
                // paymodeTable.TestField(paymodeTable.Threshold);
                PLPay := paymodeTable."Code";
                // PLAmount := paymodeTable.Threshold;

                if not (Payment."Pay Mode" in ['IF', 'RT', 'EF', 'PL', 'MO']) then begin
                    isValid := false;
                    Error('Invalid Payment Channel');
                end;

                if (Payment."Pay Mode" = EFPay) then begin
                    TotalNetAmount := 0;

                    PvLines.Reset();
                    PvLines.SetRange(No, Payment."No.");

                    Progress.Open(Text00, Counter);

                    if PvLines.FindSet() then
                        repeat
                            TotalNetAmount := TotalNetAmount + PvLines."Net Amount";
                        until PvLines.Next() = 0;

                    Progress.Close();

                    if TotalNetAmount > EFAmount then begin
                        Message('For this Pay Mode %1 The total net amount should be less than 1M', TotalNetAmount);
                        isValid := false;
                        Error('Amount Should be Less than 1M For the selected paymode');

                    end

                end;

                if (Payment."Pay Mode" = PLPay) then begin
                    TotalNetAmount := 0;

                    PvLines.Reset();
                    PvLines.SetRange(No, Payment."No.");

                    Progress.Open(Text00, Counter);

                    if PvLines.FindSet() then
                        repeat
                            TotalNetAmount := TotalNetAmount + PvLines."Net Amount";
                        until PvLines.Next() = 0;

                    Progress.Close();

                    if TotalNetAmount > PLAmount then begin
                        Message('For this Pay Mode %1 The total net amount should be less than 1M', TotalNetAmount);
                        isValid := false;
                        Error('Amount Should be Less than 1M For the selected paymode');

                    end

                end;
                if ((Payment."Payment Type" = Payment."Payment Type"::"Payment Voucher") or
               (Payment."Payment Type" = Payment."Payment Type"::"Standing Imprest") or
               (Payment."Payment Type" = Payment."Payment Type"::"Bank Transfer") or
               (Payment."Payment Type" = Payment."Payment Type"::"Staff Claim") or
               (Payment."Payment Type" = Payment."Payment Type"::"Special Imprest")) then begin

                    PvLines.Reset();
                    PVLines.SetRange(No, Payment."No.");
                    Progress.Open(Text00, Counter);
                    if PvLines.FindSet() then
                        repeat
                            if (smsSetup.skipValidation = true) then begin
                                isValid := false;

                            end
                            else begin
                                if ((smsSetup.ByPassValidation = true) and SkipBankValidationList.Contains(PvLines."Payee Bank Code")) then begin
                                    isValid := true;
                                end

                                else begin
                                    // IsBankValid := OutwardPayment.validateBankAccount(PvLines."Payee Bank Account No.", PvLines."Payee Bank Code");
                                    kcbBankAccName := DelChr(UpperCase(IsBankValid), '=');
                                    payeeBankAccName := DelChr(UpperCase(PvLines."Payee Bank Acc Name"), '=');

                                    if kcbBankAccName = payeeBankAccName then begin
                                        // PvLines.isBankValid := 'Valid Bank Account';
                                        PvLines.isBankValid := 'VALID BANK DETAILS';
                                        PvLines.rbankName := IsBankValid;
                                    end
                                    else begin
                                        // PvLines.isBankValid := 'Invalid Bank Account';
                                        PvLines.isBankValid := 'INVALID BANK DETAILS';
                                        PvLines.rbankName := IsBankValid;
                                        isValid := false;


                                    end;
                                    Counter := Counter + 1;
                                    Progress.UPDATE();
                                    SLEEP(50);
                                    PvLines.Modify();
                                    Commit();
                                    if isValid = false then
                                        Error('Invalid Bank Details');
                                end;
                            end;

                        until PvLines.Next() = 0;
                    Progress.Close();
                end;



            end;
        end;

        exit(isValid);
    end;

    procedure validateImprestBank(docNo: code[20]): Text[250]
    var
        payment: Record Payments;
        smsSetup: Record "SMS Setup";
        PRBankAcc: Record "PR Bank Accounts";
        SkipBankValidationList: List of [Code[10]];
        BankCode: Code[10];
        ValidBankName: Text[250];
        // OutwardPayment: Codeunit OutwardPayment;
    begin

        payment.reset();
        payment.setRange("No.", docNo);
        if payment.FindFirst() then begin
            if (Payment."Payment Type" = Payment."Payment Type"::"Imprest") then begin
                // if byPassValidation(Payment."Payee Bank Code") = false then
                //     // ValidBankName := OutwardPayment.validateBankAccount(Payment."Payee Bank Account", Payment."Payee Bank Code")
                // else
                //     ValidBankName := payment."Payee";

                exit(ValidBankName);
            end
        end

    end;



    procedure byPassValidation(payeeBankCode: Code[10]): Boolean
    var
        PRBankAcc: Record "PR Bank Accounts";
        SkipBankValidationList: List of [Code[10]];
        smsSetup: Record "SMS Setup";
        isValid: Boolean;
        BankCode: Code[10];
    begin
        isValid := false;
        smsSetup.get();
        PRBankAcc.reset();
        PRBankAcc.setRange(ByPassValidation, true);
        if (PRBankAcc.FindSet()) then
            repeat
                BankCode := PRBankAcc."Bank Code";
                if not SkipBankValidationList.Contains(BankCode) then
                    SkipBankValidationList.Add(BankCode);
            until PRBankAcc.Next() = 0;
        if ((smsSetup.ByPassValidation = true) and SkipBankValidationList.Contains(payeeBankCode)) then begin
            isValid := true;
        end;
        exit(isValid);
    end;

    procedure isNameValid(localName: Text[250]; kcbName: Text[250]): Boolean
    var
        ValidkcbBankAccName: Text[250];
        validPayeeBankAccName: Text[250];

    begin
        ValidkcbBankAccName := DelChr(UpperCase(kcbName), '=');
        validPayeeBankAccName := DelChr(UpperCase(localName), '=');
        if ValidkcbBankAccName = validPayeeBankAccName then
            exit(true)
        else
            exit(false);


    end;


    procedure UpdateBankName(hrBankname: Text[250]; kcbBankname: Text[250]) Result: Boolean
    var
        hrWords: List of [Text];
        kcbWords: List of [Text];
        word: Text;
    begin
        hrWords := SplitSentenceIntoWords(LowerCase(hrBankname));
        kcbWords := SplitSentenceIntoWords(LowerCase(kcbBankname));

        foreach word in hrWords do begin
            if kcbWords.Contains(word) then
                exit(true);
        end;

        exit(false);
    end;

    // procedure updateEmpBankDetails(pjNumber: Code[20]): Text[100];
    // var
    //     emp: Record Employee;
    // begin
    //     emp.reset();
    //     emp.setRange("No.", pjNumber);
    //     if emp.FindFirst() then begin
    //         exit(emp."Payee Bank Acc Name");
    //     end
    //     else
    //         exit('');

    // end;

    procedure updateEmpBankDetails(pjNumber: Code[20]): JsonObject;
    var
        emp: Record Employee;
        resultsObject: JsonObject;
        resource: Record Resource;
    begin
        emp.Reset();
        emp.SetRange("No.", pjNumber);
        if emp.FindFirst() then begin
            emp.CalcFields("Bank Name 2", "Bank Branch Name 2");
            resultsObject.add('payee bank acc name', emp."Payee Bank Acc Name");
            resultsObject.add('payee bank account', emp."Bank Account No. 2");
            resultsObject.add('payee bank code', emp."Employee's Bank 2");
            resultsObject.add('payee bank branch', emp."Bank Branch 2");
            resultsObject.add('payee bank name', emp."Bank Name 2");
            resultsObject.add('payee bank br name', emp."Bank Branch Name 2");


        end
        else begin
            Resource.reset();
            Resource.setRange("No.", pjNumber);
            if Resource.FindFirst() then begin
                resultsObject.add('payee bank acc name', resource."Payee Bank Acc Name");
                resultsObject.add('payee bank account', resource."Bank Account No.");
                resultsObject.add('payee bank code', resource."Bank Code");
                resultsObject.add('payee bank branch', resource."Bank Branch No.");
                resultsObject.add('payee bank name', resource."Bank Name");
                resultsObject.add('payee bank br name', resource."Branch Name");
            end
            else begin
                resultsObject.add('payee bank acc name', '');
                resultsObject.add('payee bank account', '');
                resultsObject.add('payee bank code', '');
                resultsObject.add('payee bank branch', '');
                resultsObject.add('payee bank name', '');
                resultsObject.add('payee bank br name', '');
            end;

        end;
        exit(resultsObject);
    end;


    local procedure SplitSentenceIntoWords(inputText: Text): List of [Text]
    var
        wordList: List of [Text];
        word: Text;
        separator: Text[1];
    begin
        separator := ' ';
        foreach word in inputText.Split(separator) do
            if word <> '' then
                wordList.Add(word);

        exit(wordList);
    end;


    procedure CheckUpdateIFT(DocumentNo: Code[20]; BankCode: Code[20]; PaymentMode: Code[20]) NewPayMode: Code[20]
    var
        Bank: Record "Bank Account";
        Payment: Record Payments;
        PayMode: Record "Pay Mode";
        IFTCode: Code[20];
    begin
        NewPayMode := PaymentMode;
        Payment.Reset;
        Payment.SetLoadFields("No.", "Paying Bank Account", "Pay Mode");
        Payment.Setrange("No.", DocumentNo);
        if Payment.FindFirst() then begin
            if PaymentMode = '' then
                NewPayMode := Payment."Pay Mode";
            if Bank.Get(Payment."Paying Bank Account") then begin
                if Bank."IFT Enabled" then begin
                    // IFTCode := PayMode.GetIFTCode();
                    if BankCode = Bank."Bank Code" then
                        NewPayMode := IFTCode;
                end;
            end;
        end;
    end;


    procedure insertSMSDetails(Paymentss: Record Payments)
    var

        PhoneNumber: Code[15];
        Emailuser: Code[100];
        smsBuffer: Record "SMS Broadcast";
        SMSBroadCastEntryNo: Integer;
        toCts: Boolean;
        Vendor: Record Vendor;
        PvLines: Record "PV Lines";
        paymentNarration: Text[2048];
        vendorInvNumber: Code[50];
        vendorNo: Code[50];

    begin
        if ((Rec."PV Type" <> Rec."PV Type"::Refund) or (Rec."PV Type" <> Rec."PV Type"::Tax)) then
            toCTS := true;

        if (Paymentss."PV Type" = Paymentss."PV Type"::Normal) then begin
            PvLines.reset();
            PvLines.SetRange(No, Paymentss."No.");
            PvLines.setRange("Account Type", PvLines."Account Type"::Vendor);
            if PvLines.FindFirst() then begin
                Vendor.reset();
                Vendor.setRange("No.", PvLines."Account No");
                if Vendor.FindFirst() then begin
                    PhoneNumber := DelChr(Vendor."Phone No.", '=', ' ');
                    Emailuser := Vendor."E-Mail";
                    vendorInvNumber := PvLines."Applies to Doc. No";
                    vendorNo := Vendor."No.";

                end;
            end;
        end
        else begin


            if Paymentss."Phone Number" <> '' then
                PhoneNumber := Paymentss."Phone Number";
            if Paymentss."E-mail" <> '' then
                Emailuser := Paymentss."E-mail";
            if Paymentss."Payment Narration" <> '' then
                paymentNarration := Paymentss."Payment Narration";

        end;


        smsBuffer.Reset();
        if smsBuffer.FindLast() then
            SMSBroadCastEntryNo := smsBuffer.EntryNo + 1
        else
            SMSBroadCastEntryNo := 1;


        while smsBuffer.Get(SMSBroadCastEntryNo) do
            SMSBroadCastEntryNo := SMSBroadCastEntryNo + 1;
        smsBuffer.Init();
        smsBuffer.EntryNo := SMSBroadCastEntryNo;
        smsBuffer.PhoneNumber := PhoneNumber;
        // smsBuffer."Payment Narration" := paymentNarration;
        smsBuffer.pvNo := Paymentss."No.";
        smsBuffer."E-Mail" := Emailuser;
        smsBuffer.isInvalidForSMS := toCTS;
        // smsBuffer."Vendor Invoice" := vendorInvNumber;
        // smsBuffer.vendorNo := vendorNo;
        smsBuffer.Insert();

    end;





    procedure CheckExchequer(Direction: Enum "Utilization Direction")
    var
        Receipt: Record "Receipts Header1";

    begin
        if Rec."PV Type" in [Rec."PV Type"::" ", Rec."PV Type"::Normal, Rec."PV Type"::Payroll] then begin
            if Rec."PV Type" = Rec."PV Type"::" " then begin
                if Rec."Payment Type" in [Rec."Payment Type"::Imprest, Rec."Payment Type"::"Payment Voucher", Rec."Payment Type"::"Warrant Voucher", Rec."Payment Type"::"Staff Claim", Rec."Payment Type"::"Special Imprest", Rec."Payment Type"::"Standing Imprest"] then begin

                end
                else
                    exit;
            end;

            Receipt.Reset;
            Receipt.SetRange("Receipt Type", "Receipt Type"::AIE);
            Receipt.SetRange(Closed, false);
            Receipt.SetRange(Posted, true);
            Receipt.SetRange("Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
            if Receipt.FindFirst() then begin
                Rec.CalcFields("Total Amount LCY", "Imprest Amount");
                if Direction = Direction::Upwards then begin
                    if Rec."Committed Amount" = 0 then begin
                        if Rec."Payment Type" = Rec."Payment Type"::Imprest then begin
                            if Receipt.GetRemainingAmount(Receipt."No.") >= Rec."Imprest Amount" then begin
                                Rec."Committed Amount" := Rec."Imprest Amount";
                                Rec."AIE Receipt" := Receipt."No.";
                                Receipt."Remaining Amount" := Receipt."Remaining Amount" - Rec."Imprest Amount";
                                Receipt.Modify;
                            end;
                        end
                        else
                            if Receipt.GetRemainingAmount(Receipt."No.") >= Rec."Total Amount LCY" then begin
                                Rec."Committed Amount" := Rec."Total Amount LCY";
                                Rec."AIE Receipt" := Receipt."No.";
                                Receipt."Remaining Amount" := Receipt."Remaining Amount" - Rec."Total Amount LCY";
                                Receipt.Modify;
                            end;
                    end;
                    if (Rec.Status = Rec.Status::"Pending Approval") and (Rec."Committed Amount" = 0) then begin
                        Error('The remaining amount on the receipt is %1 which is less than the total amount of the payment %2', Receipt.GetRemainingAmount(Receipt."No."), Rec."Total Amount LCY");
                    end;

                end else begin
                    ///Reversed and rejected PVs
                    Rec."AIE Receipt" := '';
                    Rec."Committed Amount" := 0;
                    Receipt."Remaining Amount" := Receipt."Remaining Amount" + Rec."Committed Amount";
                    Receipt.Modify;
                end;
            end else begin
                if Rec.Status = Rec.Status::"Pending Approval" then
                    Error('There is no funding for Admin Unit %1', Rec."Shortcut Dimension 2 Code");
            end;
        end;
    end;

    procedure archiveDocument()
    var
        expenseReq: Record "Expense Requisition";

    begin
        expenseReq.reset();
        expenseReq.SetRange("No.", "Expenditure Requisition Code");
        if expenseReq.FindFirst() then begin
            if expenseReq.Status <> expenseReq.Status::Recalled then
                Error('Archive Not Allowed')
            else begin
                "Archive Document" := true;
                if Modify() then begin
                    Message('Document Archived');
                end;

            end;
        end;

    end;



    procedure doesTaxPvExists(docNo: Code[20]): Boolean

    var
        payment: Record Payments;
        exists: Boolean;

    begin
        exists := false;
        payment.reset();
        payment.setRange("PV Type", payment."PV Type"::Tax);
        payment.SetRange("Source PV No.", docNo);
        payment.SetRange("Archive Document", false);
        if payment.findFirst() then begin
            exists := true;
            exit(exists);
        end;
        exit(exists);
    end;


    procedure PreventArchivedDocuments(docNo: Code[20])

    var
        exr: Record "Expense Requisition";

    begin
        exr.reset();
        exr.setRange("No.", docNo);
        if exr.findFirst then begin
            if (exr.Status = exr.Status::Recalled) then
                error('payment cannot be processed, Related EXR has been recalled');

        end

    end;





    procedure isTaxPvPosted(docNo: Code[20]): Boolean
    var
        payment: Record Payments;
        isPosted: Boolean;

    begin
        isPosted := false;

        if doesTaxPvExists(docNo) then begin
            payment.reset();
            payment.setRange("PV Type", payment."PV Type"::Tax);
            payment.SetRange("Archive Document", false);
            payment.SetRange("Source PV No.", docNo);
            if payment.FindSet() then begin
                repeat
                    if (payment.Posted = true) then begin
                        isPosted := true;
                    end
                    else begin
                        isPosted := false;
                        exit(isPosted);
                    end;
                until payment.Next() = 0;

            end;
            exit(isPosted);

        end
        else
            isPosted := true;

        exit(isPosted);

    end;


    // //added by feisal - sum up tax pv with multiple lines
    // procedure autoBatchTaxPv(IBAdocNo: Code[50]; docNo: Code[20]; paymentType: Text)
    // var
    //     EFTLines: Record "EFT Line";
    //     PVLines: Record "PV Lines";
    //     LineNo: Integer;
    //     PV: Record "Payments";
    //     HRPortal: Codeunit HRPortal;
    //     EftHeader: Record "EFT Header";
    //     TotalAmount: Decimal; // Variable to store the summed amounts
    // begin
    //     PV.Reset();
    //     PV.setRange("PV Type", PV."PV Type"::Tax);
    //     PV.SetRange("Source PV No.", docNo);
    //     if (PV.FindFirst()) then begin
    //         PVLines.Reset();
    //         PVLines.SetRange("No", PV."No.");
    //         TotalAmount := 0; // Initialize the total amount

    //         // Iterate through PVLines and sum the Net Amount
    //         if PvLines.Findset() then begin
    //             repeat
    //                 TotalAmount := TotalAmount + PvLines."Net Amount"; // Add the Net Amount of each line
    //             until PvLines.Next() = 0;

    //             EFTLines.Reset();
    //             EFTLines.SetRange("Document No.", IBAdocNo);
    //             EFTLines.SetRange("Source Record ID", PVLines.RecordId);

    //             if EFTLines.FindFirst() then begin
    //                 EFTLines."Document No." := IBAdocNo;
    //                 EFTLines."Account Type" := PvLines."Account Type";
    //                 EFTLines."Account No." := PvLines."Account No";
    //                 EFTLines.Description := PV."Payment Narration";
    //                 if paymentType = 'Payment Voucher' then
    //                     EFTLines.Amount := TotalAmount // Set the summed amount
    //                 else
    //                     EFTLines.Amount := PvLines.Amount; // Use the individual amount if not payment voucher
    //                 EFTLines."Source Document No." := PvLines.No;
    //                 EFTLines."Source Document Type" := PvLines."Source Document Type";
    //                 EFTLines."Source Record ID" := PVLines.RecordId;
    //                 EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
    //                 EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
    //                 EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
    //                 EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
    //                 EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
    //                 EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
    //                 EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
    //                 EFTLines."Pay Mode" := PV."Pay Mode";
    //                 EFTLines.eslip := EftHeader.GetEslipNo(PvLines.No);
    //                 EFTLines.Modify();
    //                 HRPortal.UpdateSourceDocument(EFTLines);
    //             end else begin
    //                 EFTLines.Reset();
    //                 if EFTLines.Find('-') then
    //                     LineNo := EFTLines.Count + 1;
    //                 if LineNo = 0 then LineNo := 1;
    //                 EFTLines.Init();
    //                 EFTLines."Line No." := LineNo;
    //                 EFTLines."Document No." := IBAdocNo;
    //                 EFTLines."Account Type" := PvLines."Account Type";
    //                 EFTLines."Account No." := PvLines."Account No";
    //                 EFTLines.Description := PV."Payment Narration";
    //                 if paymentType = 'Payment Voucher' then
    //                     EFTLines.Amount := TotalAmount // Use the summed amount
    //                 else
    //                     EFTLines.Amount := PvLines.Amount;
    //                 EFTLines."Source Document No." := PvLines.No;
    //                 EFTLines."Source Document Type" := PvLines."Source Document Type";
    //                 EFTLines."Source Record ID" := PVLines.RecordId;
    //                 EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
    //                 EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
    //                 EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
    //                 EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
    //                 EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
    //                 EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
    //                 EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
    //                 EFTLines."Pay Mode" := PV."Pay Mode";
    //                 EFTLines.eslip := EftHeader.GetEslipNo(PvLines.No);
    //                 EFTLines.Insert();
    //                 HRPortal.UpdateSourceDocument(EFTLines);
    //             end;
    //         end;
    //     end;
    // end;


    procedure ReopenPv(docNo: Code[20])
    var
        payments: Record Payments;
    begin
        payments.reset();
        payments.setRange("No.", docNo);
        if payments.FindFirst() then begin
            if payments.posted then
                Error('Cannot Reopen a posted Document')
            else begin
                payments.status := payments.status::open;
                payments.modify();
                Message('Payments has been Reopened');
            end;

        end;

    end;






    procedure autoBatchTaxPv(IBAdocNo: Code[50]; docNo: Code[20]; paymentType: Text)
    var
        EFTLines: Record "EFT Line";
        PVLines: Record "PV Lines";
        LineNo: Integer;
        PV: record "Payments";
        HRPortal: Codeunit HRPortal;
        EftHeader: Record "EFT Header";

    begin

        PV.Reset();
        PV.setRange("PV Type", PV."PV Type"::Tax);
        PV.SetRange("Source PV No.", docNo);
        PV.SetRange("Archive Document", false);
        if (PV.FindSet()) then begin
            repeat

                PVLines.Reset();
                PVLines.SetRange("No", PV."No.");
                if PvLines.Findset() then begin
                    PVLines.Calcsums("Net Amount", Amount);
                    EFTLines.Reset();
                    // EFTLines.SetRange("Document No.", IBAdocNo);
                    // EFTLines.SetRange("Source Record ID", PVLines.RecordId);
                    if EFTLines.FindFirst() then begin
                        EFTLines."Document No." := IBAdocNo;
                        EFTLines."Account Type" := PvLines."Account Type";
                        EFTLines."Account No." := PvLines."Account No";
                        EFTLines.Description := PV."Payment Narration";
                        if paymentType = 'Payment Voucher' then
                            EFTLines.Amount := PvLines."Net Amount"
                        else
                            EFTLines.Amount := PvLines.Amount;
                        EFTLines."Source Document No." := PvLines.No;
                        EFTLines."Source Document Type" := PvLines."Source Document Type";
                        EFTLines."Source Record ID" := PVLines.RecordId;
                        EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
                        EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
                        EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
                        EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
                        EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
                        EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
                        EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
                        EFTLines."Pay Mode" := PV."Pay Mode";
                        EFTLines.eslip := EftHeader.GetEslipNo(PvLines.No);
                        EFTLines.Modify();
                        // HRPortal.UpdateSourceDocument(EFTLines);
                    end else begin
                        EFTLines.Reset();
                        if EFTLines.Find('-') then
                            LineNo := EFTLines.Count + 1;
                        if LineNo = 0 then LineNo := 1;
                        EFTLines.Init();
                        EFTLines."Line No." := LineNo;
                        EFTLines."Document No." := IBAdocNo;
                        EFTLines."Account Type" := PvLines."Account Type";
                        EFTLines."Account No." := PvLines."Account No";
                        EFTLines.Description := PV."Payment Narration";
                        if paymentType = 'Payment Voucher' then
                            EFTLines.Amount := PvLines."Net Amount"
                        else
                            EFTLines.Amount := PvLines.Amount;
                        EFTLines."Source Document No." := PvLines.No;
                        EFTLines."Source Document Type" := PvLines."Source Document Type";
                        EFTLines."Source Record ID" := PVLines.RecordId;
                        EFTLines."Payee Bank Code" := PvLines."Payee Bank Code";
                        EFTLines."Payee Bank Name" := PvLines."Payee Bank Name";
                        EFTLines."Payee Bank Branch Code" := PvLines."Payee Bank Branch Code";
                        EFTLines."Payee Bank Branch Name" := PvLines."Payee Bank Branch Name";
                        EFTLines."Payee Bank Account No." := PvLines."Payee Bank Account No.";
                        EFTLines."Payee Bank Account Name" := PvLines."Payee Bank Acc Name";
                        EFTLines."Global Dimension 1 Code" := PvLines.HeaderDimension1Code;
                        EFTLines."Pay Mode" := PV."Pay Mode";
                        EFTLines.eslip := EftHeader.GetEslipNo(PvLines.No);
                        EFTLines.Insert();
                        // HRPortal.UpdateSourceDocument(EFTLines);
                    end;
                end;

            until PV.Next() = 0;


        end;

    end;

    procedure createCustomerFromResource(AccNo: Code[20]): Boolean
    var
        Customer: Record Customer;
        ResourceRec: Record Resource;
    begin
        ResourceRec.reset();
        ResourceRec.setRange("No.", AccNo);
        if ResourceRec.FindFirst() then begin
            // Customer.TransferFields(ResourceRec, false);
            Customer.init();
            // Customer."Account Type" := Customer."Account Type"::Resource;
            Customer."No." := ResourceRec."No.";
            Customer.Name := ResourceRec.Name;
            Customer."Phone No." := ResourceRec."M-Pesa Number";
            Customer."Employee's Bank" := ResourceRec."Bank Name";
            Customer."Bank Account Number" := ResourceRec."Payee Bank Acc Name";
            Customer."Bank Branch Name" := ResourceRec."Branch Name";
            Customer."Bank Branch" := ResourceRec."Bank Branch No.";
            Customer."Customer Posting Group" := getCustPosting();
            if Customer.Insert(false) then
                exit(true);
        end;

        exit(false);


    end;

    procedure checkBankBalance(bankCode: code[20]; amount: Decimal)

    var
        bankAccount: Record "Bank Account";
    begin
        bankAccount.get(bankCode);
        bankAccount.CalcFields(Balance);
        if (amount < bankAccount.Balance) then
            Error('Insuffience Balance')
    end;

    procedure getCustPosting(): Code[100]
    var
        custPost: Record "Customer Posting Group";
    begin

        custPost.reset();
        // custPost.setRange(Utilization, custPost.Utilization::"Safari Imprest");
        if custPost.FindFirst() then
            exit(custPost.Code)
        else
            error('Safari Imprest is not Defined');



    end;

    procedure isReceiptPosted(docNo: Code[20])

    var
        receipt: Record "Receipts Header1";


    begin
        receipt.reset();
        receipt.setRange("Bounced Payment Doc", docNo);
        receipt.setRange(posted, true);
        if Not receipt.FindFirst() then
            Error('Receipt The Bounced/Failed Payment and Post')

    end;

    procedure isPaymentProcessed(docNo: Code[20])
    var
        payments: Record Payments;
    begin

        payments.reset();
        payments.setRange("Bounced Payment Doc. No", docNo);
        if payments.FindSet() then
            repeat

                if (payments."No." <> Rec."No.") then
                    Error('Payment Processed in Document No: ' + payments."No.")


            until payments.Next = 0;

    end;


    procedure markPaymentAsProcessed(docNo: Code[20])

    var
        // outwardPayment: Record "Outward Payment Buffer";

    begin

        // outwardPayment.reset();
        // // outwardPayment.SetRange("Source Document No.", docNo);
        // if outwardPayment.FindFirst() then begin
        //     outwardPayment.paymentProcessed := true;
        //     outwardPayment.Modify()
        // end

    end;

    procedure GeneratePRN(var Payment: Record Payments): Text
    var
        // KRAIntegration: Codeunit "KRA Integration";
        amount: Integer;
        TaxObligation: Code[20];
        SourcePV: Record Payments;
        Vend: Record Vendor;
        Lines: Record "PV Lines";
        InvHeader: Record "Purch. Inv. Header";
        TotAmt: Integer;
    begin
        if Payment."Source PV No." = '' then
            Error('Source PV No. cannot be blank');
        SourcePV.Get(Payment."Source PV No.");
        SourcePV.CalcFields("Total Amount", "Total Excl. VAT");
        TotAmt := Round(SourcePV."Total Amount", 1, '>');
        Lines.reset();
        Lines.SetRange(No, SourcePV."No.");
        if Lines.FindFirst() then
            if Lines."Amount Excluding VAT" <> 0 then
                TotAmt := Round(Lines."Amount Excluding VAT", 1, '>');
        Vend.Get(Lines."Account No");
        InvHeader.Get(Lines."Applies to Doc. No");
        Payment.CalcFields("Total Amount LCY");
        amount := Round(Payment."Total Amount LCY", 1, '>');


        // Payment.Eslip := KRAIntegration.GeneratePRN(
        //     Payment."No.",
        //     Payment."Tax Obligation",
        //      amount,
        //      Vend."PIN Number",
        //      InvHeader."No.",
        //      TotAmt,
        //      InvHeader."Vendor Invoice Date",
        //      Payment."Posting Date",
        //      KRALog);
        // if Payment.Eslip = '' then
        //     Payment.Eslip := KRALog."TCC No";
        if Payment.Eslip <> '' then begin
            Payment.isTaxValidated := true;
            Payment.modify();
            // exit(KRALog."Status Message");
        end;
    end;

    procedure checkBlanksOnLines(docNo: Code[20])

    var
        payment: Record Payments;
        pvLines: Record "PV Lines";
    begin

        payment.reset();
        payment.setRange("No.", docNo);
        if payment.findFirst() then begin

            if payment."payment type" <> payment."Payment Type"::Imprest then begin

                pvLines.reset();
                pvLines.setRange(No, payment."No.");
                if pvlines.findset then
                    repeat

                        if (pvlines."Account No" = '') then
                            Error('Account Number Must Have A Value')



                    until pvlines.next = 0;






            end


        end
    end;
}