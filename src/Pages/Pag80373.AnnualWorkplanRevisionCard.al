

page 80373 "Annual Workplan Revision Card"
{
    Caption = 'Annual Workplan Revision Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Annual Workplan Revision";

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
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Current AWP"; Rec."Current AWP")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current AWP field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
            part(Control9; "Workplan Revision Lines")
            {
                SubPageLink = No = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Revision Workplan" = field("Annual Workplan");
                ToolTip = '<>';
                ApplicationArea = Basic;
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
                ToolTip = 'Executes the Suggest Activity Lines action.';
                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    Rec.TestField("Annual Workplan");
                    StrategyWorkplanLines.Reset;
                    StrategyWorkplanLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyWorkplanLines.SetRange("Year Reporting Code", Rec."Year Reporting Code");
                    StrategyWorkplanLines.SetRange(No, Rec."Annual Workplan");
                    if StrategyWorkplanLines.FindFirst then begin
                        repeat
                            WorkplanLinesRevision.Init;
                            WorkplanLinesRevision.No := Rec.No;
                            WorkplanLinesRevision."Revision Workplan" := Rec."Annual Workplan";
                            WorkplanLinesRevision."Strategy Plan ID" := Rec."Strategy Plan ID";
                            WorkplanLinesRevision."Activity ID" := StrategyWorkplanLines."Activity ID";
                            WorkplanLinesRevision.TransferFields(StrategyWorkplanLines, false);
                            WorkplanLinesRevision.Insert;
                        until StrategyWorkplanLines.Next = 0;
                    end;


                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", Rec."Annual Workplan");
                    if BoardActivities.FindFirst then begin
                        repeat
                            BoardActivitiesRevision.Init;
                            BoardActivitiesRevision."Revision Workplan No" := Rec.No;
                            BoardActivitiesRevision."AWP No" := Rec."Annual Workplan";
                            BoardActivitiesRevision.TransferFields(BoardActivities);
                            BoardActivitiesRevision.Insert;
                        until BoardActivities.Next = 0;
                    end;
                end;
            }
            separator(Action15)
            {
            }
            separator(Action17)
            {
            }
            action("Update Annual Workplan")
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Update Annual Workplan action.';
                trigger OnAction()
                begin
                    WorkplanLinesRevision.Reset;
                    WorkplanLinesRevision.SetRange(No, Rec.No);
                    if WorkplanLinesRevision.Find('-') then begin
                        repeat
                            StrategyWorkplanLines.Reset;
                            StrategyWorkplanLines.SetRange(No, WorkplanLinesRevision."Revision Workplan");
                            StrategyWorkplanLines.SetRange("Activity ID", WorkplanLinesRevision."Activity ID");
                            if StrategyWorkplanLines.Find('-') then begin
                            end;

                            StrategyWorkplanLines.Reset;
                            StrategyWorkplanLines.SetRange(No, WorkplanLinesRevision."Revision Workplan");
                            StrategyWorkplanLines.SetRange("Activity ID", WorkplanLinesRevision."Activity ID");
                            if not StrategyWorkplanLines.Find('-') then begin
                            end;

                        until WorkplanLinesRevision.Next = 0;
                    end;
                end;
            }
            separator(Action19)
            {
            }
            action("Board Activities")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                RunObject = Page "Board Activities Revision";
                RunPageLink = "Revision Workplan No" = field(No),
                              "AWP No" = field("Annual Workplan");
                ToolTip = 'Executes the Board Activities action.';
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                         IF ("Approval Status"="Approval Status"::Open) THEN
                        //if //ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) THEN
                           //ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);
                           */
                        /*
                        "Approval Status":="Approval Status"::Released;
                        MODIFY;
                        MESSAGE('Document %1 has been approved Automatically',No);
                        */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        /*IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                          //ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);*/

                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Activity Lines_Promoted"; "Suggest Activity Lines")
                {
                }
                actionref("Update Annual Workplan_Promoted"; "Update Annual Workplan")
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Board Activities_Promoted"; "Board Activities")
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
        StrategicPlanning: Codeunit KasnebFunctions;
        StrategicIntPlanningLines: Record "Strategic Int Planning Lines";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        WorkplanLinesRevision: Record "Workplan Lines Revision";
        BoardActivities: Record "Board Activities";
        BoardActivitiesRevision: Record "Board Activities Revision";


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
}

#pragma implicitwith restore

