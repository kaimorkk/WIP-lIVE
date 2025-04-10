page 95378 "Audit Finding Review Comments"
{
    ApplicationArea = All;
    Caption = 'Audit Finding Review Comments';
    PageType = ListPart;
    SourceTable = "Audit Finding Review Comments";
    PopulateAllFields = true;
    
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Finding ID field.', Comment = '%';
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
