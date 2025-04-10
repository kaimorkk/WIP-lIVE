report 50744 "HR Leave Adjustments"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("HR Employees"; "Employee")
        {
            DataItemTableView = where(Status = const(Active));
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            trigger OnAfterGetRecord()
            var
                NoofMonthsToWork: Integer;
                LeaveBal: Decimal;
                LeavAllocations: Record "HR Journal Line";
                AgeYears: Integer;
            begin

                HRLeaveCalendar.Reset;
                //  HRLeaveCalendar.SetRange(Current, true);
                HrSetup.Reset();
                if HrSetup.Get() then begin
                    //More than once calendar exists
                    HrSetup.TestField("Base Calender Code");
                    if HrSetup."Base Calender Code" = '' then Error('No active calendar exists', HRLeaveCalendar.Count);
                    if HRLeaveCalendar.Get(HrSetup."Base Calender Code") then
                        HRLeaveType.Reset();
                    HRLeaveType.SetRange(HRLeaveType.Code, LeaveType);
                    HRLeaveType.SetRange(HRLeaveType."Multiple Allocations", false);
                    if HRLeaveType.Find('-') then begin
                        HRLeaveAllocation2.Reset();
                        HRLeaveAllocation2.SetRange(HRLeaveAllocation2."Leave Type", LeaveType);
                        HRLeaveAllocation2.SetRange(HRLeaveAllocation2."Staff No.", "No.");
                        HRLeaveAllocation2.SetRange(HRLeaveAllocation2."Leave Period", HRLeaveCalendar.Code);
                        if HRLeaveAllocation2.Find('-') then begin
                            Error('An allocation already exists for leave type' + LeaveType + ' for employee' + "No." + ' ' + "First Name" + ' ' + "Last Name");
                        end;
                    end;

                    LineNo := LineNo + 1;

                    HRLeaveAllocation."Line No." := LineNo;
                    HRLeavePeriods.Reset;
                    //HRLeavePeriods.SETRANGE(,TRUE);
                    HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
                    if HRLeavePeriods.Find('-') then
                        HRLeaveAllocation."Leave Period" := HRLeavePeriods.Code;
                    HRLeaveAllocation."Journal Batch Name" := "Batch Name";
                    HRLeaveAllocation."Journal Template Name" := "Journal Name";

                    HRLeaveAllocation."Staff No." := "HR Employees"."No.";
                    HRLeaveAllocation."Staff Name" := "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name" + ' ' + "HR Employees"."Last Name";
                    HRLeaveAllocation."Document No" := DocumentNo;
                    HRLeaveAllocation."Posting Date" := Today;

                    HRLeaveAllocation."Leave Entry Type" := EntryType;
                    // Rec."Leave Entry Type" := HRJournalBatch.Type;
                    // HRLeaveAllocation."leave Posting Type" := PostingType;
                    HRLeaveType.Get(LeaveType);

                    if HRLeaveType.Annual = true then begin
                        if "HR Employees"."Date Of Birth" = 0D then
                            Error('Date of Birth for employee ' + "HR Employees"."No." + ' ' + "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name" + ' ' + "HR Employees"."Last Name" + ' not set');

                        if PostingType = PostingType::"Carry Forward" then begin
                            Error('You cannot perform this function!');
                        end else begin
                            if "HR Employees"."Employment Date" <> 0D then begin
                                if "HR Employees"."Employment Date" > HrSetup."Leave Posting Period[FROM]" then begin
                                    // if HRLeaveAllocation."Leave Entry Type" = EntryType::"Negative" then
                                    //     HRLeaveAllocation."No. Of days" := (HRLeaveType.Days * -1)
                                    // else begin
                                        NoofMonthsToWork := ABS(DATE2DMY("HR Employees"."Employment Date" - DATE2DMY(Today, 2), 2));
                                        if DATE2DMY(Today, 3) = DATE2DMY("HR Employees"."Employment Date", 3) then begin
                                            NoofMonthsToWork := ABS(DATE2DMY("HR Employees"."Employment Date", 2) - DATE2DMY(Today, 2));
                                        end;
                                        if DATE2DMY(Today, 3) <> DATE2DMY("HR Employees"."Employment Date", 3) then begin
                                            NoofMonthsToWork := ABS(DATE2DMY("HR Employees"."Employment Date", 2) - (DATE2DMY(Today, 2) + 12));
                                        end;
                                        HRLeaveAllocation."No. Of days" := (NoofMonthsToWork / 12) * HRLeaveType.Days;
                                    //end;
                                end else begin
                                    // if HRLeaveAllocation."Leave Entry Type" = EntryType::"Negative" then
                                    //     HRLeaveAllocation."No. Of days" := (HRLeaveType.Days * -1)
                                    // else
                                        HRLeaveAllocation."No. Of days" := HRLeaveType.Days;
                                end;
                            end else
                                Error('Date of join for employee ' + "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name" + ' ' + "HR Employees"."Last Name" + ' not set');
                        end;
                        AgeYears := ABS((DATE2DMY("HR Employees"."Date Of Birth", 3) - DATE2DMY(Today, 3)));
                        if AgeYears > 55 then
                            HRLeaveAllocation."No. Of days" := 42
                        else
                            HRLeaveAllocation."No. Of days" := 30;
                        HRLeaveAllocation.Age := AgeYears;
                    end else begin
                        // if HRLeaveAllocation."Leave Entry Type" = EntryType::"Negative" then
                        //     HRLeaveAllocation."No. Of days" := (HRLeaveType.Days * -1)
                        // else
                            HRLeaveAllocation."No. Of days" := HRLeaveType.Days;
                    end;
                    if DaysToAdjust <> 0 then begin
                        // if HRLeaveAllocation."Leave Entry Type" = EntryType::"Negative" then
                        //     HRLeaveAllocation."No. Of days" := (DaysToAdjust * -1)
                        //else
                            HRLeaveAllocation."No. Of days" := DaysToAdjust;
                    end;

                    HRLeaveAllocation."Leave Type" := LeaveType;

                    HRLeaveAllocation.Description := Format(EntryType) + ' Allocation - ' + Format(Today);
                    // HRLeaveAllocation."User ID" := UserId;

                    // HRLeaveAllocation.Posted := false;
                    HRLeaveAllocation."Leave Period Start Date" := HrSetup."Leave Posting Period[FROM]";
                    HRLeaveAllocation."Leave Period End Date" := HrSetup."Leave Posting Period[TO]";
                    HRLeaveAllocation."Document No." := 'BATCH-' + HRLeaveCalendar.Code;
                    //HRLeaveAllocation."External Document No." :=  ;
                    //   HRLeaveAllocation.Closed := false;
                    HRLeaveAllocation.Insert;
                    //  Postentries.PostLeaveAllocation(HRLeaveAllocation."Entry No.", HRLeaveAllocation."No.", HRLeaveAllocation."Leave Type", HRLeaveAllocation."Calendar Code");

                end else
                    Error('No HR calender found');
            end;

            trigger OnPreDataItem()
            begin
                //Factor in Gender
                case HRLeaveType.Gender of
                    //Male
                    HRLeaveType.Gender::Female:
                        begin
                            "HR Employees".SetRange("HR Employees".Gender, HRLeaveType.Gender);
                        end;
                    //Female
                    HRLeaveType.Gender::Male:
                        begin
                            "HR Employees".SetRange("HR Employees".Gender, HRLeaveType.Gender);
                        end;
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(LeaveType; LeaveType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Type';
                    TableRelation = "HR Leave Types".Code;
                }
                field(EntryType; EntryType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Type';
                }
                field(PostingType; PostingType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Type';
                }
                field("Journal Name"; "Journal Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Journal Name';
                    TableRelation = "HR Leave Journal Batch"."Journal Template Name";
                }
                field("Batch Name"; "Batch Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Batch';
                    TableRelation = "HR Leave Journal Batch".Name;
                }
                field(DocumentNo; DocumentNo)
                {
                    Caption = 'Document No';
                    ApplicationArea = Basic;
                    TableRelation = "Leave Journal Voucher";
                }
                field(DaysToAdjust; DaysToAdjust)
                {
                    Caption = 'Days to Adjust';
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        if DaysToAdjust < 0 then Error('Days to ajust should be 0 or greater than 0');
                    end;
                }
            }
        }
        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    var
        ERR_LEAVE_TYPE: label 'Please specify Leave Type';
        ERR_ENTRY_TYPE: label 'Please specify Entry Type as either "Positive Adjustment or Negative Adjustment"';
        ERR_CALENDAR_DUPLICATE: label 'There are currently [ %1 - Active ] Calendars, Please setup only 1 Active Calendar';
        CNF_0001: label 'There are currently [ %1  ] Entries Awaiting Posting. \\Do you wish to Delete and Generate a New Batch?';
    begin
        //Testfields
        // if EntryType = Entrytype::" " then Error(ERR_ENTRY_TYPE);
        if LeaveType = '' then Error(ERR_LEAVE_TYPE);

        //Calendar Exists
        HRLeaveCalendar.Reset;
        //HRLeaveCalendar.SetRange(Current, true);
        HRLeaveCalendar.FindFirst;

        //if HRLeaveCalendar.Count > 1 then Error(ERR_CALENDAR_DUPLICATE, HRLeaveCalendar.Count);

        //Line No.
        LineNo := 0;

        HRLeaveAllocation.Reset;
        if HRLeaveAllocation.FindLast then LineNo := HRLeaveAllocation."Line No.";

        //Leave Type
        HRLeaveType.Reset;
        HRLeaveType.Get(LeaveType);

        if not HRLeaveType."Unlimited Days" then HRLeaveType.TestField(Days);

        //Clear Page with existing entries if not posted
        // HRLeaveAllocation.Reset;
        // HRLeaveAllocation.SetRange(Posted, false);
        // if not HRLeaveAllocation.IsEmpty then begin
        //     if Confirm(CNF_0001, false, HRLeaveAllocation.Count) = false then Error('Process Aborted');
        // end;
    end;

    var
        LineNo: Integer;
        HRLeaveCalendar: Record "Base Calendar";
        HRLeaveAllocation: Record "HR Journal Line";
        EmpLeaveAlloc: Record "HR Leave Ledger Entries";
        HRLeaveType: Record "HR Leave Types";
        LeaveType: Code[20];
        EntryType: Option Positive,Negative,Reimbursement;
        PostingType: Option Normal,Reimbursement,"Carry Forward";
        Postentries: Codeunit "Leave Jnl.-Post Batch";
        HRLeaveAllocation2: Record "HR Leave Ledger Entries";
        HrSetup: Record "Human Resources Setup";
        HRJournalBatch: Record "HR Leave Journal Batch";
        "Journal Name": Code[20];
        "Batch Name": Code[20];
        HRLeavePeriods: Record "HR Leave Periods";
        DocumentNo: Code[20];
        DaysToAdjust: Integer;

    procedure setDocNo(DocNo: Code[20])
    begin
        DocumentNo := DocNo;
    end;
}

