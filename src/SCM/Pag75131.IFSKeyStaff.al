

page 75131 "IFS Key Staff"
{
    PageType = List;
    SourceTable = "IFS Key Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field("Title/Designation Description"; Rec."Title/Designation Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation Description field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Min No. of Recomm Staff"; Rec."Min No. of Recomm Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min No. of Recomm Staff field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

