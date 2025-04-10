

page 69170 "Posted Leave Days"
{
    // //

    Editable = false;
    PageType = List;
    SourceTable = "Employee Leaves";
    SourceTableView = sorting("Employee No", "Leave Code", "Posting  Date")
                      order(ascending)
                      where(Posted = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting  Date"; Rec."Posting  Date")
                {
                    ApplicationArea = Basic;
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000017; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

