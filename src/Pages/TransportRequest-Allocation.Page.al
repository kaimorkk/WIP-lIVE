Page 52194141 "Transport Request-Allocation"
{
    PageType = Card;
    SourceTable = "Transport Request1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control1000000056)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19003756;
                    Style = Strong;
                    StyleExpr = true;
                }
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field(TripPlannedStartDate; "Trip Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Trip Planned Start Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Trip Planned Start Date" := D;
                           */

                    end;
                }
                field(TripPlannedEndDate; "Trip Planned End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Trip Planned End Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Trip Planned End Date" := D;
                         */

                    end;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination/Itinerary';
                    Editable = false;
                }
                field(NoofEmployees; "No. of Personnel")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Employees';
                    Editable = false;
                }
                field(NoofNonEmployees; "No. of Non Employees")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforTravel; "Reason for Travel")
                {
                    ApplicationArea = Basic;
                }
                field(VehicleAllocated; "Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Allocated';
                }
                field(Driver; Driver)
                {
                    ApplicationArea = Basic;
                }
                field(DriverName; "Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals; "No. of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Taxi; Taxi)
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
                field(VehicleDescription; "Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Cancelled; Cancelled)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000037; "Travelling Employees")
            {
                SubPageLink = "Request No." = field("Request No.");
                SubPageView = sorting("Request No.");
            }
            group(TravelRegistration)
            {
                Caption = 'Travel Registration';
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingBefore; "Odometer Reading Before")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate; "Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(OdometerReadingAfter; "Odometer Reading After")
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
            group(Transport)
            {
                Caption = 'Transport';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Visible = false;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendTransportApprovalRequest(Rec) then;
                    end;
                }
                action(ProcurementRequisition)
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Requisition';

                    trigger OnAction()
                    begin
                        RequisitionHeader.Init;
                        RequisitionHeader."No." := '';
                        RequisitionHeader."Requisition Type" := RequisitionHeader."requisition type"::MemberApplication;
                        RequisitionHeader."Raised by" := UserId;
                        RequisitionHeader.Insert(true);
                        Page.Run(51511171, RequisitionHeader);
                    end;
                }
                action(SendNotifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Notifications';

                    trigger OnAction()
                    begin
                        DriverBody := 'This is to notify you that you are the assigned driver for a trip to '
                        + Destination + ' for ' + "Reason for Travel" + ', Dates ' + Format("Trip Planned Start Date") + ' to ' + Format("Trip Planned End Date") +
                        ', from ' + Format("Start Time") + ' to ' + Format("Return Time");

                        EmployeeBody := 'This is to notify you that you have been assigned driver ' + "Driver Name" + ' and vehicle ' + "Vehicle Allocated" + ' for the trip to '
                        + Destination + ' for ' + "Reason for Travel" + ', Dates ' + Format("Trip Planned Start Date") + ' to ' + Format("Trip Planned End Date") +
                        ', from ' + Format("Start Time") + ' to ' + Format("Return Time");


                        EmployeeRec.Reset;
                        if EmployeeRec.Get(Driver) then begin

                            if EmployeeRec."E-Mail" = '' then begin

                                UserSetup.Reset;
                                UserSetup.SetRange(UserSetup."Employee No.", EmployeeRec."No.");
                                if UserSetup.Find('-') then
                                    DriverEmail := UserSetup."E-Mail";
                            end else
                                DriverEmail := EmployeeRec."E-Mail";

                            //Mail.NewIncidentMail(DriverEmail, "Request No.", DriverBody);

                            //Mail.NewMessage(DriverEmail, '', "Request No.", DriverBody, '', false);

                        end;

                        TravellingEmployees.Reset;
                        TravellingEmployees.SetRange(TravellingEmployees."Request No.", "Request No.");
                        if TravellingEmployees.Find('-') then begin
                            repeat
                                EmployeeRec.Reset;
                                if EmployeeRec.Get(TravellingEmployees."Employee No.") then begin

                                    if EmployeeRec."E-Mail" = '' then begin

                                        UserSetup.Reset;
                                        UserSetup.SetRange(UserSetup."Employee No.", EmployeeRec."No.");
                                        if UserSetup.Find('-') then
                                            EmployeeEmail := UserSetup."E-Mail";
                                    end else
                                        EmployeeEmail := EmployeeRec."E-Mail";

                                    //Mail.NewIncidentMail(EmployeeEmail, "Request No.", EmployeeBody);

                                    // Mail.NewMessage(EmployeeEmail, '', '',"Request No.", EmployeeBody, '', false);

                                end;

                            until TravellingEmployees.Next = 0;
                        end;
                    end;
                }
            }
        }
    }

    var
        D: Date;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        RequisitionHeader: Record "Requisition Header1";
        Text19003756: label 'For Official Use Only';
        Mail: Codeunit Mail;
        EmployeeRec: Record Employee;
        TravellingEmployees: Record "Travelling Employees1";
        DriverBody: Text;
        EmployeeBody: Text;
        UserSetup: Record "User Setup";
        DriverEmail: Text;
        EmployeeEmail: Text;
}

