 
   table 50018 "EFT Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Source Record ID"; RecordID)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Description"; Text[1048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Account Type"; Enum "Gen. Journal Account Type")
        {
            ValuesAllowed = Customer, Vendor, Employee, "G/L Account";
        }
        field(7; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer."No."
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee;
        }
        field(8; "Payee Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Bank Accounts"."Bank Code";
            trigger OnValidate()
            var
                PRBanks: Record "PR Bank Accounts";
            begin
                if PRBanks.Get("Payee Bank Code") then
                    "Payee Bank Name" := PRBanks."Bank Name";
            end;
        }
        field(9; "Payee Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Payee Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Payee Bank Code"));
            trigger OnValidate()
            var
                PRBankBranches: Record "PR Bank Branches";
            begin
                if PRBankBranches.Get("Payee Bank Branch Code", "Payee Bank Code") then
                    "Payee Bank Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(11; "Payee Bank Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Payee Bank Account No."; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Payee Bank Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Transferred"; Boolean)
        {
            Editable = false;
        }
        field(16; "Date Transferred"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Source Document Type"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Source Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(18; Transfered; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(19; Status; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(20; MerchantId; Text[200])
        {

        }
        field(21; RetrievalNumber; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(22; Paid; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = '1,2,1';
        }
        field(24; "Department Name"; Text[250])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Dimension Value".Name where("Global Dimension No." = const(1), Code = field("Global Dimension 1 Code")));
            CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
        }
        field(25; "Pay Mode"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Select"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Voided"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            begin
                if Voided then begin
                    TestField("Reason for Voiding");
                    "Date Voided" := CurrentDateTime;
                    "Voided By" := UserId;
                    RemoveSourceDocAttachment(Rec);
                end;
            end;
        }
        field(29; "Date Voided"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Voided By"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Reason for Voiding"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Gross Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; "Requires Exchequer Request"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("EFT Header"."Requires Exchequer Request" where(No = field("Document No.")));
            Editable = false;
        }
        field(35; "Exchequer Request No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Net Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(37; eslip; Code[250])
        {

        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        DimensionValue: Record "Dimension Value";

    trigger OnDelete()
    var
        RecRef: RecordRef;
        PVLine: Record "PV Lines";
    begin
        RemoveSourceDocAttachment(Rec);
    end;

    procedure RemoveSourceDocAttachment(EFTLine: Record "EFT Line")
    var
        PVLine: Record "PV Lines";
        Payment: Record Payments;
        RecRef: RecordRef;
    begin
        if RecRef.Get(EFTLine."Source Record ID") then;
        case
            RecRef.Number of
            Database::"PV Lines":
                begin
                    RecRef.SetTable(PVLine);
                    PVLine."EFT Code" := '';
                    PVLine.Modify();
                end;
            Database::Payments:
                begin
                    RecRef.Settable(Payment);
                    Payment."EFT Code" := '';
                    Payment.Modify();
                end;
        end;
    end;

    procedure OpenDoc(EFTLines: Record "EFT Line")
    var
        Payments: Record Payments;
        AIE: Record "Auth. Inc. Expend. Header";
        RecRef, HeaderRecRef : RecordRef;
        PageMgt: Codeunit "Page Management Ext";
        PageId: Integer;
        PVLine: Record "PV Lines";
        AuthIncExpLine: Record "Auth. Inc Expend. Line";
    begin
        if RecRef.Get(EFTLines."Source Record ID") then;
        Commit;
        case
            RecRef.Number of
            Database::"PV Lines":
                begin
                    RecRef.SetTable(PVLine);
                    if Payments.Get(PVLine.No) then begin
                        if HeaderRecRef.Get(Payments.RecordId) then;
                    end;
                end;
            Database::"Auth. Inc Expend. Line":
                begin
                    RecRef.SetTable(AuthIncExpLine);
                    if AIE.Get(AuthIncExpLine."Document No.") then begin
                        if HeaderRecRef.Get(AIE.RecordId) then;
                    end;
                end;
        end;
        PageId := PageMgt.GetConditionalCardPageID(HeaderRecRef);
        case
            HeaderRecRef.Number of
            Database::Payments:
                begin
                    HeaderRecRef.SetTable(Payments);
                    Page.RunModal(PageId, Payments);
                end;
            Database::"Auth. Inc. Expend. Header":
                begin
                    HeaderRecRef.SetTable(AIE);
                    Page.RunModal(PageId, AIE);
                end;
        end;
    end;
}