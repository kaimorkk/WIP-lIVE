

page 95027 "Risk Mgt. Responsibilities"
{
    CardPageID = "Risk Management Responsibility";
    PageType = List;
    SourceTable = "Risk Management Responsibility";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility ID"; Rec."Responsibility ID")
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

