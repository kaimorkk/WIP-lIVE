Page 80417 "Functional AWP Card"
{
    Caption = 'Functional AWP Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Annual Strategy Workplan";
    DelayedInsert = true;
    PromotedActionCategories = 'New,Process,Reports,Plan,Request Approval,Approval Options';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PageEditable;
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'STAJ Blueprint';
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
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;

                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }


                field("Rejection Reasons"; Rec."Rejection Reasons")
                {
                    ApplicationArea = All;
                    Editable = (Rec."Approval Status" = Rec."Approval Status"::"Pending Approval");
                    ToolTip = 'Specifies the value of the Rejection Reasons field.', Comment = '%';
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
                field("Planning Budget Type"; Rec."Planning Budget Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Resource Req. No"; Rec."Resource Req. No")
                {
                    ApplicationArea = Basic;
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
            group(Cons)
            {
                Caption = 'Consolidation';
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    Caption = 'AWP Consolidation Template';
                }
            }
            part(Control9; "Strategy Workplan Lines")
            {
                Editable = PageEditable;
                Caption = 'Workplan Lines';
                SubPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
                              No = field(No),
                              "Cross Cutting" = const(false);
                ToolTip = '<>';
                ApplicationArea = All;
            }
            // part(Control32;"Cross Cutting Activites")
            // {
            //     Caption = 'Cross Cutting Activites';
            //     SubPageLink = "Strategy Plan ID"=field("Strategy Plan ID"),
            //                   No=field(No),
            //                   "Cross Cutting"=const(true);
            //     ToolTip = '<>';
            // }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;

            }
        }
    }





    actions
    {
        area(creation)
        {
            action(Test)
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                Caption = 'Validate Workings';
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    HRportal: Codeunit HRPortal;
                    Workings: Record "Workplan Workings";

                begin
                    //HRportal.CreateNewResourceRequirement('STAJ-00001', 'FY2025/26', 20250701D, 20260630D, '30100601', '9011002329', 'CONS-0000013', '', 'COURT\MKARANJA');
                    Workings.Reset;
                    Workings.SetRange("Strategy Plan ID", Rec.No);
                    if Workings.FindSet() then
                        repeat
                            if Workings."Q1 Quantity" <> 0 then
                                Workings.Validate("Q1 Quantity");
                            if Workings."Q2 Quantity" <> 0 then
                                Workings.Validate("Q2 Quantity");
                            if Workings."Q3 Quantity" <> 0 then
                                Workings.Validate("Q3 Quantity");
                            if Workings."Q4 Quantity" <> 0 then
                                Workings.Validate("Q4 Quantity");
                            if Workings."Q1 Amount" <> 0 then
                                Workings.Validate("Q1 Amount");
                            if Workings."Q2 Amount" <> 0 then
                                Workings.Validate("Q2 Amount");
                            if Workings."Q3 Amount" <> 0 then
                                Workings.Validate("Q3 Amount");
                            if Workings."Q4 Amount" <> 0 then
                                Workings.Validate("Q4 Amount");
                            Workings.UpdateBudgetLine();
                            Workings.modify();
                        until Workings.Next() = 0;
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
            action("Activities")
            {
                ApplicationArea = Basic;
                Image = ShowList;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Workplan Activities";
                RunPageLink = "Strategic Plan ID" = field(No);
                ToolTip = 'Executes the Strategies action.';
            }
            action("Import From Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                //visible = false;
                trigger OnAction()
                var
                    Buffer: Record "Excel Buffer" temporary;
                    Data: Record "Workplan Budget Line";
                    InS: InStream;
                    Filename: Text;
                    Row: Integer;
                    LastRow: Integer;
                    x: Codeunit "Excel Management";
                begin
                    if UploadIntoStream('Select the Updated Workplan', '', '', Filename, InS) then begin
                        Buffer.OpenBookStream(InS, 'Workplan');
                        Buffer.ReadSheet();
                        Buffer.setrange("Column No.", 1);
                        Buffer.FindLast();
                        LastRow := Buffer."Row No.";
                        Buffer.Reset();


                        for row := 1 to LastRow do begin
                            Data.Reset();
                            Data.SetRange("Strategy Plan ID", x.GetText(Buffer, 'A', row));
                            Data.SetRange("KRA ID", x.GetText(Buffer, 'B', row));
                            Data.SetRange("Core Strategy ID", x.GetText(Buffer, 'C', row));
                            Data.SetRange("Strategy ID", x.GetText(Buffer, 'D', row));
                            Data.SetRange("Activity ID", x.GetText(Buffer, 'E', row));
                            Data.SetRange("Input Line No.", x.GetInteger(Buffer, 'F', row));
                            Data.SetRange("Line No.", x.GetText(Buffer, 'G', row));
                            Data.SetRange("Budget Item", x.GetText(Buffer, 'H', row));
                            if Data.FindFirst() then begin
                                Data.Validate("Q1 Unit Amount", x.GetDecimal(Buffer, 'P', Row));
                                Data.Validate("Q2 Unit Amount", x.GetDecimal(Buffer, 'Q', Row));
                                Data.Validate("Q3 Unit Amount", x.GetDecimal(Buffer, 'R', Row));
                                Data.Validate("Q4 Unit Amount", x.GetDecimal(Buffer, 'S', Row));
                                Data.Modify();
                            end;
                        end;
                    end;
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
            action("Update Annual Workplan")
            {
                ApplicationArea = Basic;
                Caption = 'Consolidate Resource Requirements';
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
            action("Export To Excel")
            {
                ApplicationArea = Basic;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    WorkplanLines: Record "Workplan Budget Line";
                begin
                    WorkplanLines.Reset;
                    WorkplanLines.SetRange("Strategy Plan ID", Rec.No);
                    if WorkplanLines.FindSet() then
                        Xmlport.Run(Xmlport::"Export Workplan", true, false, WorkplanLines);
                    // AnnualWorkPlan.Reset;
                    // AnnualWorkPlan.SetRange(No, Rec.No);
                    // if AnnualWorkPlan.Find('-') then begin
                    //     Xmlport.Run(Xmlport::"Export Work Plan Lines", true, false, AnnualWorkPlan);
                    // end;
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
                visible = false;
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
                PromotedOnly = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    AnnualStrategyWorkplan.Reset;
                    AnnualStrategyWorkplan.SetRange(No, Rec.No);
                    if AnnualStrategyWorkplan.FindFirst then
                        Report.Run(Report::"Functional Workplan", true, true, AnnualStrategyWorkplan);
                end;
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
                    Caption = 'Send for Review';
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
                        CurrPage.close;
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
                        DocType := DocType::"Resource Requirements";
                        DMSManagement.GetDocument(DocType, Rec.No, Rec.RecordID, 'FNC', 80019, 'Resource Requirements');
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
        Rec."Planning Budget Type" := Rec."Planning Budget Type"::"Original";
        // Rec."Requirement Type" := Rec."Requirement Type"::Finance;
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
        CanCancel := ApprovalMgts.CanCancelApprovalForRecord(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalMgts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            PageEditable := false
        else
            PageEditable := true;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            PageEditable := false
        else
            PageEditable := true;
    end;

    var
        PageEditable: Boolean;
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
        WorkplanActiv: Record "Sub Workplan Activity";
        QuarterAmount: array[5] of Decimal;
        CanCancel, OpenApprovalEntriesExistForCurrUser : Boolean;


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

