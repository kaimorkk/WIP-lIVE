

page 80024 "Strategy Framework"
{
    PageType = List;
    SourceTable = "Strategy Framework";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Framework Perspectives")
            {
                ApplicationArea = Basic;
                Image = CreateBins;
                RunObject = Page "Strategy Framework Perspective";
                RunPageLink = "Strategy Framework" = field(Code);
            }
            action("Corporate Strategic Plan")
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page "Corporate Strategic Plans";
                RunPageLink = "Strategy Framework" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Framework Perspectives_Promoted"; "Framework Perspectives")
                {
                }
                actionref("Corporate Strategic Plan_Promoted"; "Corporate Strategic Plan")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

