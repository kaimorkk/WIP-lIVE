Page 52194130 "Employee KPA Objectives"
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
                field(GlobalDimension2Filter;"Global Dimension 2 Filter")
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
                field(PeriodFilter;"Pay Period Filter")
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Filter';
                }
            }
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19033491;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"KPA Objectives")
            {
                // SubPageLink = "Employee No"=field("No."),
                //               Period=field("Pay Period Filter");
            }
        }
    }

    actions
    {
    }

    var
        KPAObjectives: Record "KPA Objectives1";
        KPACode: Code[20];
        Text19033491: label 'Key Performance Areas Objectives';
}

