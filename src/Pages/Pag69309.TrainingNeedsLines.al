

page 69309 "Training Needs Lines"
{
    PageType = List;
    SourceTable = "Training Needs Lines";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Linked Objectives"; Rec."No. of Linked Objectives")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Need Objectives")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Training Objectives";
                RunPageLink = Type = const(Need),
                              Code = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Need Objectives_Promoted"; "Need Objectives")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

