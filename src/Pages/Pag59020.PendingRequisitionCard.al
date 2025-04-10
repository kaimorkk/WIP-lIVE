

page 59020 "Pending Requisition Card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Transport Requisition";
    SourceTableView = where(Status = filter("Pending Approval"));

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
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authorized  By"; Rec."Authorized  By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Purpose)
            {
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                SubPageLink = "Req No" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = false;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField(Commencement);
                    Rec.TestField(Destination);
                    Rec.TestField("Date of Trip");
                    Rec.TestField("Purpose of Trip");

                    //if //ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendFleetForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    // IF Status=Status::"Pending Approval" THEN
                    //ApprovalsMgmt.OnCancelFleetApprovalRequest(Rec);
                    WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        //updatecontrols();
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
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := true;
            DriverEditable := true;
            allocatedbyEditable := false;
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
            authorisedEditable := false;
            line := true;
        end;
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
        end;
        if Rec.Status = Rec.Status::Approved then begin
            TransportReqEditable := false;
            CommencementEditable := false;
            DensitationEditable := false;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := true;
            workticketEditable := true;
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
            line := false;
        end;

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
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
            line := false;
        end
    end;
}

#pragma implicitwith restore

