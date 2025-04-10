
table 69729 "Employment Offer Compensation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Offer ID"; Code[30])
        {
            TableRelation = "Employment Offer";
        }
        field(2; "Earnings Code"; Code[30])
        {
            // TableRelation = EarningsX;

            // trigger OnValidate()
            // begin
            //     EarningsX.Reset;
            //     EarningsX.SetRange(Code, "Earnings Code");
            //     if EarningsX.FindFirst then begin
            //         Description := EarningsX.Description
            //     end
            // end;
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Pay Frequency"; Option)
        {
            OptionCaption = 'Monthly Payroll,Daily Wage';
            OptionMembers = "Monthly Payroll","Daily Wage";
        }
        field(5; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(6; "Line Amount"; Decimal)
        {
        }
        field(7; "Line Amount(LCY)"; Decimal)
        {
        }
        field(8; "Payroll Start Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }

    keys
    {
        key(Key1; "Offer ID", "Earnings Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    // EarningsX: Record EarningsX;
}

