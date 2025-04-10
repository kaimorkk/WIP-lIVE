

page 80397 "BR Option Text Response Type"
{
    PageType = List;
    SourceTable = w;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Score (%)"; Rec."Score (%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score (%) field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Response Code")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "BR Response Code";
                RunPageLink = "Response Type" = field(Code);
                ToolTip = 'Executes the BR Response Code action.';
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("BR Response Code_Promoted"; "BR Response Code")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

