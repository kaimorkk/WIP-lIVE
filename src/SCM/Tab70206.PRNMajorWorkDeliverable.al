
table 70206 "PRN Major Work Deliverable"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

