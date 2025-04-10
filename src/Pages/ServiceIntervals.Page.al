Page 52194331 "Service Intervals"
{
    PageType = List;
    SourceTable = "Service Intervals";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ServiceIntervalCode;"Service Interval Code")
                {
                    ApplicationArea = Basic;
                }
                field(AssetClassCode;"Asset Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceIntervalDescription;"Service Interval Description")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceIntervalType;"Service Interval Type")
                {
                    ApplicationArea = Basic;
                }
                field(ServicePeriod;"Service Period")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceMileage;"Service Mileage")
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

