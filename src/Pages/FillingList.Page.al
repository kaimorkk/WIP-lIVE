Page 52194180 "Filling List"
{
    ApplicationArea = Basic;
    CardPageID = "Filling Card";
    PageType = List;
    SourceTable = "Vehicle Filling1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field(FillingNo;"Filling No")
                {
                    ApplicationArea = Basic;
                }
                field(No;"No.")
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
                field(KmsCovered;"Kms Covered")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(RegistrationNo;"Registration No")
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

