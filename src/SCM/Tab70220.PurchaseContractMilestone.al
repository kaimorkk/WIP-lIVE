
table 70220 "Purchase Contract Milestone"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(3; "Milestone Code"; Code[50])
        {
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Payment Instalment Code"; Code[50])
        {
            TableRelation = "Purchase Contract Payment Term"."Instalment Code" where("No." = field("No."));
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

