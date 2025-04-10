Page 52194048 "Emp Qualification"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    SourceTableView = where(Status=const(Active));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19020326;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Employee Qualification")
            {
                SubPageLink = "Employee No."=field("No.");
            }
        }
    }

    actions
    {
    }

    var
        KPACode: Code[20];
        Text19020326: label 'Qualification';
}

