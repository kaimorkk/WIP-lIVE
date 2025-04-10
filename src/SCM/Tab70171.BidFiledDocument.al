
table 70171 "Bid Filed Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Purchase Header"."No.";
        }
        field(4; "Date Filed"; Date)
        {
        }
        field(5; "Vendor No"; Code[30])
        {
            TableRelation = Vendor;
        }
        field(6; "Procurement Document Type ID"; Code[30])
        {
            Description = 'Linked to Procurement Document Type table';
            TableRelation = "Procurement Document Type".Code;
        }
        field(7; Description; Text[250])
        {
        }
        field(8; "Certificate No."; Code[30])
        {
            Caption = 'External Document/Certificate No.';
            Description = 'External Document/Certificate No.';
        }
        field(9; "Issue Date"; Date)
        {
        }
        field(10; "Expiry Date"; Date)
        {
        }
        field(11; "File Name"; Text[50])
        {
            Caption = 'Specialized Provider Requirement';
        }
        field(12; "File Type"; Text[30])
        {
        }
        field(13; "File Extension"; Text[30])
        {
        }
        field(14; "Procurement Process"; Option)
        {
            OptionCaption = ',Registration,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional';
            OptionMembers = ,Registration,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional;
        }
        field(15; "Document Link"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

