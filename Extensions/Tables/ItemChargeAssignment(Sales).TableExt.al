TableExtension 52193720 tableextension52193720 extends "Item Charge Assignment (Sales)" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Item Charge Assignment (Sales)"(Table 5809)".

    fields
    {

        //Unsupported feature: Code Modification on ""Amount to Assign"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SalesLine.GET("Document Type","Document No.","Document Line No.");
            IF NOT Currency.GET(SalesLine."Currency Code") THEN
              Currency.InitRoundingPrecision;
            "Amount to Assign" := ROUND("Qty. to Assign" * "Unit Cost",Currency."Amount Rounding Precision");
            ItemChargeAssgntSales.SuggestAssignmentFromLine(Rec);
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

