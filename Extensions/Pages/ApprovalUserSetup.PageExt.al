PageExtension 52193524 pageextension52193524 extends "Approval User Setup" 
{
    Caption = 'Approval User Setup';
    layout
    {
        addafter("Unlimited Purchase Approval")
        {
            field("Immediate Supervisor";"Immediate Supervisor")
            {
                ApplicationArea = Basic;
            }
            field(HOD;HOD)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Request Amount Approval Limit")
        {
            field("Purchase Resp. Ctr. Filter";"Purchase Resp. Ctr. Filter")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Approval Administrator")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("&Approval User Setup Test")
        {
            action("User Signature")
            {
                ApplicationArea = Basic;
                Caption = 'User Signature';
                Image = Picture;
                RunObject = Page "User Signature";
                RunPageLink = "User ID" = field("User ID");
            }
        }
        addlast(Category_Process)
        {
            actionref("User Signature_Promoted"; "User Signature")
            {
            }
        }
    }
}

