

page 69725 "Final Shortlisting Card"
{
    PageType = Card;
    SourceTable = "Candidate Shortlist Scoring";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Requiement ID."; Rec."Requiement ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requiement ID. field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
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
                field("Candidate's Response"; Rec."Candidate's Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate''s Response field.';
                }
                field("Panel Response"; Rec."Panel Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Response field.';
                }
                // field("No. of Openings"; "No. of Openings")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Openings field.';
                // }
                // field("No. of Submitted Applications"; "No. of Submitted Applications")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Submitted Applications field.';
                // }
                // field("No. of Invited Candidates"; "No. of Invited Candidates")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Invited Candidates field.';
                // }
                // field("Final Shortlisted Candidates"; "Final Shortlisted Candidates")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Final Shortlisted Candidates field.';
                // }
                // field("Non-Responsive Applications"; "Non-Responsive Applications")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Non-Responsive Applications field.';
                // }
                // field(Directorate; Directorate)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Directorate field.';
                // }
                // field(Department; Department)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Department field.';
                // }
                // field("Region Id"; "Region Id")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Region Id field.';
                // }
                // field("Seniority Level"; "Seniority Level")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Seniority Level field.';
                // }
                // field("Default Terms of Service"; "Default Terms of Service")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Default Terms of Service field.';
                // }
                // field("Employment Type"; "Employment Type")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Employment Type field.';
                // }
                // field("Application Closing Date"; "Application Closing Date")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Application Closing Date field.';
                // }
                // field("Application Closing Time"; "Application Closing Time")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Application Closing Time field.';
                // }
                // field("Min Academic Qualification"; "Min Academic Qualification")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Min Academic Qualification field.';
                // }
                // field("General Work Experience"; "General Work Experience")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the General Work Experience field.';
                // }
                // field("Management Experience"; "Management Experience")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Management Experience field.';
                // }
                // field("Planned Start Date"; "Planned Start Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planned Start Date field.';
                // }
                // field("Planned End Date"; "Planned End Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planned End Date field.';
                // }
                // field("Document Status"; "Document Status")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Document Status field.';
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
            }
            part(Control41; "Final Shortlisting Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Requirement ID" = field("Qualification Category");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Candidate Selection Committee")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Candidate Shortlist Committee";
                // RunPageLink = "Document No." = field("Document Type"),
                //               "Document Type" = field("Document No.");
                ToolTip = 'Executes the Candidate Selection Committee action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Candidate Selection Committee_Promoted"; "Candidate Selection Committee")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

