page 96019 "Licence Renewal Information"
{
    ApplicationArea = All;
    Caption = 'Licence Renewal Lines';
    PageType = ListPart;
    SourceTable = "Licence Renewal Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Licence ID"; Rec."Licence ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Licence No.';
                    ToolTip = 'Specifies the value of the Licence ID field.', Comment = '%';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Registration No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Category Name field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.', Comment = '%';
                }
            }
        }
    }
}
