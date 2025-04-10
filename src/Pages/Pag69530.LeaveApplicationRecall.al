

page 69530 "Leave Application Recall"
{
    CardPageID = "Leave Application Recall Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Leave Application Recall";
    SourceTableView = where(Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Recall No"; Rec."Recall No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recall No field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Code field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Approved Days"; Rec."Approved Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Days field.';
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Start Date field.';
                }
                field("Days Recalled"; Rec."Days Recalled")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Recalled field.';
                }
                field("Recall Date From"; Rec."Recall Date From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recall Date From field.';
                }
                field("Recall Date To"; Rec."Recall Date To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recall Date To field.';
                }
                field("Reason for Recall"; Rec."Reason for Recall")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Recall field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

