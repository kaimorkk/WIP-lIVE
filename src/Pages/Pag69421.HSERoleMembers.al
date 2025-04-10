

page 69421 "HSE Role Members"
{
    CardPageID = "HSE Role Member";
    PageType = List;
    SourceTable = "HSE Role Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role ID field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Membership Role Type"; Rec."Membership Role Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Role Type field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Service Start Date"; Rec."Service Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Start Date field.';
                }
                field("Service End Date"; Rec."Service End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

