page 96051 "Tender Alert Portal User"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Portal User';
    PageType = Card;
    SourceTable = "Tender Alert Portal Users";
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Name field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Email Verified"; Rec."Email Verified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Verified field.', Comment = '%';
                }
                field("Email Verified At"; Rec."Email Verified At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Verified At field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Phone No. Verified"; Rec."Phone No. Verified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. Verified field.', Comment = '%';
                }
                field("Phone No. Verified At"; Rec."Phone No. Verified At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. Verified At field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                }
            }
        }
    }
}
