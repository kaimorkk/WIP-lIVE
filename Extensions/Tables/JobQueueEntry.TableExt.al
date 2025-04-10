TableExtension 52193581 tableextension52193581 extends "Job Queue Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 2)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Record ID to Process"(Field 15)".


        //Unsupported feature: Code Modification on ""Starting Time"(Field 26).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Recurring Job");
            IF "Starting Time" = 0T THEN
              "Reference Starting Time" := 0DT
            ELSE
              "Reference Starting Time" := CREATEDATETIME(20000101D,"Starting Time");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TESTFIELD("Recurring Job");
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Reference Starting Time"(Field 28)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User Session ID"(Field 32)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User Service Instance ID"(Field 40)".

    }

    //Unsupported feature: Property Deletion (Local) on "ClearServiceValues(PROCEDURE 9)".

}

