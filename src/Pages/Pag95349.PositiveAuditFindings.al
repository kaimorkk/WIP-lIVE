

page 95349 "Positive Audit Findings"
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
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("CheckList Description"; Rec."CheckList Description")
                {
                    ApplicationArea = Basic;
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Positive Finding Description"; Rec."Positive Finding Description")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Finding Description';
                    Visible = false;
                }
                field(Implication; Rec.Implication)
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Implication';
                    Visible = false;
                }
                field("Affects All Audit Locations"; Rec."Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Location Code"; Rec."Audit Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Fieldwork Audit Papers"; Rec."No. of Fieldwork Audit Papers")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Fieldwork Audit Finding ID"; Rec."Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Related Audit Papers"; Rec."No. of Related Audit Papers")
                {
                    ApplicationArea = Basic;
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

