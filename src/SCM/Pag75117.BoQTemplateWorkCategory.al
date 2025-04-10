

page 75117 "BoQ Template Work Category"
{
    PageType = List;
    SourceTable = "BoQ Template Work Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }
                field("Works Category Code"; Rec."Works Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Category Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

