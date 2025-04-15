PageExtension 52193435 pageextension52193435 extends "Vendor Card"
{
    layout
    {

        //Unsupported feature: Property Insertion (TableRelation) on ""Balance (LCY)"(Control 92)".

        modify(Blocked)
        {
            Caption = 'Blacklist';
        }

        //Unsupported feature: Property Modification (SourceExpr) on ""Preferred Bank Account"(Control 9)".


        //Unsupported feature: Property Modification (Name) on ""Preferred Bank Account"(Control 9)".

        modify("Shipment Method Code")
        {
            Caption = 'IncoTerms';
        }

        //Unsupported feature: Property Insertion (Importance) on ""VAT Registration No."(Control 58)".


        //Unsupported feature: Property Deletion (ShowMandatory) on "Name(Control 4)".

        modify("Privacy Blocked")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Gen. Bus. Posting Group"(Control 60)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""VAT Bus. Posting Group"(Control 90)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Vendor Posting Group"(Control 32)".


        //Unsupported feature: Property Deletion (NotBlank) on ""Invoice Disc. Code"(Control 34)".

        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("VAT Registration No.")
        {
            Visible = false;
        }

        addafter(Blocked)
        {
            // field("Reason for Blacklist";"Reason for Blacklist")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Last Date Modified")
        {
            field(Prequalification; Prequalification)
            {
                ApplicationArea = Basic;
            }
            field("Supplier Type"; "Supplier Type")
            {
                ApplicationArea = Basic;
            }
            field("Vendor Type"; "Vendor Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("IC Partner Code")
        {
            field("Secondary Contact No."; "Secondary Contact No.")
            {
                ApplicationArea = Basic;
            }
            field("Secondary Contact"; "Secondary Contact")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Vendor Posting Group")
        {
            field("Withholding Tax Code"; "Withholding Tax Code")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Prepayment %")
        {
            field("Maximum Order Amount"; "Maximum Order Amount")
            {
                ApplicationArea = Basic;
            }
            field("Minimum Order Amount"; "Minimum Order Amount")
            {
                ApplicationArea = Basic;
            }
            field("Maximum Order Quantity"; "Maximum Order Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Minimum Order Quantity"; "Minimum Order Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Block Payment Tolerance")
        {
            field("PIN No."; "PIN Number")
            {
                ApplicationArea = Basic;
                Importance = Promoted;
            }
            field("Working Hours"; "Working Hours")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Foreign Trade")
        {
            group("Owner Details")
            {
                Caption = 'Owner Details';
                part(Control1000000006; "Owner Details")
                {
                    SubPageLink = "Supplier No." = field("No.");
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunObject) on ""Statistics by C&urrencies"(Action 20)".


        //Unsupported feature: Property Modification (RunPageLink) on ""Statistics by C&urrencies"(Action 20)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""C&ontact"(Action 14)".

        addafter(SendApprovalRequest)
        {
            action("Supplier Complaints")
            {
                ApplicationArea = Basic;
                RunObject = Page "Supplier Complaints";
                RunPageLink = "Supplier No." = field("No.");
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
    "Debtor Type":="Debtor Type"::"Vendor Account";
    */
    //end;


    //Unsupported feature: Code Modification on "ActivateFields(PROCEDURE 3)".

    //procedure ActivateFields();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSocialListeningFactboxVisibility;
    ContactEditable := "Primary Contact No." = '';
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ContactEditable := "Primary Contact No." = '';
    */
    //end;
}

