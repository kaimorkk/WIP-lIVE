Page 52194411 "Owner Details"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Owner Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2;"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmailAddress;"Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(PercentageOwnership;"Percentage Ownership")
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

