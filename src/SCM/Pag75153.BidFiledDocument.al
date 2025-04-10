

page 75153 "Bid Filed Document"
{
    PageType = List;
    SourceTable = "Bid Filed Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Date Filed"; Rec."Date Filed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filed field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Procurement Document Type ID"; Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Type ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document/Certificate No. field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialized Provider Requirement field.';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Extension field.';
                }
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Process field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

