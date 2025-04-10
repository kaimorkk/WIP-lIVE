

page 80364 "approved Individual PC Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Individual Scorecard"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No';
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Functional WorkPlan"; Rec."Functional WorkPlan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional WorkPlan field.';
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Change Status"; Rec."Change Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Change Status field.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board & Core Mandate Assigned Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Board & Core Mandate Assigned Weight(%) field.';
                }
                field("Secondary Assigned Weight(%)"; Rec."Secondary Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Secondary Assigned Weight(%) field.';
                }
                field("JD Assigned Weight(%)"; Rec."JD Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the JD Assigned Weight(%) field.';
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                ApplicationArea = Basic;
            }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Primary Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Activity);
                ApplicationArea = Basic;
            }
            part("Secondary Workplan Initiatives"; "Secondary Workplan Initiatives")
            {
                Caption = 'Core Mandate Secondary Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Year Reporting Code" = field("Annual Reporting Code");
                ApplicationArea = Basic;
            }
            part(Control8; "PC Job Description")
            {
                Caption = 'Job Description';
                SubPageLink = "Workplan No." = field(No);
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
                group("Performance Review")
                {
                    Caption = 'Performance Review';
                    Image = Vendor;
                    action("Performance Appraisal")
                    {
                        ApplicationArea = Basic;
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Standard Perfomance Appraisal";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appraisal");
                        ToolTip = 'Executes the Performance Appraisal action.';
                    }
                    action("Performance Appeal")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Performance Appeal';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Perfomance Appeals";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appeal");
                        ToolTip = 'Executes the Performance Appeal action.';
                    }
                    action(PIPs)
                    {
                        ApplicationArea = Basic;
                        Caption = 'PIPs';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Performance Improvement Plans";
                        RunPageLink = "Personal Scorecard ID" = field(No);
                        ToolTip = 'Executes the PIPs action.';
                    }
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    // RunPageLink = "Table Name" = const("Applicant Qualification"),
                    //               "No." = field("No. Series");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Change Log")
                {
                    ApplicationArea = Basic;
                    Image = Log;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Performance Diary Logs";
                    RunPageLink = "Personal Scorecard ID" = field(No);
                    ToolTip = 'Executes the Change Log action.';
                }
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
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Functional WorkPlan");
                    Rec.TestField("Annual Reporting Code");

                    SPMGeneralSetup.Get;

                    if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                        PcLinesN.Reset;
                        PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLinesN.SetRange("Workplan No.", Rec."Functional WorkPlan");
                        //PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                        if PcLinesN.Find('-') then begin
                            repeat
                                //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                                PcLines.Init;
                                PcLines."Workplan No." := Rec.No;
                                PcLines."Strategy Plan ID" := PcLinesN."Strategy Plan ID";
                                PcLines."Initiative Type" := PcLinesN."Initiative Type";
                                PcLines."Initiative No." := PcLinesN."Initiative No.";
                                PcLines."Goal Template ID" := Rec."Goal Template ID";
                                PcLines."Objective/Initiative" := PcLinesN."Objective/Initiative";
                                PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                                PcLines."Primary Directorate" := PcLinesN."Primary Directorate";
                                PcLines."Primary Department" := PcLinesN."Primary Department";
                                PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                PcLines.Insert(true);
                            until PcLinesN.Next = 0;
                        end;
                    end;

                    if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                        JobResponsiblities.Reset;
                        JobResponsiblities.SetRange("Application No", Rec.Position);
                        if JobResponsiblities.FindFirst then begin
                            repeat
                                PCJobDescription.Init;
                                PCJobDescription."Workplan No." := Rec.No;
                                PCJobDescription."Line Number" := Format(JobResponsiblities.Surname);
                                PCJobDescription.Description := JobResponsiblities."First Name";
                                PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                PCJobDescription.Validate("Primary Department");
                                PCJobDescription.Insert;

                            until JobResponsiblities.Next = 0;
                        end;
                    end;

                    Message('Functional PC Populated Successfully');
                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                ToolTip = 'Executes the Populate Goals Hub action.';
                trigger OnAction()
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
            separator(Action34)
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
            separator(Action30)
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
            separator(Action49)
            {
            }
            action("Print Individual PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print Individual PC action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80007, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(LockContract)
                {
                    ApplicationArea = Service;
                    Caption = '&Lock Contract';
                    Image = Lock;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Make sure that the changes will be part of the contract.';

                    trigger OnAction()
                    var
                        LockOpenServContract: Codeunit "Lock-OpenServContract";
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        Rec."Change Status" := Rec."change status"::Locked;
                        Rec.Modify;
                        Message('Contract Locked Successfully');
                    end;
                }
                action(SignContract)
                {
                    ApplicationArea = Service;
                    Caption = 'Si&gn Contract';
                    Image = Signature;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Confirm the contract.';

                    trigger OnAction()
                    var
                        SignServContractDoc: Codeunit SignServContractDoc;
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        Rec.TestField("Change Status", Rec."change status"::Locked);
                        Rec.Status := Rec.Status::Signed;
                        Rec.Modify;
                        Message('Contract signed Successfully');
                    end;
                }
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
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
                actionref("Print Individual PC_Promoted"; "Print Individual PC")
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
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
}

#pragma implicitwith restore

