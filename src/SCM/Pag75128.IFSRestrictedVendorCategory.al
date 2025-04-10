

page 75128 "IFS Restricted Vendor Category"
{
    PageType = List;
    SourceTable = "IFS Restricted Vendor Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Restricted Vendor Category ID"; Rec."Restricted Vendor Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Vendor Category ID field.';
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

