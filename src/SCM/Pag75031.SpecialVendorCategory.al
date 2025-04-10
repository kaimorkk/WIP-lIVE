

page 75031 "Special Vendor Category"
{
    PageType = List;
    SourceTable = "Special Vendor Category";
    Caption = 'Vendor Category';
    UsageCategory = Administration;
    ApplicationArea = All;

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
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Certifiying Agency"; Rec."Default Certifiying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Certifiying Agency URL"; Rec."Certifiying Agency URL")
                {
                    ApplicationArea = Basic;
                }
                field("No of Active Vendors"; Rec."No of Active Vendors")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup12)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    RunObject = Page "Vendor List";
                    RunPageLink = "Current Vendor Class" = field(Code);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Vendors_Promoted; Vendors)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

