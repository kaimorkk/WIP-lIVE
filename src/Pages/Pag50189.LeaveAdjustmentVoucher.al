page 52194292 "Leave Adjustment Voucher"
{
    Caption = 'Leave Adjustment Voucher';
    PageType = Card;
    SourceTable = "Leave Journal Voucher";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Template Name field.';
                }
                field("Batch Name"; Rec."Batch Name")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Batch Name field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control14; "HR Leave Adjustment")
            {
                SubPageLink = "Document No" = field(No);
                ApplicationArea = Basic;
            }
        }
        area(FactBoxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Leave Journal Voucher"),
                              "No." = field(No);
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    //Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

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
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        //if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Post Adjustment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = PostBatch;
                    ToolTip = 'Executes the Post Adjustment action.';
                    trigger OnAction()
                    var

                    begin

                        Rec.TestField(Status, Rec.Status::Released);
                        Journal.Reset();
                        Journal.SetRange("Journal Template Name", Rec."Template Name");
                        Journal.SetRange("Journal Batch Name", Rec."Batch Name");
                        Journal.FindFirst();

                        Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", Journal);
                        Rec.Posted := true;
                    end;
                }

                action("Batch Allocation")
                {
                    ApplicationArea = Basic;
                    Image = Calculate;
                    Visible = false;
                    ToolTip = 'Executes the Batch Allocation action.';
                    trigger OnAction()
                    begin

                        AllocationDone := false;
                        Journal := FnGetJournalLine();
                        HRJournalBatch.Reset;
                        HRJournalBatch.Get(Journal."Journal Template Name", Journal."Journal Batch Name");

                        //GET THE CURRENT LEAVE PERIOD
                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(,TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
                        HRLeavePeriods.Find('-');

                        //WE ARE ALLOCATING FOR ACTIVE EMPLOYEES ONLY
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.FindFirst;
                        HRLeaveTypes.Reset;
                        HRLeaveTypes.SetRange(HRLeaveTypes.Annual, true);
                        if HRLeaveTypes.Find('-') then begin
                            repeat

                            /*   //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
                               HRLeaveLedger.SETRANGE(HRLeaveLedger."Staff No.",HREmp."No.");
                               HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Type",HRLeaveTypes.Code);
                               HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Entry Type",HRJournalBatch.Type);
                               HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Period",FORMAT(HRLeavePeriods.Starts));
                               IF NOT HRLeaveLedger.FIND('-') THEN

                               OK:=CheckGender(HREmp,HRLeaveTypes);

                               IF OK THEN
                               */
                            begin
                                //INSERT INTO JOURNAL
                                Journal.Init;
                                Journal."Journal Template Name" := Journal."Journal Template Name";
                                Journal."Journal Batch Name" := Journal."Journal Batch Name";
                                Journal."Line No." := Journal."Line No." + 1000;
                                Journal."Leave Period" := HRLeavePeriods.Code;
                                Journal.Validate(Journal."Leave Period");
                                Journal."Staff No." := HREmp."No.";
                                Journal.Validate("Staff No.");
                                Journal."Posting Date" := Today;
                                Journal.Description := HRJournalBatch."Posting Description";
                                Journal."Leave Entry Type" := HRJournalBatch.Type;
                                Journal."Leave Type" := HRLeaveTypes.Code;
                                /* IF HRLeaveTypes.Code='ANNUAL' THEN BEGIN
                                 IF HREmp.GET("Staff No.") THEN BEGIN
                                 Grades.RESET;
                                 Grades.SETRANGE(Grades."Salary Grade",HREmp.Grade);
                                 IF Grades.FIND('-') THEN BEGIN
                                 "No. of Days":=Grades."Leave Days";
                                 END
                                 END
                                 END ELSE*/
                                Journal."No. of Days" := HRLeaveTypes.Days;
                                // Journal."Leave Period Start Date" := HRLeavePeriods.Starts;
                                // Journal."Leave Period End Date" := HRLeavePeriods.Ends;
                                Journal."Document No." := 'Allocation';
                                Journal.Insert();

                                /*IF (HREmp."Leave Balance"<>0) AND (HRLeaveTypes."Max Carry Forward Days"<>0) THEN BEGIN
                                  IF CarryOverAll THEN BEGIN
                                      CarryForwardLeave:=HREmp."Leave Balance"
                                  END ELSE
                                  BEGIN
                                   IF HREmp."Leave Balance">=HRLeaveTypes."Max Carry Forward Days" THEN
                                      CarryForwardLeave:=HRLeaveTypes."Max Carry Forward Days"
                                     ELSE
                                     CarryForwardLeave:=HREmp."Leave Balance";

                                  END;
                                      INIT;
                                      "Journal Template Name":="Journal Template Name";
                                      "Journal Batch Name":="Journal Batch Name";
                                      "Line No.":="Line No."+1000;
                                      "Leave Period":=FORMAT(HRLeavePeriods.Starts);
                                      "Staff No.":=HREmp."No.";
                                       VALIDATE("Staff No.");
                                      "Posting Date":=TODAY;
                                       Description:=HRJournalBatch."Posting Description";
                                      "Leave Entry Type":="Leave Entry Type"::Reimbursement;
                                      "Leave Type":=HRLeaveTypes.Code;
                                      "No. of Days":=CarryForwardLeave;
                                      "Leave Period Start Date":=HRLeavePeriods.Starts;
                                      //"Leave Period End Date":=HRLeavePeriods.Ends;
                                      "Document No.":='N/A';
                                       IF CarryForwardLeave<>0 THEN
                                       INSERT();

                                END;  */
                                AllocationDone := true;

                            end;


                            //UNTIL HRLeaveTypes.NEXT=0;

                            //HRLeaveTypes.FINDFIRST;

                            until HREmp.Next = 0;
                        end;
                        HRLeaveTypes.FindFirst;

                        if not AllocationDone then
                            Message('Allocation of leave days for ' + Format(HRLeavePeriods.Starts) +
                             ' period has already been done for all ACTIVE employees');

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
                        DocumentType: Enum "Approval Document Type";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Leave Journal Voucher", DocumentType::"Leave Adjustment", Rec.No);
                        ApprovalEntries.Run;
                    end;
                }
                action("BatchAllocation")
                {
                    caption = 'Batch Adjustment';
                    ApplicationArea = Basic;
                    Image = CalculatePlanChange;
                    //RunObject = Report "HR Leave Adjustments";
                    trigger OnAction()
                    var
                        LeaveAdj: Report "HR Leave Adjustments";
                    begin
                        LeaveAdj.setDocNo(Rec.No);
                        LeaveAdj.Run();
                    end;
                }
                action("Reimbursement Adjustment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Reimbursement Adjustment action.';
                    trigger OnAction()
                    begin

                        Journal := FnGetJournalLine();
                        //Get Current Year
                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(HRLeavePeriods."Reimbursement Clossing Date",TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
                        if HRLeavePeriods.Find('-') then
                            StartDate := HRLeavePeriods.Starts;
                        if Today <= (StartDate) then
                       ;// ERROR(Text0001);

                        HRLeavePeriods.Reset;
                        //HRLeavePeriods.SETRANGE(HRLeavePeriods."New Fiscal Year",TRUE);
                        HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
                        if HRLeavePeriods.Find('-') then begin
                            //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
                            HRLeaveLedger.SetRange("Leave Entry Type", HRLeaveLedger."leave entry type"::Reimbursement);
                            HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period", Format(HRLeavePeriods.Starts));
                            if HRLeaveLedger.Find('-') then begin
                                repeat

                                    //INSERT INTO JOURNAL
                                    Journal.Init;
                                    Journal."Journal Template Name" := Journal."Journal Template Name";
                                    Journal."Journal Batch Name" := Journal."Journal Batch Name";
                                    Journal."Line No." := Journal."Line No." + 1000;
                                    Journal."Leave Period" := HRLeavePeriods.Code;
                                    Journal."Staff No." := HRLeaveLedger."Staff No.";
                                    Journal.Validate("Staff No.");
                                    Journal."Posting Date" := Today;
                                    Journal.Description := 'Reimbursement Rerversal as at ' + Format(StartDate);
                                    Journal."Leave Entry Type" := Journal."leave entry type"::Reimbursement;
                                    Journal."Leave Type" := HRLeaveLedger."Leave Type";
                                    Journal."No. of Days" := -HRLeaveLedger."No. of days1";
                                    Journal."Leave Period Start Date" := HRLeavePeriods.Starts;
                                    //"Leave Period End Date":=HRLeavePeriods.Ends;
                                    Journal."Document No." := 'N/A';
                                    Journal.Insert();
                                until HRLeaveLedger.Next = 0;
                            end;
                        end;
                    end;
                }
                action(DocAttach)
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
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Post Adjustment_Promoted"; "Post Adjustment")
                {
                }
                actionref(BatchAllocation_Promoted; BatchAllocation)
                {
                }
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approvals', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("Batch Allocation_Promoted"; "Batch Allocation")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Setappearance();
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Setappearance();
    end;

    trigger OnAfterGetRecord()
    begin
        Setappearance();
    end;

    procedure Setappearance()
    var
        myInt: Integer;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    var
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        Journal: Record "HR Journal Line";
        HRJournalBatch: Record "HR Leave Journal Batch";
        HRLeavePeriods: Record "HR Leave Periods";
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record Employee;
        ApprovalEntries: Page "Approval Entries";
        LOS: Text;
        DaystoProbaton: Integer;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        RetireRec: Decimal;
        DocumentType: Enum "Approval Document Type";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        AllocationDone: Boolean;
        StartDate: Date;

    procedure FnGetJournalLine() HRJourn: Record "HR Journal Line"
    begin
        Journal.Reset();
        Journal.SetRange("Journal Template Name", Rec."Template Name");
        Journal.SetRange("Journal Batch Name", Rec."Batch Name");
        Journal.FindFirst();
        exit(Journal);
    end;
}
