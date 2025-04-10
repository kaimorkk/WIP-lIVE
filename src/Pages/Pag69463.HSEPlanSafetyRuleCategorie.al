

page 69463 "HSE Plan Safety Rule Categorie"
{
    CardPageID = "HSE Plan Safety Rule Category";
    PageType = List;
    SourceTable = "HSE Plan Safety Rule Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
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
                field("No. of Rules & Regulations"; Rec."No. of Rules & Regulations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Rules & Regulations field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

