

page 80169 "Policy Stakeholder Roles"
{
    PageType = List;
    SourceTable = "Policy Stakeholder Role";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

