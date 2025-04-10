

page 70050 "Purchases Types"
{
    PageType = List;
    SourceTable = "Purchases Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Type Description"; Rec."Purchase Type Description")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000007; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; Links)
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

