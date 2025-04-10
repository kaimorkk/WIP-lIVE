

page 80065 "Competencies"
{
    CardPageID = Competency;
    PageType = List;
    SourceTable = Competency;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Summary"; Rec."Competency Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Summary field.';
                }
                field("Competency Category"; Rec."Competency Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Category field.';
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

