

page 80186 "Performance Logs Card"
{
    PageType = Card;
    SourceTable = "Performance Diary Log";

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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Activity Start Date"; Rec."Activity Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Activity End Date"; Rec."Activity End Date")
                {
                    ApplicationArea = Basic;
                }
                field("CSP ID"; Rec."CSP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("AWP ID"; Rec."AWP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Board PC ID"; Rec."Board PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("CEO PC ID"; Rec."CEO PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Functional PC"; Rec."Functional PC")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control25; "Performance Log Lines")
            {
                SubPageLink = "PLog No." = field(No),
                              "Employee No." = field("Employee No."),
                              "Personal Scorecard ID" = field("Personal Scorecard ID"),
                              "Strategy Plan ID" = field("CSP ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Targets")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin
                    //    StrategicPlanning.FnSuggestPlogLines(Rec);
                    Message('Performance log Target Lines Successfully');
                end;
            }
            separator(Action30)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;

                trigger OnAction()
                begin
                    // //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;

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
                    PlogLines: Record "Plog Lines";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    PlogLines.Reset;
                    PlogLines.SetRange("PLog No.", Rec.No);
                    if PlogLines.FindFirst then begin
                        repeat
                            PlogLines.TestField("Achieved Target");
                        until PlogLines.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;

                    CompanyInfo.Get();
                    SMTPMailSet.Get;
                    // SenderAddress := SMTPMailSet."Email Sender Address";
                    // SenderName := CompanyInfo.Name + ' M&E';
                    // Subject := StrSubstNo('Performance Log');
                    // PerfomanceContractHeader.Reset;
                    // PerfomanceContractHeader.SetRange(No, No);
                    // if PerfomanceContractHeader.FindFirst then begin
                    //     FileDirectory := 'C:\DOCS\';
                    //     FileName := 'PCA_' + PerfomanceContractHeader.No + '.pdf';
                    //     //Window.OPEN('processing');
                    //     Window.Open('PROCESSING Performance Log ############1##');
                    //     Window.Update(1, PerfomanceContractHeader.No + '-' + PerfomanceContractHeader.Description);

                    //     WindowisOpen := true;
                    //     if FileName = '' then
                    //         Error('Please specify what the file should be saved as');


                    //     //Report.SaveAsPdf(80007, FileDirectory + FileName, PerfomanceContractHeader);




                    //     if Exists(FileDirectory + FileName) then begin
                    //         Counter := Counter + 1;

                    //         SMTPMailSet.Get;
                    //         SenderAddress := SMTPMailSet."Email Sender Address";



                    //         Employee.Reset;
                    //         Employee.SetRange("No.", "Employee No.");
                    //         if Employee.Find('-') then begin
                    //             Recipients := Employee."Company E-Mail";
                    //         end;
                    //         if Recipients <> '' then begin
                    //             Body := 'Dear Team <BR>Please find attached the Plog Report <Br>' + Description;
                    //             cu400.Create(CompanyInfo.Name, SenderAddress, Recipients, Subject, Body, true);

                    //             cu400.AppendToBody(
                    //             '<BR><BR>Kind Regards,');
                    //             cu400.AppendToBody('<BR>' + CompInfo.Name);
                    //             cu400.AddAttachment(FileDirectory + FileName, FileName);
                    //             cu400.Send;

                    //             Sleep(1000);
                    //             Window.Close;
                    //         end;
                    //  end;
                    // end;


                    Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                //ApprovalsMgmt.""(Rec);*/
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action31)
            {
            }
            action("Print Performance Log Summary")
            {
                ApplicationArea = Basic;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(80011, true, true, Rec)
                end;
            }
            separator(Action33)
            {
            }
            action("Post Performance Log")
            {
                ApplicationArea = Basic;
                Image = Post;
                Visible = true;

                trigger OnAction()
                var
                    PlogLines: Record "Plog Lines";
                begin
                    if not Confirm('Are you sure you want to Post', true) then
                        Error('Perforamnce Log not Posted');
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    PlogLines.Reset;
                    PlogLines.SetRange("PLog No.", Rec.No);
                    if PlogLines.FindFirst then begin
                        repeat
                            if (PlogLines."Activity Type" <> PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertPlogEntry(Rec."CSP ID", '', '', '', PlogLines."Initiative No.", Rec.Description, Entrytype::Actual, Rec."Year Reporting Code", '', PlogLines."Planned Date", Rec."Directorate Code", Rec."Department Code", PlogLines."Achieved Target", 0, Rec.No, SourceType
                               , Rec."Employee No.", PlogLines."Achieved Date", Documenttype::Plog, Rec."Region ID", Rec."Personal Scorecard ID", Rec."AWP ID", Rec."Board PC ID", Rec."CEO PC ID", Rec."Functional PC", PlogLines."Unit of Measure");
                            end;
                            if (PlogLines."Activity Type" = PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertJDPlogEntry(PlogLines);
                            end;
                        until PlogLines.Next = 0;
                    end;
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted On" := Today;
                    Rec.Modify;

                    Message('Performance Log %1 has been Posted Successfully', Rec.No);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Targets_Promoted"; "Suggest Targets")
                {
                }
                actionref("Post Performance Log_Promoted"; "Post Performance Log")
                {
                }
            }
            group(Category_Category5)
            {
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
                actionref("Print Performance Log Summary_Promoted"; "Print Performance Log Summary")
                {
                }
            }
        }
    }

    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
        StrategicPlanning: Codeunit "Strategic Planning";
        EntryType: Option Planned,Actual;
        SourceType: Option "Strategic Plan","Perfomance Contract";
        DocumentType: Option Plog,Appraisal;
}

#pragma implicitwith restore

