
table 70202 "PRN Equipment Specification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[50])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Equipment Type"; Code[60])
        {
            //TableRelation = "Works Equipment Type".Code;
        }
        field(4; Category; Code[50])
        {
            // TableRelation = "Works Equipment Category".Code;
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Minimum Required Qty"; Decimal)
        {
        }
        field(7; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Equipment Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

