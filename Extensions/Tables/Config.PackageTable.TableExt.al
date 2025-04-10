TableExtension 52193805 tableextension52193805 extends "Config. Package Table" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Imported by User ID"(Field 21)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Created by User ID"(Field 22)".

    }

    //Unsupported feature: Code Modification on "SetProcessingOrderPrimaryKey(PROCEDURE 17)".

    //procedure SetProcessingOrderPrimaryKey();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RecRef.OPEN(TableID);
        KeyRef := RecRef.KEYINDEX(1);
        FOR KeyFieldCount := 1 TO KeyRef.FIELDCOUNT DO BEGIN
          FieldRef := KeyRef.FIELDINDEX(KeyFieldCount);
          ConfigPackageField.GET(PackageCode,TableID,FieldRef.NUMBER);
          ProcessingOrder += 1;
          ConfigPackageField."Processing Order" := ProcessingOrder;
          ConfigPackageField.MODIFY;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
          ConfigPackageField."Processing Order" += ProcessingOrder;
          ConfigPackageField.MODIFY;
        END;
        */
    //end;
}

