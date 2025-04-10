PageExtension 52193591 pageextension52193591 extends "Report Selection - Inventory" 
{
    layout
    {
        modify(ReportUsage2)
        {
            OptionCaption = 'Transfer Order,Transfer Shipment,Transfer Receipt,Inventory Period Test';
        }
    }

    //Unsupported feature: Property Modification (OptionString) on "ReportUsage2(Variable 1000)".

    //var
        //>>>> ORIGINAL VALUE:
        //ReportUsage2 : "Transfer Order","Transfer Shipment","Transfer Receipt","Inventory Period Test","Assembly Order","Posted Assembly Order";
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ReportUsage2 : "Transfer Order","Transfer Shipment","Transfer Receipt","Inventory Period Test";
        //Variable type has not been exported.


    //Unsupported feature: Code Modification on "SetUsageFilter(PROCEDURE 1)".

    //procedure SetUsageFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FILTERGROUP(2);
        CASE ReportUsage2 OF
          ReportUsage2::"Transfer Order":
        #4..7
            SETRANGE(Usage,Usage::Inv3);
          ReportUsage2::"Inventory Period Test":
            SETRANGE(Usage,Usage::"Invt. Period Test");
          ReportUsage2::"Assembly Order":
            SETRANGE(Usage,Usage::"Asm. Order");
          ReportUsage2::"Posted Assembly Order":
            SETRANGE(Usage,Usage::"P.Assembly Order");
        END;
        FILTERGROUP(0);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10
        END;
        FILTERGROUP(0);
        */
    //end;
}

