Table 52193463 "Security Type"
{

    fields
    {
        field(1; "Product Code"; Code[20])
        {
            NotBlank = true;
            //TableRelation = "Loan Product Types".Code;
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Security and Attachment Items".Code where("Used on Loans" = filter(true));

            trigger OnValidate()
            begin
                if SecCode.Get(Code) then begin
                    Description := SecCode.Description;
                    Used := SecCode."Used on Loans";
                end;
            end;
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Used; Boolean)
        {
        }
        field(5; "Item No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Product Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Charges: Record Charges;
        CustPost: Record "Customer Posting Group";
        SecCode: Record "Security and Attachment Items";
}

