page 96004 "Licensing Setup"
{
    ApplicationArea = All;
    Caption = 'Licensing Setup';
    PageType = Card;
    SourceTable = "Licensing Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;
    Editable = true;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                    Visible = false;
                }
                field("Licensing Portal URL"; Rec."Licensing Portal URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licensing Portal URL field.', Comment = '%';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Base Unit of Measure field.', Comment = '%';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.', Comment = '%';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.', Comment = '%';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.', Comment = '%';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.', Comment = '%';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Licence Registration Nos."; Rec."Licence Registration Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Registration Nos. field.', Comment = '%';
                }
                field("Licence Renewal Nos."; Rec."Licence Renewal Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Renewal Nos. field.', Comment = '%';
                }
                field("Licence Restoration Nos."; Rec."Licence Restoration Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Restoration Nos. field.', Comment = '%';
                }
                field("Licence Reg. Categories Nos."; Rec."Licence Reg. Categories Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Reg. Categories Nos. field.', Comment = '%';
                }
                field("Licence Nos."; Rec."Licence Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Nos. field.', Comment = '%';
                }
                field("User Nos."; Rec."User Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Nos. field.', Comment = '%';
                }
                field("Licence Invoice Nos."; Rec."Licence Invoice Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Invoice Nos. field.', Comment = '%';
                }
                field("Registration Nos."; Rec."Registration Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Nos. field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
