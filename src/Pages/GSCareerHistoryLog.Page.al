Page 52194325 "GS Career History Log"
{
    Editable = true;
    PageType = List;
    SourceTable = "HR Career History1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo;"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeFirstName;"Employee First Name")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeLastName;"Employee Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle;"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(FullPartTime;"Full/Part Time")
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(DateOfEvent;"Date Of Event")
                {
                    ApplicationArea = Basic;
                }
                field(CareerEvent;"Career Event")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
                field(Reason;Reason)
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                }
                field(Pay;Pay)
                {
                    ApplicationArea = Basic;
                }
                field(Appraisal;Appraisal)
                {
                    ApplicationArea = Basic;
                }
                field(ExitInterview;"Exit Interview")
                {
                    ApplicationArea = Basic;
                }
                field(Grievance;Grievance)
                {
                    ApplicationArea = Basic;
                }
                field(PayPeriod;"Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field(MedicalAidNumber;"Medical Aid Number")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleRegistration;"Vehicle Registration")
                {
                    ApplicationArea = Basic;
                }
                field(MaritalStatus;"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Joined;Joined)
                {
                    ApplicationArea = Basic;
                }
                field(DisciplinaryDate;"Disciplinary Date")
                {
                    ApplicationArea = Basic;
                }
                field(Disciplinary;Disciplinary)
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        if UserSetup.Get(UserId) then
          SetRange("Employee No.",UserSetup."Employee No.");
    end;

    var
        UserSetup: Record "User Setup";
        UserID: Code[20];
}

