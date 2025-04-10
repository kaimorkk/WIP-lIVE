page 96000 "Licensing Portal Users"
{
    ApplicationArea = All;
    Caption = 'Licensing Portal Users';
    PageType = List;
    SourceTable = "Licensing Portal Users";
    UsageCategory = None;
    Editable = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    CardPageId = "Licensing Portal Users Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Date';
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
    end;

    trigger OnAfterGetRecord()
    begin
    end;

    trigger OnOpenPage()
    begin
    end;

    var
        LicensingPortal: Codeunit "Licensing Portal";
}
