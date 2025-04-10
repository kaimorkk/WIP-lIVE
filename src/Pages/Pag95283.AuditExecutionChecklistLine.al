

page 95283 "Audit Execution Checklist Line"
{
    PageType = ListPart;
    SourceTable = "Audit Execution Checklist";

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
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Fieldwork Review Status"; Rec."Fieldwork Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Review Status field.';
                }
                field("Completion %"; Rec."Completion %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion % field.';
                }
                field("No. of Audit Findings"; Rec."No. of Audit Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Findings field.';
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Recommendations field.';
                }
                field("No. Of Filed Audit Work Papers"; Rec."No. Of Filed Audit Work Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Filed Audit Work Papers field.';
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
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
                action("Transaction Testing Approach")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Testing Approach';
                    Image = TransferFunds;
                    RunObject = Page "Audit Checklist Test Approache";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Transaction Testing Approach action.';
                }
                action("Audit Findings Summary")
                {
                    ApplicationArea = Basic;
                    Image = Find;
                    RunObject = Page "Audit Execution Findings";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Audit Findings Summary action.';
                }
                action("Positive Findings")
                {
                    ApplicationArea = Basic;
                    Image = process;
                    RunObject = Page "Positive Audit Findings";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Positive Findings action.';
                }
                action("Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;
                    RunObject = Page "Audit Finding Recommendations";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Engagement ID" = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Audit Recommendations action.';
                }
                action("Filed Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Image = Workdays;
                    RunObject = Page "Filed Audit Working Papers";
                    RunPageLink = "Engagement ID" = field("Engagement ID");
                    ToolTip = 'Executes the Filed Audit Working Papers action.';
                }
                action(Dimesnions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                    ToolTip = 'Executes the Dimesnions action.';
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Audit Documents';
                    Image = Attach;
                    RunObject = Page "Aud Document Attachment";
                    RunPageLink = "Document Type" = field("Audit Procedure ID");
                    // RunPageView = where("Document Type" = filter(Audit));
                    ToolTip = 'Executes the Attach Audit Documents action.';
                    trigger OnAction()
                    begin
                        // DMSManagement.UploadImprestDocuments(Rec."No.", 'Imprest Naration', Rec.RecordId);
                    end;
                }
            }
        }
    }

    var
        // DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

