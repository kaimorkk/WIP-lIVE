page 69369 "Individual Interview Outcome"
{
    Caption = 'Individual Interview Outcome';
    PageType = List;
    SourceTable = "Individual Interview Outcome";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Panel Interview Score %"; Rec."Panel Interview Score %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Interview Score % field.';
                }
                field("Panel Interview Outcome"; Rec."Panel Interview Outcome")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Interview Outcome field.';
                }
                field("Original Document No."; Rec."Original Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Document No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
            }
        }
    }
}
