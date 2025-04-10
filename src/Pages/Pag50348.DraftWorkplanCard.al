page 50348 "Draft Workplan Card"
{
    Caption = 'Draft Workplan ';
    //DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Annual Strategy Workplan";
    PromotedActionCategories = 'New,Process,Reports,Plan,Request Approval,Approval Options';

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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    Caption = 'AWP Consolidation Template';
                }
                field("Functional Procurment Plan No"; Rec."Functional Procurment Plan No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Departmental Procurement Plan Template';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Ceiling Amount"; "Ceiling Amount")
                {
                    ApplicationArea = Basic, Suite;
                    //Editable = false;
                }
                field("Resource Req. No"; Rec."Resource Req. No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Supplementary Ceiling Amount"; SuppAmount)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supplementary Ceiling Amount field.', Comment = '%';
                    Visible = SuppVisible;

                }
                field("Budget Posted to G/L"; Rec."Budget Posted to G/L")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Posted to G/L field.';
                    Visible = false;
                }
                field("Planning Budget Type"; Rec."Planning Budget Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Planning Budget Type field.';
                }
                field("Consolidated"; Rec."Consolidated")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Archived; Rec.Archived)
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                group("Budget Amount Summary")
                {
                    field(Quarter1Amount; QuarterAmount[1])
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Quarter 1 Amount';
                        Editable = false;
                        Drilldown = true;
                    }
                    field(Quarter2Amount; QuarterAmount[2])
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Quarter 2 Amount';
                        Editable = false;
                        Drilldown = true;
                    }
                    field(Quarter3Amount; QuarterAmount[3])
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Quarter 3 Amount';
                        Editable = false;
                        Drilldown = true;
                    }
                    field(Quarter4Amount; QuarterAmount[4])
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Quarter 4 Amount';
                        Editable = false;
                        Drilldown = true;
                    }
                    field(TotalAmount; QuarterAmount[5])
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Total Amount';
                        Editable = false;
                        Drilldown = true;
                    }

                }
            }
            part(Control9; "Strategy Workplan Lines")
            {
                Caption = 'Workplan Lines';
                SubPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
                              No = field(No),
                              "Cross Cutting" = const(false);
                ToolTip = '<>';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(creation)
        {
            action(ValidateDim)
            {
                ApplicationArea = Basic;
                Caption = 'Validate Dimensions';
                Image = Validate;
                Promoted = true;
                PromotedCategory = Category4;
                //Visible = (not Rec.Consolidated) and (Rec."Approval Status" = Rec."Approval Status"::Released);

                trigger OnAction()
                begin
                    Rec.ValidateDims(Rec);
                end;
            }

            action(Reopen)
            {
                ApplicationArea = Basic;
                Caption = 'Reopen';
                Image = Validate;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = (Rec."Approval Status" = Rec."Approval Status"::Released);
                trigger OnAction()
                var
                    Budget: Record "G/L Budget Entry";
                begin
                    if Confirm('Do you want to Reopen this Workplan?', false) then begin
                        Rec."Approval Status" := Rec."Approval Status"::Open;
                        Rec.Posted := false;
                        Rec.Consolidated := false;
                        Rec."Budget Posted to G/L" := false;
                        Rec.Modify();
                        Budget.Reset();
                        Budget.SetRange("Source Document", Rec.No);
                        if Budget.FindSet() then
                            Budget.ModifyAll("Source Document", CopyStr(Rec.No, 2, 19));
                        Message('The workplan has been reopened');
                        CurrPage.Close();
                    end;
                end;
            }
            action("Update Annual Workplan")
            {
                ApplicationArea = Basic;
                Caption = 'Consolidate Draft Workplan';
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = (not Rec.Consolidated) and (Rec."Approval Status" = Rec."Approval Status"::Released);
                trigger OnAction()
                begin
                    if Confirm('Are you sure to consolidate to %1', false, Rec."Strategy Plan ID") then begin
                        Rec.ConsolidatePlan();
                        Currpage.Close();
                    end;
                end;
            }
            action("Suggest Activity Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
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
                    //StrategicIntPlanningLines.SETRANGE("Primary Directorate","Primary Directorate");
                    //StrategicIntPlanningLines.SETRANGE("Primary Department","primary department);
                    if StrategicIntPlanningLines.Find('-') then begin
                        repeat
                            WPLines.Init;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            StrategicInt.Reset;
                            StrategicInt.SetRange(Code, WPLines."Activity ID");
                            if StrategicInt.Find('-') then begin
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                //WPLines."Key Performance Indicator":=StrategicInt."Key Perfromance Indicator";
                                //WPLines."Primary Directorate Name":=StrategicInt."Primary Directorate Name";
                                //WPLines."Primary Department Name":=StrategicInt."Primary Department Name";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            end;
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
                            WPLines.Insert(true);
                        until StrategicIntPlanningLines.Next = 0;
                    end;
                    Message('Work Plan Lines Populated Successfully');
                end;
            }
            action("Suggest Functional lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Category4;
                visible = false;
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
                    WPLines.Reset;
                    WPLines.SetRange(No, Rec.No);
                    if WPLines.FindSet then begin
                        WPLines.DeleteAll;
                    end;

                    StrategicIntPlanningLines.Reset;
                    StrategicIntPlanningLines.SetRange("Strategic Plan ID", Rec."Strategy Plan ID");
                    StrategicIntPlanningLines.SetRange("Annual Reporting Codes", Rec."Year Reporting Code");
                    //StrategicIntPlanningLines.SETRANGE("Primary Directorate","Primary Directorate");
                    StrategicIntPlanningLines.SetRange("Primary Department", Rec.Department);
                    if StrategicIntPlanningLines.Find('-') then begin
                        repeat
                            WPLines.Init;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicIntPlanningLines."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicIntPlanningLines.Code;
                            StrategicInt.Reset;
                            StrategicInt.SetRange(Code, WPLines."Activity ID");
                            if StrategicInt.Find('-') then begin
                                WPLines."Perfomance Indicator" := StrategicInt."Perfomance Indicator";
                                //WPLines."Key Performance Indicator":=StrategicInt."Key Perfromance Indicator";
                                //WPLines."Primary Directorate Name":=StrategicInt."Primary Directorate Name";
                                //WPLines."Primary Department Name":=StrategicInt."Primary Department Name";
                                WPLines."Unit of Measure" := StrategicInt."Unit of Measure";
                                WPLines."Desired Perfomance Direction" := StrategicInt."Desired Perfomance Direction";
                                WPLines."Strategy Framework" := StrategicInt."Strategy Framework";
                                WPLines."Framework Perspective" := StrategicInt."Framework Perspective";
                                WPLines."Source Of Fund" := StrategicInt."Source Of Fund";
                            end;
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
                            WPLines.Insert(true);
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
                //Visible = false;
                trigger OnAction()
                var
                    WorkplanLines: Record "Workplan Budget Line";
                begin
                    // WorkplanLines.Reset;
                    // WorkplanLines.SetRange("Strategy Plan ID", Rec.No);
                    // if WorkplanLines.FindSet() then
                    //     Xmlport.Run(Xmlport::"Export Workplan", true, false, WorkplanLines);
                    ExportToExcel(Rec);
                end;
            }
            separator(Action16)
            {
            }
            action("Import From Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                //visible = false;
                trigger OnAction()
                begin
                    ImportfromExcel(Rec, '');
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
                Visible = false;
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
            separator(Action19)
            {
            }
            action("Budget Per Item")
            {
                ApplicationArea = Basic, Suite;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    AWP: Record "Annual Strategy Workplan";
                begin
                    AWP.Reset();
                    AWP.SetRange(No, Rec.No);
                    Report.Run(Report::"Workplan Budget Per Item", true, true, AWP);
                end;
            }

            separator(Action21)
            {
            }
            action("Board Activities")
            {
                ApplicationArea = Basic;
                Caption = 'PC Activities';
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Board Activities";
                RunPageLink = "AWP No" = field(No);
                Visible = false;
            }
            separator(Action34)
            {
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    if Confirm('Are You sure you want to Archive this Document ?', true) then begin
                        Rec.TestField(Archived, false);
                        Rec.TestField("Approval Status", Rec."approval status"::Open);
                        Rec.Validate(Archived, true);
                        Rec.Modify(true);
                        Message('Archived Successfully');
                    end;
                    CurrPage.Close;
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
                        Report.Run(report::"Functional Workplan", true, true, AnnualStrategyWorkplan);
                end;
            }
            action("PPR")
            {
                ApplicationArea = Basic;
                Caption = 'Program Perfomance Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec.No);
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(report::"Program Perfomance Report PPR", true, true, AnnualStrategyWorkplan);
                end;
            }
            action(ProcurementPlan)
            {
                ApplicationArea = Basic;
                Caption = 'Draft Procurement Plan';
                Image = Planning;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec.No);
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(report::"Draft Procurement Plan", true, true, AnnualStrategyWorkplan);
                end;
            }
            action("Update AWP Amounts")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                trigger OnAction()
                begin
                    WorkplanActiv.Reset;
                    WorkplanActiv.SetRange("Workplan No.", Rec.No);
                    if WorkplanActiv.FindSet then begin
                        repeat
                            WorkplanActiv.CalcFields("Total Autocalculated Amount");
                            WorkplanActiv."Total Budget" := WorkplanActiv."Total Autocalculated Amount";
                            WorkplanActiv.Modify(true);
                        until WorkplanActiv.Next = 0;
                    end;

                    WPlanLines.Reset;
                    WPlanLines.SetRange(No, Rec.No);
                    if WPlanLines.Find('-') then begin
                        repeat
                            WPlanLines.CalcFields("Sub Activity Budget Sum");
                            WPlanLines."Total Subactivity budget" := WPlanLines."Sub Activity Budget Sum";
                            WPlanLines.Modify(true);
                        until WPlanLines.Next = 0;
                    end;
                    Message('Updated Successfully');
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send for review';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    visible = (Rec."Approval Status" = Rec."Approval Status"::Open);
                    trigger OnAction()
                    var
                        ApprovalMgt: codeunit "Custom Approvals Codeunit";
                        SubWorkplanActivity: Record "Sub Workplan Activity";
                        WorkplanCostElements: Record "Workplan Cost Elements";
                        VarVariant: Variant;
                    begin
                        /* Rec.CalcFields("Total Assigned Weight(%)");
                         if Rec."Total Assigned Weight(%)" <> 100 then
                             Error('Total Assigned weight should be equal to 100%');
                         WPlanLines.Reset;
                         WPlanLines.SetRange(No, Rec.No);
                         if WPlanLines.FindFirst then begin
                             repeat
                                 WPlanLines.TestField("Primary Directorate");
                                 WPlanLines.TestField("Primary Department");
                                 WPlanLines.TestField("Annual Target");

                                 SubWorkplanActivity.Reset;
                                 //SubWorkplanActivity.SETRANGE("Strategy Plan ID",WPlanLines."Strategy Plan ID");
                                 SubWorkplanActivity.SetRange("Workplan No.", WPlanLines.No);
                                 SubWorkplanActivity.SetRange("Activity Id", WPlanLines."Activity ID");
                                 if SubWorkplanActivity.FindFirst then begin
                                     repeat
                                         SubWorkplanActivity.TestField("Imported Annual Target Qty");

                                         WorkplanCostElements.Reset;
                                         WorkplanCostElements.SetRange("Workplan No.", SubWorkplanActivity."Workplan No.");
                                         WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                                         WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                                         if not WorkplanCostElements.Find('-') then begin
                                             repeat
                                                 Error('All Sub activities must have Workplan Cost Elements. Please enter Workplan Cost Elements for sub activity %1  %2',
                                                 SubWorkplanActivity."Sub Initiative No.", SubWorkplanActivity."Objective/Initiative");
                                             until WorkplanCostElements.Next = 0;
                                         end;

                                         /// Added to check Procurement Items.
                                         WorkplanCostElements.Reset;
                                         WorkplanCostElements.SetRange("Workplan No.", SubWorkplanActivity."Workplan No.");
                                         WorkplanCostElements.SetRange("Activity Id", SubWorkplanActivity."Activity Id");
                                         WorkplanCostElements.SetRange("Sub Activity No", SubWorkplanActivity."Sub Initiative No.");
                                         if WorkplanCostElements.Find('-') then begin
                                             repeat
                                                 WorkplanCostElements.TestField("Job No");
                                                 WorkplanCostElements.TestField("Vote id");
                                                 WorkplanCostElements.TestField("Plan Category");
                                                 WorkplanCostElements.TestField("Plan Item No");
                                                 WorkplanCostElements.TestField("Unit Cost");
                                                 WorkplanCostElements.TestField(Quantity);
                                                 WorkplanCostElements.TestField("Q1 Quantity");
                                                 WorkplanCostElements.TestField("Q2 Quantity");
                                                 WorkplanCostElements.TestField("Q3 Quantity");
                                                 WorkplanCostElements.TestField("Q4 Quantity");
                                             until WorkplanCostElements.Next = 0;
                                         end;

                                     until SubWorkplanActivity.Next = 0;
                                 end;
                             until WPlanLines.Next = 0;
                         end;
                         */
                        Rec.SendApprovalRequest();
                        VarVariant := Rec;
                        ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalMgt.RunWorkflowOnSendApprovalRequest(VarVariant);
                        CurrPage.Close();
                        //if (Rec."Approval Status" = Rec."approval status"::Open) then
                        //if ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = CanCancel;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        //ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant);
                        ApprovalMgt.RunWorkflowOnCancelApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Close();
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Close();
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Update();
                    end;
                }
            }

            group(Attachments)
            {
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "Sharepoint Integration";
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::Workplans;
                        DMSManagement.GetDocument(DocType, Rec.No, Rec.RecordID, 'FNC', 80019, 'Workplans');
                    end;
                }
                action("View Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                    begin

                        attachLink.setRange(attachLink.Document_No, Rec.No);
                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');

                    end;
                }

            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Annual Strategy Type" := Rec."annual strategy type"::Functional;
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::"Supplementary";
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    var
        ExcelBuffer: Record "Excel Buffer";
    begin
    end;

    trigger OnAfterGetRecord()
    var
        ApprovalMgts: Codeunit "Approvals Mgmt.";
    begin
        Rec.GetBudgetAmount(QuarterAmount);
        Rec.getSupplementaryAmount(SuppAmount);
        CanCancel := ApprovalMgts.CanCancelApprovalForRecord(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalMgts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        if Rec."Planning Budget Type" = Rec."Planning Budget Type"::"Supplementary 2" then
            SuppVisible := true;
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
        if Rec."Planning Budget Type" = Rec."Planning Budget Type"::"Supplementary 2" then
            SuppVisible := true;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
        if Rec."Planning Budget Type" = Rec."Planning Budget Type"::"Supplementary 2" then
            SuppVisible := true;
    end;


    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        UserSetup: Record "User Setup";
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
        WorkplanActiv: Record "Sub Workplan Activity";
        QuarterAmount: array[5] of Decimal;
        SuppAmount: Decimal;
        CanCancel, OpenApprovalEntriesExistForCurrUser, SuppVisible : Boolean;

    procedure exportToExcel(Rec: Record "Annual Strategy Workplan") FileContentsB64: Text
    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        ServerFileName: Text;
        x: Codeunit "Excel Management";
        WorkplanLines: Record "Workplan Budget Line";
        Workplan: Record "Strategy Workplan Lines";
        Objective: Record "Strategic Objective";
        Strat: Record Strategy;
        TempBlob: Codeunit "Temp Blob";
        Output: OutStream;
        BlobInStream: InStream;
        Base64: Codeunit "Base64 Convert";
    begin
        ExcelBuffer.Reset();
        ExcelBuffer.deleteAll();
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Strategy Plan ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("KRA ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Core Strategy ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Strategic Objective', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Strategy ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Strategy', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Activity ID"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Activity', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Input Line No."), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Line No."), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Budget Item"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Budget Item Description"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Global Dimension 1 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Global Dimension 2 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 3 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 4 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 5 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Shortcut Dimension 6 Code"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q1 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q2 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q3 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(WorkplanLines.FieldCaption("Q4 Amount"), false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);

        WorkplanLines.Reset;
        WorkplanLines.SetRange("Strategy Plan ID", Rec.No);
        WorkplanLines.SetRange("G/L Updated", false);
        if WorkplanLines.FindSet() then
            repeat
                Workplan.Reset();
                Workplan.SetRange("Activity ID", WorkplanLines."Activity ID");
                //Workplan.SetRange("Strategy Plan ID", WorkplanLines."Strategy Plan ID");
                Workplan.FindFirst();
                Strat.Reset;
                Strat.SetRange("Strategy ID", WorkplanLines."Strategy ID");
                Strat.FindFirst();
                Objective.Reset;
                Objective.SetRange("Objective ID", WorkplanLines."Core Strategy ID");
                Objective.FindFirst();
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(WorkplanLines."Strategy Plan ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."KRA ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Core Strategy ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Objective.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Strategy ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Strat.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Activity ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(Workplan.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Input Line No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Line No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Budget Item", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Budget Item Description", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Global Dimension 1 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Global Dimension 2 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 3 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 4 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 5 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Shortcut Dimension 6 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(WorkplanLines."Q1 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q2 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q3 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(WorkplanLines."Q4 Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);


            until WorkplanLines.Next() = 0;
        ExcelBuffer.CreateNewBook('Workplan');
        ExcelBuffer.WriteSheet(Rec.Description, CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename(Rec.Description);
        if GuiAllowed then
            ExcelBuffer.OpenExcel()
        else begin
            TempBlob.CreateInStream(BlobInStream);
            TempBlob.CreateOutStream(Output, TextEncoding::UTF8);
            ExcelBuffer.SaveToStream(Output, true);
            FileContentsB64 := Base64.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;

    end;

    procedure ImportfromExcel(Workplan: Record "Annual Strategy Workplan"; FileContentsB64: Text)
    var
        Buffer: Record "Excel Buffer" temporary;
        Data: Record "Workplan Budget Line";
        InS: InStream;
        Filename: Text;
        Row: Integer;
        LastRow: Integer;
        x: Codeunit "Excel Management";
        Base64: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        Output: OutStream;
        BlobInStream: InStream;
    begin
        if GuiAllowed then begin
            if UploadIntoStream('Select the Updated Workplan', '', '', Filename, InS) then begin
            end;
        end else begin
            TempBlob.CreateInStream(InS);
            TempBlob.CreateOutStream(Output, TextEncoding::UTF8);
            Base64.FromBase64(FileContentsB64, Output);
        end;

        Buffer.OpenBookStream(InS, 'Workplan');
        Buffer.ReadSheet();
        Buffer.setrange("Column No.", 1);
        Buffer.FindLast();
        LastRow := Buffer."Row No.";
        Buffer.Reset();


        for row := 2 to LastRow do begin
            Data.Reset();
            Data.SetRange("Strategy Plan ID", x.GetText(Buffer, 'A', row));
            Data.SetRange("KRA ID", x.GetText(Buffer, 'B', row));
            Data.SetRange("Core Strategy ID", x.GetText(Buffer, 'C', row));
            Data.SetRange("Strategy ID", x.GetText(Buffer, 'E', row));
            Data.SetRange("Activity ID", x.GetText(Buffer, 'G', row));
            Data.SetRange("Input Line No.", x.GetInteger(Buffer, 'I', row));
            Data.SetRange("Line No.", x.GetText(Buffer, 'J', row));
            Data.SetRange("Budget Item", x.GetText(Buffer, 'K', row));
            if Data.FindFirst() then begin
                Data.Validate("Q1 Unit Amount", x.GetDecimal(Buffer, 'S', Row));
                Data.Validate("Q2 Unit Amount", x.GetDecimal(Buffer, 'T', Row));
                Data.Validate("Q3 Unit Amount", x.GetDecimal(Buffer, 'U', Row));
                Data.Validate("Q4 Unit Amount", x.GetDecimal(Buffer, 'V', Row));
                Data.Modify();
            end;
        end;
    end;

}
