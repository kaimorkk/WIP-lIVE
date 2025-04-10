

page 75093 "Vendor Debarment Voucher Line"
{
    PageType = ListPart;
    SourceTable = "Vendor Debarment Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Firm Name"; Rec."Firm Name")
                {
                    ApplicationArea = Basic;
                }
                field("Debarment Reason Code"; Rec."Debarment Reason Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason Code';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ineligibility Start Date"; Rec."Ineligibility Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Ineligibility End Date"; Rec."Ineligibility End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reinstatement Date"; Rec."Reinstatement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                }
                field("Incorporation/Reg No."; Rec."Incorporation/Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
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

