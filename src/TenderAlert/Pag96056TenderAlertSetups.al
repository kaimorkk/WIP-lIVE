page 96056 "Tender Alert Setups"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Setups';
    PageType = Card;
    SourceTable = "Tender Alert Setups";
    InsertAllowed = false;
    DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
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
                field("SMS Cost"; Rec."SMS Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SMS Cost field.', Comment = '%';
                }
                field("E-Mail Cost"; Rec."E-Mail Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail Cost field.', Comment = '%';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                
                field("User Nos."; Rec."User Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Nos. field.', Comment = '%';
                }
                field("Subscription Nos."; Rec."Subscription Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subscription Nos. field.', Comment = '%';
                }
                field("Transaction Nos."; Rec."Transaction Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Nos. field.', Comment = '%';
                }
                field("Invoice Nos."; Rec."Invoice Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Nos. field.', Comment = '%';
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
