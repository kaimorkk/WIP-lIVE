Page 52194179 "Filling Card"
{
    PageType = Card;
    SourceTable = "Vehicle Filling1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FillingNo;"Filling No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(RegistrationNo;"Registration No")
                {
                    ApplicationArea = Basic;
                }
                field(DriverNo;"Driver No")
                {
                    ApplicationArea = Basic;
                }
                field(DriverName;"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field(FillingDate;"Filling Date")
                {
                    ApplicationArea = Basic;
                }
                field(OilDrawnLitres;"Oil Drawn (Litres)")
                {
                    ApplicationArea = Basic;
                }
                field(FuelDrawnLitres;"Fuel Drawn (Litres)")
                {
                    ApplicationArea = Basic;
                }
                field(VoucherNo;"Voucher No.")
                {
                    ApplicationArea = Basic;
                }
                field(SpeedReadingonRef;"Speed Reading on Ref")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReading;"Kms Covered")
                {
                    ApplicationArea = Basic;
                    Caption = 'Odometer Reading';
                }
                field(CostperLitre;"Cost per Litre")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

