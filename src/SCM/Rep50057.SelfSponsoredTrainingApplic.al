report 50057 "Self Sponsored Training Applic"
{
    Caption = 'Self Sponsored Training Applic';
    RDLCLayout = 'Layouts/SelfSponsoredTraining.rdlc';
    dataset
    {
        dataitem(TrainingRequests; "Training Requests")
        {
            DataItemTableView = where("Funding Source" = filter(<> Internal));
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(Actual; Actual)
            {
            }
            column(ActualEndDate; "Actual End Date")
            {
            }
            column(ActualStartDate; "Actual Start Date")
            {
            }
            column(ApplicationDate; "Application Date")
            {
            }
            column(ApprovedCost; "Approved Cost")
            {
            }
            column(AvailableFunds; "Available Funds")
            {
            }
            column(BondPenalty; "Bond Penalty")
            {
            }
            column(Bonded; Bonded)
            {
            }
            column(BondingPeriod; "Bonding Period")
            {
            }
            column(Budget; Budget)
            {
            }
            column(BudgetName; "Budget Name")
            {
            }
            column(Code; "Code")
            {
            }
            column(Commitment; Commitment)
            {
            }
            column(Cost; Cost)
            {
            }
            column(CourseTitle; "Course Title")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(Description; Description)
            {
            }
            column(Duration; "Duration")
            {
            }
            column(DurationType; "Duration Type")
            {
            }
            column(EmployeeDepartment; "Employee Department")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(EstimatedCost; "Estimated Cost")
            {
            }
            column(EvaluationSummary; "Evaluation Summary")
            {
            }
            column(ExpectedBondEnd; "Expected Bond End")
            {
            }
            column(ExpectedBondStart; "Expected Bond Start")
            {
            }
            column(FundingSource; "Funding Source")
            {
            }
            column(GLAccount; "GL Account")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ImprestCreated; "Imprest Created")
            {
            }
            column(Local; "Local")
            {
            }
            column(Location; Location)
            {
            }
            column(MemoNo; "Memo No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(NoofParticipants; "No. of Participants")
            {
            }
            column(OtherCosts; "Other Costs")
            {
            }
            column(PlannedBudget; "Planned Budget")
            {
            }
            column(PlannedNotobeTrained; "Planned No. to be Trained")
            {
            }
            column(Provider; Provider)
            {
            }
            column(ProviderName; "Provider Name")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(Requestor; Requestor)
            {
            }
            column(RequiresFlight; "Requires Flight")
            {
            }
            column(ServiceProviderCost; "Service Provider Cost")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(Status; Status)
            {
            }
            column(SupervisorName; "Supervisor Name")
            {
            }
            column(SupervisorNo; "Supervisor No.")
            {
            }
            column(TotalPerdiemCosts; "Total Per diem Costs")
            {
            }
            column(TotalProcurementCost; "Total Procurement Cost")
            {
            }
            column(TrainingDurationHrs; "Training Duration Hrs")
            {
            }
            column(TrainingPlanCost; "Training Plan Cost")
            {
            }
            column(TrainingPlanDescription; "Training Plan Description")
            {
            }
            column(TrainingPlanNo; "Training Plan No.")
            {
            }
            column(TrainingRegion; "Training Region")
            {
            }
            column(TrainingResponsibility; "Training Responsibility")
            {
            }
            column(TrainingTime; "Training Time")
            {
            }
            column(TrainingType; "Training Type")
            {
            }
            column(TrainingTypes; "Training Types")
            {
            }
            column(TrainingVenueRegion; "Training Venue Region")
            {
            }
            column(TrainingVenueRegionCode; "Training Venue Region Code")
            {
            }
            column(Year; Year)
            {
            }
            column(TrainingCategory_TrainingRequests; "Training Category")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}
