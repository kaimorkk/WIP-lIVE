page 96025 "Licence Category Lines"
{
    ApplicationArea = All;
    Caption = 'Licence Category Lines';
    PageType = ListPart;
    SourceTable = "Licence Category Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                    Editable = false;
                }
                field("Practice Category Code"; Rec."Practice Category Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Practice Category Code field.', Comment = '%';
                    Editable = false;
                }
                field("Practice Category Name"; Rec."Practice Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Practice Category Name field.', Comment = '%';
                    Editable = false;
                }
                field("Practice Fee"; Rec."Practice Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Practice Fee field.', Comment = '%';
                    Editable = false;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.', Comment = '%';
                    Editable = false;
                }
                field(Approve; Rec.Approve)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approve field.', Comment = '%';
                }
            }
        }
    }
}
