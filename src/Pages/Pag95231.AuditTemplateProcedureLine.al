

page 95231 "Audit Template Procedure Line"
{
    PageType = ListPart;
    SourceTable = "Audit Template Procedure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
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
                field("No. Of Reccomm Audit Test Meth"; Rec."No. Of Reccomm Audit Test Meth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Reccomm Audit Test Meth field.';
                }
                field("No. Of Comments"; Rec."No. Of Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Comments field.';
                }
                field("No. of Audit Risks"; Rec."No. of Audit Risks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Risks field.';
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
                action("Procedure Test")
                {
                    ApplicationArea = Basic;
                    Image = AbsenceCategory;
                    RunObject = Page "Audit Template Procedure Tests";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Audit Objective ID" = field("Audit Objective ID"),
                                  "Audit Procedure ID" = field("Audit Procedure ID");
                    ToolTip = 'Executes the Procedure Test action.';
                }
                action("Procedure Comment")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "Audit Temp Procedure Comments";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Audit Objective ID" = field("Audit Objective ID"),
                                  "Audit Procedure ID" = field("Audit Procedure ID");
                    ToolTip = 'Executes the Procedure Comment action.';
                }
                action("Procedure Risk")
                {
                    ApplicationArea = Basic;
                    Image = Alerts;
                    RunObject = Page "Audit Template Default Risks";
                    RunPageLink = "Template ID" = field("Template ID");
                    ToolTip = 'Executes the Procedure Risk action.';
                }
                action("Procedure Control")
                {
                    ApplicationArea = Basic;
                    Image = Aging;
                    RunObject = Page "Audit Temp Procedure Controls";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Audit Objective ID" = field("Audit Objective ID"),
                                  "Audit Procedure ID" = field("Audit Procedure ID");
                    ToolTip = 'Executes the Procedure Control action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

