

page 75028 "Procurement Categories"
{
    PageType = List;
    SourceTable = "Procurement Category";
    SourceTableView = where(Blocked = const(false));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Vendor Cluster"; Rec."Preferred Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable Location"; Rec."Applicable Location")
                {
                    ApplicationArea = Basic;
                }
                field("Specific Responsibility Center"; Rec."Specific Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Type"; Rec."Responsibility Center Type")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Code"; Rec."Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Category Type"; Rec."Category Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
            // chartpart("Q9150-01"; "Q9150-01")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Products)
            {
                ApplicationArea = Basic;
                Image = Item;
                RunObject = Page "Procurement Category Product";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Registered Vendors")
            {
                ApplicationArea = Basic;
                Image = Vendor;
                RunObject = Page "Vendor List";
            }
            action("Specific Category Requirement")
            {
                ApplicationArea = Basic;
                Image = ServiceAccessories;
                RunObject = Page "RFI Category Requirement";
                RunPageLink = "Category ID" = field(Code);
            }
            action("Procurement Planning")
            {
                ApplicationArea = Basic;
                Image = AbsenceCategory;
                RunObject = Page "Procurement Plan Lines";
                RunPageLink = "Planning Category" = field(Code);
            }
            action("Invitation For Prequalification")
            {
                ApplicationArea = Basic;
                Image = Info;
                RunObject = Page "Request For Information";
            }
            action("Invitation For Supply")
            {
                ApplicationArea = Basic;
                Image = InwardEntry;
                RunObject = Page "Draft Invitation For Supply";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Products_Promoted; Products)
                {
                }
                actionref("Registered Vendors_Promoted"; "Registered Vendors")
                {
                }
                actionref("Specific Category Requirement_Promoted"; "Specific Category Requirement")
                {
                }
                actionref("Procurement Planning_Promoted"; "Procurement Planning")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Invitation For Prequalification_Promoted"; "Invitation For Prequalification")
                {
                }
                actionref("Invitation For Supply_Promoted"; "Invitation For Supply")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

