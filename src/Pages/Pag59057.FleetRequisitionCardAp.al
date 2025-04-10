

page 59057 "Fleet Requisition Card Ap"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Transport Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field(From; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = CommencementEditable;
                    ToolTip = 'Specifies the value of the Commencement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = DensitationEditable;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleEditable;
                    ToolTip = 'Specifies the value of the Vehicle Allocated field.';
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = DriverEditable;
                    LookupPageID = "Fleet Drivers List";
                    ToolTip = 'Specifies the value of the Driver Allocated field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = DriverNameEditable;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    Editable = Requestedby;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Editable = PositionEditable;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                    Editable = allocatedbyEditable;
                    ToolTip = 'Specifies the value of the Vehicle Allocated by field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = DepartmentEditable;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = DaterequestedEditable;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Editable = TimeRequestedEditable;
                    ToolTip = 'Specifies the value of the Time Requested field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = DateofTripEditable;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = TimeoutEditable;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = TimeInEditable;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = JourneyEditable;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = openingMileageEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = closingMileageEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = NoofDaysEditable;
                    ToolTip = 'Specifies the value of the No of Days Requested field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = RespEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = loadedEditable;
                    ToolTip = 'Specifies the value of the Loaded to WorkTicket field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = workticketEditable;
                    LookupPageID = "Daily Work Ticket List";
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Id field.';
                }
                field("Added On"; Rec."Added On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Added On field.';
                }
            }
            group(Purpose)
            {
                Editable = false;
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = purposeEditable;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = commentsEditable;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                Editable = line;
                SubPageLink = "Req No" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin

                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField(Commencement);
                    Rec.TestField(Destination);
                    Rec.TestField("Date of Trip");
                    Rec.TestField("Purpose of Trip");
                    /*
                    //if //ApprovalsMgmt.CheckTransportReqApprovalsWorkflowEnabled(Rec) THEN
                    //ApprovalsMgmt.OnSendTransportReqForApproval(Rec);
                    */

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    /*
                    //ApprovalsMgmt.OnCancelTransportReqApprovalRequest(Rec)
                    */

                end;
            }
            action("Send SMS to Driver")
            {
                ApplicationArea = Basic;
                Image = Start;
                ToolTip = 'Executes the Send SMS to Driver action.';
                trigger OnAction()
                begin
                    /*IF Status<>Status::Approved THEN BEGIN
                    ERROR('The status must be approved for you to notify the driver');
                    END ELSE BEGIN

                   SMSMessages.RESET;
                   IF SMSMessages.FIND('+') THEN BEGIN
                   iEntryNo:=SMSMessages."Entry No";
                   iEntryNo:=iEntryNo+1;
                   END ELSE BEGIN
                   iEntryNo:=1;
                   END;

                   SMSMessages.INIT;
                   SMSMessages."Com:=iEntryNo;
                   SMSMessages."Global Dimension 2":="Transport Requisition No";
                   SMSMessages.Account:=TODAY;
                   SMSMessages."Committed Amount":=TIME;
                   SMSMessages."Commitment Date":='DRIVERNOT';
                   SMSMessages.User:=USERID;
                   SMSMessages."Account Name":=TRUE;
                   SMSMessages."Account No.":="Transport Requisition No";
                   SMSMessages.InvoiceNo:=SMSMessages.InvoiceNo::"0";
                   SMSMessages."Document No":='Dear '+"Driver Name"+' you have a job to '+Destination+' on '+FORMAT("Date of Trip")+' at '+FORMAT("Time Requested");
                   IF HR.GET("Driver Allocated") THEN BEGIN
                   IF HR."Cellular Phone Number"<> '' THEN
                   SMSMessages."Commitment Type":=HR."Cellular Phone Number";
                   END;
                   SMSMessages.INSERT;

                   END;
                   */

                    Message('SMS Message sent succesfully');

                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Send SMS to Driver_Promoted"; "Send SMS to Driver")
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
    end;

    var
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        Requestedby: Boolean;
        PositionEditable: Boolean;
        commentsEditable: Boolean;
        RespEditable: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // SMSMessages: Record "Committment Entries";
        iEntryNo: Integer;
        HR: Record Employee;


    procedure updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := true;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            Requestedby := true;
            PositionEditable := true;
            authorisedEditable := false;
            line := true;
            commentsEditable := true;
            RespEditable := true;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                TransportReqEditable := false;
                CommencementEditable := false;
                DensitationEditable := false;
                VehicleEditable := true;
                DriverEditable := true;
                allocatedbyEditable := false;
                closingMileageEditable := false;
                DriverNameEditable := false;
                DepartmentEditable := false;
                loadedEditable := false;
                workticketEditable := false;
                DaterequestedEditable := false;
                TimeRequestedEditable := false;
                DateofTripEditable := false;
                TimeoutEditable := false;
                JourneyEditable := false;
                openingMileageEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                authorisedEditable := false;
                Requestedby := false;
                PositionEditable := false;
                commentsEditable := false;
                RespEditable := false;
                line := false;
            end else
                if Rec.Status = Rec.Status::Approved then begin
                    TransportReqEditable := false;
                    CommencementEditable := false;
                    DensitationEditable := false;
                    VehicleEditable := false;
                    DriverEditable := false;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := true;
                    workticketEditable := true;
                    DaterequestedEditable := false;
                    TimeRequestedEditable := false;
                    DateofTripEditable := false;
                    TimeoutEditable := false;
                    TimeInEditable := true;
                    JourneyEditable := false;
                    openingMileageEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    authorisedEditable := false;
                    Requestedby := false;
                    PositionEditable := false;
                    commentsEditable := false;
                    RespEditable := false;

                    line := false;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        TransportReqEditable := false;
                        CommencementEditable := false;
                        DensitationEditable := false;
                        VehicleEditable := false;
                        DriverEditable := false;
                        allocatedbyEditable := false;
                        closingMileageEditable := false;
                        DriverNameEditable := false;
                        DepartmentEditable := false;
                        loadedEditable := false;
                        workticketEditable := false;
                        DaterequestedEditable := false;
                        TimeRequestedEditable := false;
                        DateofTripEditable := false;
                        TimeoutEditable := false;
                        TimeInEditable := false;
                        JourneyEditable := false;
                        openingMileageEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        authorisedEditable := false;
                        line := false;
                        Requestedby := false;
                        PositionEditable := false;
                        commentsEditable := false;
                        RespEditable := false;
                    end
    end;
}

#pragma implicitwith restore

