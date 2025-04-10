

page 80094 "Performance Plan Guidelines"
{
    CardPageID = "Performance Plan Guideline";
    Editable = false;
    PageType = List;
    SourceTable = "Performance Plan Guideline";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Policy/Guideline ID"; Rec."Policy/Guideline ID")
                {
                    ApplicationArea = Basic;
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

