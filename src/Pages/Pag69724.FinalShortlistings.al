

page 69724 "Final Shortlistings"
{
    CardPageID = "Final Shortlisting Card";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Shortlist Scoring";
    SourceTableView = where("Document No." = filter('1'));

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Requiement ID."; Rec."Requiement ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requiement ID. field.';
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
                // field("Document Status"; "Document Status")
                // {
                //     ApplicationArea = Basic;
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
    }
}

#pragma implicitwith restore

