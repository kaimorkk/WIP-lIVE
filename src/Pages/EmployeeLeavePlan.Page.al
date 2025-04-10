Page 52193983 "Employee Leave Plan"
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
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfAppointment; "Date Of Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Of Appointment';
                }
            }
            part(Control1000000028; "Employee Plan Details")
            {
                Editable = true;
                Enabled = true;
                SubPageLink = "Employee No" = field("No.");
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin

            SetRange("No.", UserSetup."Employee No.");

        end;
    end;

    var
        UserSetup: Record "User Setup";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

