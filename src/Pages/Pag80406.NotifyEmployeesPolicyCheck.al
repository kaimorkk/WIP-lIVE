

page 80406 "Notify Employees(Policy Check)"
{
    PageType = List;
    SourceTable = "Employee to be Notified-Policy";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
                field("Policy Description"; Rec."Policy Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Description field.';
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
                    PolicyManagementSetup.Get;
                    EmployeetobeNotified.Reset;
                    EmployeetobeNotified.SetRange("Document No.", Rec."Document No.");
                    if EmployeetobeNotified.Find('-') then begin
                        repeat


                            PolicyManagementSetup.Get;
                            if PolicyManagementSetup."Enable Email Alerts" then begin
                                CompanyInfo.Get();
                                SMTPMailSet.Get;
                                // SenderAddress := SMTPMailSet."Email Sender Address";
                                // SenderName := CompanyInfo.Name + ' M&E';
                                // Subject := StrSubstNo('Survey Invite');

                                // FileDirectory := 'C:\DOCS\';
                                // FileName := 'PCA_' + EmployeetobeNotified."Document No." + '.pdf';
                                // //Window.OPEN('processing');
                                // Window.Open('POLICY  ############1##');
                                // Window.Update(1, EmployeetobeNotified."Document No." + '-' + EmployeetobeNotified."Employee Name");

                                // WindowisOpen := true;
                                // if FileName = '' then
                                //     Error('Please specify what the file should be saved as');
                                // BrResponse.Reset;
                                // BrResponse.SetRange(Code, EmployeetobeNotified."Document No.");
                                // if BrResponse.Find('-') then begin
                                //     //Report.SaveAsPdf(80014, FileDirectory + FileName, BrResponse);
                                // end;



                                // if Exists(FileDirectory + FileName) then begin
                                //     Counter := Counter + 1;

                                //     SMTPMailSet.Get;
                                //     SenderAddress := SMTPMailSet."Email Sender Address";

                                //     Recipients := EmployeetobeNotified."Email Address";

                                //     if Recipients <> '' then begin
                                //         Body := 'Dear ' + EmployeetobeNotified."Employee Name" + '<BR>This email is to invite you to Policy No:<Br>'
                                //         + EmployeetobeNotified."Document No." +
                                //         '<BR>Please Login into the system give feedback and Recomendations:';
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

                        until EmployeetobeNotified.Next = 0;

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
        QInteger: Integer;
        QScoreGuide: Integer;
        BRBranchResponseQuestion: Record "BR Branch Response Question";
        BRBranchSurveyQuestion: Record "BR Branch Survey Question";
        ParentQuestionID: Integer;
        QuestionID: Integer;
        BRMultipleResponse: Record "BR Multiple Response";
        BusinessResearchSurvey: Record "Business Research Survey";
        EmployeetobeNotified: Record "Employee to be Notified-Policy";
        BrResponse: Record Policy;
}

#pragma implicitwith restore

