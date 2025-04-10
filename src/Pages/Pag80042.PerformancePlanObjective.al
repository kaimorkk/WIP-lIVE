

page 80042 "Performance Plan Objective"
{
    PageType = List;
    SourceTable = "Performance Plan Objective";

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
                field("Objective Entry No"; Rec."Objective Entry No")
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

