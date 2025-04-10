
page 80081 "Functional/Operational PC"
{
    Caption = 'Functional Objective Templates';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec.No)
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = All;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("CEO WorkPlan"; Rec."CEO WorkPlan")
                {
                    Editable = true;
                    Visible = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = All;
                }
                field(Designation; Rec.Designation)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Directorate; Rec.Directorate)
                {
                    Caption = 'Division';
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    Caption = 'Division Name';
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = true;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Total Assigned Weight(%)"; Rec."Total Assigned Weight(%)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Annual perfomance contract';
                // SubPageLink = "Workplan No." = field(No);
                //SubPageLink = Workplan No.=FIELD(No),
                //            Initiative Type=CONST(Board);
                Visible = false;
                ApplicationArea = All;
            }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Activities';
                SubPageLink = "Workplan No." = field(No);
                ApplicationArea = All;
                //               Initiative Type=CONST(Activity);
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
                //PromotedCategory = Process;
                //  RunObject = Page "Standard Perfomance Appraisal";
                //                 RunPageLink = Personal Scorecard ID=FIELD(No);
                Visible = false;
                ApplicationArea = All;
            }
            action("PC Perspectives")
            {
                Image = Interaction;
                // RunObject = Page 80365;
                //               RunPageLink = Field2=FIELD(No);
                Visible = false;
                ApplicationArea = All;
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                Image = Suggest;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    /*  IF NOT CONFIRM( 'Are you sure you want to Suggest Activities',TRUE) THEN
                            ERROR('Activities not suggested');
                    TESTFIELD("Strategy Plan ID");
                    TESTFIELD("CEO WorkPlan");
                    TESTFIELD("Annual Reporting Code");
                    PcLinesN.RESET;
                    PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    //PcLinesN.SETRANGE("Workplan No.","CEO WorkPlan");
                    PcLinesN.SETRANGE("Primary Directorate",Directorate);
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

                    Rec.TESTFIELD("Strategy Plan ID");
                    Rec.TESTFIELD("Annual Workplan");
                    Rec.TESTFIELD("Annual Reporting Code");

                    PcLines.Reset();
                    PcLines.SetRange("Workplan No.", Rec.No);
                    if PcLines.FindFirst() then
                        PcLines.DeleteAll();

                    StrategyObjLines.RESET;
                    StrategyObjLines.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SETRANGE(No, Rec."Annual Workplan");
                    StrategyObjLines.SETRANGE("Primary Directorate", Rec.Directorate);
                    //StrategyObjLines.SETRANGE("Primary Department","Responsibility Center");
                    // StrategyObjLines.SETRANGE("Primary Directorate","Responsibility Center");
                    if StrategyObjLines.FIND('-') then begin
                        repeat
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.INIT;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Activity;
                            //MESSAGE('wow');
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
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Strategy Framework" := StrategyObjLines."Strategy Framework";
                            PcLines."Framework Perspective" := StrategyObjLines."Framework Perspective";
                            // PcLines."Assigned Weight (%)" := StrategyObjLines."Departmental Activity Weight";
                            //PcLines."Summary of subactivities" := StrategyObjLines."Assigned Weight(%)";
                            // PcLines.Budget := StrategyObjLines."Total Subactivity budget";
                            // PcLines."Imported Annual Target Qty" := StrategyObjLines."Annual Target";
                            PcLines.INSERT(true);
                            PCPerspectives.RESET;
                            PCPerspectives.SETRANGE(Code, StrategyObjLines."Framework Perspective");
                            PCPerspectives.SETRANGE("Document No", Rec.No);
                            if not PCPerspectives.FINDSET then begin
                                PCPerspectives.INIT;
                                PCPerspectives.Code := StrategyObjLines."Framework Perspective";
                                PCPerspectives."Document No" := Rec.No;
                                if CSPPerspective.GET(PCPerspectives.Code) then
                                    PCPerspectives.Description := CSPPerspective.Description;
                                PCPerspectives.INSERT;
                            end;

                            // Insert sub Activities
                            SubWorkplanActivity.RESET;
                            SubWorkplanActivity.SETRANGE("Strategy Plan ID", Rec."Strategy Plan ID");
                            SubWorkplanActivity.SETRANGE("Workplan No.", Rec."Annual Workplan");
                            SubWorkplanActivity.SETRANGE("Activity Id", StrategyObjLines."Activity ID");
                            if SubWorkplanActivity.FINDSET then begin
                                repeat
                                    PCSubActivities.INIT;
                                    PCSubActivities."Strategy Plan ID" := SubWorkplanActivity."Strategy Plan ID";
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := SubWorkplanActivity."Activity Id";
                                    PCSubActivities."Sub Initiative No." := SubWorkplanActivity."Sub Initiative No.";
                                    PCSubActivities."Objective/Initiative" := SubWorkplanActivity."Objective/Initiative";
                                    PCSubActivities."Sub Targets" := SubWorkplanActivity."Imported Annual Target Qty";
                                    //  PCSubActivities."Sub Activity weight %" := SubWorkplanActivity.Weight;
                                    PCSubActivities."Unit of Measure" := SubWorkplanActivity."Unit of Measure";
                                    PCSubActivities."Due Date" := SubWorkplanActivity."Due Date";
                                    // PCSubActivities.Budget := SubWorkplanActivity."Total Budget";
                                    PCSubActivities.INSERT;

                                until SubWorkplanActivity.NEXT = 0;
                            end;
                        until StrategyObjLines.NEXT = 0;
                    end;



                    BoardActivities.RESET;
                    BoardActivities.SETRANGE("AWP No", Rec."Annual Workplan");
                    if BoardActivities.FIND('-') then begin
                        repeat
                            PcLines.INIT;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."Initiative Type"::Board;
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            PcLines."Unit of Measure" := BoardActivities."Unit of Measure";
                            PcLines."Strategy Framework" := BoardActivities."Strategy Framework";
                            PcLines."Framework Perspective" := BoardActivities."Framework Perspective";
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.INSERT(true);

                            //Board Sub-activities
                            BoardSubActivities.RESET;
                            BoardSubActivities.SETRANGE("Workplan No.", Rec."Annual Workplan");
                            BoardSubActivities.SETRANGE("Activity Id", BoardActivities."Activity Code");

                            if BoardSubActivities.FINDSET then begin
                                repeat
                                    PCSubActivities.INIT;
                                    PCSubActivities."Workplan No." := Rec.No;
                                    PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                                    PCSubActivities."Strategy Plan ID" := Rec."Strategy Plan ID";
                                    PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                    PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities, false);
                                    PCSubActivities.INSERT(true);
                                until BoardSubActivities.NEXT = 0;
                            end;
                        until BoardActivities.NEXT = 0;
                    end;
                    MESSAGE('Activities Populated Successfully');

                end;
            }

            action(PreviousTargets)
            {
                ApplicationArea = All;
                Caption = 'Previous  & Future Targets';
                Image = OrderTracking;
                Visible = true;

                trigger OnAction()
                var
                    StrategicIntPlanLines: page "Strategic Int Planning Lines";
                    StrategicPlanLines: record "Strategic Int Planning Lines";
                begin
                    StrategicPlanLines.Reset();
                    StrategicPlanLines.SetRange("Start Date", CalcDate('-3Y+CM', Today), CalcDate('3Y+CM', Today));
                    StrategicIntPlanLines.SetTableView(StrategicPlanLines);
                    StrategicIntPlanLines.Run();
                end;
            }
            action("Populate Goals Hub")
            {
                Image = PostBatch;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    // SMTPSetup: Codeunit "400";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    // FileMangement: Codeunit "419";
                    ProgressWindow: Dialog;
                    //  SMTPMailSet: Record "409";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    // cu400: Codeunit "400";
                    // DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    /*GoalTemplateLine.RESET;
                    GoalTemplateLine.SETRANGE("Goal Template ID","Goal Template ID");
                    IF GoalTemplateLine.FIND('-') THEN BEGIN
                        REPEAT
                          workplangoalhub.INIT;
                          workplangoalhub."Goal ID":=GoalTemplateLine."Goal ID";
                          workplangoalhub."Performance Contract ID":=No;
                          workplangoalhub."Goal Description":=GoalTemplateLine.Description;
                          workplangoalhub."Aligned-To PC ID":=GoalTemplateLine."Corporate Strategic Plan ID";
                          workplangoalhub."Aligned-To PC Goal ID":=GoalTemplateLine."Strategic Objective ID";
                          workplangoalhub.INSERT(TRUE);
                          UNTIL GoalTemplateLine.NEXT=0;
                      END;
                      MESSAGE('WorkPlan Hub Populated successfully');*/

                end;
            }
            action("Aligned Business Goals")
            {
                Image = "Action";
                // RunObject = Page "Aligned Business Goals";
                //                 RunPageLink = "Performance Contract ID"=FIELD(No);
                Visible = false;
                ApplicationArea = All;
            }
            action("Risk Analysis")
            {
                Image = Reserve;
                ApplicationArea = All;
                //RunObject = Page "Workplan Risk";
                //               RunPageLink = "Document No"=FIELD(No);
            }
            action("Capability Matrix")
            {
                Image = "Action";
                ApplicationArea = All;
                // RunObject = Page "Workplan Capability Matrixs";

                //RunObject = Page workpla
                //              RunPageLink = "Document No"=FIELD(No);
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
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                var
                    //ApprovalMgt: Codeunit ""Approvals Mgmt.";";
                    // SMTPSetup: Codeunit "400";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    // FileMangement: Codeunit "419";
                    ProgressWindow: Dialog;
                    //SMTPMailSet: Record "409";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    //cu400: Codeunit "400";
                    // DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin

                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", Rec.No);
                    if PcLines.FINDFIRST then begin
                        repeat
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        until PcLines.NEXT = 0;
                    end;

                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                                                         /* IF ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                                                           ApprovalsMgmt.OnSendPerformanceContractForApproval(Rec);*/



                    /*
                      //MESSAGE('Nofity Team');
                    CompanyInfo.GET();
                    SMTPMailSet.GET;
                    SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName :=CompanyInfo.Name+' M&E';
                    Subject := STRSUBSTNO('Functional PC');
                       PerfomanceContractHeader.RESET;
                       PerfomanceContractHeader.SETRANGE(No,No);
                       IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                          FileDirectory :=  'C:\DOCS\';
                          FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                          //Window.OPEN('processing');
                          Window.OPEN('PROCESSING Functional PC ############1##');
                            Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);
                    
                          WindowisOpen := TRUE;
                          IF FileName = '' THEN
                            ERROR('Please specify what the file should be saved as');
                    
                    
                           REPORT.SAVEASPDF(80006,FileDirectory+FileName,PerfomanceContractHeader);
                    
                    
                    
                    
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
                           Body:='Dear Team <BR>Please find attached the Functional PC <Br>'+Description;
                            cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);
                    
                            cu400.AppendBody(
                            '<BR><BR>Kind Regards,');
                            cu400.AppendBody('<BR>'+CompInfo.Name);
                            cu400.AddAttachment(FileDirectory+FileName,FileName);
                            cu400.Send;
                    
                            SLEEP(1000);
                            Window.CLOSE;
                        END;
                        END;
                      END;
                    
                      MESSAGE('Document has been approved Automatically');
                      */

                end;
            }
            action("Notify DCS &CEO")
            {
                Caption = 'Notify DCS and CEO';
                Image = Add;
                ApplicationArea = All;

                trigger OnAction()
                var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //SMTPSetup: Codeunit "400";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    // FileMangement: Codeunit "419";
                    ProgressWindow: Dialog;
                    //SMTPMailSet: Record "409";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    // cu400: Codeunit "400";
                    // DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                    Rec."Approval Status" := Rec."Approval Status"::Released;
                    Rec.MODIFY(true);
                    PcLines.RESET;
                    PcLines.SETRANGE("Workplan No.", Rec.No);
                    if PcLines.FINDFIRST then begin
                        repeat
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        until PcLines.NEXT = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/




                    //MESSAGE('Nofity Team');
                    CompanyInfo.GET();
                    // SMTPMailSet.GET;
                    //SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName := CompanyInfo.Name + ' M&E';
                    Subject := STRSUBSTNO('Functional PC');
                    PerfomanceContractHeader.RESET;
                    PerfomanceContractHeader.SETRANGE(No, Rec.No);
                    if PerfomanceContractHeader.FINDFIRST then begin
                        FileDirectory := 'C:\DOCS\';
                        FileName := 'PCA_' + PerfomanceContractHeader.No + '.pdf';
                        //Window.OPEN('processing');
                        Window.OPEN('PROCESSING Functional PC ############1##');
                        Window.UPDATE(1, PerfomanceContractHeader.No + '-' + PerfomanceContractHeader.Description);

                        WindowisOpen := true;
                        if FileName = '' then
                            ERROR('Please specify what the file should be saved as');


                        // REPORT.SAVEASPDF(80006,FileDirectory+FileName,PerfomanceContractHeader);






                        // if EXISTS(FileDirectory + FileName) then begin
                        //     Counter := Counter + 1;
                        if Subject <> '' then begin

                            // SMTPMailSet.GET;
                            //SenderAddress := SMTPMailSet."Email Sender Address";



                            Employee.RESET;
                            Employee.SETRANGE("No.", '0235');
                            if Employee.FIND('-') then begin
                                Recipients := Employee."Company E-Mail";
                            end;
                            if Recipients <> '' then begin
                                Body := 'Dear Team <BR>Please find attached the Functional PC <Br>' + Rec.Description;
                                /* cu400.CreateMessage(CompanyInfo.Name, SenderAddress, Recipients, Subject, Body, TRUE);

                                 cu400.AppendBody(
                                 '<BR><BR>Kind Regards,');
                                 cu400.AppendBody('<BR>' + CompInfo.Name);
                                 cu400.AddAttachment(FileDirectory + FileName, FileName);
                                 cu400.Send;

                                 SLEEP(1000);*/
                                Window.CLOSE;
                            end;
                        end;
                    end;

                    MESSAGE('Notified Succesfully');


                end;
            }
            action("Cancel Approval Request")
            {
                Image = CancelApprovalRequest;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                                                                                                // ApprovalsMgmt.OnCancelPerformanceContractApprovalRequest(Rec);
                end;
            }


            action("Send Appraisal")
            {
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Released);
                    MESSAGE('Test');
                end;
            }

            action("Print Functional PC")
            {
                Caption = 'Preview Targets';
                Image = Print;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.SETRANGE(No, Rec.No);
                    //REPORT.RUN(80053,TRUE,TRUE,Rec)
                    // REPORT.RUN(80058,TRUE,TRUE,Rec)
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
                    //var
                    // CopyJob: Page "Copy Job";
                    begin
                        //CopyJob.SetFromWorkplan(Rec);
                        // CopyJob.RUNMODAL;
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
                actionref(CopyWorkplan_Promoted; CopyWorkplan)
                {
                }
                actionref("PC Perspectives_Promoted"; "PC Perspectives")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

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
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Notify DCS &CEO_Promoted"; "Notify DCS &CEO")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Preview', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Print Functional PC_Promoted"; "Print Functional PC")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Functional/Operational PC";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"Functional/Operational PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "Intiative Target";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        BoardActivities: Record "Board Activities";
        PCPerspectives: Record "PC Perspective";
        CSPPerspective: Record "Strategy Framework Perspective";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        SubPCObjective: Record "Sub PC Objective";
        SubWorkplanActivity: Record "Sub Workplan Activity";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

