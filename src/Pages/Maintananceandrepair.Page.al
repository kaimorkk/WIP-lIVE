Page 52194330 "Maintanance and repair"
{
    ApplicationArea = Basic;
    SourceTable = "Maintanance and Repair";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ItemNo;"Item No.")
                {
                    ApplicationArea = Basic;
                }
                field(ItemDescription;"Item Description")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProvider;"Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName;"Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceIntervalType;"Service Interval Type")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceRepairDescription;"Service/Repair Description")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceIntervals;"Service Intervals")
                {
                    ApplicationArea = Basic;
                }
                field(ServicePeriod;"Service Period")
                {
                    ApplicationArea = Basic;
                }
                field(DateofService;"Date of Service")
                {
                    ApplicationArea = Basic;
                }
                field(CurrentOdometerReading;"Current Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceMileage;"Service Mileage")
                {
                    ApplicationArea = Basic;
                }
                field(NextService;"Next Service")
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

