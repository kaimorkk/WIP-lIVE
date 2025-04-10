Page 52193959 "Employee Bank Account Card"
{
    PageType = Card;
    SourceTable = "Employee Bank AccountX1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(BankBranchNo;"Bank Branch No.")
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
                field(PostCodeCity;"Post Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code/City';
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
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(BranchName;"Name 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
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
    }

    var
        Mail: Codeunit Mail;
}

