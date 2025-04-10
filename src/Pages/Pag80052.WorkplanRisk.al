

page 80052 "Workplan Risk"
{
    PageType = List;
    SourceTable = "PC Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Source Class"; Rec."Risk Source Class")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Description"; Rec."Risk Description")
                {
                    ApplicationArea = Basic;
                }
                field("Inherent Likelihood Level"; Rec."Inherent Likelihood Level")
                {
                    ApplicationArea = Basic;
                }
                field("Inherent Impact Level"; Rec."Inherent Impact Level")
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

