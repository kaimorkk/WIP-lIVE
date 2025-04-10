Table 52193492 "Transaction Charges"
{

    fields
    {
        field(1; "Transaction Type"; Code[20])
        {
            TableRelation = "Transaction Types";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Charge Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Charges - FOSA";

            trigger OnValidate()
            begin
                if Charges.Get("Charge Code") then begin
                    Description := Charges.Description;
                    "Charge Amount" := Charges."Charge Amount";
                    "Percentage of Amount" := Charges."Percentage of Amount";
                    "Use Percentage" := Charges."Use Percentage";
                    "Minimum Amount" := Charges.Minimum;
                    "Maximum Amount" := Charges.Maximum;
                    "G/L Account" := Charges."GL Account";
                    //"Due Amount":=;
                    //"Due to Account":=;
                    "Charges 1-999" := Charges."Charges 1-199";
                    "Charges 1000-19999" := Charges."Charges 200-999";
                    "Charges 20000-49999" := Charges."Charges 1000-1999";
                    "Charges 50000-99999" := Charges."Charges 2000-2500";
                    "Charges 100000" := Charges."Charges 2501";

                end;
            end;
        }
        field(4; Description; Text[80])
        {
        }
        field(5; "Charge Amount"; Decimal)
        {
        }
        field(6; "Percentage of Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Charge Amount" > 100 then
                    Error('You cannot exceed 100. Please enter a valid number.');
            end;
        }
        field(7; "Use Percentage"; Boolean)
        {
        }
        field(8; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(9; "Minimum Amount"; Decimal)
        {
        }
        field(10; "Maximum Amount"; Decimal)
        {
        }
        field(11; "Due Amount"; Decimal)
        {
        }
        field(12; "Due to Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(13; "Charges 1-999"; Decimal)
        {
        }
        field(14; "Charges 1000-19999"; Decimal)
        {
        }
        field(15; "Charges 20000-49999"; Decimal)
        {
        }
        field(16; "Charges 50000-99999"; Decimal)
        {
        }
        field(17; "Charges 100000"; Decimal)
        {
        }
        field(18; "PayOut 50-100"; Decimal)
        {
        }
        field(19; "PayOut 100-200"; Decimal)
        {
        }
        field(20; "PayOut 201-300"; Decimal)
        {
        }
        field(21; "PayOut 301-400"; Decimal)
        {
        }
        field(22; "PayOut 401-500"; Decimal)
        {
        }
        field(23; "PayOut 501-600"; Decimal)
        {
        }
        field(24; "PayOut 601 & above"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Transaction Type", "Line No.")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    var
        cashierr: Record Receipts;
        // LOAN: Record Loans;
        // type: Record "Loan Repayment Schedule";
        PostContributions: Codeunit "Receipt Management";
        cust: Record Customer;
        // LRSchedule: Record "Loan Repayment Schedule";
        Balance: Decimal;
        CashierRec: Record Receipts;
        Charges: Record "Charges - FOSA";
}

