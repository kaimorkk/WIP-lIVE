

page 95250 "Audit Project Checklist Lines"
{
    PageType = ListPart;
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
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("No. Of Audit Test Methods"; Rec."No. Of Audit Test Methods")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Audit Test Methods field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
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
                action(Findings)
                {
                    ApplicationArea = Basic;
                    Image = AddContacts;
                    RunObject = Page "Audit Findings";
                    RunPageLink = "Document No." = field("Engagement ID"),
                                  "Checklist ID" = field("Checklist ID");
                    ToolTip = 'Executes the Findings action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

