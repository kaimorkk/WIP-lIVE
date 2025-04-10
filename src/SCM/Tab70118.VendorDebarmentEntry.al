
table 70118 "Vendor Debarment Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry no"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Source Voucher No."; Code[30])
        {
        }
        field(3; "Document Type"; Option)
        {
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(4; "Firm Name"; Text[80])
        {
        }
        field(5; "Reason Code"; Code[30])
        {
            TableRelation = "Debarment Reason Code".Code;
        }
        field(6; Description; Text[80])
        {
        }
        field(7; "Ineligibility Start Date"; Date)
        {
            Description = 'Date available on Debarment Voucher';
            Editable = false;
        }
        field(8; "Ineligibility End Date"; Date)
        {
            Description = 'Date available on Debarment Voucher';
            Editable = false;
        }
        field(9; "Reinstatement Date"; Date)
        {
            Description = 'Date available on Reinstatement Voucher';
            Editable = false;
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
        field(16; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry no", "Source Voucher No.", "Document Type")
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
}

