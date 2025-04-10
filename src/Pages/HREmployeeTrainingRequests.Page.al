Page 50021 "HR Employee Training Requests"
{
    ApplicationArea = Basic;
    CardPageID = "HR Employee Training Request";
    Editable = false;
    PageType = List;
    SourceTable = "ESS Training Request1";
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
                field(DepartmentCode;"Department Code")
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
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName;"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName;"Directorate Name")
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
                field(DateofTravel;"Date of Travel")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiemDays;"Per Diem Days")
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
                field(TrainingOfficerStatus;"TO Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Officer Status';
                }
                field(TrainingOfficerRemarks;"TO Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Officer Remarks';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //SETRANGE("User ID",USERID);
    end;
}

