page 70009 "Vendor Target Groups"
{
    PageType = List;
    SourceTable = "Vendor Target Groups";
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
            action("Supplier List")
            {
                ApplicationArea = Basic;
                Caption = 'Supplier List';
                Image = Vendor;
                RunObject = Page "Vendor List";
                RunPageLink = "Special Groups Type" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Supplier List_Promoted"; "Supplier List")
                {
                }
            }
        }
    }
}