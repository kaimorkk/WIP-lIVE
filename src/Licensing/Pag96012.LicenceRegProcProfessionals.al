page 96012 "Licence Reg Proc Professionals"
{
    ApplicationArea = All;
    Caption = 'Summary of Procurement Professionals';
    PageType = ListPart;
    SourceTable = "Licence Reg Proc Professionals";
    
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
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field(Profession; Rec.Profession)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profession field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EMail field.', Comment = '%';
                }
            }
        }
    }
}
