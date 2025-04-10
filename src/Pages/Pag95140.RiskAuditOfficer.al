

page 95140 "Risk & Audit Officer"
{
    PageType = Card;
    SourceTable = "Risk & Audit Officer";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
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

