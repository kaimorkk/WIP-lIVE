Page 52194090 "Employee Off/Holidays Worked"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000028;"Off/Holiday Worked")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
    }
}

