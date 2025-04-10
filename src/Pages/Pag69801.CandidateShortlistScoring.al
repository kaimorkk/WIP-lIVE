

page 69801 "Candidate Shortlist Scoring"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Scoring";

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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

