

page 59036 "Maintenance Request"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = NotEditable;
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleRegNoEditable;
                    ToolTip = 'Specifies the value of the Vehicle Reg No field.';
                }
                field("Cost Center Name"; Rec."Cost Center Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost Center Name field.';
                }

                field("Vehicle Location"; Rec."Vehicle Location")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Location';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vehicle Location field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Odometer Reading field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                // field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                // }
                // field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                // }

                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = vendorEditable;
                    LookupPageID = "Vendor List";
                    ToolTip = 'Specifies the value of the Vendor(Dealer) field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field("Responsible Employee Name"; Rec."Responsible Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Employee Name field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Code field.';
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Name field.';
                }
                /*    field("G/L Account"; Rec."G/L Account")
                   {
                       ApplicationArea = Basic;
                       ToolTip = 'Specifies the value of the G/L Account field.';
                   }
                   field("G/L Account Name"; Rec."G/L Account Name")
                   {
                       ApplicationArea = Basic;
                       ToolTip = 'Specifies the value of the G/L Account Name field.';
                   } */
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }

                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = closedbyEditable;
                    LookupPageID = "User Setup";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateclosedEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    Editable = vendorInvoiceEditable;
                    LookupPageID = "Purchase Invoices";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vendor Invoice No field.';
                }
            }

            group("Project Details")
            {
                Visible = FullyApproved;
                Editable = FullyApproved;
                field("Project Number";
                Rec."Project Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Number field.';
                }
                field("Task Number"; Rec."Task Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Number field.';
                }
                field("Maintenance Cost"; Rec."Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Cost field.';
                }
            }
            group(Inspection)
            {
                Visible = FullyApproved;
                Editable = FullyApproved;
                field("Comments/Remarks"; Rec."Comments/Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments/Remarks field.';
                    MultiLine = false;
                }
                field("Parts Changed"; Rec."Parts Changed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Parts Changed field.';
                    MultiLine = false;
                }
                field("Pre-Repair Inspection"; Rec."Pre-Repair Inspection")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pre-Repair Inspection field.';
                }
                field("Post-Repair Inspection"; Rec."Post-Repair Inspection")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Post-Repair Inspection field.';
                }

            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Close Maintenance Request.")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Visible = false;
                ToolTip = 'Executes the Close Maintenance Request. action.';
                trigger OnAction()
                begin
                    Rec.TestField("Posted Invoice No");
                    if Rec."PO Created" = true then begin
                        if Confirm('Are you sure you want to close this Maintenance Request?', true) = false then begin
                            exit
                        end else
                            Rec.Status := Rec.Status::Closed;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                    end else
                        Error('You cannot close the request until the LSO is created');
                end;
            }
            action("Process LSO")
            {
                ApplicationArea = Basic;
                // Enabled = false;
                Image = Purchasing;
                ToolTip = 'Executes the Process LSO action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                        if Confirm(Text004, false) then begin
                            RequsitionManager.MaintanceReview(Rec);
                            Rec."PO Created By" := UserId;
                            Rec."Date PO Created" := Today;
                            Rec."PO Created" := true;
                            Rec.Modify;
                            Message(Text005);
                        end;
                    end;
                end;
            }

            action(Print)
            {
                ApplicationArea = Basic;
                // Enabled = false;
                Image = AnalysisView;
                ToolTip = 'Executes the Process LSO action.';
                trigger OnAction()
                var
                    FuelMaintReq: Record "Fuel & Maintenance Requisition";
                begin
                    // FuelMaintReq.Reset;
                    // FuelMaintReq.SetRange("Requisition No", Rec."Requisition No");
                    // if FuelMaintReq.FindFirst() then
                    //     Report.Run(Report::"Fuel and Maintenance Report", true, false, FuelMaintReq);

                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Enabled = NotEditable;
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                    DocAttmt: Record "Document Attachment";
                    AttachmentRequired: Label 'Please attach the estimate/invoice before proceeding!';
                begin
                    DocAttmt.Reset;
                    DocAttmt.SetRange("Table ID", DataBase::"Fuel & Maintenance Requisition");
                    DocAttmt.SetRange("No.", Rec."Requisition No");
                    if DocAttmt.IsEmpty() then
                        Error(AttachmentRequired);

                    VarVariant := Rec;
                    if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovalsCodeunit.OnSendDocForApproval(VarVariant);
                    // Message('');
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    CustomApprovalsCodeunit.OnCancelDocApprovalRequest(VarVariant);
                    // //ApprovalsMgmt.OnSendProjectReqForApproval(Rec);
                    // WorkflowWebhookMgt.FindAndCancel(RECORDID);
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
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

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
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = PendingApp;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        Message('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Visible = PendingApp;
                    ToolTip = 'Executes the Reject action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Visible = PendingApp;
                    ToolTip = 'Executes the Delegate action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        CheckAllocationDetails;
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Close Maintenance Request._Promoted"; "Close Maintenance Request.")
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Process LSO_Promoted"; "Process LSO")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Document', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Maintenance;
        Rec."Request Date" := Today;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        Rec.Status := Rec.Status::Open;
        // Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    trigger OnOpenPage()
    begin
        Approved := false;
        NotEditable := true;
        ViewApprovalButton := false;
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::"Pending Approval") then
            Approved := true;
        PendingApp := false;
        if Rec.Status = Rec.Status::"Pending Approval" then
            PendingApp := true;
        FullyApproved := false;
        if Rec.Status = Rec.Status::Approved then
            FullyApproved := true;

        if Rec.Status <> Rec.Status::Open then
            NotEditable := false;
    end;

    var
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
        VehicleRegNoEditable: Boolean;
        vendorEditable: Boolean;
        RequestDateEditable: Boolean;
        DateofMaintenanceEditable: Boolean;
        typeofmaintenanceEditable: Boolean;
        chequenoEditable: Boolean;
        closedbyEditable: Boolean;
        DateclosedEditable: Boolean;
        vendorInvoiceEditable: Boolean;
        postedInvoiceEditable: Boolean;
        Text004: label 'Do you want to proceed and perform the selected action on the Maintanance request?';
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text005: label 'Purchase Review process completed';
        DocAttach: Record "Document Attachment";
        NoDoc: Integer;
        Text006: label 'Please ensure that you have uploaded a document to %1 before proceeding';
        Recx: Record "Fuel & Maintenance Requisition";
        Approved: Boolean;
        PendingApp: Boolean;
        NotEditable: Boolean;
        ViewApprovalButton: Boolean;
        FullyApproved: Boolean;


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VehicleRegNoEditable := true;
            vendorEditable := true;
            RequestDateEditable := true;
            DateofMaintenanceEditable := true;
            typeofmaintenanceEditable := true;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Approved then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::Rejected then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Closed then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
    end;

    local procedure SendFuelMail()
    var
        FleetSetup: Record "Fleet Management Setup";
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
    begin

        FleetSetup.Get();
        FleetSetup.TestField(FleetSetup."Transport Admin Email");
        // IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
        Header := 'PRN PREPARATION FOR VEHICLE MAINTENANCE ' + Rec."Requisition No" + ' ON ' + Format(Rec."Request Date");

        if SMTPSetup.Get() then begin
            //  SenderEmail := SMTPSetup."Email Sender Address";
            //   SenderName := SMTPSetup."Email Sender Name";
        end;
        if FleetSetup."Transport Admin Email" <> '' then begin
            //  SMTPMail.Create(SenderName, SenderEmail, FleetSetup."Transport Admin Email", Header, '', true);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Dear Sir/Madam');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Kindly prepare a Purchase requisition for vehicle mentanace ' + Rec."Requisition No");// for the month of January 2014');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<h1>Vehicle Maintenance Details</h1>');
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Vehicle Number : ' + Rec."Vehicle Reg No");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Projected Amount : KES' + Format(Rec."Maintenance Cost"));
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Vedore : ' + Rec."Vendor(Dealer)" + ' ' + Rec."Vendor Name");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Maintenance Details : ' + Rec.Description);
            // SMTPMail.AppendToBody('<br>');
            // //SMTPMail.AppendToBody('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Kindly prepare adequately');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Thanks & Regards');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody(SenderName);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<HR>');
            // SMTPMail.AppendToBody('This is a system generated mail.');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kemri.go.ke');
            // SMTPMail.AppendToBody('<br><br>');
            /// SMTPMail.Send;
            Message('Mail sent to %1', FleetSetup."Transport Admin Email");
        end;
        //End email
        // END;
    end;

    local procedure CheckAllocationDetails()
    var
        NoOfDrivers: Integer;
        NoOfVehicles: Integer;
        NoOfStaff: Integer;
        NoOfNonStaff: Integer;
        TotalCarryingCap: Integer;
    begin
    end;
}

#pragma implicitwith restore

