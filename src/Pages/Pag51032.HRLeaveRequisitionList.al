page 51032 "HR Leave Requisition List"
{
    PageType = List;
    SourceTable = "HR Leave Allocation Request";
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                Editable = false;

                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;

                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; Rec."Employee No")
                {
                    ApplicationArea = Basic;

                }
                field(EmployeeName; Rec."Employee Name")
                {
                    ApplicationArea = Basic;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(AppliedDays; Rec."Applied Days")
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveType; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveBalance; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = '&Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;


                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        // ApprovalEntries.SetRecordFilters(Database::"HR Leave Allocation Request", DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(sendApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;


                    trigger OnAction()
                    var
                        // ApprovalMgt: Codeunit UnknownCodeunit439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        Rec.TestField("Employee No");
                        Rec.TestField("Applied Days");
                        Rec.TestField("Starting Date");
                        Rec.TestField("Reliever No.");
                        Rec.TestField(Purpose);
                        if Rec."Availlable Days" < 1 then Error('Please note that you dont have enough leave balance');


                        //Release the Imprest for Approval
                        State := State::Open;
                        if Rec.Status <> Rec.Status::Open then State := State::"Pending Approval";
                        DocType := Doctype::"Leave Application";
                        Clear(tableNo);
                        tableNo := 39005550;
                        //IF ApprovalMgt.SendApproval(tableNo,Rec."No.",DocType,State) THEN;
                        //  IF ApprovalMgt.SendLeaveApprovalRequest(Rec) THEN;
                    end;
                }
                action(cancellsApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;

                    trigger OnAction()
                    var
                        //  ApprovalMgt: Codeunit UnknownCodeunit439;
                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        DocType := Doctype::"Leave Application";
                        showmessage := true;
                        ManualCancel := true;
                        Clear(tableNo);
                        tableNo := 39005550;
                        // if ApprovalMgt.CancelApproval(tableNo, DocType, Rec."No.", showmessage, ManualCancel) then;

                        // IF ApprovalMgt.CancelLeaveApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                separator(Action1102755038)
                {
                }
                action(PrintPreview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = PrintReport;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(70135251, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Action16)
                {
                }
                action("Leave Journal")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    //RunObject = Page "Hr Emp. Leave Journal Lines";
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(PrintPreview_Promoted; PrintPreview)
                {
                }
                actionref("Leave Journal_Promoted"; "Leave Journal")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(sendApproval_Promoted; sendApproval)
                {
                }
                actionref(cancellsApproval_Promoted; cancellsApproval)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnInit()
    begin
        PurposeEditable := true;
        "Starting DateEditable" := true;
        "Applied DaysEditable" := true;
        "Department CodeEditable" := true;
        "Campus CodeEditable" := true;
        "Employee NoEditable" := true;
        DateEditable := true;
        "No.Editable" := true;
    end;

    trigger OnOpenPage()
    begin

        //  if UserMgt.GetPurchasesFilter() <> '' then begin
        //      FilterGroup(2);
        //      SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
        //      FilterGroup(0);
        //  end;

        //SETFILTER("User ID",USERID);
        UpdateControls;
    end;

    var
        UserMgt: Codeunit "User Management";
        //ApprovalMgt: Codeunit UnknownCodeunit439;
        // ReqLine: Record UnknownRecord70135011;
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        // JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        // MinorAssetsIssue: Record UnknownRecord70135013;
        // LeaveEntry: Record UnknownRecord70135277;

        "No.Editable": Boolean;

        DateEditable: Boolean;

        "Employee NoEditable": Boolean;

        "Campus CodeEditable": Boolean;

        "Department CodeEditable": Boolean;

        "Applied DaysEditable": Boolean;

        "Starting DateEditable": Boolean;

        PurposeEditable: Boolean;
        ApprovalEntries: Page "Approval Entries";

    procedure UpdateControls()
    begin
        if Rec.Status <> Rec.Status::Open then begin
            "No.Editable" := false;
            DateEditable := false;
            "Employee NoEditable" := false;
            "Campus CodeEditable" := false;
            "Department CodeEditable" := false;
            "Applied DaysEditable" := false;
            "Starting DateEditable" := false;
            PurposeEditable := false;
            //  CurrForm."Process Leave Allowance".EDITABLE:=FALSE;
        end else begin
            "No.Editable" := true;
            DateEditable := true;
            "Employee NoEditable" := true;
            "Campus CodeEditable" := true;
            "Department CodeEditable" := true;
            "Applied DaysEditable" := true;
            "Starting DateEditable" := true;
            PurposeEditable := true;
            // CurrForm."Process Leave Allowance".EDITABLE:=TRUE;

        end;
    end;
}

