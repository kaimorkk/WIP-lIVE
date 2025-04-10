

page 95186 "Audit Project Checklists"
{
    CardPageID = "Audit Project Checklist";
    PageType = List;
    SourceTable = "Audit Project Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("Procedure Description"; Rec."Procedure Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procedure Description field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Checklist Description';
                    ToolTip = 'Specifies the value of the Checklist Description field.';
                }
                field("No. Of Audit Test Methods"; Rec."No. Of Audit Test Methods")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. Of Audit Test Methods field.';
                }
                field("Fieldwork Review Status"; Rec."Fieldwork Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fieldwork Review Status field.';
                }
                field("Completion %"; Rec."Completion %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Completion % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

