Page 52193687 "Departments - Employer Card111"
{
    Caption = 'Departments';
    PageType = Card;
    SourceTable = Departments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(SearchName;"Search Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Contacts)
            {
                field(PhoneNo;"Phone No.")
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
                field(EMail;"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage;"Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000016;Links)
            {
                Visible = true;
            }
            systempart(Control1000000015;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

