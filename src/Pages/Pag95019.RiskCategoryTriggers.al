

page 95019 "Risk Category Triggers"
{
    CardPageID = "Risk Category Trigger";
    PageType = List;
    SourceTable = "Risk Category Trigger";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Category ID"; Rec."Risk Category ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Trigger ID"; Rec."Trigger ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
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

