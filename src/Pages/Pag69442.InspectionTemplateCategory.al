

page 69442 "Inspection Template Category"
{
    PageType = Card;
    SourceTable = "Inspection Template Category";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
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
                field("No. of Compliance Requirements"; Rec."No. of Compliance Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Compliance Requirements field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

