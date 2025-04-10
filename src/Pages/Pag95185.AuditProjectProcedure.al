

page 95185 "Audit Project Procedure"
{
    PageType = Card;
    SourceTable = "Audit Project Procedure";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
                }
                field("No. fo Audit Checklists"; Rec."No. fo Audit Checklists")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. fo Audit Checklists field.';
                }
                field("No. Of Reccomm Audit Test Meth"; Rec."No. Of Reccomm Audit Test Meth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Reccomm Audit Test Meth field.';
                }
                field("No. of Business Risks"; Rec."No. of Business Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Business Risks field.';
                }
                field("No. of Controls"; Rec."No. of Controls")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Controls field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

