Page 52193565 "Next of Kin - FOSA"
{
    Caption = 'Account''s Next of Kin List';
    PageType = Card;
    SourceTable = "Next of Kin FOSA";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;"ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(Relationship;Relationship)
                {
                    ApplicationArea = Basic;
                }
                field(DateofBirth;"Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Beneficiary;Beneficiary)
                {
                    ApplicationArea = Basic;
                }
                field(Allocation;"%Allocation")
                {
                    ApplicationArea = Basic;
                }
                field(Telephone;Telephone)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
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
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(Fax;Fax)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
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

