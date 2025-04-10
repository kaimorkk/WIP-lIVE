

page 69302 "Disciplinary Committe Members"
{
    PageType = ListPart;
    SourceTable = "Disciplinary Committee Members";

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
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

