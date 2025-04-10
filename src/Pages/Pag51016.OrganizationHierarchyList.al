page 52194366 "Organization Hierarchy List"
{
    ApplicationArea = All;
    Caption = 'Administrative Organization Hierarchy List';
    PageType = List;
    SourceTable = "Organization Hierarchy Header";
    UsageCategory = Lists;
    CardPageId = "Organization Hierarchy Header";
    SourceTableView = where("Structure Type" = filter(Administrative));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Structure Type"; Rec."Structure Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Structure Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Done By"; Rec."Done By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Done By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
