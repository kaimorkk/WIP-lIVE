 
   table 50019 "EFT Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."EFT Header Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; Transferred; Boolean)
        {
            Editable = false;
            trigger OnValidate()
            var
                EFTLine: Record "EFT Line";
            begin
                if Transferred then begin
                    "Transferred By" := UserId;
                    "Date Transferred" := DT2Date(CurrentDateTime);
                    "Time Transferred" := DT2Time(CurrentDateTime);

                    EFTLine.Reset();
                    EFTLine.SetRange("Document No.", No);
                    if EFTLine.FindSet() then begin
                        EFTLine.ModifyAll(Transferred, Transferred);
                        EFTLine.ModifyAll("Date Transferred", CreateDateTime("Date Transferred", "Time Transferred"));
                    end;
                end;
            end;
        }
        field(4; "Date Transferred"; Date)
        {
            Editable = false;
        }
        field(5; "Time Transferred"; Time)
        {
            Editable = false;
        }
        field(6; "Transferred By"; Text[20])
        {
            Editable = false;
        }
        field(7; "Date Entered"; Date)
        {
        }
        field(8; "Time Entered"; Time)
        {
        }
        field(9; "Entered By"; Text[30])
        {
        }
        field(10; Remarks; Text[150])
        {
        }
        field(11; "Payee Bank Name"; Text[50])
        {
            Editable = false;
            Caption = 'Paying Bank Name';
        }
        field(12; "Bank  No"; Code[20])
        {
            Caption = 'Paying Bank Account';
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin
                Banks.Reset;
                if Banks.Get("Bank  No") then begin
                    "Payee Bank Name" := Banks.Name;
                    "Bank Code" := Banks."Bank Code";
                    "Bank Name" := Banks."Bank Name";
                    "Bank Branch Code" := Banks."Bank Branch No.";
                    "Bank Branch Name" := Banks."Bank Branch Name";
                    "Bank Account No." := Banks."Bank Account No.";
                end;
            end;
        }
        field(13; "Salary Processing No."; Code[20])
        {
        }
        field(14; "Salary Options"; Option)
        {
            OptionMembers = "Add To Existing","Replace Lines";
        }
        field(15; Total; Decimal)
        {
            CalcFormula = sum("EFT Line".Amount where("Document No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Count"; Integer)
        {
            CalcFormula = count("EFT Line" where("Document No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; RTGS; Boolean)
        {

            trigger OnValidate()
            begin
                EFTDetails.Reset;
                EFTDetails.SetRange(EFTDetails."Header No", No);
                if EFTDetails.FindSet() then begin
                    repeat
                        if Accounts.Get(EFTDetails."Account No") then begin
                            /*
                          IF AccountTypes.GET(Accounts."Account Type") THEN BEGIN
                          IF EFTDetails."Destination Account Type" = EFTDetails."Destination Account Type"::External THEN
                          EFTDetails.Charges:=AccountTypes."External EFT Charges"
                          ELSE
                          EFTDetails.Charges:=AccountTypes."Internal EFT Charges";

                          AccountTypes.TESTFIELD(AccountTypes."EFT Charges Account");
                          EFTDetails."EFT Charges Account":=AccountTypes."EFT Charges Account";

                          IF RTGS = TRUE THEN BEGIN
                          EFTDetails.Charges:=AccountTypes."RTGS Charges";
                          AccountTypes.TESTFIELD(AccountTypes."RTGS Charges Account");
                          EFTDetails."EFT Charges Account":=AccountTypes."RTGS Charges Account";
                          END;

                          END;
                          */
                        end;
                        EFTDetails.Modify;
                    until EFTDetails.Next = 0;
                end;
            end;
        }
        field(18; "Document No. Filter"; Code[250])
        {
            FieldClass = FlowFilter;
        }
        field(19; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(20; "Cheque No"; Code[20])
        {
        }
        field(21; "Bank Code"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
        }
        field(22; "Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank Code"));
        }
        field(24; "Bank Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Bank Account No."; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(26; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
            Editable = false;
        }
        field(27; "Processing Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Paid,Processing,Failed;
        }
        field(28; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(29; "Department Name"; Text[400])
        {
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where("Global Dimension No." = const(1), Code = field("Global Dimension 1 Code")));
        }
        field(30; "Voided"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if Voided then begin
                    TestField("Reason for Voiding");
                    "Date Voided" := CurrentDateTime;
                    "Voided By" := UserId;
                end;
            end;
        }
        field(31; "Date Voided"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Voided By"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Reason for Voiding"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; "Batch"; Code[20])
        {
            TableRelation = "EFT Batch".Code;
            trigger OnValidate()
            var
                EFTBatch: Record "EFT Batch";
            begin
                if EFTBatch.Get(Batch) then begin
                    EFTBatch.Testfield("Minimum Amount");
                    EFTBatch.Testfield("Maximum Amount");
                    "Minimum Amount" := EFTBatch."Minimum Amount";
                    "Maximum Amount" := EFTBatch."Maximum Amount";
                end;
            end;
        }
        field(35; "Minimum Amount"; Decimal)
        {
            Editable = false;
        }
        field(36; "Maximum Amount"; Decimal)
        {
            Editable = false;
        }
        field(37; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = " ","Tax Payment Voucher","Payroll Payment Voucher","Normal Payment Voucher","Retention Payment","Retention Movement","Revenue Sweep Voucher",Refund,"Special Imprest","Safari Imprest","Standing Imprest",Imprest,"Staff Claim","Bounced Payments Voucher";
        }
        field(38; "Requires Exchequer Request"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Reasons to Reopen"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }

        field(40; testTwinning; Code[30])
        {
            DataClassification = ToBeClassified;

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
        if Transferred = true then
            Error('You cannot delete an already posted record.');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."EFT Header Nos.");
            NoSeriesMgt.InitSeries(NoSetup."EFT Header Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;


        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;
    end;

    trigger OnModify()
    begin
        if xRec.Transferred = true then
            Error('You cannot modify an already posted record.');
    end;

    var
        NoSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Accounts: Record Vendor;
        Members: Record Vendor;
        AccountHolders: Record Vendor;
        Banks: Record "Bank Account";
        BanksList: Record "Bank Account";
        EFTDetails: Record "EFT Details";
        DimensionValue: Record "Dimension Value";

    procedure ClearLines()
    var
        EFTLines: Record "EFT Line";
    begin
        EFTLines.Reset();
        EFTLines.SetRange("Document No.", No);
        if EFTLines.FindSet() then
            EFTLines.DeleteAll(true);
    end;

    procedure LookupLines()
    var
        PVEFTLines, PVEFTLines2 : Record "PV Lines" temporary;
        LineNo: Integer;
        LookupLines: Page "Lookup EFT Lines";
        PVLines: Record "PV Lines";
        EFTLines: Record "EFT Line";
        LineNo2: Integer;
        PV: record Payments;
        PVImpreset: Record Payments;
        PV2: record Payments;

    begin
        TestField("Bank  No");
        TestField(Batch);
        if (rec."Document Type" = "Document Type"::Imprest) then begin
            PVImpreset.Reset();
            PVImpreset.SetRange(Posted, true);
            PVImpreset.SetRange("Paying Bank Account", "Bank  No");
            PVImpreset.SetRange("EFT Code", '');
            PVImpreset.SetRange(Reversed, false);
            PVImpreset.SetRange("Shortcut Dimension 1 Code", "Global Dimension 1 Code");
            if PVImpreset.FindFirst() then begin
                PVImpreset.CalcFields("Imprest Amount");
                if (PVImpreset."Imprest Amount" >= Rec."Minimum Amount") and (PVImpreset."Imprest Amount" <= Rec."Maximum Amount") then begin
                    PVEFTLines.Reset();
                    if PVEFTLines.FindLast() then
                        LineNo := PVEFTLines."Line No" + 1;
                    PVEFTLines.Init();
                    PVEFTLines.No := No;
                    PVEFTLines."Account Type" := PVImpreset."Account Type";
                    PVEFTLines."Account No" := PVImpreset."Account No.";
                    PVEFTLines.Description := PVImpreset."Payment Narration";
                    if PVEFTLines.Description = '' then begin
                        if PV.Get(PVLines.No) then begin
                            PVEFTLines.Description := PVImpreset."Payment Narration";
                        end;
                    end;
                    PVEFTLines."Line No" := LineNo;
                    PVEFTLines."Amount (LCY)" := PVImpreset."Imprest Amount LCY";
                    PVEFTLines."VAT Amount" := 0;
                    PVEFTLines."W/Tax Amount" := PVImpreset."Total Witholding Tax Amount";
                    PVEFTLines."W/T VAT Amount" := PVImpreset."Total VAT Amount";
                    PVEFTLines."Retention  Amount" := PVImpreset."Total Retention Amount";
                    PVEFTLines.Amount := PVImpreset."Imprest Amount";
                    PVEFTLines."Payee Bank Code" := PVImpreset."Payee Bank Code";
                    PVEFTLines."Payee Bank Name" := PVImpreset."Payee Bank Name";
                    PVEFTLines."Payee Bank Branch Code" := PVImpreset."Payee Bank Branch";
                    PVEFTLines."Payee Bank Branch Name" := PVImpreset."Payee Branch Name";
                    PVEFTLines."Payee Bank Account No." := PVImpreset.Payee;
                    PVEFTLines."Payee Bank Acc Name" := PVImpreset.Payee;
                    PVEFTLines."Posted Date" := PVImpreset."Posting Date";
                    PVEFTLines."Payment Type2" := PVEFTLines."Payment Type2"::Imprest;
                    PVEFTLines."Shortcut Dimension 1 Code" := PVImpreset."Shortcut Dimension 1 Code";
                    PVEFTLines."Source RecordID" := PVImpreset.RecordId;
                    PVEFTLines."Source Document No." := PVImpreset."No.";
                    // if (PVLines."PV Type2" = PVLines."PV Type2"::Tax) then
                    //  PVEFTLines.eslip := GetEslipNo(PVLines."Source Document No.");

                    PVEFTLines."Payment Mode1" := PVImpreset."Pay Mode";
                    if PVEFTLines."Payment Mode1" = '' then
                        PVEFTLines."Payment Mode1" := PVImpreset."Pay Mode";
                    // PVEFTLines."Source Document Type" := GetSourceDocType(PVImpreset);
                    PVEFTLines.Insert();
                end;
            end;
        end;
        PVLines.Reset();
        PVLines.SetRange("Posted 2", true);
        PVLines.SetRange("Paying Bank Acc", "Bank  No");
        PVLines.SetRange("EFT Code", '');
        PVLines.SetRange("Net Amount", "Minimum Amount", "Maximum Amount");

        if "Global Dimension 1 Code" <> '' then
            PVLines.SetRange(HeaderDimension1Code, "Global Dimension 1 Code");
        PVLines.SetCurrentKey("Posting Date");
        PVLines.SetFilter("Payment Type2", '%1|%2|%3|%4|%5|%6', PVLines."Payment Type2"::"Payment Voucher", PVLines."Payment Type2"::"Standing Imprest",
                         PVLines."Payment Type2"::"Petty Cash", PVLines."Payment Type2"::"Special Imprest", PVLines."Payment Type2"::"Bank Transfer",
        PVLines."Payment Type2"::"Staff Claim");
        case
            Rec."Document Type" of
            Rec."Document Type"::" ":
                PVLines.SetFilter("PV Type2", '%1|%2|%3|%4|%5|%6', PVLines."PV Type2"::" ", PVLines."PV Type2"::Normal, PVLines."PV Type2"::Payroll,
                                    PVLines."PV Type2"::"Retention Payment", PVLines."PV Type2"::Tax, PVLines."PV Type2"::Refund);
            Rec."Document Type"::"Normal Payment Voucher":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::Normal);
            Rec."Document Type"::"Bounced Payments Voucher":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::"Bounced Payments Voucher");
            Rec."Document Type"::"Payroll Payment Voucher":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::Payroll);
            Rec."Document Type"::"Retention Movement":
                PVLines.SetRange(PVLines."PV Type2", PVLines."PV Type2"::Retention);
            Rec."Document Type"::"Retention Payment":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::"Retention Payment");
            Rec."Document Type"::"Tax Payment Voucher":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::Tax);
            Rec."Document Type"::"Revenue Sweep Voucher":
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::"Revenue Sweep Voucher");
            Rec."Document Type"::Refund:
                PVLines.SetRange("PV Type2", PVLines."PV Type2"::Refund);
            Rec."Document Type"::"Special Imprest":
                PVLines.SetRange("Payment Type2", PVLines."Payment Type2"::"Special Imprest");
            Rec."Document Type"::"Standing Imprest":
                PVLines.SetRange("Payment Type2", PVLines."Payment Type2"::"Payment Voucher");
            Rec."Document Type"::"Safari Imprest":
                PVLines.SetRange("Payment Type2", PVLines."Payment Type2"::Imprest);
            Rec."Document Type"::Imprest:
                PVLines.SetFilter("Payment Type2", '%1|%2|%3', PVLines."Payment Type2"::"Special Imprest", PVLines."Payment Type2"::"Standing Imprest", PVLines."Payment Type2"::Imprest);
        end;
        PVLines.SetAutoCalcFields("Payment Type2", "PV Type2", HeaderDimension1Code, "Posting Date", "Payment Mode");
        if PVLines.FindSet() then begin
            repeat
                LineNo += 1;

                // if (PVLines."PV Type2" = PVLines."PV Type2"::Normal) then begin
                if (PVLines."PV Type2" = PVLines."PV Type2"::Normal) then begin
                    if (not PV.isTaxPvPosted(PVLines.No)) then
                        Error('Please Post The related Tax Pv');
                    PVEFTLines.Init();
                    PVEFTLines.No := No;
                    PVEFTLines."Account Type" := PVLines."Account Type";
                    PVEFTLines."Account No" := PVLines."Account No";
                    PVEFTLines.Description := PVLines.Description;
                    if PVEFTLines.Description = '' then begin
                        if PV.Get(PVLines.No) then begin
                            PVEFTLines.Description := PV."Payment Narration";
                        end;
                    end;
                    PVEFTLines."Line No" := LineNo;
                    PVEFTLines."Amount (LCY)" := PVLines."Amount (LCY)";
                    PVEFTLines."VAT Amount" := PVLines."VAT Amount";
                    PVEFTLines."W/Tax Amount" := PVLines."W/Tax Amount";
                    PVEFTLines."W/T VAT Amount" := PVLines."W/T VAT Amount";
                    PVEFTLines."Retention  Amount" := PVLines."Retention  Amount";
                    PVEFTLines.Amount := PVLines."Net Amount";
                    PVEFTLines."Payee Bank Code" := PVLines."Payee Bank Code";
                    PVEFTLines."Payee Bank Name" := PVLines."Payee Bank Name";
                    PVEFTLines."Payee Bank Branch Code" := PVLines."Payee Bank Branch Code";
                    PVEFTLines."Payee Bank Branch Name" := PVLines."Payee Bank Branch Name";
                    PVEFTLines."Payee Bank Account No." := PVLines."Payee Bank Account No.";
                    PVEFTLines."Payee Bank Acc Name" := PVLines."Payee Bank Acc Name";
                    PVEFTLines."Posted Date" := PVLines."Posting Date";
                    PVEFTLines."Shortcut Dimension 1 Code" := PVLines.HeaderDimension1Code;
                    PVEFTLines."Source RecordID" := PVLines.RecordId;
                    PVEFTLines."Source Document No." := PVLines.No;
                    PVEFTLines."Payment Mode1" := PVLines."Payment Mode1";
                    if PVEFTLines."Payment Mode1" = '' then
                        PVEFTLines."Payment Mode1" := PVLines."Payment Mode";
                    PVEFTLines."Source Document Type" := GetSourceDocType(PVLines);
                    if (PVLines."PV Type2" = PVLines."PV Type2"::Tax) then
                        PVEFTLines.eslip := GetEslipNo(PVLines.No);
                    if PVEFTLines.Insert() then begin
                        //insert tax details here using tax pv
                        LineNo += 1;
                        PV.Reset();
                        PV2.setRange("PV Type", PV."PV Type"::Tax);
                        PV2.SetRange("Source PV No.", PVLines.No);
                        if (PV2.FindFirst()) then begin
                            PVLines.Reset();
                            PVLines.SetRange("No", PV2."No.");
                            if PvLines.Findset() then begin
                                PVLines.Calcsums("Net Amount", Amount);
                                PVEFTLines.Init();
                                PVEFTLines.No := No;
                                PVEFTLines."Account Type" := PVLines."Account Type";
                                PVEFTLines."Account No" := PVLines."Account No";
                                PVEFTLines.Description := PVLines.Description;
                                if PVEFTLines.Description = '' then begin
                                    if PV.Get(PVLines.No) then begin
                                        PVEFTLines.Description := PV."Payment Narration";
                                    end;
                                end;
                                PVEFTLines."Line No" := LineNo;
                                PVEFTLines."Amount (LCY)" := PVLines."Amount (LCY)";
                                PVEFTLines."VAT Amount" := PVLines."VAT Amount";
                                PVEFTLines."W/Tax Amount" := PVLines."W/Tax Amount";
                                PVEFTLines."W/T VAT Amount" := PVLines."W/T VAT Amount";
                                PVEFTLines."Retention  Amount" := PVLines."Retention  Amount";
                                PVEFTLines.Amount := PVLines."Net Amount";
                                PVEFTLines."Payee Bank Code" := PVLines."Payee Bank Code";
                                PVEFTLines."Payee Bank Name" := PVLines."Payee Bank Name";
                                PVEFTLines."Payee Bank Branch Code" := PVLines."Payee Bank Branch Code";
                                PVEFTLines."Payee Bank Branch Name" := PVLines."Payee Bank Branch Name";
                                PVEFTLines."Payee Bank Account No." := PVLines."Payee Bank Account No.";
                                PVEFTLines."Payee Bank Acc Name" := PVLines."Payee Bank Acc Name";
                                PVEFTLines."Posted Date" := PVLines."Posting Date";
                                PVEFTLines."Shortcut Dimension 1 Code" := PVLines.HeaderDimension1Code;
                                PVEFTLines."Source RecordID" := PVLines.RecordId;
                                PVEFTLines."Source Document No." := PVLines.No;
                                PVEFTLines."Payment Mode1" := PVLines."Payment Mode1";
                                if PVEFTLines."Payment Mode1" = '' then
                                    PVEFTLines."Payment Mode1" := PVLines."Payment Mode";
                                PVEFTLines."Source Document Type" := GetSourceDocType(PVLines);
                                if (PVLines."PV Type2" = PVLines."PV Type2"::Tax) then
                                    PVEFTLines.eslip := GetEslipNo(PVLines.No);
                                PVEFTLines.Insert();
                            end;
                        end;


                    end;
                    // end;

                end
                else begin
                    PVEFTLines.Init();
                    PVEFTLines.No := No;
                    PVEFTLines."Account Type" := PVLines."Account Type";
                    PVEFTLines."Account No" := PVLines."Account No";
                    PVEFTLines.Description := PVLines.Description;
                    if PVEFTLines.Description = '' then begin
                        if PV.Get(PVLines.No) then begin
                            PVEFTLines.Description := PV."Payment Narration";
                        end;
                    end;
                    PVEFTLines."Line No" := LineNo;
                    PVEFTLines."Amount (LCY)" := PVLines."Amount (LCY)";
                    PVEFTLines."VAT Amount" := PVLines."VAT Amount";
                    PVEFTLines."W/Tax Amount" := PVLines."W/Tax Amount";
                    PVEFTLines."W/T VAT Amount" := PVLines."W/T VAT Amount";
                    PVEFTLines."Retention  Amount" := PVLines."Retention  Amount";
                    PVEFTLines.Amount := PVLines."Net Amount";
                    PVEFTLines."Payee Bank Code" := PVLines."Payee Bank Code";
                    PVEFTLines."Payee Bank Name" := PVLines."Payee Bank Name";
                    PVEFTLines."Payee Bank Branch Code" := PVLines."Payee Bank Branch Code";
                    PVEFTLines."Payee Bank Branch Name" := PVLines."Payee Bank Branch Name";
                    PVEFTLines."Payee Bank Account No." := PVLines."Payee Bank Account No.";
                    PVEFTLines."Payee Bank Acc Name" := PVLines."Payee Bank Acc Name";
                    PVEFTLines."Posted Date" := PVLines."Posting Date";
                    PVEFTLines."Shortcut Dimension 1 Code" := PVLines.HeaderDimension1Code;
                    PVEFTLines."Source RecordID" := PVLines.RecordId;
                    PVEFTLines."Source Document No." := PVLines.No;
                    PVEFTLines."Payment Mode1" := PVLines."Payment Mode1";
                    if PVEFTLines."Payment Mode1" = '' then
                        PVEFTLines."Payment Mode1" := PVLines."Payment Mode";
                    PVEFTLines."Source Document Type" := GetSourceDocType(PVLines);
                    // if (PVLines."PV Type2" = PVLines."PV Type2"::Tax) then
                    //     PVEFTLines.eslip := GetEslipNo(PVLines.No);
                    if (PVLines."PV Type2" = PVLines."PV Type2"::Tax) then
                        PVEFTLines.eslip := GetEslipNo(PVLines.No);
                    PVEFTLines.Insert();

                end;


            until PVLines.Next() = 0;
        end;

        if "Document Type" in ["Document Type"::Imprest, "Document Type"::"Safari Imprest", "Document Type"::" ", "Document Type"::"Staff Claim"] then begin
            //Imprest
            PV.Reset();
            case
                true of
                "Document Type" in ["Document Type"::Imprest, "Document Type"::"Safari Imprest"]:
                    PV.SetRange("Payment Type", PV."Payment Type"::Imprest);
                "Document Type" = "Document Type"::"Staff Claim":
                    PV.SetRange("Payment Type", PV."Payment Type"::"Staff Claim");
                "Document Type" = "Document Type"::" ":
                    PV.SetFilter("Payment Type", '%1|%2', PV."Payment Type"::Imprest, PV."Payment Type"::"Staff Claim");
            end;
            PV.SetRange(Reversed, false);
            PV.SetRange(Posted, true);
            PV.SetRange("EFT Code", '');
            pv.SetRange("Paying Bank Account", "Bank  No");
            PV.SetRange("Imprest Amount LCY", "Minimum Amount", "Maximum Amount");
            if "Global Dimension 1 Code" <> '' then
                PV.SetRange("Shortcut Dimension 1 Code", "Global Dimension 1 Code");
            PV.SetAutoCalcFields("Imprest Amount LCY", "Imprest Amount");
            if PV.FindSet() then begin
                repeat
                    LineNo += 1;
                    PVEFTLines.Init();
                    PVEFTLines."Line No" := LineNo;
                    PVEFTLines.No := No;
                    PVEFTLines."Account Type" := PV."Account Type";
                    PVEFTLines."Account No" := PV."Account No.";
                    PVEFTLines.Description := PV."Payment Narration";
                    PVEFTLines."Line No" := LineNo;
                    PVEFTLines."NetAmount LCY" := PV."Imprest Amount LCY";
                    PVEFTLines.Amount := PV."Imprest Amount";
                    PVEFTLines."Payee Bank Code" := PV."Payee Bank Code";
                    PVEFTLines.Validate(PVEFTLines."Payee Bank Code");
                    PVEFTLines."Payee Bank Name" := PV."Payee Bank Name";
                    PVEFTLines."Payee Bank Branch Code" := PV."Payee Bank Branch";
                    PVEFTLines."Payee Bank Branch Name" := PV."Payee Branch Name";
                    PVEFTLines."Payee Bank Account No." := PV."Payee Bank Account";
                    PVEFTLines."Payee Bank Acc Name" := PV."Account Name";
                    PVEFTLines."Posted Date" := PV."Posting Date";
                    PVEFTLines."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
                    PVEFTLines."Source RecordID" := PV.RecordId;
                    PVEFTLines."Source Document No." := PV."No.";
                    PVEFTLines."Payment Mode1" := PV."Pay Mode";
                    PVEFTLines."Source Document Type" := 'Safari Imprest';
                    PVEFTLines.Insert();
                until PV.Next() = 0;
            end;
        end;

        clear(LookupLines);
        LookupLines.LookupMode(true);
        // LookupLines.SetTableView(EFTLines);
        LookupLines.SetEFTHeader(Rec);
        LookupLines.SetLines(PVEFTLines);
        if LookupLines.RunModal() = Action::LookupOK then begin
            LookupLines.GetLines(PVEFTLines2);

            if PVEFTLines2.FindSet() then begin
                EFTLines.Reset();
                if EFTLines.FindLast() then
                    LineNo2 := EFTLines."Line No.";
                repeat
                    EFTLines.Reset();
                    EFTLines.SetRange("Document No.", No);
                    EFTLines.SetRange("Source Record ID", PVEFTLines2."Source RecordID");
                    if EFTLines.FindFirst() then begin
                        EFTLines."Account Type" := PVEFTLines2."Account Type";
                        EFTLines."Account No." := PVEFTLines2."Account No";
                        EFTLines.Description := PVEFTLines2.Description;
                        EFTLines.Amount := PVEFTLines2.Amount;
                        EFTLines."Gross Amount" := PVEFTLines2."Amount (LCY)";
                        EFTLines.Tax := PVEFTLines2."W/Tax Amount" + PVEFTLines2."Retention  Amount" + PVEFTLines2."W/T VAT Amount";
                        EFTLines."Source Document No." := PVEFTLines2."Source Document No.";
                        EFTLines.eslip := PVEFTLines2.eslip;
                        EFTLines."Source Document Type" := PVEFTLines2."Source Document Type";
                        EFTLines."Source Record ID" := PVEFTLines2."Source RecordID";
                        EFTLines."Payee Bank Code" := PVEFTLines2."Payee Bank Code";
                        EFTLines."Payee Bank Name" := PVEFTLines2."Payee Bank Name";
                        EFTLines.Validate("Payee Bank Code");
                        EFTLines."Payee Bank Branch Code" := PVEFTLines2."Payee Bank Branch Code";
                        EFTLines."Payee Bank Branch Name" := PVEFTLines2."Payee Bank Branch Name";
                        EFTLines.Validate("Payee Bank Code");
                        EFTLines."Payee Bank Account No." := PVEFTLines2."Payee Bank Account No.";
                        EFTLines."Payee Bank Account Name" := PVEFTLines2."Payee Bank Acc Name";
                        EFTLines."Global Dimension 1 Code" := PVEFTLines2.HeaderDimension1Code;
                        EFTLines."Pay Mode" := PVEFTLines2."Payment Mode1";
                        EFTLines.Modify();
                        UpdateSourceDocument(EFTLines);
                    end
                    else begin
                        LineNo2 += 1;
                        EFTLines.Init();
                        EFTLines."Document No." := No;
                        EFTLines."Line No." := LineNo2;
                        EFTLines."Account Type" := PVEFTLines2."Account Type";
                        EFTLines."Account No." := PVEFTLines2."Account No";
                        EFTLines.Description := PVEFTLines2.Description;
                        EFTLines."Gross Amount" := PVEFTLines2."Amount (LCY)";
                        EFTLines.Tax := PVEFTLines2."W/Tax Amount" + PVEFTLines2."Retention  Amount" + PVEFTLines2."W/T VAT Amount";
                        EFTLines.Amount := PVEFTLines2.Amount;
                        EFTLines."Source Document No." := PVEFTLines2."Source Document No.";
                        EFTLines.eslip := PVEFTLines2.eslip;
                        EFTLines."Source Document Type" := PVEFTLines2."Source Document Type";
                        EFTLines."Source Record ID" := PVEFTLines2."Source RecordID";
                        EFTLines."Payee Bank Code" := PVEFTLines2."Payee Bank Code";
                        EFTLines."Payee Bank Name" := PVEFTLines2."Payee Bank Name";
                        EFTLines.Validate("Payee Bank Code");
                        EFTLines."Payee Bank Branch Code" := PVEFTLines2."Payee Bank Branch Code";
                        EFTLines."Payee Bank Branch Name" := PVEFTLines2."Payee Bank Branch Name";
                        EFTLines.Validate("Payee Bank Branch Code");
                        EFTLines."Payee Bank Account No." := PVEFTLines2."Payee Bank Account No.";
                        EFTLines."Payee Bank Account Name" := PVEFTLines2."Payee Bank Acc Name";
                        EFTLines."Global Dimension 1 Code" := PVEFTLines2.HeaderDimension1Code;
                        EFTLines."Pay Mode" := PVEFTLines2."Payment Mode1";
                        EFTLines.Insert();
                        //Update Source Document
                        UpdateSourceDocument(EFTLines);
                    end;
                until PVEFTLines2.Next() = 0;
            end;
        end;
    end;

    procedure GetEslipNo(docNo: Code[20]): Text[250];
    var
        payments: Record Payments;
    begin
        payments.reset();
        payments.SetRange("No.", docNo);
        if payments.FindFirst() then begin
            if (payments."PV Type" = payments."PV Type"::Tax) then
                Exit(payments.Eslip);
        end;
        exit('');


    end;

    local procedure GetSourceDocType(var PVLines: Record "PV Lines"): Text
    begin
        case
            PVLines."Payment Type2" of
            PVLines."Payment Type2"::"Payment Voucher":
                begin
                    case
                        PVLines."PV Type2" of
                        PVLines."PV Type2"::Payroll:
                            begin
                                exit('Payroll Payment Voucher');
                            end;
                        PVLines."PV Type2"::Refund:
                            begin
                                exit('Refund Payment Voucher');
                            end;
                        PVLines."PV Type"::"Retention Payment":
                            begin
                                exit('Retention Payment Voucher');
                            end;
                        PVLines."PV Type2"::Tax:
                            exit('Tax Payment Voucher');
                        PVLines."PV Type2"::Retention:
                            exit('Retention Movement Voucher');
                        PVLines."PV Type2"::"Revenue Sweep Voucher":
                            exit('Revenue Sweep Voucher');
                        else
                            exit('Normal Payment Voucher')
                    end;
                end;
            PVLines."Payment Type2"::Imprest:
                exit('Safari Imprest Voucher');
            PVLines."Payment Type2"::"Special Imprest":
                exit('Special Imprest Voucher');
            PvLines."Payment Type2"::"Standing Imprest":
                exit('Standing Imprest Voucher')
            else
                exit(Format(PVLines."Payment Type2"));
        end;
    end;

    procedure UpdateSourceDocument(var EFTLines: Record "EFT Line")
    var
        PVLine: Record "PV Lines";
        Payment: Record Payments;
        RecRef: RecordRef;
    begin
        if RecRef.Get(EFTLines."Source Record ID") then;
        case
            RecRef.Number of
            Database::"PV Lines":
                begin
                    RecRef.SetTable(PVLine);
                    PVLine."EFT Code" := EFTLines."Document No.";
                    PVLine.Modify();
                end;
            Database::Payments:
                begin
                    RecRef.SetTable(Payment);
                    Payment."EFT Code" := EFTLines."Document No.";
                    Payment.Modify();
                end;
        end;
    end;

    procedure VoidHeader(DocNo: Code[20])
    var
        ReasonToReject: Text;
        // CommentPage: Page "Rejecti/on Comment";
        Lines: Record "EFT Line";
        EFTHeader: Record "EFT Header";
    begin
        if EFTHeader.Get(DocNo) then begin
            with EFTHeader do begin
                ReasonToReject := "Reason for Voiding";
                // clear(CommentPage);
                // CommentPage.SetRejectComment(ReasonToReject);
                // if CommentPage.RunModal() = Action::OK then
                //     ReasonToReject := CommentPage.GetRejectComment();

                if ReasonToReject = '' then
                    Error('Please provide a reason to void');

                Lines.Reset;
                Lines.Setrange("Document No.", "No");
                Lines.Setrange(Voided, false);
                if Lines.FindSet() then begin
                    Lines.ModifyAll("Reason for Voiding", ReasonToReject);
                    Lines.ModifyAll(Voided, true, true);
                end;
                //Check the header
                "Reason for Voiding" := ReasonToReject;
                Voided := true;
                Validate(Voided);
                Modify();
            end;
        end;
    end;

    procedure VoidLines(DocNo: Code[20])
    var
        ReasonToReject: Text;
        // CommentPage: Page "Rejection Comment";
        Lines: Record "EFT Line";
        EFTHeader: Record "EFT Header";
    begin
        if EFTHeader.Get(DocNo) then begin
            with EFTHeader do begin
                ReasonToReject := "Reason for Voiding";
                // clear(CommentPage);
                // CommentPage.SetRejectComment(ReasonToReject);
                // if CommentPage.RunModal() = Action::OK then
                //     ReasonToReject := CommentPage.GetRejectComment();

                if ReasonToReject = '' then
                    Error('Please provide a reason to void');

                Lines.Reset;
                Lines.Setrange("Document No.", DocNo);
                Lines.Setrange(Voided, false);
                Lines.Setrange(Select, true);
                if Lines.FindSet() then begin
                    Lines.ModifyAll("Reason for Voiding", ReasonToReject);
                    Lines.ModifyAll(Voided, true, true);
                end;
            end;
        end;
    end;
}

