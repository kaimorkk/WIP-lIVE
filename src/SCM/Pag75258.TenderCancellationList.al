

page 75258 "Tender Cancellation List"
{
    CardPageID = "Tender Cancellation Voucher";
    PageType = List;
    SourceTable = "Tender Cancellation Voucher";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No"; Rec."Invitation Notice No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 1.';
            }
            group(Category_Report)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
        }
    }
}

#pragma implicitwith restore

