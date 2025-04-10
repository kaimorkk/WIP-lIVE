PageExtension 52193424 pageextension52193424 extends "Company Information" 
{
    layout
    {

        //Unsupported feature: Property Deletion (ShowMandatory) on "Name(Control 2)".


        //Unsupported feature: Property Deletion (ShowMandatory) on "Address(Control 4)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Post Code"(Control 34)".


        //Unsupported feature: Property Deletion (ShowMandatory) on "City(Control 8)".


        //Unsupported feature: Property Deletion (ShowMandatory) on ""Country/Region Code"(Control 42)".

        modify("Phone No.2")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bank Name"(Control 16)".

        modify("Bank Branch No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bank Branch No."(Control 18)".

        modify("Bank Account No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on ""Bank Account No."(Control 20)".

        modify("SWIFT Code")
        {
            Visible = false;
        }
        modify(Iban)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ShowMandatory) on "IBAN(Control 74)".

       
        addafter("VAT Registration No.")
        {
            field("PIN No.";"PIN No.")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst(Communication)
        {
            field("Phone No. 2";"Phone No. 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Home Page")
        {
            field("Finance Support Email";"Finance Support Email")
            {
                ApplicationArea = Basic;
            }
            field("HR Support Email";"HR Support Email")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Support E-mail";"Procurement Support E-mail")
            {
                ApplicationArea = Basic;
            }
            field("Fleet Manager Support Email";"Fleet Manager Support Email")
            {
                ApplicationArea = Basic;
            }
            field("Training Officer Support Email";"Training Officer Support Email")
            {
                ApplicationArea = Basic;
            }
            field("Administrator Email";"Administrator Email")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Communication)
        {
            group(Administration)
            {
                field("Company Head"; Rec."Company Head")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        MapPointVisible := TRUE;
        SetShowMandatoryConditions;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        MapPointVisible := TRUE;
        */
    //end;
}

