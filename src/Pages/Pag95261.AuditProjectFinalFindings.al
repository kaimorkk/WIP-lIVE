

page 95261 "Audit Project Final Findings"
{
    PageType = List;
    SourceTable = "Audit Project Final Finding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Finding ID"; Rec."Audit Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Finding ID field.';
                }
                field("Final Audit Report ID"; Rec."Final Audit Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Audit Report ID field.';
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
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Mgt Commenet Received Date"; Rec."Mgt Commenet Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mgt Commenet Received Date field.';
                }
                field("Auditee Response Type"; Rec."Auditee Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Response Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

