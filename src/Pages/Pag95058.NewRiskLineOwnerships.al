

page 95058 "New Risk Line Ownerships"
{
    CardPageID = "New Risk Line Ownership";
    PageType = List;
    SourceTable = "New Risk Line Ownership";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center ID field.';
                }
                field(Desciption; Rec.Desciption)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desciption field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

