
table 70170 "Bid Insurance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'Entry No.';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Insurance Type"; Code[20])
        {
            Caption = 'Insurance Type';
            Description = 'Submitted Bid Security Form/Type';
            TableRelation = "Insurance Type".Code;
        }
        field(4; "Policy Cover Type"; Option)
        {
            OptionCaption = 'Third Party,Comprehensive';
            OptionMembers = "Third Party",Comprehensive;
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Policy Start Date"; Date)
        {
        }
        field(7; "Policy Expiry Date"; Date)
        {
        }
        field(8; "Issuer Insurance Name"; Text[50])
        {
        }
        field(9; "Insurance Address"; Text[50])
        {
        }
        field(10; "Policy No."; Code[10])
        {
        }
        field(11; "Policy Coverage (LCY)"; Decimal)
        {
            Caption = 'Bid Security Validity Expiry Date';
            Description = 'Bid Security Validity Expiry Date';
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Insurance Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

