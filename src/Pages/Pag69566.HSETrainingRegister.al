

page 69566 "HSE Training Register"
{
    CardPageID = "HSE Plan Calendar";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "HSE Plan Calendar";
    SourceTableView = where("OSH Activity Type" = const("OSH Training"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("OSH Activity Type"; Rec."OSH Activity Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Activity Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Mission field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Overall Owner ID"; Rec."Overall Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Owner ID field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Due Date field.';
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Status field.';
                }
                field("% Complete"; Rec."% Complete")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % Complete field.';
                }
                field("Activity Priority"; Rec."Activity Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Priority field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Date Done field.';
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue/Location field.';
                }
                field("Meeting Medium"; Rec."Meeting Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Medium field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

