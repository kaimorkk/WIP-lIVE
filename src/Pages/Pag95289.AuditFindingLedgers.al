

page 95289 "Audit Finding Ledgers"
{
    PageType = List;
    SourceTable = "Audit Finding Ledger";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
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
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Risk Rating"; Rec."Risk Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Rating field.';
                }
                field(Implication; Rec.Implication)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implication field.';
                }
                field("Affects All Audit Locations"; Rec."Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Affects All Audit Locations field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Mgt Comment Received Date"; Rec."Mgt Comment Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mgt Comment Received Date field.';
                }
                field("Management Response Type"; Rec."Management Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Response Type field.';
                }
                field("Ganeral Management Comments"; Rec."Ganeral Management Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ganeral Management Comments field.';
                }
                field("No. Of Posted Audit Recomms"; Rec."No. Of Posted Audit Recomms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Posted Audit Recomms field.';
                }
                field("No. Of Posted Implement Action"; Rec."No. Of Posted Implement Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Posted Implement Action field.';
                }
                field("No. Of Open Implement Actions"; Rec."No. Of Open Implement Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Open Implement Actions field.';
                }
                field("No. Of Closed Implement Action"; Rec."No. Of Closed Implement Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Closed Implement Action field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

