

page 56122 "Escalation Matrix"
{
    PageType = List;
    SourceTable = "ICT Helpdesk Escalation Matrix";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("Reports To Officer Name"; Rec."Reports To Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reports To Officer Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

