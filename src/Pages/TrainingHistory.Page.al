Page 52194122 "Training History"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                CaptionClass = Text19036747;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Training Request Lines")
            {
                Editable = false;
                SubPageLink = "Employee No"=field("No."),
                              Status=const(Released);
            }
        }
    }

    actions
    {
    }

    var
        KPAObjectives: Record "KPA Objectives1";
        KPACode: Code[20];
        Text19036747: label 'Training History';
}

