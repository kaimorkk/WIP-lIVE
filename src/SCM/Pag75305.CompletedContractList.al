

page 75305 "Completed Contract List"
{
    CardPageID = "Contract Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const("Blanket Order"),
                            "Contract Status" = const(Signed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address of the vendor who ships the items.';
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the vendor who ships the items.';
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact person at the vendor who delivered the items.';
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the vendor who delivered the items.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Description field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bid No field.';
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes (LCY) field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Governing Laws"; Rec."Governing Laws")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Governing Laws field.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Status field.';
                }
                field("Procuring Entity (PE) Name"; Rec."Procuring Entity (PE) Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procuring Entity (PE) Name field.';
                }
                field("PE Representative"; Rec."PE Representative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PE Representative field.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Your Reference field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

