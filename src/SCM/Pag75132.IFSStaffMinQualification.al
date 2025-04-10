

page 75132 "IFS Staff Min Qualification"
{
    PageType = List;
    SourceTable = "IFS Staff Min Qualification";

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
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Role Code field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Minimum Qualification Req"; Rec."Minimum Qualification Req")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Qualification Requirements field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

