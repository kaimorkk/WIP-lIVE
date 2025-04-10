table 96010 "Licensing Setup"
{
    Caption = 'Licensing Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Licence Registration Nos."; Code[20])
        {
            Caption = 'Licence Registration Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Licence Renewal Nos."; Code[20])
        {
            Caption = 'Licence Renewal Nos.';
            TableRelation = "No. Series";
        }
        field(4; "Licence Restoration Nos."; Code[20])
        {
            Caption = 'Licence Restoration Nos.';
            TableRelation = "No. Series";
        }
        field(5; "Licence Reg. Categories Nos."; Code[20])
        {
            Caption = 'Licence Reg. Categories Nos.';
            TableRelation = "No. Series";
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
        field(7; "Licence Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(8; "User Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9; "Licensing Portal URL"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Licence Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(11; "Registration Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
        }
        field(13; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(14; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(15; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(16; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
