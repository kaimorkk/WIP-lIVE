

page 75138 "IFS Prebid Register Agenda"
{
    PageType = ListPart;
    SourceTable = "IFS Prebid Clarification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID"; Rec."Prebid Register ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Register ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

