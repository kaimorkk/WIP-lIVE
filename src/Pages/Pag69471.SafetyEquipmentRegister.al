

page 69471 "Safety Equipment Register"
{
    PageType = Card;
    SourceTable = "Safety Equipment Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = Basic;
                }
                field(SubType; Rec.SubType)
                {
                    ApplicationArea = Basic;
                }
                field("SubType No."; Rec."SubType No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Safety Equipment Category"; Rec."Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Notes/Comments"; Rec."Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset/Resource Quantity"; Rec."Fixed Asset/Resource Quantity")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Maintenance)
            {
                Caption = 'Maintenance';
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

