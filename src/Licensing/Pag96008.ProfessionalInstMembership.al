page 96008 "Professional Inst. Membership"
{
    ApplicationArea = All;
    Caption = 'Membership Summary';
    PageType = ListPart;
    SourceTable = "Professional Inst. Membership";
    
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
                field("Membership Name"; Rec."Membership Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Name field.', Comment = '%';
                }
                field("Membership Number"; Rec."Membership Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Number field.', Comment = '%';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                }
                field("Licence Number"; Rec."Licence Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Number field.', Comment = '%';
                }
                field("Annual Licence Date"; Rec."Annual Licence Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Licence Date field.', Comment = '%';
                }
            }
        }
    }
}
