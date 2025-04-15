codeunit 57004 "Tax Calculation"
{
    trigger OnRun()
    begin
    end;

    procedure CalculateTax(Rec: Record "PV Lines"; CalculationType: Option VAT,"W/Tax",Retention) Amount: Decimal
    begin
        case CalculationType of
            Calculationtype::VAT:
                begin
                    Amount := (Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec."Amount (LCY)";
                end;
            Calculationtype::"W/Tax":
                begin
                    Amount := (Rec."Amount (LCY)" - ((Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec."Amount (LCY)"))
                    * (Rec."W/Tax Rate" / 100);
                    //Amount := (Rec."Amount (LCY)") * (Rec."W/Tax Rate" / 100);
                end;
            Calculationtype::Retention:
                begin
                    Amount := (Rec."Amount (LCY)" * (Rec."Retention Rate" / 100));
                end;
        end;
    end;
}

