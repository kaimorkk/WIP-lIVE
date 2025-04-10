page 59015 "Daily Work Ticket Card"
{
    SourceTable = "Monthly Work Ticket Header";
    Caption = 'Monthly Work Ticket Card';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Work Ticket"; "Daily Work Ticket")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Month Date"; "Month Date")
                {
                    ApplicationArea = All;
                }
                field("Month Name"; "Month Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Ticket No"; "Ticket No")
                {
                    ApplicationArea = All;

                }
                field("Previous Work Ticket No"; "Previous Work Ticket No")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registration No"; "Vehicle Registration No")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        FleetVehicles.RESET;
                        FleetVehicles.SETRANGE(FleetVehicles."Registration No.", "Vehicle Registration No");
                        if FleetVehicles.FINDFIRST then begin
                            Make := FleetVehicles.Make;
                            "Global Dimension 1 Code" := FleetVehicles."Global Dimension 1 Code";
                            //Station := FleetVehicles.
                        end;
                    end;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    //Editable = false;
                }
                field(Comments; Comments)
                {
                    Editable = CommentsEditable;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Department; Department)
                {
                    Editable = DepartmentEditable;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Closed by"; "Closed by")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Date Closed"; "Date Closed")
                {
                    ApplicationArea = All;
                    //  Editable = DateClosedEditable;
                }
                field("Created By"; "Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Date Created"; "Date Created")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Authorized By"; "Authorized By")
                {
                    ApplicationArea = All;
                }
                field("Authorized By Name"; "Authorized By Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Time Created"; "Time Created")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Total Fuel Carried Forward"; Rec."Total Fuel Carried Forward")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fuel Carried Forward field.';
                }
                field("Total Fuel Drawn (Ltrs)"; Rec."Total Fuel Drawn (Ltrs)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fuel Drawn (Ltrs) field.';
                }
                field("Total Kilometers"; Rec."Total Kilometers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Kilometers field.';
                }
                field("Total Km's Covered"; Rec."Total Km's Covered")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Km''s Covered field.';
                }
                field("Total Miles Per Litre(Fuel)"; Rec."Total Miles Per Litre(Fuel)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Miles Per Litre(Fuel) field.';
                }
                field("Total Miles Per Ltr (Oil)"; Rec."Total Miles Per Ltr (Oil)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Miles Per Ltr (Oil) field.';
                }
                field("Total Oil Drawn (Ltrs)"; Rec."Total Oil Drawn (Ltrs)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Oil Drawn (Ltrs) field.';
                }

            }

            group(Defects)
            {


                field(Defect; Rec.Defect)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Defect field.';
                }
                field("Defect Date"; Rec."Defect Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Defect Date field.';
                }
                field("Action Taken Reported"; Rec."Action Taken Reported")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Action Taken Reported field.';
                }
            }
            part("Daily Work Ticket Lines"; "Daily Work Ticket Lines")
            {
                Caption = 'Monthly Work Ticket Lines';
                Editable = lines;
                SubPageLink = "Daily Work Ticket" = field("Daily Work Ticket");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load transport Requests")
            {
                ApplicationArea = All;

                trigger OnAction()
                var

                    Exists: Boolean;
                begin

                    TransportReq.RESET;
                    TransportReq.SETFILTER(TransportReq.Status, '%1|%2', TransportReq.Status::Approved, TransportReq.Status::Closed);
                    TransportReq.SETRANGE("Driver Allocated", "Driver Allocated");
                    //TransportReq.SETRANGE("Loaded to WorkTicket",FALSE);
                    if TransportReq.FIND('-') then
                        repeat
                            //Check whether entry exists
                            Exists := false;
                            TicketLines.RESET;
                            TicketLines.SETRANGE(TicketLines."Transport Requisition No", TransportReq."Transport Requisition No");
                            if TicketLines.FIND('-') then begin
                                Exists := TicketLines."Daily Work Ticket" <> "Daily Work Ticket";
                                // IF TicketLines."Daily Work Ticket" <> "Daily Work Ticket" THEN
                                //   MESSAGE(Text0005, TicketLines."Transport Requisition No", "Date of Request", TicketLines."Daily Work Ticket")
                            end;
                            //End Checking whether entry exists
                            if not Exists then begin
                                EntryN += 1;

                                //Enter the Workticket lines
                                TicketLines2.INIT;
                                TicketLines2."Daily Work Ticket" := "Daily Work Ticket";
                                TicketLines2.EntryNo := EntryN;
                                TicketLines2."Transport Requisition No" := TransportReq."Transport Requisition No";
                                TicketLines2.Commencement := TransportReq.Commencement;
                                TicketLines2.Destination := TransportReq.Destination;
                                TicketLines2."Vehicle Allocated" := TransportReq."Vehicle Allocated";
                                TicketLines2."Driver Allocated" := TransportReq."Driver Allocated";
                                TicketLines2."Date of Request" := TransportReq."Date of Request";
                                TicketLines2."Opening Odometer Reading" := TransportReq."Opening Odometer Reading";
                                TicketLines2."Time out" := TransportReq."Time out";
                                TicketLines2."Time In" := TransportReq."Time In";
                                TicketLines2."Authorized By" := TransportReq."Authorized  By";
                                TicketLines2.Position := TransportReq.Position;
                                TicketLines2."Driver Name" := TransportReq."Driver Name";
                                //Only insert if doesn't exist
                                TicketLines.RESET;
                                TicketLines.SETRANGE(TicketLines."Transport Requisition No", TransportReq."Transport Requisition No");

                                TicketLines2.INSERT(true);
                                TransportReq."Loaded to WorkTicket" := true;
                                TransportReq."Work Ticket No" := "Daily Work Ticket";
                                TransportReq.MODIFY;
                            end;
                        until TransportReq.NEXT = 0;
                end;
            }
            action("Close Work Ticket ")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                    if not CONFIRM(Text0002, false) then
                        ERROR(Text0003);

                    TicketLines.RESET;
                    TicketLines.SETRANGE(TicketLines."Daily Work Ticket", "Daily Work Ticket");
                    if TicketLines.FIND('-') then begin
                        repeat
                            //TicketLines.TESTFIELD("Opening Odometer Reading");
                            //TicketLines.TESTFIELD("Closing Odometer Reading");
                            if TransportReq.GET(TicketLines."Transport Requisition No") then begin
                                //changed status from closed to Approved by Morris.
                                TransportReq.Status := TransportReq.Status::Closed;
                                TransportReq."Time out" := TicketLines."Time out";
                                TransportReq."Time In" := TicketLines."Time In";
                                TransportReq."Opening Odometer Reading" := TicketLines."Opening Odometer Reading";
                                TransportReq."Closing Odometer Reading" := TicketLines."Closing Odometer Reading";
                                TransportReq."Work Ticket No" := TicketLines."Daily Work Ticket";
                                TransportReq.MODIFY;
                            end;
                        until TicketLines.NEXT = 0;
                        //UPDATE The Vehicle Details
                        //TESTFIELD("Closing Odometer");
                        WshpFA.RESET;
                        WshpFA.SETRANGE(WshpFA."Registration No.", "Vehicle Registration No");
                        if WshpFA.FIND('-') then begin
                            WshpFA."Current Reading" := "Closing Odometer";
                            WshpFA.MODIFY;
                        end;
                        Status := Status::Closed;
                        "Date Closed" := TODAY;
                        "Closed by" := USERID;
                        MODIFY;
                    end;

                    MESSAGE(Text0004);
                end;
            }
            action("Print Work Ticket")
            {
                Image = "Report";
                ApplicationArea = All;

                trigger OnAction()
                begin
                    RESET;
                    SETRANGE("Daily Work Ticket", "Daily Work Ticket");
                    REPORT.RUN(65016, true, true, Rec);
                    //RESET;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovalsCodeunit.OnSendDocForApproval(VarVariant);
                    //    IF ApprovalsMgmt.IsWorkTicketApprovalWorkflowEnabled(Rec) THEN
                    //    ApprovalsMgmt.OnSendWorkTicketForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                ToolTip = 'Cancel the approval request.';


                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    CustomApprovalsCodeunit.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalsMgmt.OnCancelWorkTicketApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action(AttachDocuments)
            {
                Caption = 'Attach Document';
                Image = Attach;
                Visible = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Load transport Requests_Promoted"; "Load transport Requests")
                {
                }
                actionref("Close Work Ticket _Promoted"; "Close Work Ticket ")
                {
                }
                actionref("Print Work Ticket_Promoted"; "Print Work Ticket")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(AttachDocuments_Promoted; AttachDocuments)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        updatecontrols
    end;

    trigger OnClosePage()
    begin
        updatecontrols
    end;

    trigger OnInit()
    begin
        updatecontrols
    end;

    trigger OnOpenPage()
    begin
        updatecontrols
    end;

    var
        FltUserSetup: Record "Fleet Management Setup";
        TicketLines: Record "Daily Work Ticket Lines";
        TransportReq: Record "Transport Requisition";
        TicketLines2: Record "Daily Work Ticket Lines";
        DeleteExisting: Boolean;
        UserSetup: Record "User Setup";
        EntryN: Integer;
        WshpFA: Record "Fleet Vehicles.";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VehicleAllocatedEditable: Boolean;
        DriverAllocatedEditable: Boolean;
        DateofRequestEditable: Boolean;
        DateClosedEditable: Boolean;
        ClosedbyEditable: Boolean;
        CommentsEditable: Boolean;
        DepartmentEditable: Boolean;
        OpeningOdometerEditable: Boolean;
        ClosingOdometerEditable: Boolean;
        TimeCreatedEditable: Boolean;
        lines: Boolean;
        createdbyEditable: Boolean;
        Text0001: Label 'You have no been setup as a Fleet Management User Contact your Systems Administrator';
        Text0002: Label 'Are you sure you want to close work ticket?';
        Text0003: Label 'Process Aborted';
        Text0004: Label 'Process Completed';
        Text0005: Label 'Transport Request No %1  which falls on the specified date %2 appears to be in another WorkTicket %3';
        Text0006: Label 'Do you want to DELETE all Existing Ticket Lines';
        FleetVehicles: Record "Fleet Vehicles.";
        // DMSDocuments: Record "DMS Documents";
        // DMSManagement: Codeunit "DMS Management";

    procedure updatecontrols()
    begin
        if Status = Status::Open then begin
            VehicleAllocatedEditable := true;
            DriverAllocatedEditable := true;
            CommentsEditable := true;
            DateClosedEditable := true;
            DateofRequestEditable := true;
            DepartmentEditable := true;
            //DriverNameEditable:=FALSE;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            //"DateCreatedEditable":=TRUE;
            TimeCreatedEditable := true;
            lines := true;
        end;
        if Status = Status::"Pending Approval" then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            //"DriverNameEditable":=FALSE;
            ClosedbyEditable := false;
            OpeningOdometerEditable := false;
            ClosingOdometerEditable := false;
            //"DateCreatedEditable":=FALSE;
            TimeCreatedEditable := false;
            lines := false;

        end;
        if Status = Status::Released then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            // "DriverNameEditable":=FALSE;
            ClosedbyEditable := true;
            OpeningOdometerEditable := false;
            ClosingOdometerEditable := true;
            //"DateCreatedEditable":=FALSE;
            TimeCreatedEditable := false;
            lines := true;
        end;
        if Status = Status::Rejected then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            //"DriverNameEditable":=FALSE;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            //"DateCreatedEditable":=FALSE;
            TimeCreatedEditable := false;
            lines := false;
        end;
        if Status = Status::Closed then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            //"DriverNameEditable":=FALSE;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            //"DateCreatedEditable":=FALSE;
            TimeCreatedEditable := false;
            lines := false;
        end;
    end;
}

