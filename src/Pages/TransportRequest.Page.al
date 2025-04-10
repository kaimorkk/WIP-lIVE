Page 52194139 "Transport Request"
{
    Editable = true;
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
                    Editable = false;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PurposeofTravel; "Reason for Travel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purpose of Travel';
                    NotBlank = true;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination/Itinerary';
                    NotBlank = true;
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
                    NotBlank = true;
                }
                field(ReturnTime; "Return Time")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(NoofEmployeesTravelling; "No. of Personnel")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Employees Travelling';
                    Editable = false;
                    NotBlank = true;
                }
                field(NoofNonStaffTravelling; "No. of Non Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Non-Staff Travelling';
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
                    Editable = false;
                    NotBlank = true;
                }
                label(Control1000000005)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19003756;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(VehicleAllocated; "Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(VehicleDescription; "Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Driver; Driver)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(DriverName; "Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field(Taxi; Taxi)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(OutsourcedVehicleRegNo; "Outsourced Vehicle Reg No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Employee)
            {
                Caption = 'Employee';
                part(Control1000000037; "Travelling Employees")
                {
                    SubPageLink = "Request No." = field("Request No.");
                    SubPageView = sorting("Request No.");
                }
            }
            group(NonEmployee)
            {
                Caption = 'Non Employee';
                part(Control1000000038; "Transport Non Employee Lines")
                {
                    SubPageLink = "Request No." = field("Request No.");
                    SubPageView = sorting("Request No.");
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
                        TestField("Trip Planned Start Date");
                        TestField("Trip Planned End Date");
                        TestField("Return Time");
                        TestField("Start Time");
                        TestField(Destination);
                        TestField("Reason for Travel");

                        if "Trip Planned Start Date" > "Trip Planned End Date" then begin
                            Error('You cannot go to a Trip after the before the Trip Start date');
                        end;
                        ComInfo.Get;
                        ComInfo.TestField(ComInfo."HR Support Email");
                        // ComInfo.TESTFIELD(ComInfo."HR Support Email");
                        Hrmail := ComInfo."HR Support Email";
                        /*
                       //Mail.NewIncidentMail(Hrmail, 'Transport App No ' + "Request No." , "Employee Name" +
                       ' has applied transport awaiting for approval');
                        */
                        //if ApprovalMgt.SendTransportApprovalRequest(Rec) then;

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.CancelTransportApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        "User ID" := UserId;
    end;

    trigger OnOpenPage()
    begin
        //CurrForm.EDITABLE:=TRUE;
        SetRange("Request ID", UserId);
    end;

    var
        D: Date;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ComInfo: Record "Company Information";
        Mail: Codeunit Mail;
        Hrmail: Text[120];
        Text19003756: label 'For Official Use Only';
}

