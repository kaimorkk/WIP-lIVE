TableExtension 52193462 tableextension52193462 extends "Item Vendor" 
{
    fields
    {

        //Unsupported feature: Deletion on ""Lead Time Calculation"(Field 6).OnValidate".

    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InsertItemCrossReference;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        xRec.INIT;
        UpdateItemCrossReference;
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateItemCrossReference(PROCEDURE 6)".

    //procedure UpdateItemCrossReference();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ItemCrossReference.WRITEPERMISSION THEN
          IF ("Vendor No." <> '') AND ("Item No." <> '') THEN
            IF ("Vendor No." <> xRec."Vendor No.") OR ("Item No." <> xRec."Item No.") OR
               ("Variant Code" <> xRec."Variant Code") OR ("Vendor Item No." <> xRec."Vendor Item No.")
            THEN
              DistIntegration.UpdateItemCrossReference(Rec,xRec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF ItemCrossReference.WRITEPERMISSION THEN
          IF ("Vendor No." <> '') AND ("Item No." <> '') THEN
            DistIntegration.UpdateItemCrossReference(Rec,xRec);
        */
    //end;
}

