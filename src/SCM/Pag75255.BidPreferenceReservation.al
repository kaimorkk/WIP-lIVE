

page 75255 "Bid Preference & Reservation"
{
    PageType = List;
    SourceTable = "Bid Preference & Reservation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("AGPO Certificate No"; Rec."AGPO Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AGPO Certificate No field.';
                }
                field("Registered Special Group"; Rec."Registered Special Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registered Special Group field.';
                }
                field("Products/Service Category"; Rec."Products/Service Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Products/Service Category field.';
                }
                field("Certificate Effective Date"; Rec."Certificate Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Effective Date field.';
                }
                field("Certificate Expiry Date"; Rec."Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Expiry Date field.';
                }
                field("Certifying Agency"; Rec."Certifying Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certifying Agency field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

