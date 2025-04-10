
table 70210 "Bid Preference & Reservation"
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
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; "AGPO Certificate No"; Code[30])
        {
        }
        field(5; "Registered Special Group"; Code[30])
        {
            TableRelation = "Special Vendor Category".Code;
        }
        field(6; "Products/Service Category"; Text[80])
        {
        }
        field(7; "Certificate Effective Date"; Date)
        {
        }
        field(8; "Certificate Expiry Date"; Date)
        {
        }
        field(9; "Certifying Agency"; Text[50])
        {
        }
        field(10; Blocked; Boolean)
        {
        }
        field(11; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Entry No", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

