

page 80067 "Competency Note & Requirement"
{
    PageType = List;
    SourceTable = "Competency Note & Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Competency ID"; Rec."Competency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency ID field.';
                }
                field("Competency Notes"; Rec."Competency Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Notes field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

