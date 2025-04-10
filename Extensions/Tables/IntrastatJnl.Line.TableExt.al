TableExtension 52193501 tableextension52193501 extends "Intrastat Jnl. Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Tariff No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            GetItemDescription;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TESTFIELD("Item No.",'');
            GetItemDescription;
            */
        //end;


        //Unsupported feature: Code Modification on ""Item No."(Field 20).OnValidate".

        //trigger "(Field 20)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD("Source Type",0);

            IF "Item No." = '' THEN
              CLEAR(Item)
            ELSE
              Item.GET("Item No.");

            Name := Item.Description;
            "Tariff No." := Item."Tariff No.";
            "Country/Region of Origin Code" := Item."Country/Region of Origin Code";
            GetItemDescription;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            ELSE BEGIN
              Item.GET("Item No.");
              Item.TESTFIELD("Tariff No.");
            END;
            #7..11
            */
        //end;
    }
}

