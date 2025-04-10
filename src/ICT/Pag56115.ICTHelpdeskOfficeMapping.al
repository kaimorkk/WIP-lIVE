

page 56115 "ICT Helpdesk Office Mapping"
{
    PageType = List;
    SourceTable = "ICT Officers Category Mapping";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserName; Rec.UserName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserName field.';
                }
                field("Help Desk Category"; Rec."Help Desk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Help Desk Category field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("User Feedbback Duration"; Rec."User Feedbback Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Feedbback Duration field.';
                }
                field("Assined Issue Duration"; Rec."Assined Issue Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Issue Duration';
                    ToolTip = 'Specifies the value of the Assigned Issue Duration field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

