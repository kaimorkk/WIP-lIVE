page 69367 "Consolidated Interview Record"
{
    Caption = 'Consolidated Interview Record';

    PageType = Card;
    SourceTable = "Candidate Interview Record";

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
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }

                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            part(Control32; "Consolidated Inteview Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Outcome/Results")
            {
                Caption = 'Outcome/Results';

                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }

            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Question Categories";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
            action("Panelist Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Panelist Evaluation Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69633, true, false, Rec);
                end;
            }
            action("Candidate No Show Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Panelist Evaluation Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69555, true, false, Rec);
                end;
            }
            action("Suggest Applicants")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                ToolTip = 'Executes the generate  action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.FnSuggestINTERVIEWInd(Rec);
                        Recruitment.FnSuggestINTERVIEWAGGRE(Rec);

                        //Message('Suggested Successfully');

                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify(true);
                    end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Applicants_Promoted"; "Suggest Applicants")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Panelist Evaluation Report_Promoted"; "Panelist Evaluation Report")
                {
                }
                actionref("Candidate No Show Report_Promoted"; "Candidate No Show Report")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Evaluation Sections_Promoted"; "Evaluation Sections")
                {
                }
            }
        }
    }
    trigger OnNewRecord(myBoolean: Boolean)
    var
        myInt: Integer;
    begin
        Rec."Document Type" := Rec."Document Type"::Consolidated;
    end;

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

