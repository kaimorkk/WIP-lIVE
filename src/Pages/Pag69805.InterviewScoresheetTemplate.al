

page 69805 "Interview Scoresheet Template"
{
    PageType = Card;
    SourceTable = "HR Screening Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Template Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Questions field.';
                }
                field("Total Oral Weight"; Rec."Total Oral Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Oral Weight field.';
                }
                field("Total Technical Weight"; Rec."Total Technical Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Technical Weight field.';
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weight field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control12; "Interview Scoresheet Questions")
            {
                SubPageLink = "Template ID" = field(Code),
                              "Template Type" = field("Template Type");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(69620, true, false, Rec);
                end;
            }
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = AvailableToPromise;
                RunObject = Page "Question Group";
                RunPageLink = "Header No." = field(Code);
                ToolTip = 'Executes the Evaluation Sections action.';
            }
            action("Interview Plans")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                RunObject = Page "Interview Invitations";
                RunPageLink = "Interview Scoresheet Template" = field(Code);
                ToolTip = 'Executes the Interview Plans action.';
            }
            action("Suggest Score Guide")
            {
                ApplicationArea = Basic;
                Image = SuggestReminderLines;
                ToolTip = 'Executes the Suggest Score Guide action.';
                trigger OnAction()
                begin
                    Recruitment.SuggestTemplateScoreGuide(Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Interview Plans_Promoted"; "Interview Plans")
                {
                }
                actionref("Suggest Score Guide_Promoted"; "Suggest Score Guide")
                {
                }
                actionref("Evaluation Sections_Promoted"; "Evaluation Sections")
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowXrec: Boolean)
    var
        myInt: Integer;
    begin

    end;

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

