Page 52193962 "Employee Bank List"
{
    CardPageID = "Employee Bank Account Card";
    PageType = List;
    SourceTable = "Employee Bank AccountX1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Name';
                }
                field(BankBranchNo;"Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name2;"Name 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
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
                field(PostCode;"Post Code")
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
                field(TelexNo;"Telex No.")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNo;"Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(TransitNo;"Transit No.")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(CountryCode;"Country Code")
                {
                    ApplicationArea = Basic;
                }
                field(County;County)
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo;"Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(TelexAnswerBack;"Telex Answer Back")
                {
                    ApplicationArea = Basic;
                }
                field(LanguageCode;"Language Code")
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
}

