

page 80362 "Approved Functional PC Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Functional/Operational PC"));

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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective Setting Due Date field.';
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Workplan field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("CEO WorkPlan"; Rec."CEO WorkPlan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the CEO WorkPlan field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked? field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Last Evaluation Date field.';
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                ApplicationArea = Basic;
            }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Activity);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
            }
            action("Performance Appraisal")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Personal Scorecard ID" = field(No);
                ToolTip = 'Executes the Performance Appraisal action.';
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                ToolTip = 'Executes the Suggest Objective Lines action.';
                trigger OnAction()
                begin
                    /*TESTFIELD("Strategy Plan ID");
                    TESTFIELD("CEO WorkPlan");
                    TESTFIELD("Annual Reporting Code");
                    PcLinesN.RESET;
                    PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    PcLinesN.SETRANGE("Workplan No.","CEO WorkPlan");
                    PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                    IF PcLinesN.FIND('-') THEN BEGIN
                       REPEAT
                         //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":=PcLinesN."Strategy Plan ID";
                         PcLines."Initiative No.":=PcLinesN."Initiative No.";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=PcLinesN."Objective/Initiative";
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Activity;
                         PcLines."Primary Directorate":=PcLinesN."Primary Directorate";
                         PcLines."Primary Department":=PcLinesN."Primary Department";
                         PcLines."Imported Annual Target Qty":=PcLinesN."Imported Annual Target Qty";
                         PcLines."Q1 Target Qty":=PcLinesN."Q1 Target Qty";
                         PcLines."Q2 Target Qty":=PcLinesN."Q2 Target Qty";
                         PcLines."Q3 Target Qty":=PcLinesN."Q3 Target Qty";
                         PcLines."Q4 Target Qty":=PcLinesN."Q4 Target Qty";
                         PcLines.INSERT(TRUE);
                       UNTIL PcLinesN.NEXT=0;
                      END;
                    MESSAGE('Functional PC Populated Successfully');*/

                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Annual Workplan");
                    Rec.TestField("Annual Reporting Code");
                    StrategyObjLines.Reset;
                    StrategyObjLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SetRange(No, Rec."Annual Workplan");
                    StrategyObjLines.SetRange("Primary Directorate", Rec.Directorate);
                    //StrategyObjLines.SETRANGE("Primary Department","Responsibility Center");
                    if StrategyObjLines.Find('-') then begin
                        repeat
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Activity;
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Imported Annual Target Qty";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines.Insert(true);
                        until StrategyObjLines.Next = 0;
                    end;

                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", Rec."Annual Workplan");
                    if BoardActivities.Find('-') then begin
                        repeat
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Board;
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.Insert(true);
                        until BoardActivities.Next = 0;
                    end;
                    Message('Annual Workplan & Board PC Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                ToolTip = 'Executes the Populate Goals Hub action.';
                trigger OnAction()
                var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit "Email Message";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit "Email Message";
                    // DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    // FundingOpp: Record "Project Contract Header";
                    // GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    GoalTemplateLine.Reset;
                    GoalTemplateLine.SetRange("Goal Template ID", Rec."Goal Template ID");
                    if GoalTemplateLine.Find('-') then begin
                        repeat
                            workplangoalhub.Init;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := Rec.No;
                            workplangoalhub."Goal Description" := GoalTemplateLine.Description;
                            workplangoalhub."Aligned-To PC ID" := GoalTemplateLine."Corporate Strategic Plan ID";
                            workplangoalhub."Aligned-To PC Goal ID" := GoalTemplateLine."Strategic Objective ID";
                            workplangoalhub.Insert(true);
                        until GoalTemplateLine.Next = 0;
                    end;
                    Message('WorkPlan Hub Populated successfully');
                end;
            }
            action("Aligned Business Goals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = field(No);
                ToolTip = 'Executes the Aligned Business Goals action.';
            }
            action("Risk Analysis")
            {
                ApplicationArea = Basic;
                Image = Reserve;
                RunObject = Page "Workplan Risk";
                RunPageLink = "Document No" = field(No);
                ToolTip = 'Executes the Risk Analysis action.';
            }
            action("Capability Matrix")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Workplan Capability Matrixs";
                RunPageLink = "Document No" = field(No);
                ToolTip = 'Executes the Capability Matrix action.';
            }
            separator(Action35)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = Approval;
                ToolTip = 'Executes the Re-Open action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    /*//if //ApprovalsMgmt.CheckStrategicPlanApprovalPossible(Rec) THEN
                      //ApprovalsMgmt.IsReceiptApprovalsWorkflowEnabled(Rec);*/

                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;

                    Message('Document Re-Opened Successfully  ');

                end;
            }
            separator(Action31)
            {
            }
            action("Send Appraisal")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Send Appraisal action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Message('Test');
                end;
            }
            separator(Action48)
            {
            }
            action("Print Functional PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print Functional PC action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80006, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    ToolTip = 'Copy a Workplan and its Lines';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        CopyJob.SetFromWorkplan(Rec);
                        CopyJob.RunModal;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Objective Lines_Promoted"; "Suggest Objective Lines")
                {
                }
                actionref("Populate Goals Hub_Promoted"; "Populate Goals Hub")
                {
                }
                actionref("Send Appraisal_Promoted"; "Send Appraisal")
                {
                }
                actionref(CopyWorkplan_Promoted; CopyWorkplan)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Aligned Business Goals_Promoted"; "Aligned Business Goals")
                {
                }
            }
            group(Category_Category5)
            {
                actionref("Risk Analysis_Promoted"; "Risk Analysis")
                {
                }
                actionref("Capability Matrix_Promoted"; "Capability Matrix")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Print Functional PC_Promoted"; "Print Functional PC")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Functional/Operational PC";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Functional/Operational PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        BoardActivities: Record "Board Activities";
}

#pragma implicitwith restore

