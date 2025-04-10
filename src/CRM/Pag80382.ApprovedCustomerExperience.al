

page 80382 "Approved Customer Experience"
{
    PageType = Card;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category" = const("Customer Experience"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Business Research Template ID"; Rec."Business Research Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Template ID field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Responses field.';
                }
            }
            part(Control10; "BR Survey Section")
            {
                SubPageLink = "Survey ID" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Survey Section")
            {
                ApplicationArea = Basic;
                Caption = 'Survey Section';
                Image = AbsenceCategory;
                RunObject = Page "BR Survey Section";
                RunPageLink = "Survey ID" = field("Document No.");
                ToolTip = 'Executes the Survey Section action.';
            }
            action("Suggest Business Sections")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Visible = false;
                ToolTip = 'Executes the Suggest Business Sections action.';
                trigger OnAction()
                begin
                    Rec.TestField("Business Research Template ID");
                    BRTemplateSection.Reset;
                    BRTemplateSection.SetRange("Template ID", Rec."Business Research Template ID");
                    if BRTemplateSection.FindFirst then begin
                        repeat
                            BRSurveySection.Init;
                            BRSurveySection."Survey ID" := Rec."Document No.";
                            BRSurveySection."Section Code" := BRTemplateSection."Section Code";
                            BRSurveySection.Description := BRTemplateSection.Description;
                            BRSurveySection."Section Completion Instruction" := BRTemplateSection."Section Completion Instruction";
                            BRSurveySection."No. of Questions" := BRTemplateSection."No. of Questions";
                            BRSurveySection."Total Weight %" := BRTemplateSection."Total Weight %";
                            BRSurveySection.Insert;
                        until BRTemplateSection.Next = 0;
                    end;

                    BRTemplateLine.Reset;
                    BRTemplateLine.SetRange("Template ID", Rec."Business Research Template ID");
                    if BRTemplateLine.FindFirst then begin
                        repeat
                            BRSurveyQuestion.Init;
                            BRSurveyQuestion."Survey ID" := Rec."Document No.";
                            BRSurveyQuestion."Section Code" := BRTemplateLine."Section ID";
                            BRSurveyQuestion."Question ID" := BRTemplateLine."Question ID";
                            BRSurveyQuestion.Question := BRTemplateLine.Question;
                            BRSurveyQuestion."Rating Type" := BRTemplateLine."Rating Type";
                            BRSurveyQuestion."Option Text Response Type" := BRTemplateLine."Option Text Response Type";
                            BRSurveyQuestion."Assigned Weight %" := BRTemplateLine."Assigned Weight %";
                            BRSurveyQuestion."Desired Perfomance Direction" := BRTemplateLine."Desired Perfomance Direction";
                            BRSurveyQuestion.Insert;

                            BRTemplateScoreGuide.Reset;
                            BRTemplateScoreGuide.SetRange("Template ID", Rec."Business Research Template ID");
                            BRTemplateScoreGuide.SetRange("Section ID", BRTemplateLine."Section ID");
                            BRTemplateScoreGuide.SetRange("Question ID", BRTemplateLine."Question ID");
                            if BRTemplateScoreGuide.FindFirst then begin
                                BRSurveyScoreGuide.Init;
                                BRSurveyScoreGuide."Survey ID" := Rec."Document No.";
                                BRSurveyScoreGuide."Section Code" := BRTemplateScoreGuide."Section ID";
                                BRSurveyScoreGuide."Question ID" := BRTemplateScoreGuide."Question ID";
                                BRSurveyScoreGuide."Line No." := BRTemplateScoreGuide."Line No.";
                                BRSurveyScoreGuide."Rating Type" := BRSurveyScoreGuide."Rating Type";
                                BRSurveyScoreGuide."Desired Perfomance Direction" := BRSurveyScoreGuide."Desired Perfomance Direction";
                                BRSurveyScoreGuide."Response Value" := BRSurveyScoreGuide."Response Value";
                                BRSurveyScoreGuide."Score %" := BRSurveyScoreGuide."Score %";
                                BRSurveyScoreGuide.Insert
                            end;

                        until BRTemplateLine.Next = 0;
                    end;
                    Message('Lines Suggested Successfully');
                end;
            }
            separator(Action29)
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
            separator(Action25)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    //MESSAGE('Printed Successfully');
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(80024, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Generate Participant Invites")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Generate Participant Invites';
                    Ellipsis = true;
                    Image = CreateDocument;
                    //  RunObject = Report "Create Customer BR Participate";
                    ToolTip = 'Generate Participant Invites';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                    end;
                }
                action("Participant Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Participant Invitations';
                    Image = Allocations;
                    RunObject = Page "BR Survey Participants";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Participant Invitations action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Business Sections_Promoted"; "Suggest Business Sections")
                {
                }
            }
            group(Category_Category5)
            {
                actionref("BR Survey Section_Promoted"; "BR Survey Section")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category6)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category7)
            {
                actionref("Generate Participant Invites_Promoted"; "Generate Participant Invites")
                {
                }
                actionref("Participant Invitations_Promoted"; "Participant Invitations")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Business Research Category" := Rec."business research category"::"Customer Experience";
    end;

    trigger OnOpenPage()
    begin
        Rec."Business Research Category" := Rec."business research category"::"Customer Experience";
    end;

    var
        BRTemplateLine: Record "BR Template Line";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BRTemplateSection: Record "BR Template Section";
        BRTemplateScoreGuide: Record "BR Template Score Guide";
}

#pragma implicitwith restore

