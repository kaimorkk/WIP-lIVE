Page 52193688 "Departments - Employer List111"
{
    Caption = 'Departments List';
    PageType = List;
    SourceTable = Departments;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(SearchName;"Search Name")
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
                field(Blocked;Blocked)
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
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode;"Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(DateFilter;"Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000021;Links)
            {
                Visible = true;
            }
            systempart(Control1000000020;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Department Card")
            {
                ApplicationArea = Basic;
                RunObject = Page "Departments - Employer Card111";
                RunPageLink = "No."=field("No.");
            }
        }
    }
}

