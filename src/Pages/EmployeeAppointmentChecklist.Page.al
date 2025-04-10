Page 52194055 "Employee Appointment Checklist"
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
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19077253;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Appointment Checklist")
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
        Text19077253: label 'Appointment Checklist';
}

