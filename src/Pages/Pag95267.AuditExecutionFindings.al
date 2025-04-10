

page 95267 "Audit Execution Findings"
{
    PageType = List;
    SourceTable = "Audit Execution Finding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("CheckList Description"; Rec."CheckList Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CheckList Description field.';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Finding ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Finding Description';
                    ToolTip = 'Specifies the value of the Finding Description field.';
                }
                field("Compliance Frameworks"; Rec."Compliance Frameworks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Frameworks field.';
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Risk Rating Code"; Rec."Risk Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Rating Code field.';
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Heat Zone field.';
                }
                field(Implication; Rec.Implication)
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Implication';
                    ToolTip = 'Specifies the value of the Risk Implication field.';
                }
                field("Affects All Audit Locations"; Rec."Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Affects All Audit Locations field.';
                }
                field("Audit Location Code"; Rec."Audit Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Location Code field.';
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Recommendations field.';
                }
                field("No. of Fieldwork Audit Papers"; Rec."No. of Fieldwork Audit Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Fieldwork Audit Papers field.';
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
                field("Fieldwork Audit Finding ID"; Rec."Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Audit Finding ID field.';
                }
                field("No. of Related Audit Papers"; Rec."No. of Related Audit Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Related Audit Papers field.';
                }
                field("Management Comment Deadline"; Rec."Management Comment Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Comment Deadline field.';
                }
                field("Mgt Comment Received Date"; Rec."Mgt Comment Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mgt Comment Received Date field.';
                }
                field("Auditee Response Type"; Rec."Auditee Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Response Type field.';
                }
                field("No. of Management Comments"; Rec."No. of Management Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Management Comments field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Audit Execution Implications")
            {
                ApplicationArea = Basic;
                Image = ImplementPriceChange;
                RunObject = Page "Audit Execution Implications";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID"),
                              "Checklist ID" = field("Checklist ID"),
                              "Finding ID" = field("Finding ID");
                ToolTip = 'Executes the Audit Execution Implications action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Audit Execution Implications_Promoted"; "Audit Execution Implications")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

