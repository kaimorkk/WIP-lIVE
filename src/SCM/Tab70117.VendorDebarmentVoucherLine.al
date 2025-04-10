
table 70117 "Vendor Debarment Voucher Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Firm Name"; Text[80])
        {
        }
        field(5; "Debarment Reason Code"; Code[30])
        {
            TableRelation = "Debarment Reason Code".Code;

            trigger OnValidate()
            begin
                DebarmentReason.Reset;
                DebarmentReason.SetRange(Code, "Debarment Reason Code");
                if DebarmentReason.FindSet then begin
                    Description := DebarmentReason.Description;
                end;
            end;
        }
        field(6; Description; Text[80])
        {
            Editable = false;
        }
        field(7; "Ineligibility Start Date"; Date)
        {
            Description = 'Date available on Debarment Voucher';
        }
        field(8; "Ineligibility End Date"; Date)
        {
            Description = 'Date available on Debarment Voucher';
        }
        field(9; "Reinstatement Date"; Date)
        {
            Description = 'Date available on Reinstatement Voucher';
        }
        field(10; "Vendor No."; Code[10])
        {
            Description = 'Link to Vendor records, if the Vendor exists on our database';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Vendor No.");
                if Vend.FindSet then begin
                    "Firm Name" := Vend.Name;
                    "Tax Registration (PIN) No." := Vend."VAT Registration No.";
                    //"Incorporation/Reg No." := Vend."Incorporation Certificate No.";
                    Address := Vend.Address;
                    "Address 2" := Vend."Address 2";
                    "Country/Region Code" := Vend."Country/Region Code";
                end;
            end;
        }
        field(11; "Tax Registration (PIN) No."; Code[20])
        {
            Editable = false;
        }
        field(12; "Incorporation/Reg No."; Code[30])
        {
        }
        field(13; Address; Text[300])
        {
            Caption = 'Address';
        }
        field(14; "Address 2"; Text[300])
        {
            Caption = 'Address 2';
        }
        field(15; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(16; Posted; Boolean)
        {
            CalcFormula = lookup("Vendor Debarment Voucher".Posted where("Document No" = field("Document No")));
            FieldClass = FlowField;
        }
        field(17; "Apply To Entry No."; Integer)
        {
            Description = 'This field shall only be available on the Reinstatement voucher and it shall link to debarment entries of the vendor being reinstated  . The user has to s';
            TableRelation = "Vendor Debarment Entry"."Entry no";

            trigger OnValidate()
            begin
                VendDebarmentEntry.Reset;
                VendDebarmentEntry.SetRange("Entry no", "Apply To Entry No.");
                if VendDebarmentEntry.FindSet then begin
                    "Vendor No." := VendDebarmentEntry."Vendor No.";
                    "Tax Registration (PIN) No." := VendDebarmentEntry."Tax Registration (PIN) No.";
                    "Incorporation/Reg No." := VendDebarmentEntry."Incorporation/Reg No.";
                    Address := VendDebarmentEntry.Address;
                    "Address 2" := VendDebarmentEntry."Address 2";
                    "Country/Region Code" := VendDebarmentEntry."Country/Region Code";
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Vend: Record Vendor;
        DebarmentReason: Record "Debarment Reason Code";
        VendDebarmentEntry: Record "Vendor Debarment Entry";
}

