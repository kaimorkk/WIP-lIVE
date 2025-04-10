

page 69305 "Training Goal Setup"
{
    PageType = List;
    SourceTable = "Training Goals Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Plan ID"; Rec."Training Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of training objectives"; Rec."No. of training objectives")
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

