#pragma implicitwith disable
Page 80463 "All Annual Strategy Workplan"
{
    Caption = 'Annual Workplan Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Annual Strategy Workplan";
    PromotedActionCategories = 'New,Process,Reports,Request Approval';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Current AWP"; Rec."Current AWP")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
            }
            part(Control9; "Strategy Workplan Lines")
            {
                SubPageLink = No = field(No);
                ToolTip = '<>';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Activity Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');
                    /*StrategicAct.RESET;
                    StrategicAct.SETRANGE("Strategic Plan ID","Strategy Plan ID");
                    IF StrategicAct.FIND('-') THEN BEGIN
                       REPEAT
                         NumCount:=5;
                        // NumCount:=FnGetCount(StrategicAct);
                         WPLines.INIT;
                         WPLines.No:=No;
                         WPLines."Strategy Plan ID":=StrategicAct."Strategic Plan ID";
                         WPLines."Activity ID":=StrategicAct.Code;
                         WPLines."Year Reporting Code":="Year Reporting Code";
                         WPLines.Description:=StrategicAct.Description;
                         WPLines."Primary Directorate":=StrategicAct."Primary Directorate";
                         IF (NumCount>0) THEN
                            WPLines."Imported Annual Target Qty":=StrategicAct."Collective target"/NumCount;
                           WPLines.VALIDATE( WPLines."Imported Annual Target Qty");
                          IF (NumCount>0) THEN
                            WPLines."Imported Annual Budget Est.":=StrategicAct."Collective Budget"/NumCount;
                           WPLines.VALIDATE( WPLines."Imported Annual Budget Est.");
                         WPLines.INSERT(TRUE);
                       UNTIL StrategicAct.NEXT=0;
                      END;*///old

                    //new


                    StrategicIntPlanningLines.Reset;
                    StrategicIntPlanningLines.SetRange("Strategic Plan ID", Rec."Strategy Plan ID");
                    StrategicIntPlanningLines.SetRange("Annual Reporting Codes", Rec."Year Reporting Code");
                    if StrategicIntPlanningLines.FindSet then begin
                        repeat
                            WPLines.Init;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            WPLines."Year Reporting Code" := Rec."Year Reporting Code";
                            WPLines.Validate("Activity ID");
                            //WPLines.Description:=StrategicIntPlanningLines.Description;
                            WPLines."Primary Directorate" := StrategicIntPlanningLines."Primary Directorate";
                            //MESSAGE('StrategicIntPlanningLines."Primary Department" is %1',StrategicIntPlanningLines."Primary Department");
                            WPLines."Primary Department" := StrategicIntPlanningLines."Primary Department";
                            WPLines."Imported Annual Target Qty" := StrategicIntPlanningLines."Target Qty";
                            WPLines.Validate("Imported Annual Target Qty");
                            WPLines."Imported Annual Budget Est." := StrategicIntPlanningLines."Target Budget";
                            WPLines.Validate("Imported Annual Budget Est.");
                            StrategicInt.Reset;
                            StrategicInt.SetRange(Code, WPLines."Activity ID");
                            if StrategicInt.FindSet then begin
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                // WPLines."Key Performance Indicator":=StrategicInt."Date Filter";
                                WPLines."Primary Directorate Name" := StrategicInt."Primary Directorate";
                                WPLines."Primary Department Name" := StrategicInt."Primary Department";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            end;
                            WPLines.Insert();
                        until StrategicIntPlanningLines.Next = 0;
                    end;
                    Message('Work Plan Lines Populated Successfully');

                end;
            }
            separator(Action15)
            {
            }
            action("Export To Excel")
            {
                ApplicationArea = Basic;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    AnnualWorkPlan.Reset;
                    AnnualWorkPlan.SetRange(No, Rec.No);
                    if AnnualWorkPlan.Find('-') then begin
                        Xmlport.Run(80000, true, false, AnnualWorkPlan);
                    end;
                end;
            }
            separator(Action16)
            {
            }
            action("Import To Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Xmlport.Run(80001);
                end;
            }
            action("Import From Excel_TobeUsed")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Import Workplan Lines";
                Visible = false;
            }
            separator(Action17)
            {
            }
            action("Post Targets")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    WPlanLines.Reset;
                    WPlanLines.SetRange(No, Rec.No);
                    if WPlanLines.Find('-') then begin
                        repeat
                            //fnPostPlanEntry(WPlanLines);
                            StrategicPlanning.fnPostPlanEntry(WPlanLines);
                        until WPlanLines.Next = 0;
                    end;
                    Message('Targets Posted Successfully');
                end;
            }
            separator(Action19)
            {
            }
            action("Print Annual Plan")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80002, true, true, Rec)
                end;
            }
            separator(Action21)
            {
            }
            action("Preview Departmental Targets Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80048, true, true, Rec)
                end;
            }
            action("Combined Annual Workplan Report")
            {
                ApplicationArea = Basic;
                Caption = 'Preview AWP Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec.No);
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(80042, true, true, AnnualStrategyWorkplan);
                end;
            }
            action(Comments)
            {

                ApplicationArea = Basic;
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    BudgetComments: Record "Budget Comment";
                begin
                    BudgetComments.ShowComments(Rec.RecordId, true);
                end;
            }
            action("Board Activities")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Board Activities";
                RunPageLink = "AWP No" = field(No);
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        // IF ("Approval Status"="Approval Status"::Open) THEN
                        // IF ApprovalsMgmt.OnSendTPlanForApproval(Rec) THEN
                        //   ApprovalsMgmt.IsTPlanApprovalsWorkflowEnabled(Rec);


                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify;
                        Message('Document %1 has been approved Automatically', Rec.No);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //
                        // IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                        //   ApprovalsMgmt.OnCancelTPlanApprovalRequest(Rec);
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Annual Strategy Type" := Rec."annual strategy type"::Organizational;
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    var
        ExcelBuffer: Record "Excel Buffer";
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        Text0001: label 'testing';
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        StrategicPlanning: Codeunit "Strategic Planning";
        StrategicIntPlanningLines: Record "Strategic Int Planning Lines";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";


    procedure FnGetCount(StrategicInitiative: Record "Strategic Initiative") NumCount: Integer
    var
        StrategicInitiativeYears: Record "Strategic Int Planning Lines";
    begin
        StrategicInitiativeYears.Reset;
        StrategicInitiativeYears.SetRange("Strategic Plan ID", StrategicInitiative."Strategic Plan ID");
        StrategicInitiativeYears.SetRange("Theme ID", StrategicInitiative."Theme ID");
        StrategicInitiativeYears.SetRange("Objective ID", StrategicInitiative."Objective ID");
        StrategicInitiativeYears.SetRange("Strategy ID", StrategicInitiative."Strategy ID");
        StrategicInitiativeYears.SetRange(Code, StrategicInitiative.Code);
        if StrategicInitiativeYears.Find('-') then begin
            NumCount := StrategicInitiativeYears.Count;
        end;
        exit(NumCount);
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                Rec.No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;
}

#pragma implicitwith restore


