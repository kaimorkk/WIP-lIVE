

page 95155 "Audit Template Procedures"
{
    CardPageID = "Audit Template Procedure";
    PageType = List;
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
    }
}

#pragma implicitwith restore

