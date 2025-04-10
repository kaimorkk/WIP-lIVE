PageExtension 52193433 pageextension52193433 extends "Customer List" 
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Customer Price Group")
        {
            Visible = false;
        }
        modify("Customer Disc. Group")
        {
            Visible = false;
        }
        modify("Payment Terms Code")
        {
            Visible = false;
        }
        modify("Reminder Terms Code")
        {
            Visible = false;
        }
        modify("Fin. Charge Terms Code")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        modify("Language Code")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify("Credit Limit (LCY)")
        {
            Visible = false;
        }
        modify(Blocked)
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Application Method")
        {
            Visible = false;
        }
        modify("Combine Shipments")
        {
            Visible = false;
        }
        modify(Reserve)
        {
            Visible = false;
        }
        modify("Shipping Advice")
        {
            Visible = false;
        }
        modify("Shipping Agent Code")
        {
            Visible = false;
        }
        
    }
    actions
    {

        //Unsupported feature: Property Modification (RunObject) on ""Statistics by C&urrencies"(Action 63)".


        //Unsupported feature: Property Modification (RunPageLink) on ""Statistics by C&urrencies"(Action 63)".

        
        //Unsupported feature: Property Deletion (AccessByPermission) on ""Dimensions-&Multiple"(Action 42)".

        modify("Direct Debit Mandates")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""C&ontact"(Action 60)".


        //Unsupported feature: Property Deletion (RunPageView) on ""Return Orders"(Action 70)".


        //Unsupported feature: Property Deletion (RunPageLink) on ""Return Orders"(Action 70)".

        
    }


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
        /*
        //SETRANGE("Customer Type","Customer Type"::Debtor);
        */
    //end;
}

