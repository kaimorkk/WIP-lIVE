 
table 52193641 "Pay Mode"
{
    DrillDownPageID = "Pay Mode";
    LookupPageID = "Pay Mode";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }

        field(4; Threshold; Decimal)
        {

        }
        field(5; "Default"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                PayMode: Record "Pay Mode";
            begin
                if Default then begin
                    PayMode.Reset();
                    PayMode.SetRange(Default, true);
                    PayMode.SetFilter(Code, '<>%1', Code);
                    if PayMode.FindFirst() then
                        Error('There can only be one Default Payment Method');
                end;
            end;
        }
        field(6; "IFT Code"; Boolean)
        {
            Caption = 'Internal Fund Transfer';
        }

        field(7; isEF; Boolean)
        {
            Caption = 'isEF';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Default)
        {
        }
        key(Key3; "IFT Code")
        {
        }
    }


    fieldgroups
    {
    }

    procedure GetDefaultClaimsPaymode(amount: decimal): Code[40]
    var
        PayMode: Record "Pay Mode";
    begin
        PayMode.reset();
        PayMode.SetRange(isEF, true);
        if PayMode.FindFirst() then begin
            if (amount < PayMode.Threshold) then
                exit(PayMode.Code)
            else
                exit(GetDefaultPayMode());
        end
        else
            Error('Kindly Enable EF Payment');
    end;


    procedure GetDefaultPayMode(): Code[40]
    var
        PayMode: Record "Pay Mode";
    begin
        PayMode.Reset();
        PayMode.SetRange(Default, true);
        if PayMode.FindFirst() then
            exit(PayMode.Code)
        //apply logic 
    end;

    procedure GetDefaultPayMode(DepositRefund: Record "Deposit Refund Buffer"): Code[40]
    var
        PayMode: Record "Pay Mode";
    begin
        if DepositRefund."Payment Type" in [11, 22, 33] then begin
            exit(GetIFTCode());
        end else begin
            PayMode.reset();
            PayMode.SetRange(isEF, true);
            if PayMode.FindFirst() then begin
                if (DepositRefund.Price < PayMode.Threshold) then
                    exit(PayMode.Code)
                else
                    exit(GetDefaultPayMode());


            end
            else
                Error('Kindly Enable EF Payment');

        end;
    end;

    procedure GetIFTCode(): Code[20]
    var
        PayMode: Record "Pay Mode";
    begin
        PayMode.Reset();
        PayMode.SetRange("IFT Code", true);
        if PayMode.FindFirst() then
            exit(PayMode.Code);
    end;

    procedure GetDescription(Code: Code[30]): Text
    var
        PayMode: Record "Pay Mode";
    begin
        if PayMode.Get(Code) then
            exit(PayMode.Description)
    end;
}

