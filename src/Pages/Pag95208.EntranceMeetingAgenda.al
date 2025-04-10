

page 95208 "Entrance Meeting Agenda"
{
    CardPageID = "Entrance Meeting Agendum";
    PageType = List;
    SourceTable = "Entrance Meeting Agenda";

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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
                field("No. of Discussed Items"; Rec."No. of Discussed Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Discussed Items field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

