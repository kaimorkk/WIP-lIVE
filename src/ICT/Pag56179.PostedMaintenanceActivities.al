

page 56179 "Posted Maintenance Activities"
{
    Editable = false;
    PageType = List;
    SourceTable = "Posted Maintenance Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Area"; Rec."Maintenance Area")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Inventory No."; Rec."ICT Inventory No.")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Schedule"; Rec."Maintenance Schedule")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Period"; Rec."Maintenance Period")
                {
                    ApplicationArea = Basic;
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                }
                field("Period Date"; Rec."Period Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
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

