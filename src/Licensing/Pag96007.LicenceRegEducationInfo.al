page 96007 "Licence Reg Education Info"
{
    ApplicationArea = All;
    Caption = 'Education Summary';
    PageType = ListPart;
    SourceTable = "Licence Reg. Education Info";
    
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
                field("Education Level"; Rec."Education Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Education Level field.', Comment = '%';
                }
                field(Qualification; Rec.Qualification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification field.', Comment = '%';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.', Comment = '%';
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field("Other Education Level"; Rec."Other Education Level")
                {
                    ToolTip = 'Specifies the value of the Other Education Level field.', Comment = '%';
                }
                field("Other Qualification"; Rec."Other Qualification")
                {
                    ToolTip = 'Specifies the value of the Other Qualification field.', Comment = '%';
                }
            }
        }
    }
}
