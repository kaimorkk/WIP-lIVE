
table 70168 "Bid Equipment Specification"
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
            Caption = 'No';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Equipment Type Code"; Code[60])
        {
            //TableRelation = "Works Equipment Type".Code;
        }
        field(4; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Ownership Type"; Option)
        {
            OptionCaption = ',Owned,Leased,Purchase Proposal';
            OptionMembers = ,Owned,Leased,"Purchase Proposal";
        }
        field(6; "Equipment Serial"; Code[50])
        {
            Caption = 'Equipment Serial/Registration No.';
            Description = 'Equipment Serial/Registration No.';
        }
        field(7; "Equipment Usability Code"; Option)
        {
            OptionCaption = ',Excellent,Good,Fair,Beyond  Useful Life';
            OptionMembers = ,Excellent,Good,Fair,"Beyond  Useful Life";
        }
        field(8; "Equipment Condition Code"; Option)
        {
            OptionCaption = ',New Eqpm,Reconditioned Eqpm,Serviced Eqpm';
            OptionMembers = ,"New Eqpm","Reconditioned Eqpm","Serviced Eqpm";
        }
        field(9; "Qty of Equipment"; Decimal)
        {
            Editable = true;
        }
        field(10; Description; Text[100])
        {
        }
        field(11; Blocked; Boolean)
        {
        }
        field(12; "Years of Previous Use"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Equipment Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

