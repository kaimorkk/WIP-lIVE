TableExtension 52193753 tableextension52193753 extends "Standard Service Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Standard Service Line"(Table 5997)".

    fields
    {

        //Unsupported feature: Code Modification on ""No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "No." <> xRec."No." THEN BEGIN
              Quantity := 0;
              "Amount Excl. VAT" := 0;
            #4..24
                Type::Resource:
                  BEGIN
                    Res.GET("No.");
                    Res.CheckResourcePrivacyBlocked(FALSE);
                    Res.TESTFIELD(Blocked,FALSE);
                    Res.TESTFIELD("Gen. Prod. Posting Group");
                    Description := Res.Name;
            #32..50
            END;

            CreateDim(DimMgt.TypeToTableID5(Type),"No.");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..27
            #29..53
            */
        //end;
    }
}

