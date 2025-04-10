

page 69425 "OSH Rule Template Categories"
{
    CardPageID = "OSH Rule Template Category";
    PageType = List;
    SourceTable = "OSH Rule Template Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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

