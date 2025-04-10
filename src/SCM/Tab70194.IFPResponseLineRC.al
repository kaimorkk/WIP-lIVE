
table 70194 "IFP Response Line RC"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "RFI Response"."Document No.";
        }
        field(3; "Procurement Category"; Code[30])
        {
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID";
        }
        field(4; "Responsibility Center Code"; Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(5; Description; Text[30])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

