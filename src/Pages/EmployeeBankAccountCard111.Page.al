Page 52193607 "Employee Bank Account Card111"
{
    PageType = Card;
    SourceTable = "Employee Bank Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(BankBranchNo;"Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNo;"Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(CountryCode;"Country Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Contact;Contact)
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                field(TelexNo;"Telex No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo;"Fax No.")
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
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(List)
            {
                ApplicationArea = Basic;
                ShortCutKey = 'F5';
            }
        }
    }
}

