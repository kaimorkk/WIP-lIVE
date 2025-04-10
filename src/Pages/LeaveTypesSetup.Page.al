Page 52194087 "Leave Types Setup"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    SourceTable = "Leave Types1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Days;Days)
                {
                    ApplicationArea = Basic;
                }
                field(UnlimitedDays;"Unlimited Days")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Balance;Balance)
                {
                    ApplicationArea = Basic;
                }
                field(MaxCarryForwardDays;"Max Carry Forward Days")
                {
                    ApplicationArea = Basic;
                }
                field(AnnualLeave;"Annual Leave")
                {
                    ApplicationArea = Basic;
                }
                field(InclusiveofHolidays;"Inclusive of Holidays")
                {
                    ApplicationArea = Basic;
                }
                field(InclusiveofSaturday;"Inclusive of Saturday")
                {
                    ApplicationArea = Basic;
                }
                field(InclusiveofSunday;"Inclusive of Sunday")
                {
                    ApplicationArea = Basic;
                }
                field(OffHolidaysDaysLeave;"Off/Holidays Days Leave")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

