

page 95248 "Audit Findings"
{
    CardPageID = "Audit Finding";
    PageType = List;
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
                    Visible = false;
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
                field("Management Response"; Rec."Management Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Response field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field("Responsible Person Name"; Rec."Responsible Person Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsible Person Name field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Response Submission Deadline"; Rec."Response Submission Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Submission Deadline field.';
                }
                field("Verdict/Opinion"; Rec."Verdict/Opinion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict/Opinion field.';
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
    }
}

#pragma implicitwith restore

