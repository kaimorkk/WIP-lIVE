page 96011 "Licence Reg. Practice Agencies"
{
    ApplicationArea = All;
    Caption = 'Practice Agencies Summary';
    PageType = ListPart;
    SourceTable = "Licence Reg. Practice Agencies";
    
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
                field("Agency Name"; Rec."Agency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agency Name field.', Comment = '%';
                }
                field("Firm No."; Rec."Firm No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm No. field.', Comment = '%';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.', Comment = '%';
                }
                field("Agency Registration No."; Rec."Agency Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agency Registration No. field.', Comment = '%';
                }
                field("Firm Licence No."; Rec."Firm Licence No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Licence No. field.', Comment = '%';
                }
                field("Firm Annual Licence No."; Rec."Firm Annual Licence No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Annual Licence No. field.', Comment = '%';
                }
            }
        }
    }
}
