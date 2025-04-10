TableExtension 52193532 tableextension52193532 extends "Tracking Specification" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Quantity (Base)"(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Quantity (Base)" * "Quantity Handled (Base)" < 0) OR
               (ABS("Quantity (Base)") < ABS("Quantity Handled (Base)"))
            THEN
              FIELDERROR("Quantity (Base)",STRSUBSTNO(Text002,FIELDCAPTION("Quantity Handled (Base)")));

            WMSManagement.CheckItemTrackingChange(Rec,xRec);
            InitQtyToShip;
            CheckSerialNoQty;

            IF NOT QuantityToInvoiceIsSufficient THEN
              VALIDATE("Appl.-to Item Entry",0);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8
            VALIDATE("Appl.-to Item Entry",0);
            */
        //end;
    }
}

