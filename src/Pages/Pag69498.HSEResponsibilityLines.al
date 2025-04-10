

page 69498 "HSE Responsibility Lines"
{
    PageType = ListPart;
    SourceTable = "HSE Responsibility";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role ID field.';
                }
                field("Responsibility ID"; Rec."Responsibility ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility ID field.';
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

