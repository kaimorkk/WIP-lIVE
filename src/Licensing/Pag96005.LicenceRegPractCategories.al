page 96005 "Licence Reg Pract Categories"
{
    ApplicationArea = All;
    Caption = 'Practice Categories';
    PageType = ListPart;
    SourceTable = "Licence Reg. Pract. Categories";
    
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
                }
                field("Practice Category Code"; Rec."Practice Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Practice Category Code field.', Comment = '%';
                    Editable = false;
                    Visible = false;
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Practice Fee field.', Comment = '%';
                }
                field("Renewal Fee"; Rec."Renewal Fee")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Renewal Fee field.', Comment = '%';
                }
                field("Restoration Fee"; Rec."Restoration Fee")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Restoration Fee field.', Comment = '%';
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
                field(Deregistered; Rec.Deregistered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deregistered field.', Comment = '%';
                }
            }
        }
    }
}
