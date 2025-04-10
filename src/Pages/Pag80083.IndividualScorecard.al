

page 80083 "Individual Scorecard"
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
                field("Functional Template ID"; Rec."Department/Center PC ID")
                {
                    Caption = 'PMMU';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department/Center PC ID field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }

                field("Contract Year"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Target Setting Commitee"; Rec."Target Setting Commitee")
                {
                    //Editable = Rec."Approval Status" = Rec."approval status"::Open;
                    Editable = DocEditable;
                    ApplicationArea = all;
                    Visible = false;
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
                    Visible = false;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        REC."PMMU/PAS Stage" := Rec."PMMU/PAS Stage"::Evaluation;
                        REC.Modify();
                    end;
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
                field("Document Stage"; Rec."Document Stage")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Stage field.';
                }
                field("Populate Activities From"; Rec."Populate Activities From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Populate Activities From field.', Comment = '%';
                }
                field("Department/Center PC ID"; Rec."Department/Center PC ID")
                {
                    ApplicationArea = all;
                    Visible = false;
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
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }
                // field("Responsibility Center Name"; Rec."Responsibility Center Name")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                // }

                field("Admin Unit"; Rec."Admin Unit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Admin Unit Name';
                    ToolTip = 'Specifies the value of the Admin Unit Name.';
                    Editable = false;

                }
                field("Admin Unit Name"; Rec."Admin Unit Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Admin Unit Name';
                    ToolTip = 'Specifies the value of the Admin Unit Name.';
                    Editable = false;

                }

                field("Supervisors Employee No."; Rec."Supervisors Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisors Employee No. field.', Comment = '%';
                }
                field("Supervisors Employee Name."; Rec."Supervisors Employee Name.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisors Employee Name. field.', Comment = '%';
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

                field("Document is At Supervision"; Rec."Document is At Supervision")
                {
                    Visible = false;
                }


            }
            part("Performance Targets"; "Performance Targets")
            {
                SubPageLink = "Contract No." = field(No), "PMMU No." = field("Department/Center PC ID");
                ApplicationArea = All;
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                Visible = false;
                ApplicationArea = Basic;
            }
            part("Core Activities"; "Workplan Initiatives")
            {
                Caption = 'PMMU Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity | Board);
                ApplicationArea = Basic;
                Visible = false;
            }
            part("Added Activities"; "Secondary Workplan Initiatives")
            {
                Caption = 'Elements of Service Charter';
                Visible = false;
                SubPageLink = "Workplan No." = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Year Reporting Code" = field("Annual Reporting Code");
                ApplicationArea = Basic;
            }
            part(Control25; "PC Job Description")
            {
                Caption = 'Job Description';
                SubPageLink = "Workplan No." = field(No);
                ApplicationArea = Basic;
                Visible = false;
            }
            part("PAS Core Values"; "PAS Core Values")
            {
                ApplicationArea = All;
                SubPageLink = "Performance Contract Header" = field(No), "Strategic Plan ID" = field("Strategy Plan ID");
            }
            part("PAS Training Needs"; "PAS Training Needs")
            {
                ApplicationArea = All;
                SubPageLink = "PAS No." = field(No);
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50038),
                              "No." = field(No);
            }
            systempart(Notes; Notes)
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
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(PAS),
                                  "No." = FIELD(No);
                    ToolTip = 'View or add comments for the record.';
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
                    Rec.TestField("Department/Center PC ID");
                    Rec.TestField("Annual Reporting Code");
                    PCHeader.Reset;
                    PCHeader.SetRange(No, Rec."Department/Center PC ID");
                    if PCHeader.FindSet then begin
                        SPMGeneralSetup.Get;

                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PcLinesN.Reset;
                            PcLinesN.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                            PcLinesN.SetRange("Workplan No.", Rec."Department/Center PC ID");
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

                            PositionTargets.Reset();
                            PositionTargets.SetRange("Position Code", Rec.Position);
                            if PositionTargets.FindSet then
                                repeat
                                    PCJobDescription.Init;
                                    PCJobDescription."Workplan No." := Rec.No;
                                    PCJobDescription."Entry No" := 0;
                                    PCJobDescription."Line Number" := PositionTargets."Position Code";
                                    PCJobDescription.Description := PositionTargets."Strategic Objective";
                                    PCJobDescription."Key Perfomance Indicator" := PositionTargets.KPI;
                                    PCJobDescription."Unit of Measure" := PositionTargets."Unit of Measure";
                                    //PCJobDescription.Description := PositionTargets.Target;
                                    PCJobDescription."Primary Department" := Rec."Responsibility Center";
                                    PCJobDescription.Validate("Primary Department");
                                    PCJobDescription.Insert;
                                until PositionTargets.Next() = 0;


                            /*JobResponsiblities.Reset;
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
                            end;*/
                        end;
                    end;
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
            action("Supervisor Actions")
            {
                ApplicationArea = Basic;
                Image = CarryOutActionMessage;
                ToolTip = 'Executes the supervisor actions.';
                trigger OnAction()
                var
                    SelectedOption: Char;
                    ChooseOptionsTxt: Label 'Choose one of the following actions!';
                    SupervisorStrMenuOption: Label 'Select,Return To Employee,Set for Mid Year Review,Mark Mid Year Review Completed';
                begin
                    SelectedOption := StrMenu(SupervisorStrMenuOption, 1, ChooseOptionsTxt);
                    if SelectedOption = 1 then
                        Error('Select an option');
                    case SelectedOption of
                        2:
                            begin
                                Rec.TestField("Document Stage", Rec."Document Stage"::"Sent To Supervisor");
                                Rec.ReturnToEmployee();
                            end;

                        3:
                            begin
                                Rec.TestField("Document Stage", Rec."Document Stage"::"Sent To Supervisor");
                                Rec.SetForMidYearReview();
                            end;
                        4:
                            begin
                                Rec.TestField("Document Stage", Rec."Document Stage"::"Mid-Year Review");
                                Rec.MarkMidYearReviewAsCompleted();
                            end;
                    end;
                end;
            }
            action("Appraisee Actions")
            {
                ApplicationArea = Basic;
                Image = SendElectronicDocument;
                ToolTip = 'Executes the appraisee actions.';
                trigger OnAction()
                var
                    SelectedOption: Char;
                    ChooseOptionsTxt: Label 'Choose one of the following actions!';
                    SupervisorStrMenuOption: Label 'Select,Send to Supervisor,Return to Supervisor';
                begin
                    SelectedOption := StrMenu(SupervisorStrMenuOption, 1, ChooseOptionsTxt);
                    if SelectedOption = 1 then
                        Error('Select an option');
                    case SelectedOption of
                        2:
                            begin
                                Rec.TestField("Document Stage", Rec."Document Stage"::" ");
                                Rec.UpdateEmployeeActions(Rec."Document Stage"::"Sent To Supervisor");
                            end;
                        3:
                            begin
                                Rec.TestField("Document Stage", Rec."Document Stage"::"Returned To Employee");
                                Rec.UpdateEmployeeActions(Rec."Document Stage"::"Returned to Supervisor");
                            end;
                    end;
                end;
            }

            action("Position Targets")
            {
                ApplicationArea = Basic;
                Image = Track;
                RunObject = Page "Position Targets";
                RunPageLink = "Position Code" = field(Position);
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
                    PerformanceTargets: Record "Performance Targets";
                    PASCoreValues: Record "PAS Core Values";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    Rec.ValidatePerformanceTargets();
                    Rec.ValidateCoreValues();

                    PerformanceTargets.Reset();
                    PerformanceTargets.SetRange("Contract No.", Rec.No);
                    PerformanceTargets.CalcSums(Weight);

                    if PerformanceTargets.Weight <> 80 then
                        Error('Total Assigned Weight for all Core Mandate Primary Activities should be (80%),Currently is %1', PerformanceTargets.Weight);

                    PASCoreValues.Reset;
                    PASCoreValues.SetRange("Performance Contract Header", Rec.No);
                    PASCoreValues.CalcSums(Weight);
                    if PASCoreValues.weight <> 20 then
                        Error('Total Assigned Weight for all PAS Core Values should be (20%),Currently is %1', PASCoreValues.weight);

                    Variant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Variant) then
                        ApprovalsMgmt.OnSendDocForApproval(Variant);


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    // Rec."Approval Status" := Rec."approval status"::Released;
                    // Rec.Modify;
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
                    ApprovalsMgmt.OnCancelDocApprovalRequest(Variant);                                                                            //ApprovalsMgmt.""(Rec);*/
                end;
            }
            separator(Action30)
            {
            }
            action("Send To Supervisor")
            {
                ApplicationArea = Basic;
                //Visible = not Rec."Document is At Supervision";
                Visible = false;
                ToolTip = 'Executes the Send to Supervisor action.';
                trigger OnAction()
                var
                    PerformanceTargets: Record "Performance Targets";
                begin
                    if not Confirm('Are you sure you want to send this document to the Supervisor?', false) then
                        exit;
                    Rec.TestField("Document is At Supervision", false);

                    PerformanceTargets.Reset;
                    PerformanceTargets.SetRange("Contract No.", Rec.No);
                    if PerformanceTargets.FindSet then begin
                        repeat
                            PerformanceTargets.TestField(Activity);
                            PerformanceTargets.TestField("PAS Activity");
                            PerformanceTargets.TestField(Target);
                            PerformanceTargets.TestField("Performance Indicator");
                            PerformanceTargets.TestField(Weight);
                        until PerformanceTargets.Next = 0;
                    end;

                    Rec."Document is At Supervision" := true;
                    Rec.Modify;

                    Message('Document sent to Supervisor successfully');
                    // Rec.TestField("Approval Status", Rec."approval status"::Released);
                    //Message('Test');
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
            action("Print PAS")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print PAS action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    // Report.Run(Report::"Performance Appraisal System", true, true, Rec)
                end;
            }

            action("PAS Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the PAS Report.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    // Report.Run(Report::"PAS Report", true, true, Rec)
                end;
            }
            separator(Action50) { }

            action("Copy Score Card")
            {
                ApplicationArea = Basic;
                Image = Copy;
                trigger OnAction()
                var
                    CopyScoreCard: Page "Copy ScoreCard";
                begin
                    CopyScoreCard.SetFromContractHeader(Rec);
                    CopyScoreCard.RunModal();
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
                actionref("Send To Supervisor_Promoted"; "Send To Supervisor")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Function', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Aligned Business Goals_Promoted"; "Aligned Business Goals")
                {
                }
                actionref("Supervisor Actions_Promoted"; "Supervisor Actions")
                {
                }
                actionref("Appraisee Actions_Promoted"; "Appraisee Actions")
                {
                }
                actionref("Position Targets_Promoted"; "Position Targets")
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
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Print Individual PC_Promoted"; "Print Individual PC")
                {
                }
                actionref("Print PAS_Promoted"; "Print PAS")
                {
                }
                actionref("PAS Report_Promoted"; "PAS Report")
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Copy', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref("Copy Score Card_Promoted"; "Copy Score Card")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Staff;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Staff;
    end;

    trigger OnOpenPage()
    begin
        EditableCommitee();
        Rec."Document Type" := Rec."document type"::"Individual Scorecard";
        Rec."Score Card Type" := Rec."score card type"::Staff;
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
        DocEditable := SmtpSet."PAS Document Stage" = SmtpSet."PAS Document Stage"::"Target Setting";
        Evaation := SmtpSet."PAS Document Stage" = SmtpSet."PAS Document Stage"::Evaluation;
    end;


    var
        Evaation: Boolean;
        SmtpSet: Record "SPM General Setup";
        DocEditable: Boolean;
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        // JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
        PCHeader: Record "Perfomance Contract Header";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        PositionTargets: Record "Position Targets";

}

#pragma implicitwith restore

