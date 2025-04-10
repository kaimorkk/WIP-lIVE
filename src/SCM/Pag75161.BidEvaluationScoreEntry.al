

page 75161 "Bid Evaluation Score Entry"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Bid Evaluation Score Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requirement ID field.';
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Requirement field.';
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Criteria Group field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Findings';
                    ToolTip = 'Specifies the value of the Evaluation Findings field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation  Remarks';
                    ToolTip = 'Specifies the value of the Evaluation  Remarks field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Quantity';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Required Quantity field.';
                }
                field("Bid Response Actual Qty"; Rec."Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Quantity';
                    ToolTip = 'Specifies the value of the Actual Quantity field.';
                }
                field("Target Value/KPI"; Rec."Target Value/KPI")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Target Value/KPI field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Weighted Line Score"; Rec."Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weighted Line Score field.';
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Results field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Bid Evaluation Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    RunObject = Page "Bid Evaluation Score Guide";
                    RunPageLink = "Template ID" = field("Bid Scoring Document No."),
                                  "Criteria Group ID" = field("Criteria Group"),
                                  "Requirement ID" = field("Requirement ID");
                    ToolTip = 'Executes the Bid Evaluation Score Guide action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

