

page 80350 "BR Survey Participants"
{
    PageType = List;
    SourceTable = "BR Survey Participant";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Participant ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field(Invited; Rec.Invited)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited field.';
                }
                field("Date Invited"; Rec."Date Invited")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Invited field.';
                }
                field("Time Invited"; Rec."Time Invited")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Invited field.';
                }
                field("Invited By"; Rec."Invited By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited By field.';
                }
                field("Survey Response ID"; Rec."Survey Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Response ID field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send E-Invites")
            {
                ApplicationArea = Basic;
                Image = Email;
                ToolTip = 'Executes the Send E-Invites action.';
                trigger OnAction()
                var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit "Email Message";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[500];
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
                    Policy: Record Policy;
                begin
                    eBRInnovationSetup.Get;
                    BRSurveyParticipant.Reset;
                    BRSurveyParticipant.SetRange("Document No.", Rec."Document No.");
                    if BRSurveyParticipant.Find('-') then begin
                        repeat
                            BRSurveyParticipant.TestField(Invited, false);
                            BrSurveyNo := '';
                            BusinessResearchResponse.Init;
                            BusinessResearchResponse."Document No." := NoSeriesManagement.GetNextNo(eBRInnovationSetup."Survey Response No. Series", Today, true);
                            BusinessResearchResponse."Document Date" := Today;
                            BusinessResearchResponse."Target Respondent Type" := BRSurveyParticipant."Target Respondent Type";
                            BusinessResearchResponse."Survey ID" := BRSurveyParticipant."Document No.";
                            BusinessResearchResponse.Validate("Survey ID");
                            BusinessResearchResponse."Participant ID" := BRSurveyParticipant."Participant ID";
                            BusinessResearchResponse.Name := BRSurveyParticipant.Name;
                            BusinessResearchResponse.Validate("Participant ID");
                            BusinessResearchResponse."Due Date" := BRSurveyParticipant."Response Due Date";
                            BusinessResearchResponse.Description := BRSurveyParticipant.Description;
                            BusinessResearchResponse.Insert;


                            BrSurveyNo := BusinessResearchResponse."Document No.";


                            BRSurveyParticipant."Survey Response ID" := BrSurveyNo;
                            BRSurveyParticipant.Invited := true;
                            BRSurveyParticipant."Invited By" := UserId;
                            BRSurveyParticipant."Date Invited" := Today;
                            BRSurveyParticipant."Time Invited" := Time;
                            BRSurveyParticipant.Modify;

                            BRSurveySection.Reset;
                            BRSurveySection.SetRange("Survey ID", Rec."Document No.");
                            if BRSurveySection.FindFirst then begin
                                repeat
                                    BRResponseSection.Init;
                                    BRResponseSection."Survey Response ID" := BrSurveyNo;
                                    BRResponseSection."Section Code" := BRSurveySection."Section Code";
                                    BRResponseSection.TransferFields(BRSurveySection, false);
                                    BRResponseSection.Insert;

                                    BRSurveyQuestion.Reset;
                                    BRSurveyQuestion.SetRange("Survey ID", Rec."Document No.");
                                    BRSurveyQuestion.SetRange("Section Code", BRResponseSection."Section Code");
                                    if BRSurveyQuestion.Find('-') then begin
                                        repeat
                                            //EVALUATE(QInteger,BRSurveyQuestion."Question ID");
                                            BRResponseQuestion.Init;
                                            BRResponseQuestion."Survey Response ID" := BrSurveyNo;
                                            BRResponseQuestion."Section Code" := BRSurveyQuestion."Section Code";
                                            BRResponseQuestion."Question ID" := BRSurveyQuestion."Question ID";
                                            BRResponseQuestion.Question := BRSurveyQuestion.Question;
                                            BRResponseQuestion."Rating Type" := BRSurveyQuestion."Rating Type";
                                            BRResponseQuestion."Assigned Weight %" := BRSurveyQuestion."Assigned Weight %";
                                            BRResponseQuestion."Option Text Response Type" := BRSurveyQuestion."Option Text Response Type";
                                            BRResponseQuestion."Question Type" := BRSurveyQuestion."Question Type";
                                            BRResponseQuestion."Branch Logic Question" := BRSurveyQuestion."Branch Logic Question";
                                            BRResponseQuestion."Response Type" := BRSurveyQuestion."Response Type";
                                            BRResponseQuestion.Mandatory := BRSurveyQuestion.Mandatory;
                                            BRResponseQuestion.Insert;

                                            //
                                            BRSurveyScoreGuide.Reset;
                                            BRSurveyScoreGuide.SetRange("Survey ID", Rec."Document No.");
                                            BRSurveyScoreGuide.SetRange("Section Code", BRResponseQuestion."Section Code");
                                            BRSurveyScoreGuide.SetRange("Question ID", BRResponseQuestion."Question ID");
                                            if BRSurveyScoreGuide.FindFirst then begin
                                                repeat
                                                    BRResponseScoreGuide.Init;
                                                    BRResponseScoreGuide."Survey Response ID" := BrSurveyNo;
                                                    BRResponseScoreGuide."Section Code" := BRSurveyScoreGuide."Section Code";
                                                    BRResponseScoreGuide."Question ID" := BRSurveyScoreGuide."Question ID";
                                                    BRResponseScoreGuide."Line No" := BRSurveyScoreGuide."Line No.";
                                                    BRResponseScoreGuide."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                                    BRResponseScoreGuide."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                                    BRResponseScoreGuide."Response Value" := BRSurveyScoreGuide."Response Value";
                                                    BRResponseScoreGuide."Score %" := BRSurveyScoreGuide."Score %";
                                                    BRResponseScoreGuide.Insert;

                                                until BRSurveyScoreGuide.Next = 0;
                                            end;

                                            //Branching Questions
                                            if BRSurveyQuestion."Branch Logic Question" = true then begin
                                                BRBranchSurveyQuestion.Reset;
                                                BRBranchSurveyQuestion.SetRange("Survey ID", Rec."Document No.");
                                                BRBranchSurveyQuestion.SetRange("Section Code", BRResponseQuestion."Section Code");
                                                BRBranchSurveyQuestion.SetRange("Parent Question ID", BRResponseQuestion."Question ID");

                                                if BRBranchSurveyQuestion.FindFirst then begin
                                                    repeat
                                                        BRBranchResponseQuestion.Init;
                                                        BRBranchResponseQuestion."Response ID" := BrSurveyNo;
                                                        BRBranchResponseQuestion."Section Code" := BRBranchSurveyQuestion."Section Code";
                                                        BRBranchResponseQuestion."Parent Question ID" := BRBranchSurveyQuestion."Parent Question ID";
                                                        BRBranchResponseQuestion."Parent Response" := BRBranchSurveyQuestion."Parent Response";
                                                        BRBranchResponseQuestion."Question ID" := BRBranchSurveyQuestion."Question ID";
                                                        BRBranchResponseQuestion.Question := BRBranchSurveyQuestion.Question;
                                                        BRBranchResponseQuestion."Rating Type" := BRBranchSurveyQuestion."rating type"::"Open Text";
                                                        BRBranchResponseQuestion.Insert;
                                                    until BRBranchSurveyQuestion.Next = 0;
                                                end;
                                            end;
                                            //Multiple Questions Response
                                            if BRSurveyQuestion."Response Type" = BRSurveyQuestion."response type"::"Multiple Response" then begin
                                                BRSurveyScoreGuide.Reset;
                                                BRSurveyScoreGuide.SetRange("Survey ID", Rec."Document No.");
                                                BRSurveyScoreGuide.SetRange("Section Code", BRResponseQuestion."Section Code");
                                                BRSurveyScoreGuide.SetRange("Question ID", BRResponseQuestion."Question ID");
                                                if BRSurveyScoreGuide.FindFirst then begin
                                                    repeat
                                                        BRMultipleResponse.Init;
                                                        BRMultipleResponse."Survey Response ID" := BrSurveyNo;
                                                        BRMultipleResponse."Section Code" := BRSurveyScoreGuide."Section Code";
                                                        BRMultipleResponse."Question ID" := BRSurveyScoreGuide."Question ID";
                                                        BRMultipleResponse."Line No" := BRSurveyScoreGuide."Line No.";
                                                        BRMultipleResponse."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                                        BRMultipleResponse."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                                        BRMultipleResponse."Response Value" := BRSurveyScoreGuide."Response Value";
                                                        BRMultipleResponse."Score %" := BRSurveyScoreGuide."Score %";
                                                        BRMultipleResponse.Insert;
                                                    until BRSurveyScoreGuide.Next = 0;
                                                end;
                                            end;


                                        until BRSurveyQuestion.Next = 0;
                                    end;

                                until BRSurveySection.Next = 0;
                            end;


                            eBRInnovationSetup.Get;
                            if eBRInnovationSetup."Enable Email Alerts" then begin
                                CompanyInfo.Get();
                                SMTPMailSet.Get;
                                // SenderAddress := SMTPMailSet."Email Sender Address";
                                SenderName := CompanyInfo.Name + ' M&E';
                                // Subject := StrSubstNo('Survey Invite');

                                // FileDirectory := 'C:\DOCS\';
                                // FileName := 'PCA_' + BRSurveyParticipant."Document No." + '.pdf';
                                // //Window.OPEN('processing');
                                // Window.Open('PROCESSING SURVEY INVITES ############1##');
                                // Window.Update(1, BRSurveyParticipant."Document No." + '-' + BRSurveyParticipant.Name);

                                // WindowisOpen := true;
                                // if FileName = '' then
                                //     Error('Please specify what the file should be saved as');
                                // BrResponse.Reset;
                                // BrResponse.SetRange("Document No.", BRSurveyParticipant."Document No.");
                                // if BrResponse.Find('-') then begin
                                //     //Report.SaveAsPdf(80020, FileDirectory + FileName, BrResponse);
                                // end;



                                // if Exists(FileDirectory + FileName) then begin
                                //     Counter := Counter + 1;

                                //     SMTPMailSet.Get;
                                //     SenderAddress := SMTPMailSet."Email Sender Address";

                                //     Recipients := BRSurveyParticipant.Email;

                                //     if Recipients <> '' then begin
                                //         Body := 'Dear ' + BRSurveyParticipant.Name + '<BR>This email is to invite you to submit your Survey Response for this Survey:<Br>'
                                //         + BRSurveyParticipant."Document No." + ' ' + Format(BRSurveyParticipant."Target Respondent Type") + ' ' + BRSurveyParticipant.Description + '''+Response Due Date is ' + ''
                                //         + Format(BRSurveyParticipant."Response Due Date")
                                //         + '<BR>Please read the questions and Respond.<Br> if you require any assistance, please contact Strategy and Compliance office via Email:';
                                //         cu400.Create(CompanyInfo.Name, SenderAddress, Recipients, Subject, Body, true);

                                //         cu400.AppendToBody(
                                //         '<BR><BR>Kind Regards,');
                                //         cu400.AppendToBody('<BR>' + CompInfo.Name);
                                //         cu400.AddAttachment(FileDirectory + FileName, FileName);
                                //         cu400.Send;

                                //         Sleep(1000);
                                //         Window.Close;
                                //     end;
                                // end;
                            end;

                        until BRSurveyParticipant.Next = 0;


                        BusinessResearchSurvey.Reset;
                        BusinessResearchSurvey.SetRange("Document No.", Rec."Document No.");
                        if BusinessResearchSurvey.Find('-') then begin
                            BusinessResearchSurvey.Published := true;
                            BusinessResearchSurvey."Date Published" := Today;
                            BusinessResearchSurvey."Published By" := UserId;
                            BusinessResearchSurvey.Modify;

                        end;

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send E-Invites_Promoted"; "Send E-Invites")
                {
                }
            }
        }
    }

    var
        BRSurveyParticipant: Record "BR Survey Participant";
        BrSurveyNo: Code[50];
        PolicyManagementSetup: Record "Policy Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        BusinessResearchResponse: Record "Business Research Response";
        BRResponseQuestion: Record "BR Response Question";
        BRResponseSection: Record "BR Response Section";
        BRResponseScoreGuide: Record "BR Response Score Guide";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BrResponse: Record "Business Research Response";
        eBRInnovationSetup: Record "e-BR & Innovation Setup";
        QInteger: Integer;
        QScoreGuide: Integer;
        BRBranchResponseQuestion: Record "BR Branch Response Question";
        BRBranchSurveyQuestion: Record "BR Branch Survey Question";
        ParentQuestionID: Integer;
        QuestionID: Integer;
        BRMultipleResponse: Record "BR Multiple Response";
        BusinessResearchSurvey: Record "Business Research Survey";
}

#pragma implicitwith restore

