Page 50014 "HOD Training Plans list"
{
    ApplicationArea = Basic;
    CardPageID = "Training Request HR";
    Editable = false;
    PageType = List;
    SourceTable = "Training Request1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution;"Training Insitution")
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(TuitionFee;"Tuition Fee")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiem;"Per Diem")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicket;"Air Ticket")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCost;"Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(CourseTitle;"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(PlannedStartDate;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedEndDate;"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRate;"Exchange Rate")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCostLCY;"Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                }
                field(AvailableFunds;"Available Funds")
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
        UserRec.Reset;
        if UserRec.Get(UserId) then
        // Emp.RESET;
         if Emp.Get(UserRec."Employee No.") then begin
           SetRange(Directorate,Emp."Global Dimension 1 Code");
           SetRange("Department Code",Emp."Global Dimension 2 Code");
         end;
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

