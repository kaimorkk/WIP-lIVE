

page 80171 "Policy Version"
{
    Editable = false;
    PageType = List;
    SourceTable = "Policy Version";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Version Id"; Rec."Version Id")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Revision Date"; Rec."Revision Date")
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

