Table 52193471 "Product Charges"
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
            TableRelation = Charges.Code;

            trigger OnValidate()
            begin
                if Charges.Get(Code) then begin
                    Description := Charges.Description;
                    Amount := Charges."Charge Amount";
                    Percentage := Charges.Percentage;
                    "G/L Account" := Charges."G/L Account";
                    "Use Perc" := Charges."Use Perc";
                    IsInsurance := Charges.IsInsurance;
                    "Min Amount" := Charges."Min Amount";
                    "Max Amount" := Charges."Max Amount";
                    "Short term Insuarance" := Charges."Short term Insuarance";
                    //"Customer Posting Group":=Charges."Customer Posting Group";
                end;
            end;
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; Percentage; Decimal)
        {
        }
        field(6; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(7; "Use Perc"; Boolean)
        {
        }
        field(8; "Min Amount"; Decimal)
        {
        }
        field(9; "Max Amount"; Decimal)
        {
        }
        field(10; IsInsurance; Boolean)
        {
        }
        field(11; "Short term Insuarance"; Boolean)
        {
        }
        field(12; "Customer Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;

            trigger OnValidate()
            begin
                if "Customer Posting Group" <> '' then
                    if CustPost.Get("Customer Posting Group") then begin
                        "G/L Account" := CustPost."Receivables Account";
                        Validate("G/L Account");
                    end;
            end;
        }
    }

    keys
    {
        key(Key1; "Product Code", "Code")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        Charges: Record Charges;
        CustPost: Record "Customer Posting Group";
}

