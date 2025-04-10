

page 69686 "Job Application Checklist"
{
    PageType = List;
    SourceTable = "Requirements Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Vacancy No."; Rec."Vacancy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Candidates Response"; Rec."Candidates Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidates Response field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

