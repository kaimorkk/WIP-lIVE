#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 72061 "Project Funding Voucher Line"
{
    PageType = ListPart;
    SourceTable = "Project Funding Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Estimated Cost(LCY)"; Rec."Total Estimated Cost(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Status"; Rec."Revision Status")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)"; Rec."Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)"; Rec."End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Surface Type"; Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Work Category"; Rec."Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Type"; Rec."Fund Type")
                {
                    ApplicationArea = Basic;
                }
                field("Execution Method"; Rec."Execution Method")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Details Of Road Activities")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Add;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    // RunObject = Page "Details Of Road Activities";
                    // RunPageLink = "WorkPlan No" = field("Document No");
                }
                action("Work Schedule(%)")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    // RunObject = Page "Work Schedule";
                    // RunPageLink = "Workplan No" = field("Document No");
                }
            }
        }
    }
}

#pragma implicitwith restore

