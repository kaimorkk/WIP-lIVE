table 96051 "Tender Alert Setups"
{
    Caption = 'Tender Alert Setups';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }   
        field(2; "User Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3; "Transaction Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Editable = false;
        }
        field(5; "Subscription Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(6; "Invoice Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Unit of Measure";
        }
        field(8; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(9; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(10; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(11; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(12; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Item";
        }
        field(13; "SMS Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "E-Mail Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
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
