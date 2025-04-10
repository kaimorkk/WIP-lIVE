

page 56133 "ICT Inventory"
{
    PageType = Card;
    SourceTable = "ICT Inventory";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Sub-Type"; Rec."Sub-Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Type field.';
                }
                field("Sub Type No."; Rec."Sub Type No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset number';
                    ToolTip = 'Specifies the value of the Asset number field.';
                }
                field("Sub Type Description"; Rec."Sub Type Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Type Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("ICT Asset Category"; Rec."ICT Asset Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Asset Category field.';
                }
                field("ICT Asset subcategory"; Rec."ICT Asset subcategory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Asset subcategory field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Maintenance Date field.';
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Under Maintenance field.';
                }
                field("Next service date"; Rec."Next service date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next service date field.';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brand field.';
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insured field.';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.';
                }
                field("Current Assigned Division/Unit"; Rec."Current Assigned Division/Unit")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current Assigned Division/Unit field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Condition; Rec.Condition)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. of Issues Raised"; Rec."No. of Issues Raised")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Issues Raised field.';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field("Purchase date"; Rec."Purchase date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase date field.';
                }
                field("Disposed date"; Rec."Disposed date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposed date field.';
                }
                field("Tag No"; Rec."Tag No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tag No field.';
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("IP address"; Rec."IP address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IP address field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
            group("Software details")
            {
                Caption = 'Software details';
                field("Has Expiry Date"; Rec."Has Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Expiry Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Software Product key"; Rec."Software Product key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Software Product key field.';
                }
                field("Total number of license"; Rec."Total number of license")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total number of license field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Link; Rec.Link)
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                    ToolTip = 'Specifies the value of the Link field.';
                }
                field("Manufactured date"; Rec."Manufactured date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manufactured date field.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Issuance Entries")
            {
                ApplicationArea = Basic;
                Image = ShipmentLines;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = field(Code),
                              Type = const(Issuance);
                ToolTip = 'Executes the Issuance Entries action.';
            }
            action("Movement Entries")
            {
                ApplicationArea = Basic;
                Image = ViewDocumentLine;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = field(Code),
                              Type = const(Movement);
                ToolTip = 'Executes the Movement Entries action.';
            }
            action("Maintenance &Registration")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Maintenance &Registration';
                Image = MaintenanceRegistrations;
                RunObject = Page "Maintenance Registration";
                RunPageLink = "FA No." = field("Sub Type No.");
                ToolTip = 'View or edit maintenance codes for the various types of maintenance, repairs, and services performed on your fixed assets. You can then enter the code in the Maintenance Code field on journals.';
                Visible = false;
            }
            action("Main&tenance Ledger Entries")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Main&tenance Ledger Entries';
                Image = MaintenanceLedgerEntries;
                RunObject = Page "Posted Maintenance Activities";
                RunPageLink = "ICT Inventory No." = field(Code);
                ToolTip = 'View all the maintenance ledger entries for a fixed asset.';
            }
            action("Board of Survey Entries")
            {
                ApplicationArea = Basic;
                Image = EntriesList;
                RunObject = Page "ICT Board of Survey Entries";
                RunPageLink = "ICT Inventory No" = field(Code);
                ToolTip = 'Executes the Board of Survey Entries action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Maintenance &Registration_Promoted"; "Maintenance &Registration")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Movement Entries_Promoted"; "Movement Entries")
                {
                }
                actionref("Board of Survey Entries_Promoted"; "Board of Survey Entries")
                {
                }
                actionref("Issuance Entries_Promoted"; "Issuance Entries")
                {
                }
                actionref("Main&tenance Ledger Entries_Promoted"; "Main&tenance Ledger Entries")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

