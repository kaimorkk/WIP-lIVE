
table 70214 "Purchase Contract Documents"
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
        }
        field(3; "Document Type ID"; Code[30])
        {
            TableRelation = "Procurement Doc Template Line"."Procurement Document Type" where("Procurement Process" = filter("Contract Issuance"));
        }
        field(4; Description; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Document Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

