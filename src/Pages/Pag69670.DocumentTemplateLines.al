

page 69670 "Document Template Lines"
{
    PageType = ListPart;
    SourceTable = "Document Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Document Type"; Rec."HR Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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

