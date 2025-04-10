

page 69746 "Application Submission Card"
{
    Caption = 'Application Submission Card';
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
            part(Control18; "Application Submission Line")
            {
                SubPageLink = "Template ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
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
                    //SETRANGE("Template Type","Template Type"::"Application Submission");
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(69620, true, false, Rec);
                end;
            }
            action("Question Categories")
            {
                ApplicationArea = Basic;
                Image = AvailableToPromise;
                RunObject = Page "Question Group";
                ToolTip = 'Executes the Question Categories action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Question Categories_Promoted"; "Question Categories")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Template Type" := Rec."template type"::"Application Submission";
    end;
}

#pragma implicitwith restore

