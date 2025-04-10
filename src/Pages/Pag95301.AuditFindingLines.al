

page 95301 "Audit Finding Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Finding";

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
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Implications; Rec.Implications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implications field.';
                }
                field("Finding Rating Code"; Rec."Finding Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding Rating Code field.';
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendations field.';
                }
                field("Applicable To All Locations"; Rec."Applicable To All Locations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable To All Locations field.';
                }
                field("Engagement  ID"; Rec."Engagement  ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement  ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Management Response"; Rec."Management Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Response field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Response Submission Deadline"; Rec."Response Submission Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Submission Deadline field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field("Verdict/Opinion"; Rec."Verdict/Opinion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict/Opinion field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Responsible Person Name"; Rec."Responsible Person Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person Name field.';
                }
                field("Action Plan"; Rec."Action Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Plan field.';
                }
                field("Action Plan Deadline"; Rec."Action Plan Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Plan Deadline field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Audit Location Findings")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    RunObject = Page "Audit Finding Locations";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement  ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Audit Location Findings action.';
                }
                action("Mgt Comments & Action Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Management Comments & Action Plans';
                    Image = Comment;
                    RunObject = Page "Audit Management Comments";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement  ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Management Comments & Action Plans action.';
                }
                action("Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Image = Receipt;
                    RunObject = Page "Audit Finding Recommendations";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement  ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Audit Recommendations action.';
                }
                action("Filed Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "Filed Audit Working Papers";
                    RunPageLink = "Engagement ID" = field("Engagement  ID"),
                                  "Fieldwork Audit Finding ID" = field("Checklist ID");
                    ToolTip = 'Executes the Filed Audit Working Papers action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

