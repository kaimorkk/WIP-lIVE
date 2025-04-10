Page 52194267 "GS Training Requests List"
{
    //CardPageID = 51511459;
    PageType = List;
    SourceTable = "Training Request1";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Period;Period)
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
                field(CountryCode;"Country Code")
                {
                    ApplicationArea = Basic;
                }
                field(CBKWebsiteAddress;"CBK Website Address")
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
                field(Budget;Budget)
                {
                    ApplicationArea = Basic;
                }
                field(Actual;Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment;Commitment)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"GL Account")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetName;"Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field(AvailableFunds;"Available Funds")
                {
                    ApplicationArea = Basic;
                }
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingObjective;"Training Objective")
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(CommisionerNo;"Commisioner No")
                {
                    ApplicationArea = Basic;
                }
                field(CommissionerName;"Commissioner Name")
                {
                    ApplicationArea = Basic;
                }
                field(Commissioner;Commissioner)
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
         SetRange("User ID",UserId);
    end;
}

