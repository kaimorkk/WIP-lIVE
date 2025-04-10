
table 70219 "Purchase Contract Payment Term"
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
        field(3; "Instalment Code"; Code[50])
        {
        }
        field(4; "Payment Certificate Type"; Option)
        {
            OptionCaption = ',Advance,Interim,Final';
            OptionMembers = ,Advance,Interim,Final;
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Payment %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(8; "Planned Amount"; Decimal)
        {
        }
        field(9; "Planned Amount (LCY)"; Decimal)
        {
        }
        field(10; "Paid Amount"; Decimal)
        {
        }
        field(11; "Paid Amount (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Instalment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

