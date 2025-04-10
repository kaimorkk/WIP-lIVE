

page 69197 "Training Objectives"
{
    PageType = ListPart;
    SourceTable = "Training Lines Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Need Requests";
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

