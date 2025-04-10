
table 70016 "Tender Specifications"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Requisition No"; Code[50])
        {

            trigger OnValidate()
            begin
                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;
                */

            end;
        }
        field(2; "Bidder Name"; Text[150])
        {
        }
        field(3; "Bidder Email"; Text[60])
        {
        }
        field(4; "Line No"; Integer)
        {

            trigger OnValidate()
            begin
                /*
                IF ReqHeader.GET("Requisition No") THEN
                BEGIN
                 "Procurement Plan":=ReqHeader."Procurement Plan";
                 "Global Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
                END;
                */

            end;
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6; No; Code[10])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(7; Description; Text[250])
        {
        }
        field(8; Specification; Text[250])
        {
        }
        field(9; Complied; Boolean)
        {
        }
        field(10; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Bidder Name", "Bidder Email")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

