page 96014 "Licence Restoration Referees"
{
    ApplicationArea = All;
    Caption = 'Licence Restoration Referees';
    PageType = ListPart;
    SourceTable = "Licence Restoration Referees";
    
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EMail field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field(Profession; Rec.Profession)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Profession field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
            }
        }
    }
}
