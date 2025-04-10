

page 75079 "IFS Major Work_Deliverable"
{
    PageType = List;
    SourceTable = "IFS Major Work_Deliverable";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Major Activity Description"; Rec."Major Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Major Activity Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

