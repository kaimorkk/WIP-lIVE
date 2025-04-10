

page 52193693 "HR Leave Adjustment"
{
    PageType = ListPart;
    SourceTable = "HR Journal Line";

    layout
    {
        area(content)
        {

            // field(CurrentJnlBatchName; CurrentJnlBatchName)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Batch Name';
            //     Lookup = true;
            //     ToolTip = 'Specifies the value of the Batch Name field.';
            //     trigger OnLookup(var Text: Text): Boolean
            //     begin
            //         CurrPage.SaveRecord;

            //         //Rec.RESET;

            //         InsuranceJnlManagement.LookupName(CurrentJnlBatchName, Rec);
            //         CurrPage.Update(false);
            //     end;

            //     trigger OnValidate()
            //     begin

            //         InsuranceJnlManagement.CheckName(CurrentJnlBatchName, Rec);
            //         CurrentJnlBatchNameOnAfterVali;
            //     end;
            // }
            repeater(Control1102755000)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Entry Type field.';
                }
                field("Leave Application No."; Rec."Leave Application No.")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Application No. field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Leave Period Start Date"; Rec."Leave Period Start Date")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Period Start Date field.';
                }
                field("Leave Period End Date"; Rec."Leave Period End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period End Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Leave Start Date"; Rec."Leave Start Date")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Leave Start Date field.';
                }
                field(Age; Rec.Age)
                {
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Start Date field.';
                }
            }
        }
    }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';

    //              action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 //Enabled = not OpenApprovalEntriesExist;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = New;
    //                 ToolTip = 'Executes the Send A&pproval Request action.';
    //                 trigger OnAction()
    //                 var
    //                     Attach: Record "Document Attachment";
    //                     DocumentAttachment: Record "Document Attachment";
    //                 begin
    //                     Rec.TestField(Status,Rec.Status::Open);
    //                     VarVariant := Rec;
    //                     if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //                         ApprovalsMgmt.OnSendDocForApproval(VarVariant);

    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = New;
    //                 ToolTip = 'Executes the Cancel Approval Re&quest action.';
    //                 trigger OnAction()
    //                 begin
    //                     Rec.TestField(Status, Rec.Status::"Pending Approval");
    //                     VarVariant := Rec;
    //                     if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
    //                         ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
    //                 end;
    //             }
    //             action("Post Adjustment")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Post';
    //                 Image = PostBatch;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 ToolTip = 'Executes the Post Adjustment action.';
    //                 trigger OnAction()
    //                 begin

    //                     Rec.TestField(Status,Rec.Status::Released);
    //                     Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", Rec);



    //                     CurrentJnlBatchName := Rec.GetRangemax("Journal Batch Name");
    //                     CurrPage.Update(false);
    //                 end;
    //             }

    //             action("Batch Allocation")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = Calculate;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 ToolTip = 'Executes the Batch Allocation action.';
    //                 trigger OnAction()
    //                 begin

    //                     AllocationDone := false;

    //                     HRJournalBatch.Reset;
    //                     HRJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name");

    //                     //GET THE CURRENT LEAVE PERIOD
    //                     HRLeavePeriods.Reset;
    //                     //HRLeavePeriods.SETRANGE(,TRUE);
    //                     HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
    //                     HRLeavePeriods.Find('-');

    //                     //WE ARE ALLOCATING FOR ACTIVE EMPLOYEES ONLY
    //                     HREmp.Reset;
    //                     HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
    //                     HREmp.FindFirst;
    //                     HRLeaveTypes.Reset;
    //                     HRLeaveTypes.SetRange(HRLeaveTypes.Annual, true);
    //                     if HRLeaveTypes.Find('-') then begin
    //                         repeat

    //                         /*   //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
    //                            HRLeaveLedger.SETRANGE(HRLeaveLedger."Staff No.",HREmp."No.");
    //                            HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Type",HRLeaveTypes.Code);
    //                            HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Entry Type",HRJournalBatch.Type);
    //                            HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Period",FORMAT(HRLeavePeriods.Starts));
    //                            IF NOT HRLeaveLedger.FIND('-') THEN

    //                            OK:=CheckGender(HREmp,HRLeaveTypes);

    //                            IF OK THEN
    //                            */
    //                         begin
    //                             //INSERT INTO JOURNAL
    //                             Rec.Init;
    //                             Rec."Journal Template Name" := Rec."Journal Template Name";
    //                             Rec."Journal Batch Name" := Rec."Journal Batch Name";
    //                             Rec."Line No." := Rec."Line No." + 1000;
    //                             Rec."Leave Period" := HRLeavePeriods.Code;
    //                             Rec."Staff No." := HREmp."No.";
    //                             Rec.Validate("Staff No.");
    //                             Rec."Posting Date" := Today;
    //                             Rec.Description := HRJournalBatch."Posting Description";
    //                             Rec."Leave Entry Type" := HRJournalBatch.Type;
    //                             Rec."Leave Type" := HRLeaveTypes.Code;
    //                             /* IF HRLeaveTypes.Code='ANNUAL' THEN BEGIN
    //                              IF HREmp.GET("Staff No.") THEN BEGIN
    //                              Grades.RESET;
    //                              Grades.SETRANGE(Grades."Salary Grade",HREmp.Grade);
    //                              IF Grades.FIND('-') THEN BEGIN
    //                              "No. of Days":=Grades."Leave Days";
    //                              END
    //                              END
    //                              END ELSE*/
    //                             Rec."No. of Days" := HRLeaveTypes.Days;
    //                             Rec."Leave Period Start Date" := HRLeavePeriods.Starts;
    //                             Rec."Leave Period End Date" := HRLeavePeriods.Ends;
    //                             Rec."Document No." := 'Allocation';
    //                             Rec.Insert();

    //                             /*IF (HREmp."Leave Balance"<>0) AND (HRLeaveTypes."Max Carry Forward Days"<>0) THEN BEGIN
    //                               IF CarryOverAll THEN BEGIN
    //                                   CarryForwardLeave:=HREmp."Leave Balance"
    //                               END ELSE
    //                               BEGIN
    //                                IF HREmp."Leave Balance">=HRLeaveTypes."Max Carry Forward Days" THEN
    //                                   CarryForwardLeave:=HRLeaveTypes."Max Carry Forward Days"
    //                                  ELSE
    //                                  CarryForwardLeave:=HREmp."Leave Balance";

    //                               END;
    //                                   INIT;
    //                                   "Journal Template Name":="Journal Template Name";
    //                                   "Journal Batch Name":="Journal Batch Name";
    //                                   "Line No.":="Line No."+1000;
    //                                   "Leave Period":=FORMAT(HRLeavePeriods.Starts);
    //                                   "Staff No.":=HREmp."No.";
    //                                    VALIDATE("Staff No.");
    //                                   "Posting Date":=TODAY;
    //                                    Description:=HRJournalBatch."Posting Description";
    //                                   "Leave Entry Type":="Leave Entry Type"::Reimbursement;
    //                                   "Leave Type":=HRLeaveTypes.Code;
    //                                   "No. of Days":=CarryForwardLeave;
    //                                   "Leave Period Start Date":=HRLeavePeriods.Starts;
    //                                   //"Leave Period End Date":=HRLeavePeriods.Ends;
    //                                   "Document No.":='N/A';
    //                                    IF CarryForwardLeave<>0 THEN
    //                                    INSERT();

    //                             END;  */
    //                             AllocationDone := true;

    //                         end;


    //                         //UNTIL HRLeaveTypes.NEXT=0;

    //                         //HRLeaveTypes.FINDFIRST;

    //                         until HREmp.Next = 0;
    //                     end;
    //                     HRLeaveTypes.FindFirst;

    //                     if not AllocationDone then
    //                         Message('Allocation of leave days for ' + Format(HRLeavePeriods.Starts) +
    //                          ' period has already been done for all ACTIVE employees');

    //                 end;
    //             }
    //             action("BatchAllocation")
    //             {
    //                 caption = 'Batch Adjustment';
    //                 ApplicationArea = Basic;
    //                 Image = CalculatePlanChange;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 RunObject = Report "HR Leave Adjustments";
    //             }
    //             action("Reimbursement Adjustment")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Executes the Reimbursement Adjustment action.';
    //                 trigger OnAction()
    //                 begin
    //                     //Get Current Year
    //                     HRLeavePeriods.Reset;
    //                     //HRLeavePeriods.SETRANGE(HRLeavePeriods."Reimbursement Clossing Date",TRUE);
    //                     HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
    //                     if HRLeavePeriods.Find('-') then
    //                         StartDate := HRLeavePeriods.Starts;
    //                     if Today <= (StartDate) then
    //                    ;// ERROR(Text0001);

    //                     HRLeavePeriods.Reset;
    //                     //HRLeavePeriods.SETRANGE(HRLeavePeriods."New Fiscal Year",TRUE);
    //                     HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
    //                     if HRLeavePeriods.Find('-') then begin
    //                         //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
    //                         HRLeaveLedger.SetRange("Leave Entry Type", HRLeaveLedger."leave entry type"::Reimbursement);
    //                         HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period", Format(HRLeavePeriods.Starts));
    //                         if HRLeaveLedger.Find('-') then begin
    //                             repeat

    //                                 //INSERT INTO JOURNAL
    //                                 Rec.Init;
    //                                 Rec."Journal Template Name" := Rec."Journal Template Name";
    //                                 Rec."Journal Batch Name" := Rec."Journal Batch Name";
    //                                 Rec."Line No." := Rec."Line No." + 1000;
    //                                 Rec."Leave Period" := HRLeavePeriods.Code;
    //                                 Rec."Staff No." := HRLeaveLedger."Staff No.";
    //                                 Rec.Validate("Staff No.");
    //                                 Rec."Posting Date" := Today;
    //                                 Rec.Description := 'Reimbursement Rerversal as at ' + Format(StartDate);
    //                                 Rec."Leave Entry Type" := Rec."leave entry type"::Reimbursement;
    //                                 Rec."Leave Type" := HRLeaveLedger."Leave Type";
    //                                 Rec."No. of Days" := -HRLeaveLedger."No. of days";
    //                                 Rec."Leave Period Start Date" := HRLeavePeriods.Starts;
    //                                 //"Leave Period End Date":=HRLeavePeriods.Ends;
    //                                 Rec."Document No." := 'N/A';
    //                                 Rec.Insert();
    //                             until HRLeaveLedger.Next = 0;
    //                         end;
    //                     end;
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnOpenPage()
    // var
    //     JnlSelected: Boolean;
    //     InsuranceJnlManagement: Codeunit LeaveJnlManagement;
    // begin

    //     OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
    //     if OpenedFromBatch then begin
    //         CurrentJnlBatchName := Rec."Journal Batch Name";
    //         InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
    //         exit;
    //     end;
    //     InsuranceJnlManagement.TemplateSelection(Page::"HR Leave Journal Lines", Rec, JnlSelected);
    //     if not JnlSelected then
    //         Error('');
    //     InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
    // end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LeaveJournalVoucher.Get(Rec."Document No");
        Rec."Journal Batch Name" := LeaveJournalVoucher."Batch Name";
        Rec."Journal Template Name" := LeaveJournalVoucher."Template Name";
    end;

    var
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record Employee;
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[30];
        InsuranceDescription: Text[30];
        FADescription: Text[30];
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        HRLeavePeriods: Record "HR Leave Periods";
        AllocationDone: Boolean;
        HRJournalBatch: Record "HR Leave Journal Batch";
        OK: Boolean;
        OldHrLeaveLedger: Record "HR Leave Ledger Entries";
        CarryForwardLeave: Decimal;
        StartDate: Date;
        Text0001: label 'Reversal cannot be done before the date of Reimbursement expiry';
        LeaveJournalVoucher: Record "Leave Journal Voucher";


    procedure CheckGender(Emp: Record Employee; LeaveType: Record "HR Leave Types") Allocate: Boolean
    begin

        //CHECK IF LEAVE TYPE ALLOCATION APPLIES TO EMPLOYEE'S GENDER

        if Emp.Gender = Emp.Gender::Male then begin
            if LeaveType.Gender = LeaveType.Gender::Female then
                Allocate := true;
        end;

        if Emp.Gender = Emp.Gender::" " then begin
            if LeaveType.Gender = LeaveType.Gender::Male then
                Allocate := true;
        end;

        if LeaveType.Gender = LeaveType.Gender::" " then
            Allocate := true;
        exit(Allocate);

        if Emp.Gender <> LeaveType.Gender then
            Allocate := false;

        exit(Allocate);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        InsuranceJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;

    procedure NotifyEmployee(Journal: Record "HR Leave Ledger Entries")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Recipient: Text[100];
        Body: Text;
        Subject: Text[100];

    begin
        HREmp.Reset();
        HREmp.Get(Journal."Staff No.");
        if HREmp."Company E-Mail" <> '' then begin

            Clear(Recipient);
            Recipient := HREmp."Company E-Mail";
            Subject := 'LEAVE ADJUSTMENT';
            Body := 'Dear ' + HREmp."First Name" + ',<br>'
            + 'Your ' + Journal."Leave Type" + ' leave has been adjusted ' + format(Rec."Leave Entry Type") +
            ' by ' + format(Journal."No. of days1") + ' days ';
            //EmailMessage.Create(Recipient, Subject, Body, true);
            // Email.Send(EmailMessage);
        end;
    end;


    procedure CarryOverAll() CarryOver: Boolean
    begin
    end;
}

#pragma implicitwith restore

