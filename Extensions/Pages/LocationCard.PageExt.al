PageExtension 52193587 pageextension52193587 extends "Location Card" 
{

    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Use Cross-DockingEnable" := TRUE;
        "Use Put-away WorksheetEnable" := TRUE;
        "Bin MandatoryEnable" := TRUE;
        #4..28
        "Base Calendar CodeEnable" := TRUE;
        InboundWhseHandlingTimeEnable := TRUE;
        OutboundWhseHandlingTimeEnable := TRUE;
        EditInTransit := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..31
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateEnabled(PROCEDURE 1)".

    //procedure UpdateEnabled();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Require PickEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
        "Require Put-awayEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
        "Require ReceiveEnable" := NOT "Use As In-Transit" AND NOT "Directed Put-away and Pick";
        #4..32
        AssemblyShipmentBinCodeEnable := "Bin Mandatory" AND NOT ShipmentBinCodeEnable;
        "Default Bin SelectionEnable" := "Bin Mandatory" AND NOT "Directed Put-away and Pick";
        "Use ADCSEnable" := NOT "Use As In-Transit" AND "Directed Put-away and Pick";
        "Pick According to FEFOEnable" := "Require Pick" AND "Bin Mandatory";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..35
        "Pick According to FEFOEnable" := "Require Pick";
        */
    //end;
}

