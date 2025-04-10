Page 52194100 "Employee Disciplinary Cases"
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
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19064291;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Emp Disciplinary Cases")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(MonetaryImplications)
            {
                Caption = 'Monetary Implications';
                action(Deductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No"=field("No."),
                                  Type=const(Deduction);
                }
            }
        }
    }

    var
        KPACode: Code[20];
        Text19064291: label 'Disciplinary Cases';
}

