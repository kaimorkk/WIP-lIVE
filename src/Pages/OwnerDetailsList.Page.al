Page 52194410 "Owner Details List"
{
    Editable = false;
    PageType = List;
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
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
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
                field(EmailAddress;"Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PercentageOwnership;"Percentage Ownership")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000013;Notes)
            {
            }
            systempart(Control1000000014;MyNotes)
            {
            }
            systempart(Control1000000015;Links)
            {
            }
        }
    }

    actions
    {
    }
}

