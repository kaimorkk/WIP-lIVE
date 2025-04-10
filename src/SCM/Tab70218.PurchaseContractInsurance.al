
table 70218 "Purchase Contract Insurance"
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
        field(3; "Insurance Type"; Code[50])
        {
            TableRelation = "Insurance Type".Code;

            trigger OnValidate()
            begin
                InsuranceType.Reset;
                InsuranceType.SetRange(Code, "Insurance Type");
                if InsuranceType.FindSet then begin
                    Description := InsuranceType.Description;
                end;
            end;
        }
        field(4; "Policy Cover Type"; Option)
        {
            OptionCaption = ',Third Party,Comprehensive';
            OptionMembers = ,"Third Party",Comprehensive;
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Policy Coverage (LCY)"; Decimal)
        {
        }
        field(7; "Policy ID"; Code[50])
        {
        }
        field(8; "Insurance Company"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Insurance Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        InsuranceType: Record "Insurance Type";
}

