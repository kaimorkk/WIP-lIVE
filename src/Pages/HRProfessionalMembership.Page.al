Page 52194125 "HR Professional Membership"
{
    PageType = Card;
    SourceTable = "HR Professional Membership1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(MembershipNo;"Membership No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeFirstName;"Employee First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateAdmitted;"Date Admitted")
                {
                    ApplicationArea = Basic;
                }
                field(RenewalDate;"Renewal Date")
                {
                    ApplicationArea = Basic;
                }
                field(Organisation;Organisation)
                {
                    ApplicationArea = Basic;
                }
                field(MembershipType;"Membership Type")
                {
                    ApplicationArea = Basic;
                }
                field(MembershipDescription;"Membership Description")
                {
                    ApplicationArea = Basic;
                }
                field(AnnualFee;"Annual Fee")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ProfessionalMembership)
            {
                Caption = 'Professional Membership';
                action(ProfessionalMembershipList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Membership List';
                    RunObject = Page "HR Professional Membership L";
                }
            }
        }
    }

    var
        CalDate: Codeunit "HR Dates";
}

