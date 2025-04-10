

page 95110 "Audit Charter Components"
{
    CardPageID = "Audit Charter Component";
    PageType = List;
    SourceTable = "Audit Charter Component";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Charter ID"; Rec."Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Charter ID field.';
                }
                field("Component Type"; Rec."Component Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Component Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

