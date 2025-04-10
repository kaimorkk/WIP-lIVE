

page 80367 "Departments\Centers PC"
{
    Caption = 'Performance Appraisal System';
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field("Type"; Rec."Target Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Type field.';
                // }
                field("Directors PC ID"; Rec."Directors PC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directors PC ID field.';
                    Editable = true;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Strsategy Plan ID field.';
                }

                field("Contract Year"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Goal Template ID field.';
                }
                field("Populate Activities From"; Rec."Populate Activities From")
                {
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
                    Caption = 'Implementing Unit';
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Implementing Unit Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
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
                    Caption = 'Primary Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Primary Inititives Weight(%) field.';
                }
                field("Secondary Assigned Weight(%)"; Rec."Secondary Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Secondary Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Secondary Inititives Weight(%) field.';
                }
                field("JD Assigned Weight(%)"; Rec."JD Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'JD Inititives Weight(%)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the JD Inititives Weight(%) field.';
                }

            }
            part("Core Activities"; "Workplan Initiatives")
            {
                Caption = 'CSP Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity);
                ApplicationArea = Basic;
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = ' PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                Visible = true;
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
            part(Control8; "PC Job Description")
            {
                Caption = 'Cross Functional Activities';
                SubPageLink = "Workplan No." = field(No);
                ApplicationArea = Basic;
            }
            part("PAS Core Values"; "PAS Core Values")
            {
                Caption = 'PAS Core Values';
                SubPageLink = "Performance Contract Header" = field(No);
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
                    //   RunPageLink = "Table Name" = const("Applicant Qualification"),
                    ///              "No." = field("No. Series");
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
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Directors PC ID");
                    Rec.TestField("Annual Reporting Code");

                    SPMGeneralSetup.Get;
                    PCHeader.Reset;
                    PCHeader.SetRange(No, Rec."Directors PC ID");
                    if PCHeader.FindSet then begin

                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PcLinesN.Reset;
                            // PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                            PcLinesN.SetRange("Workplan No.", PCHeader.No);
                            //     PcLinesN.SetRange("Primary Department", Rec."Responsibility Center");
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
                                    PcLines."Primary Department Name" := PcLinesN."Primary Department Name";
                                    PcLines."Primary Directorate Name" := PcLinesN."Primary Directorate Name";
                                    PcLines."Primary Department" := PcLinesN."Primary Department";
                                    PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                    //PcLines."Key Performance Indicator":=PcLinesN."Key Performance Indicator";
                                    PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                    PcLines."Start Date" := Rec."Start Date";
                                    PcLines."Due Date" := Rec."End Date";
                                    PcLines."Previous Annual Target Qty" := PcLinesN."Previous Annual Target Qty";
                                    PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                    PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                    //       PcLines."Q1 Target Qty":=PcLinesN."Q1 Target Qty";
                                    //       PcLines."Q2 Target Qty":=PcLinesN."Q2 Target Qty";
                                    //       PcLines."Q3 Target Qty":=PcLinesN."Q3 Target Qty";
                                    //       PcLines."Q4 Target Qty":=PcLinesN."Q4 Target Qty";
                                    PcLines.Insert(true);

                                    //Sub Activities
                                    OriginalSubActivities.Reset;
                                    OriginalSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                                    OriginalSubActivities.SetRange("Workplan No.", Rec."Directors PC ID");
                                    OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                    if OriginalSubActivities.FindFirst then begin
                                        repeat
                                            //ERROR('123');
                                            PCSubActivities.Init;
                                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                            PCSubActivities."Workplan No." := Rec.No;
                                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                            PCSubActivities.TransferFields(OriginalSubActivities, false);
                                            PCSubActivities.Insert(true);
                                        until OriginalSubActivities.Next = 0;
                                    end;
                                //End Sub Activities

                                until PcLinesN.Next = 0;
                            end;
                            ///where Department is blank
                            PcLinesN.Reset;
                            PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                            PcLinesN.SetRange("Workplan No.", PCHeader.No);
                            PcLinesN.SetRange("Primary Department", '')
                            ;
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
                                    PcLines."Primary Department Name" := PcLinesN."Primary Department Name";
                                    PcLines."Primary Directorate Name" := PcLinesN."Primary Directorate Name";
                                    PcLines."Primary Department" := PcLinesN."Primary Department";
                                    PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                    //PcLines."Key Performance Indicator":=PcLinesN."Key Performance Indicator";
                                    PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                    PcLines."Start Date" := Rec."Start Date";
                                    PcLines."Due Date" := Rec."End Date";
                                    PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                    PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                    PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                    PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                    PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                    PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                    PcLines.Insert(true);

                                    //Sub Activities
                                    OriginalSubActivities.Reset;
                                    OriginalSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                                    OriginalSubActivities.SetRange("Workplan No.", Rec."Directors PC ID");
                                    OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                    if OriginalSubActivities.FindFirst then begin
                                        repeat
                                            // ERROR('1234');
                                            PCSubActivities.Init;
                                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                            PCSubActivities."Workplan No." := Rec.No;
                                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                            PCSubActivities.TransferFields(OriginalSubActivities, false);
                                            PCSubActivities.Insert(true);
                                        until OriginalSubActivities.Next = 0;
                                    end;
                                //End Sub Activities

                                until PcLinesN.Next = 0;
                            end;
                        end;
                        //Loading JD
                        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                            // MESSAGE('Wow');
                            JobRes.Reset;
                            if Rec."Acting Job ID" <> '' then begin
                                JobRes.SetRange("Position ID", PCHeader."Acting Job ID");
                            end else begin
                                JobRes.SetRange("Position ID", PCHeader.Position);
                            end;
                            if JobRes.FindFirst then begin
                                repeat
                                    PCJobDescription.Init;
                                    PCJobDescription."Workplan No." := Rec.No;
                                    PCJobDescription."Line Number" := Format(JobRes."Line No");
                                    PCJobDescription.Description := JobRes.Description;
                                    PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                    PCJobDescription.Validate("Primary Department");
                                    PCJobDescription."Start Date" := Rec."Start Date";
                                    PCJobDescription."Due Date" := Rec."End Date";
                                    PCJobDescription.Insert;

                                until JobRes.Next = 0;
                            end;
                        end;
                    end;  //**************************************************** Added by Kisavi to load JD from the new HR Module
                    /*
                    IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
                      JobResponsiblities.RESET;
                      IF "Acting Job ID"<>'' THEN BEGIN
                        JobResponsiblities.SETRANGE("Application No","Acting Job ID");
                      END ELSE BEGIN
                      JobResponsiblities.SETRANGE("Application No",Position);
                        END;
                      IF JobResponsiblities.FINDFIRST THEN BEGIN
                        REPEAT
                          PCJobDescription.INIT;
                          PCJobDescription."Workplan No.":=No;
                          PCJobDescription."Line Number":=FORMAT(JobResponsiblities.Surname);
                          PCJobDescription.Description:=JobResponsiblities."First Name";
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobResponsiblities.NEXT=0;
                      END;
                    END;
                    END;*/
                    //Board Sub-activities
                    BoardSubActivities.Reset;
                    BoardSubActivities.SetRange("Workplan No.", Rec."Annual Workplan");
                    if BoardSubActivities.FindSet then begin
                        repeat
                            PCSubActivities.Init;
                            PCSubActivities.TransferFields(BoardSubActivities);
                            PCSubActivities."Workplan No." := Rec.No;
                            PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                            PCSubActivities.Insert(true);
                        until BoardSubActivities.Next = 0;
                    end;

                    Message('Directors PC Populated Successfully');

                end;
            }
            action("Select Activities")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                ToolTip = 'Executes the Select Activities action.';
                trigger OnAction()
                begin
                    Clear(WorkplanInitiatives);
                    PcLines.Reset;
                    PcLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    PcLines.SetRange("Workplan No.", Rec."Directors PC ID");
                    WorkplanInitiatives.SetTableview(PcLines);
                    WorkplanInitiatives.LookupMode(true);
                    if WorkplanInitiatives.RunModal = Action::LookupOK then begin
                        PcLines.Reset;
                        PcLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                        PcLines.SetRange("Workplan No.", Rec."Directors PC ID");
                        PcLines.SetRange(Selected, true);
                        if PcLines.FindFirst then begin
                            repeat
                                PcLinesN.Init;
                                PcLinesN."Strategy Plan ID" := Rec."Strategy Plan ID";
                                PcLinesN."Workplan No." := Rec.No;
                                PcLinesN."Initiative No." := PcLines."Initiative No.";
                                PcLinesN.TransferFields(PcLines, false);
                                PcLinesN.Insert;
                            until PcLines.Next = 0;
                        end;
                    end;

                    OriginalSubActivities.Reset;
                    OriginalSubActivities.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    OriginalSubActivities.SetRange("Workplan No.", Rec."Directors PC ID");
                    OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                    if OriginalSubActivities.FindFirst then begin
                        repeat
                            //ERROR('123');
                            PCSubActivities.Init;
                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                            PCSubActivities."Workplan No." := Rec.No;
                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                            PCSubActivities.TransferFields(OriginalSubActivities, false);
                            PCSubActivities.Insert(true);
                        until OriginalSubActivities.Next = 0;

                    end;
                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Visible = false;
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
            action("Supervisor PAS")
            {
                ApplicationArea = Basic;
                Image = ViewCheck;
                trigger OnAction()
                var
                    PerfomanceContrHdr: Record "Perfomance Contract Header";
                begin
                    PerfomanceContrHdr.Reset();
                    PerfomanceContrHdr.SetRange(PerfomanceContrHdr."Document Type", PerfomanceContrHdr."Document Type"::"Individual Scorecard");
                    PerfomanceContrHdr.SetRange("Responsible Employee No.", Rec."Supervisors Employee No.");
                    PerfomanceContrHdr.SetRange("Annual Reporting Code", Rec."Annual Reporting Code");
                    if PerfomanceContrHdr.FindFirst() then
                        Page.Run(Page::"Departments\Centers PC", PerfomanceContrHdr);

                end;
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
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::Open);
                    TotalWeight:=0;
                    CALCFIELDS("Total Assigned Weight(%)","Secondary Assigned Weight(%)","JD Assigned Weight(%)");
                    TotalWeight:="Total Assigned Weight(%)"+"Secondary Assigned Weight(%)"+"JD Assigned Weight(%)";
                    IF NOT (TotalWeight=100) THEN
                       ERROR('Total Assigned Weight for all Core Mandate Primary Activities should be (100%),Currently is %1',TotalWeight);
                    
                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.",No);
                    IF PcLines.FINDFIRST THEN BEGIN
                      REPEAT
                       // PcLines.TESTFIELD("Primary Directorate");
                       // PcLines.TESTFIELD("Primary Department");
                        UNTIL PcLines.NEXT=0;
                      END;*/

                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    //status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                                                         ////if //ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                                                         // //ApprovalsMgmt.OnSendPerformanceContractForApproval(Rec);


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
                    Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin

                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/

                    ////ApprovalsMgmt.OnCancelPerformanceContractApprovalRequest(Rec);
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action30)
            {
            }
            action("Send Appraisal")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Send Appraisal action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Appraisal Sent Successfully');
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
            action("Print Sub Indicators")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print Sub Indicators action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80017, true, true, Rec)
                end;
            }
            action("Performance Contract Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                // RunObject = Report "PERFORMANCE CONTRACT-IND";
                ToolTip = 'Executes the Performance Contract Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80017, true, true, Rec)
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
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

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

                actionref("Select Activities_Promoted"; "Select Activities")
                {
                }
                actionref("Aligned Business Goals_Promoted"; "Aligned Business Goals")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Risk Analysis_Promoted"; "Risk Analysis")
                {
                }
                actionref("Capability Matrix_Promoted"; "Capability Matrix")
                {
                }
                actionref("Supervisor PAS_Promoted"; "Supervisor PAS")
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
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Print Individual PC_Promoted"; "Print Individual PC")
                {
                }
                actionref("Print Sub Indicators_Promoted"; "Print Sub Indicators")
                {
                }
                actionref("Performance Contract Report_Promoted"; "Performance Contract Report")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Departmental;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Departmental;
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Departmental;
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        JobResponsiblities: Record "Positive Pay Entry";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
        PCHeader: Record "Perfomance Contract Header";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        WorkplanInitiatives: Page "Select Workplan Initiatives";
}

#pragma implicitwith restore

