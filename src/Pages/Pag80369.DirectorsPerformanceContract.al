

page 80369 "Directors Performance Contract"
{
    Caption = 'PMMU';
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
                    // Editable = false;
                    Caption = 'Head of Admin Unit No.';
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Head of Admin Unit Name';
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Functional Template ID"; Rec."Functional WorkPlan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Functional WorkPlan field.';
                }
                field("Contract Year"; Rec."Annual Reporting Code")
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
                field("Target Setting Commitee"; Rec."Target Setting Commitee")
                {
                    //Editable = Rec."Approval Status" = Rec."approval status"::Open;
                    Editable = DocEditable;
                    Caption = 'Evaluation Panel';
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        REC."PMMU/PAS Stage" := Rec."PMMU/PAS Stage"::"Target Setting";
                        REC.Modify();
                    end;
                }
                field("Evaluation Commitee"; Rec."Evaluation Commitee")
                {
                    Editable = Evaation;
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        REC."PMMU/PAS Stage" := Rec."PMMU/PAS Stage"::Evaluation;
                        REC.Modify();
                    end;
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


                // field("Approved By"; Rec."Approved By")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Approved By field.';
                // }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Approved field.';
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



                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Imlementing Unit';
                //     ToolTip = 'Specifies the value of the Department field.';
                // }
                // field("Responsibility Center Name"; Rec."Responsibility Center Name")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Implenting Unit Name';
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Department Name field.';
                // }

                field("Admin Unit"; Rec."Admin Unit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Admin Unit';
                    ToolTip = 'Specifies the value of the Admin Unit.';
                    Editable = false;


                }
                field("Admin Unit Name"; Rec."Admin Unit Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Admin Unit Name';
                    ToolTip = 'Specifies the value of the Admin Unit Name.';
                    Editable = false;

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




                // field("Signed By"; Rec."Signed By")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Signed By field.';
                // }
                // field("Date Signed"; Rec."Date Signed")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Date Signed field.';
                // }

                field("Document Type"; Rec."Document Type")
                {
                    visible = false;
                }
                field(ScoreCardType; Rec."Score Card Type")
                {
                    visible = false;


                }

                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Core Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Core Inititives Weight(%) field.';
                }
                field("Secondary Assigned Weight(%)"; Rec."Secondary Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Additional Inititives Weight(%) field.';
                }
                field("JD Assigned Weight(%)"; Rec."JD Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'JD Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the JD Inititives Weight(%) field.';
                }
            }
            part("PMMU Activities"; "PMMU Activities")
            {
                SubPageLink = "Strategy Plan ID" = field("Strategy Plan ID"), "Contract No." = field(No);
                ApplicationArea = All;
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'PMMU Activities';
                SubPageLink = "Goal ID" = field(No);
                //"Initiative Type" = const(Board);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Core Activities"; "Workplan Initiatives")
            {
                Caption = 'CSP Activities';
                Visible = false;
                SubPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity);
                ApplicationArea = Basic;
            }
            part("Core Activities1"; "Workplan Initiatives")
            {
                Caption = 'Crosscutting activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Added Activities"; "Secondary Workplan Initiatives")
            {
                Caption = 'Additional Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Year Reporting Code" = field("Annual Reporting Code");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control60; "PC Job Description")
            {
                Caption = 'Other Functional Activities';
                SubPageLink = "Workplan No." = field(No);
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control8; "PC Job Description")
            {
                Caption = 'Cross Functional activities';
                SubPageLink = "Workplan No." = field(No);
                Visible = false;
                ApplicationArea = Basic;
            }
        }

        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50038),
                              "No." = field(No);
            }
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }


    actions
    {
        area(navigation)
        {

            action(Attachments)
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
                    //     "No." = field("No. Series");
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
            action("Suggest Line")
            {
                Image = Suggest;
                Caption = 'Suggest Objective Lines';
                ApplicationArea = All;
                Visible = false;
                trigger OnAction()
                var
                    StrategyWorkplanLines: Record "Strategy Workplan Lines";
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', false) then exit;

                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Functional WorkPlan");
                    Rec.TestField("Annual Reporting Code");

                    SPMGeneralSetup.Get;

                    if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                        PcLinesN.Reset();
                        PcLinesN.SetRange(PcLinesN."Workplan No.", Rec.No);
                        if PcLinesN.FindFirst() then
                            PcLinesN.DeleteAll();

                        StrategyWorkplanLines.Reset();
                        StrategyWorkplanLines.SetRange(No, Rec."Functional WorkPlan");
                        StrategyWorkplanLines.SetRange("Primary Department", Rec."Department/Center PC ID");
                        if StrategyWorkplanLines.FindSet then
                            repeat
                                PcLinesN.Init;
                                PcLinesN."Workplan No." := Rec.No;
                                PcLinesN."Initiative Type" := PcLinesN."Initiative Type"::Activity;
                                PcLinesN."Workplan No." := StrategyWorkplanLines.No;
                                PcLinesN."Activity Type" := PcLinesN."Activity Type"::CSP;
                                PcLinesN.EntryNo := 0;
                                PcLinesN."Initiative No." := StrategyWorkplanLines."Activity ID";
                                PcLinesN."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                                PcLinesN."Objective/Initiative" := StrategyWorkplanLines.Description;
                                PcLinesN.Insert(true);
                            until StrategyWorkplanLines.Next = 0;

                        Message('Objectives Loaded successfully');
                    end else
                        Message('The field Allow Loading of CsP in spm general setup is marked false');
                end;
            }
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Visible = false;
                Enabled = false;
                ToolTip = 'Executes the Suggest Objective Lines action.';
                trigger OnAction()

                var
                    PCObjective: Record "PC Objective";
                    StrategyWorkplanLines: Record "Strategy Workplan Lines";
                begin
                    if not Confirm('Are you sure you want to Suggest Activities?', true) then
                        Error('Activities not Suggested');

                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Functional WorkPlan");
                    Rec.TestField("Annual Reporting Code");

                    PcLinesN.Reset();
                    PcLinesN.SetRange(PcLinesN."Workplan No.", Rec.No);
                    if PcLinesN.FindFirst() then
                        PcLinesN.DeleteAll();

                    SPMGeneralSetup.Get;

                    if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                        PcLinesN.Reset;
                        PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLinesN.SetRange("Workplan No.", Rec."Functional WorkPlan");
                        PcLinesN.SetRange("Initiative Type", PcLinesN."Initiative Type"::Activity);
                        //PcLinesN.SETRANGE(PcLinesN."Primary Directorate", "Responsibility Centre");
                        if PcLinesN.FindSet then begin
                            repeat
                                //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                                PcLines.Init;
                                PcLines."Workplan No." := Rec.No;
                                PcLines."Workplan No." := PcLinesN."Workplan No.";
                                PcLines."Strategy Plan ID" := PcLinesN."Strategy Plan ID";
                                PcLines."Initiative Type" := PcLinesN."Initiative Type";
                                PcLines."Initiative No." := PcLinesN."Initiative No.";
                                PcLines."Goal Template ID" := Rec."Goal Template ID";
                                PcLines."Objective/Initiative" := PcLinesN."Objective/Initiative";
                                PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                                PcLines.EntryNo := 0;
                                PcLines."Primary Directorate" := PcLinesN."Primary Directorate";
                                PcLines."Primary Department" := PcLinesN."Primary Department";
                                PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                PcLines."Strategy Framework" := PcLinesN."Strategy Framework";
                                PcLines."Framework Perspective" := PcLines."Framework Perspective";
                                PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                PcLines."Start Date" := Rec."Start Date";
                                PcLines."Due Date" := Rec."End Date";
                                PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                //PcLines."Combined Key" := PcLinesN."Workplan No." + PcLinesN."Strategy Plan ID" + PcLinesN."Initiative No.";
                                PcLines.Insert(true);

                                SubWorkplanActivy.Reset;
                                SubWorkplanActivy.SetRange("Workplan No.", PcLinesN."Workplan No.");
                                SubWorkplanActivy.SetRange("Strategy Plan ID", PcLinesN."Strategy Plan ID");
                                if SubWorkplanActivy.FindSet then
                                    repeat
                                        NewSubWorkplanActivy.Init;
                                        NewSubWorkplanActivy.TransferFields(SubWorkplanActivy);
                                        NewSubWorkplanActivy.Insert();
                                    until SubWorkplanActivy.Next = 0;

                                //Sub Activities
                                OriginalSubActivities.Reset;
                                OriginalSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                                OriginalSubActivities.SetRange("Workplan No.", Rec."Functional WorkPlan");
                                OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                if OriginalSubActivities.FindFirst then begin
                                    //repeat
                                    PCSubActivities.Init;
                                    PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                    PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                    PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                    PCSubActivities.TransferFields(OriginalSubActivities, false);
                                    PCSubActivities.Insert(true);
                                    // until OriginalSubActivities.Next = 0;
                                end;
                            //End Sub Activities
                            until PcLinesN.Next = 0;

                        end;
                    end;
                    //Loading JD
                    if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                        JobResponsiblities.Reset;
                        if Rec."Acting Job ID" <> '' then begin
                            JobResponsiblities.SetRange("Application No", Rec."Acting Job ID");
                        end else begin
                            JobResponsiblities.SetRange("Application No", Rec.Position);
                        end;
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

                    //load JD from New HR Module    \\Kisavi
                    /*IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
                      JobRes.RESET;
                      IF "Acting Job ID"<>'' THEN BEGIN
                        JobRes.SETRANGE("Position ID","Acting Job ID");
                        END ELSE BEGIN
                        JobRes.SETRANGE("Position ID",Position);
                          END;
                        IF JobRes.FINDFIRST THEN BEGIN
                        REPEAT
                          PCJobDescription.INIT;
                          PCJobDescription."Workplan No.":=No;
                          PCJobDescription."Line Number":=FORMAT(JobRes."Line No");
                          PCJobDescription.Description:=JobRes.Description;
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobRes.NEXT=0;
                      END;
                    END; */


                    //Board Sub-activities
                    /*BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities."Workplan No.":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/

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
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Start Evaluation")
            {
                ApplicationArea = All;
                Visible = Evaation;
                trigger OnAction()
                begin
                    rec.TestField("PMMU/PAS Stage", rec."PMMU/PAS Stage"::Evaluation);
                    rec."Approval Status" := Rec."Approval Status"::Open;
                    rec.Modify();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
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
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin

                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    /*TotalWeight:=0;
                    CALCFIELDS("Total Assigned Weight(%)","Secondary Assigned Weight(%)","JD Assigned Weight(%)");
                    TotalWeight:="Total Assigned Weight(%)"+"Secondary Assigned Weight(%)"+"JD Assigned Weight(%)";
                    IF NOT (TotalWeight=100) THEN
                       ERROR('Total Assigned Weight for all Core Mandate Primary Activities should be (100%),Currently is %1',TotalWeight);
                    */
                    PcLines.Reset;
                    PcLines.SetRange("Workplan No.", Rec.No);
                    if PcLines.FindFirst then begin
                        repeat
                        // PcLines.TESTFIELD("Primary Directorate");
                        // PcLines.TESTFIELD("Primary Department");
                        until PcLines.Next = 0;
                    end;


                    //status must be open.
                    /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                     //if //ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendPerformanceContractForApproval(Rec);*/


                    //Rec."Approval Status" := Rec."approval status"::Released;
                    //Rec.Modify;
                    /*
                   CompanyInfo.GET();
                     SMTPMailSet.GET;
                     SenderAddress := SMTPMailSet."Email Sender Address";
                     SenderName :=CompanyInfo.Name+' M&E';
                     Subject := STRSUBSTNO('Individual PC');
                        PerfomanceContractHeader.RESET;
                        PerfomanceContractHeader.SETRANGE(No,No);
                        IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                           FileDirectory :=  'C:\DOCS\';
                           FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                           //Window.OPEN('processing');
                           Window.OPEN('PROCESSING Individual PC ############1##');
                             Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                           WindowisOpen := TRUE;
                           IF FileName = '' THEN
                             ERROR('Please specify what the file should be saved as');


                            //Report.SaveAsPdf(80007,FileDirectory+FileName,PerfomanceContractHeader);




                           IF EXISTS(FileDirectory+FileName) THEN BEGIN
                             Counter:=Counter+1;

                           SMTPMailSet.GET;
                           SenderAddress := SMTPMailSet."Email Sender Address";



                          Employee.RESET;
                          Employee.SETRANGE("No.","Responsible Employee No.");
                          IF Employee.FIND('-') THEN BEGIN
                            Recipients :=Employee."Company E-Mail";
                          END;
                          IF Recipients<>'' THEN BEGIN
                            Body:='Dear Team <BR>Please find attached the Individual PC <Br>'+Description;
                             cu400.Create(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);

                             cu400.AppendToBody(
                             '<BR><BR>Kind Regards,');
                             cu400.AppendToBody('<BR>'+CompInfo.Name);
                             cu400.AddAttachment(FileDirectory+FileName,FileName);
                             cu400.Send;

                             SLEEP(1000);
                             Window.CLOSE;
                         END;
                         END;
                       END;


                   MESSAGE('Document has been approved Automatically');
                   */
                    Variant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Variant) then
                        ApprovalsMgmt.OnSendDocForApproval(Variant);

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    Variant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Variant := Rec;
                    ApprovalsMgmt.OnCancelDocApprovalRequest(Variant);
                end;
            }
            separator(Action30)
            {
            }
            action("Send Appraisal")
            {
                Caption = 'Submit Draft PMMU';
                ApplicationArea = Basic;
                ToolTip = 'Executes the Send Appraisal action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Submitted PMMU Successfully!');
                end;
            }
            separator(Action49)
            {
            }
            action("Print PMMU")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print PMMU action.';
                trigger OnAction()
                begin
                    // Rec.SetRange(No, Rec.No);
                    // Report.Run(Report::"PMMU Report", true, true, Rec);
                    // Rec.Reset;
                end;
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
            action("Individual PC-Sub Indicators")
            {
                ApplicationArea = Basic;
                Image = Print;
                // RunObject = Report "Individual PC-Sub Indicators";
                ToolTip = 'Executes the Individual PC-Sub Indicators action.';
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
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Suggest Line_Promoted"; "Suggest Line")
                {
                }
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
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Action', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Aligned Business Goals_Promoted"; "Aligned Business Goals")
                {
                }
                actionref("Risk Analysis_Promoted"; "Risk Analysis")
                {
                }
                actionref("Capability Matrix_Promoted"; "Capability Matrix")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 4.';

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
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Print PMMU_Promoted"; "Print PMMU")
                {
                }
                actionref("Print Individual PC_Promoted"; "Print Individual PC")
                {
                }
                actionref("Individual PC-Sub Indicators_Promoted"; "Individual PC-Sub Indicators")
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Directors;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Directors;
    end;

    trigger OnOpenPage()
    begin
        EditableCommitee();
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Directors;
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        EditableCommitee();
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        EditableCommitee();

    end;

    local procedure EditableCommitee()
    var
        myInt: Integer;
    begin
        SmtpSet.Get();
        DocEditable := SmtpSet."PMMU Document Stage" = SmtpSet."PMMU Document Stage"::"Target Setting";
        Evaation := SmtpSet."PMMU Document Stage" = SmtpSet."PMMU Document Stage"::Evaluation;
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        Evaation: Boolean;
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        SubWorkplanActivy: Record "Sub Workplan Activity";
        NewSubWorkplanActivy: Record "Sub Workplan Activity";
        DocEditable: Boolean;
        SmtpSet: Record "SPM General Setup";

}

#pragma implicitwith restore

