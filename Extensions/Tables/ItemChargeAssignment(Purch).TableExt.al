TableExtension 52193719 tableextension52193719 extends "Item Charge Assignment (Purch)" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Item Charge Assignment (Purch)"(Table 5805)".

    fields
    {

        //Unsupported feature: Code Modification on ""Amount to Assign"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            PurchLine.GET("Document Type","Document No.","Document Line No.");
            IF NOT Currency.GET(PurchLine."Currency Code") THEN
              Currency.InitRoundingPrecision;
            "Amount to Assign" := ROUND("Qty. to Assign" * "Unit Cost",Currency."Amount Rounding Precision");
            ItemChargeAssgntPurch.SuggestAssgntFromLine(Rec)
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            */
        //end;
    }
}

