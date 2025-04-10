

page 69441 "Inspection Template Categories"
{
    CardPageID = "Inspection Template Category";
    PageType = List;
    SourceTable = "Inspection Template Category";

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

