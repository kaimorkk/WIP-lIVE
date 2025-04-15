PageExtension 52193432 pageextension52193432 extends "Customer Card"
{
    layout
    {

        //Unsupported feature: Property Deletion (ShowMandatory) on "Name(Control 4)".

        modify("Privacy Blocked")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Gen. Bus. Posting Group"(Control 70)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""VAT Bus. Posting Group"(Control 58)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Customer Posting Group"(Control 38)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Payment Terms Code"(Control 50)".

        modify("VAT Registration No.")
        {
            Visible = false;
        }

        addafter(Blocked)
        {
            field("Customer Type"; "Customer Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            // field("Customer Ref No";"Customer Ref No")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }
    actions
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on ""C&ontact"(Action 14)".

    }


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
    "Customer Type":="Customer Type"::Debtor;
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ActivateFields;
    IF NOT MapMgt.TestSetup THEN
      MapPointVisible := FALSE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3

    //SETRANGE("Customer Type","Customer Type"::Debtor);
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

