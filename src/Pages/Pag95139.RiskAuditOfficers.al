

page 95139 "Risk & Audit Officers"
{
    CardPageID = "Risk & Audit Officer";
    PageType = List;
    SourceTable = "Risk & Audit Officer";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Assigned Audit Projects"; Rec."No. of Assigned Audit Projects")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

