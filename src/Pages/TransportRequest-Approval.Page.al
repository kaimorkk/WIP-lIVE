Page 52194150 "Transport Request-Approval"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Transport Request1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReasonforTravel; "Reason for Travel")
                {
                    ApplicationArea = Basic;
                }
                field(TripPlannedStartDate; "Trip Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(TripPlannedEndDate; "Trip Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime; "Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnTime; "Return Time")
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                }
                field(NoofEmployees; "No. of Personnel")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Employees ';
                    Editable = false;
                }
                field(NoofNonEmployees; "No. of Non Employees")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PredictedWeatherConditions; "Predicted Weather Conditions")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleAllocated; "Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(OutsourcedVehicleRegNo; "Outsourced Vehicle Reg No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(VehicleOwner; "Vehicle Owner")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleDescription; "Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field(Driver; Driver)
                {
                    ApplicationArea = Basic;
                }
                field(DriverName; "Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field(Taxi; Taxi)
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingBefore; "Odometer Reading Before")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No. of Approvals")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingAfter; "Odometer Reading After")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Employee)
            {
                Caption = 'Employee';
                part(Control1000000011; "Travelling Employees")
                {
                    SubPageLink = "Request No." = field("Request No.");
                    SubPageView = sorting("Request No.");
                }
            }
            group(NonEmployee)
            {
                Caption = 'Non Employee';
                part(Control1000000008; "Transport Non Employee Lines")
                {
                    SubPageLink = "Request No." = field("Request No.");
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Transport)
            {
                Caption = 'Transport';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendTransportApprovalRequest(Rec) then;
                    end;
                }
            }
        }
    }

    var
        D: Date;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

