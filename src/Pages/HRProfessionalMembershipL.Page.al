Page 52194126 "HR Professional Membership L"
{
    CardPageID = "HR Professional Membership";
    PageType = List;
    SourceTable = "HR Professional Membership1";
    SourceTableView = sorting("Membership No")
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                field(MembershipNo; "Membership No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName; FullName1("Employee No."))
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field(DateAdmitted; "Date Admitted")
                {
                    ApplicationArea = Basic;
                }
                field(Organisation; Organisation)
                {
                    ApplicationArea = Basic;
                }
                field(MembershipType; "Membership Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field(AnnualFee; "Annual Fee")
                {
                    ApplicationArea = Basic;
                }
                field(RenewalDate; "Renewal Date")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyPaysFees; "Company Pays Fees")
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
                action(ProfessionalMembershipCard)
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Membership Card';
                    RunObject = Page "HR Professional Membership";
                    RunPageLink = "Employee No." = field("Employee No.");
                    ShortCutKey = 'Shift+Ctrl+L';
                }
            }
        }
    }

    var
        Emp: Record "HR Professional Membership1";
        UserSetup: Record Employee;


    procedure FullName1(EmployeeNumber: Code[20]) Name: Text[150]
    var
        Employee: Record Employee;
        OK: Boolean;
    begin
        OK := Employee.Get("Employee No.");
        if OK then Name := Employee.FullName();
    end;
}

