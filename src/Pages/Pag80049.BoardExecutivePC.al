page 80049 "Board/Executive PC"
{
    Caption = 'Perfomance Contract(PC)';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Board/Executive PC"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document Type"; "Document Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = All;
                }
                field("Objective Setting Due Date"; "Objective Setting Due Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = All;
                }
                field("Strategy Framework"; "Strategy Framework")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Annual Reporting Code"; "Annual Reporting Code")
                {
                    ApplicationArea = All;
                }
                field("Goal Template ID"; "Goal Template ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Annual Workplan"; "Annual Workplan")
                {
                    Caption = 'Approved Organizational PC';
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field("Responsible Employee No."; "Responsible Employee No.")
                {
                    ApplicationArea = All;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = All;
                }
                field(Grade; Grade)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Employee Name"; "Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Caption = 'Department Code';
                    ApplicationArea = All;
                }
                field("Responsibility Center Name"; "Responsibility Center Name")
                {
                    Caption = 'Department Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Evaluation Type"; "Evaluation Type")
                {
                    ApplicationArea = All;
                }
                field("Approval Status"; "Approval Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Blocked?"; "Blocked?")
                {
                    ApplicationArea = All;
                }
                field("Created By"; "Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Created On"; "Created On")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Last Evaluation Date"; "Last Evaluation Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Vision and Mission")
            {
                field("Vision Statement"; "Vision Statement")
                {
                    ApplicationArea = All;
                }
                field("Mission Statement"; "Mission Statement")
                {
                    ApplicationArea = All;
                }
            }
            part("Objectives and Intiatives"; "Sub Objectives/Intiatives")
            {
                Caption = 'Activities and Performance Indicators';
                SubPageLink = "Workplan No." = field(No),
                              "Goal Template ID" = field("Goal Template ID");
                ApplicationArea = All;
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
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process; "Objectives and Intiatives"
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Personal Scorecard ID" = field(No);
                ApplicationArea = All;
            }
        }
        area(creation)
        {
            action("Core Mandate")
            {
                Image = Hierarchy;
                RunObject = Page 80003;
                ApplicationArea = All;
            }
            action("Strategic Theme")
            {
                Image = Planning;
                RunObject = Page "Strategic Theme";
                RunPageLink = "Strategic Plan ID" = field("Strategy Plan ID");
                ApplicationArea = All;
                // Strategic Plan ID=FIELD(Strategy Plan ID);
            }
            action("Strategic Objectives")
            {
                Image = Route;
                RunObject = Page "Strategic Objectives";
                RunPageLink = "Strategic Plan ID" = field("Strategy Plan ID");
                ApplicationArea = All;
            }
            /*    action("Performance Perspectives")
               {
                   Image = Interaction;
                   Promoted = true;
                   PromotedCategory = Process;
                   PromotedIsBig = true;
                   RunObject = Page 80365;
                   RunPageLink = Field2 = FIELD(No);
                   Visible = false;
               } */
            action("Suggest Objective Lines")
            {
                Image = Suggest;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if not CONFIRM('Are you sure you want to Suggest Activities', true) then
                        ERROR('Activities not suggested');
                    TESTFIELD("Strategy Plan ID");
                    TESTFIELD("Annual Workplan");
                    TESTFIELD("Annual Reporting Code");

                    /*
                    StrategyObjLines.RESET;
                    StrategyObjLines.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    StrategyObjLines.SETRANGE(No,"Annual Workplan");
                    IF StrategyObjLines.FIND('-') THEN BEGIN
                       REPEAT
                         ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":=StrategyObjLines."Strategy Plan ID";
                         PcLines."Initiative No.":=StrategyObjLines."Activity ID";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=StrategyObjLines.Description;
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Activity;
                         PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                         PcLines."Primary Department":=StrategyObjLines."Primary Department";
                         PcLines."Outcome Perfomance Indicator":=StrategyObjLines."Perfomance Indicator";
                         PcLines."Desired Perfomance Direction":=StrategyObjLines."Desired Perfomance Direction";
                         PcLines."Unit of Measure":=StrategyObjLines."Unit of Measure";
                         PcLines."Imported Annual Target Qty":=StrategyObjLines."Imported Annual Target Qty";
                         PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                         PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                         PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                         PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";
                         PcLines."Start Date":="Start Date";
                         PcLines."Due Date":="End Date";
                         PcLines."Strategy Framework":=StrategyObjLines."Strategy Framework";
                         PcLines."Framework Perspective":=StrategyObjLines."Framework Perspective";
                         PcLines.INSERT(TRUE);
                      //added by daudi to add PC Perspectives
                      PCPerspectives.RESET;
                      PCPerspectives.SETRANGE(Code,StrategyObjLines."Framework Perspective");
                      PCPerspectives.SETRANGE("Document No",No);
                      IF NOT PCPerspectives.FINDSET THEN BEGIN
                        PCPerspectives.INIT;
                        PCPerspectives.Code:=StrategyObjLines."Framework Perspective";
                        PCPerspectives."Document No":=No;
                        IF CSPPerspective.GET(PCPerspectives.Code) THEN
                        PCPerspectives.Description:=CSPPerspective.Description;
                        PCPerspectives.INSERT;
                        END;
                    
                       UNTIL StrategyObjLines.NEXT=0;
                      END;
                     */


                    BoardActivities.RESET;
                    BoardActivities.SETRANGE("AWP No", "Annual Workplan");
                    if BoardActivities.FIND('-') then begin
                        repeat
                            PcLines.INIT;
                            PcLines."Workplan No." := No;
                            PcLines."Strategy Plan ID" := "Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := "Goal Template ID";
                            PcLines."Unit of Measure" := BoardActivities."Unit of Measure";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := "Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Board;
                            PcLines."Strategy Framework" := BoardActivities."Strategy Framework";
                            PcLines."Framework Perspective" := BoardActivities."Framework Perspective";
                            PcLines."Assigned Weight (%)" := BoardActivities."WT(%)";
                            PcLines."Primary Directorate" := BoardActivities."Primary Directorate";
                            PcLines."Primary Department" := BoardActivities."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            // BoardActivities.CALCFIELDS(Budget);
                            // PcLines.Budget := BoardActivities.Budget;
                            PcLines."Start Date" := "Start Date";
                            PcLines."Due Date" := "End Date";
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.INSERT(true);

                            //Board Sub-activities
                            BoardSubActivities.RESET;
                            BoardSubActivities.SETRANGE("Workplan No.", "Annual Workplan");
                            BoardSubActivities.SETRANGE("Activity Id", BoardActivities."Activity Code");
                            if BoardSubActivities.FINDSET then begin
                                repeat
                                    PCSubActivities.INIT;
                                    PCSubActivities."Workplan No." := No;
                                    PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                                    PCSubActivities."Initiative Type" := PCSubActivities."Initiative Type"::Activity;
                                    PCSubActivities."Strategy Plan ID" := "Strategy Plan ID";
                                    PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                    PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                    PCSubActivities."Due Date" := BoardSubActivities."Due Date";
                                    PCSubActivities."Sub Targets" := BoardSubActivities."Imported Annual Target Qty";
                                    // PCSubActivities.Budget := BoardSubActivities."Sub Activity Budget";
                                    PCSubActivities."Objective/Initiative" := BoardSubActivities."Objective/Initiative";
                                    PCSubActivities."Goal ID" := PCSubActivities."Goal ID";
                                    PCSubActivities."Year Reporting Code" := PCSubActivities."Year Reporting Code";
                                    PCSubActivities."Outcome Perfomance Indicator" := BoardSubActivities."Outcome Perfomance Indicator";
                                    PCSubActivities."Unit of Measure" := BoardSubActivities."Unit of Measure";

                                    // PCSubActivities."Imported Annual Target Qty":=PCSubActivities."Imported Annual Target Qty"


                                    //PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
                                    PCSubActivities.INSERT(true);
                                until BoardSubActivities.NEXT = 0;
                            end;

                        until BoardActivities.NEXT = 0;
                    end;

                    /*//Board Sub-activities
                    BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities);
                    PCSubActivities."Workplan No.":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/
                    MESSAGE('Board PC Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                Enabled = false;
                Image = PostBatch;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    GoalTemplateLine.RESET;
                    GoalTemplateLine.SETRANGE("Goal Template ID", "Goal Template ID");
                    if GoalTemplateLine.FIND('-') then begin
                        repeat
                            workplangoalhub.INIT;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := No;
                            workplangoalhub."Goal Description" := GoalTemplateLine.Description;
                            workplangoalhub."Aligned-To PC ID" := GoalTemplateLine."Corporate Strategic Plan ID";
                            workplangoalhub."Aligned-To PC Goal ID" := GoalTemplateLine."Strategic Objective ID";
                            workplangoalhub.INSERT(true);
                        until GoalTemplateLine.NEXT = 0;
                    end;
                    MESSAGE('WorkPlan Hub Populated successfully');
                end;
            }
            action("Aligned Business Goals")
            {
                Image = "Action";
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = field(No);
                // RunPageLink = Performance Contract ID=FIELD(No);
                Visible = false;
                ApplicationArea = All;
            }
            action("Risk Analysis")
            {
                Image = Reserve;
                RunObject = Page "Workplan Risk";
                RunPageLink = "Document No" = field(No);
                ApplicationArea = All;
            }
            action("Capability Matrix")
            {
                Image = "Action";
                RunObject = Page "Workplan Capability Matrixs";
                RunPageLink = "Document No" = field(No);
                ApplicationArea = All;
            }

            action(Approvals)
            {
                Image = Approval;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                Image = SendApprovalRequest;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    TESTFIELD("Approval Status", "Approval Status"::Open);

                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", No);
                    if PcLines.FINDFIRST then begin
                        repeat
                        //PcLines.TESTFIELD("Primary Directorate");
                        until PcLines.NEXT = 0;
                    end;



                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/
                    "Approval Status" := "Approval Status"::Released;
                    MODIFY;
                    MESSAGE('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TESTFIELD("Approval Status", "Approval Status"::"Pending Approval");//status must be open.
                                                                                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                        ApprovalsMgmt.""(Rec);*/
                    "Approval Status" := "Approval Status"::Open;
                    MODIFY;
                    MESSAGE('Document has been Re-Opened');

                end;
            }

            action("Send Appraisal")
            {
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TESTFIELD("Approval Status", "Approval Status"::Released);
                    MESSAGE('Test');
                end;
            }

            // action("Print Board PC")
            // {
            //     Image = Print;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     Visible = false;
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     begin
            //         SETRANGE(No, No);
            //         REPORT.RUN(Report::"Board PC", true, true, Rec)
            //     end;
            // }
            action("Sub Activities Report")
            {
                Image = Print;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    SETRANGE(No, No);
                    //   REPORT.RUN(Report::"Performance Management Plan", TRUE, TRUE, Rec);
                end;
            }
            // action("Detailed PC")
            // {
            //     Image = Print;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     Visible = false;
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     begin
            //         SETRANGE(No, No);
            //         //REPORT.RUN(80004,TRUE,TRUE,Rec)
            //         REPORT.RUN(Report::"PERFORMANCE CONTRACT-IND", true, true, Rec);
            //     end;
            // }
            action("Preview Tagets")
            {
                Image = Print;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    SETRANGE(No, No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)"Workplan Capability Matixs"
                    // REPORT.RUN(Report::"Workplan Capability Matixs", TRUE, TRUE, Rec);
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
                        CopyJob.RUNMODAL;
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
                actionref("Core Mandate_Promoted"; "Core Mandate")
                {
                }
                actionref("Strategic Theme_Promoted"; "Strategic Theme")
                {
                }
                actionref("Strategic Objectives_Promoted"; "Strategic Objectives")
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
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Sub Activities Report_Promoted"; "Sub Activities Report")
                {
                }
                actionref("Preview Tagets_Promoted"; "Preview Tagets")
                {
                }
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        "Document Type" := "Document Type"::"Board/Executive PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        BoardActivities: Record "Board Activities";
        PCPerspectives: Record "PC Perspective";
        CSPPerspective: Record "Strategy Framework Perspective";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        txtDecimal: Decimal;
}

