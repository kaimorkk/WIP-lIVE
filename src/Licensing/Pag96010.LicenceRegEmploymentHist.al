page 96010 "Licence Reg. Employment Hist"
{
    ApplicationArea = All;
    Caption = 'Employment History';
    PageType = ListPart;
    SourceTable = "Licence Reg. Employment Hist";
    
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
                field(Employer; Rec.Employer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer field.', Comment = '%';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field("Currently Work Here"; Rec."Currently Work Here")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currently Work Here field.', Comment = '%';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.', Comment = '%';
                }
            }
        }
    }
}
