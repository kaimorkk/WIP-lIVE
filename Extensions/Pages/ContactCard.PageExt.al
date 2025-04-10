PageExtension 52193558 pageextension52193558 extends "Contact Card" 
{
    layout
    {
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify(Minor)
        {
            Visible = false;
        }
        modify("Parental Consent Received")
        {
            Visible = false;
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on ""T&o-dos"(Action 96)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetParentalConsentReceivedEnable;
        IF NOT MapMgt.TestSetup THEN
          MapPointVisible := FALSE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF NOT MapMgt.TestSetup THEN
          MapPointVisible := FALSE;
        */
    //end;
}

