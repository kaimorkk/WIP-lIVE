

page 80003 "Core Mandates"
{
    CardPageID = "Core Mandat Card";
    PageType = List;
    SourceTable = "Core Mandates";

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
                field("Core Mandates"; Rec."Core Mandates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Core Mandates field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

