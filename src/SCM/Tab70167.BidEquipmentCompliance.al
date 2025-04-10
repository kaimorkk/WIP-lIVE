
table 70167 "Bid Equipment Compliance"
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
        field(3; "Equipment Type Code"; Code[60])
        {
            //TableRelation = "Works Equipment Type".Code;
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Total No. of Equipment"; Decimal)
        {
            Description = 'Un-editable field that sums up the number of equipment defined on the Bid Equipment Ownership Table';
            Editable = false;
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(8; "Minimum Required Quantity"; Integer)
        {
        }
        field(9; "Actual Owned Quantity"; Decimal)
        {
        }
        field(10; "Actual Leased Equipment"; Decimal)
        {
        }
        field(11; "Total Owned/Leased Quantity"; Decimal)
        {
        }
        field(12; "Compliance Check"; Text[50])
        {
        }
        field(13; "Equipment Counter"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Equipment Type Code", "Equipment Counter")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

