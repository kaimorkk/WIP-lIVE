

page 69443 "Inspection Template Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
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
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

