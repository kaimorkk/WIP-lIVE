

page 59137 "Fleet Req Gate Pass Card"
{
    Caption = 'Gate Pass Card';
    PageType = Card;
    SourceTable = "Transport Req Gate Pass";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Gate Pass Serial No"; Rec."Gate Pass Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gate Pass Serial No field.';
                }
                field("Requested By"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Requested By Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = commentsEditable;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part(Control25; "Fleet Requisition Items")
            {
                Caption = 'Items';
                SubPageLink = "Requisition Number" = field("Gate Pass Serial No");
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
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
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify(true);
                    Message('Approved Successfully');

                    ////if //ApprovalsMgmt.CheckGatePassApprovalsWorkflowEnabled(Rec) THEN
                    //  //ApprovalsMgmt.IsTSalaryApprovalsWorkflowEnabled(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::"Pending Approval" then
                        Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message('Cancelled Successfully');
                    ////ApprovalsMgmt.OnSendTSalaryForApproval(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Print Gate Pass")
            {
                ApplicationArea = Basic;
                Image = PrintDocument;
                ToolTip = 'Executes the Print Gate Pass action.';
                trigger OnAction()
                begin
                    GatePass.Reset;
                    GatePass.SetRange("Gate Pass Serial No", Rec."Gate Pass Serial No");
                    Report.Run(59028, true, true, Rec);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    // DMSManagement.FnUploadGatePassDocs(Rec."Gate Pass Serial No", 'GatePass', Rec.RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Attach Documents_Promoted"; "Attach Documents")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Print Gate Pass_Promoted"; "Print Gate Pass")
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

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
    end;

    trigger OnAfterGetRecord()
    begin
        // "Purpose of Trip".CREATEINSTREAM(ObjInstr);
        // Obj.READ(ObjInstr);
        // ObjText:=FORMAT(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Security;
    end;

    trigger OnOpenPage()
    begin
        Approved := false;
        if Rec.Status = Rec.Status::Approved then
            Approved := true;
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
        Fleetmgmtsetup: Record "Fleet Management Setup";
        Emp: Record Employee;
        Email2: Code[100];
        Body: Code[100];
        SMTP: Codeunit "Email Message";
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Approved: Boolean;
        VehicleDrivers: Record "Vehicle Drivers";
        // ImprestMemo: Record "Imprest Memo";
        // ImprestMemo1: Record "Imprest Memo";
        // ProjectMembers: Record "Project Members";
        // ProjectMember1: Record "Project Members";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        NoOfDriv: Integer;
        FleetItems: Record "Fleet Requisition Items";
        NoOfItems: Integer;
        GatePass: Record "Transport Req Gate Pass";
        // DMSManagement: Codeunit "DMS Management";


    procedure updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
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
                allocatedbyEditable := true;
                closingMileageEditable := false;
                DriverNameEditable := true;
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
                    VehicleEditable := true;
                    DriverEditable := true;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := false;
                    workticketEditable := false;
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

