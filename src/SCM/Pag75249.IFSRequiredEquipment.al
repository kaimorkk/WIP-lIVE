

page 75249 "IFS Required Equipment"
{
    PageType = List;
    SourceTable = "IFS Required Equipment";

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
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Minimum Required Qty"; Rec."Minimum Required Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Required Qty field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

