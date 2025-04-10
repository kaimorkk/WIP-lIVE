Page 52193452 "Branches Card"
{
    PageType = Card;
    SourceTable = Branches;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(BranchCode;"Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field(BranchName;"Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Picture;Picture)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communications)
            {
                Caption = 'Communications';
                field(PhysicalAddress;"Physical Address")
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
                field(Contact;Contact)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode;"Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(EMail;"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage;"Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000018;Links)
            {
                Visible = true;
            }
            systempart(Control1000000014;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

