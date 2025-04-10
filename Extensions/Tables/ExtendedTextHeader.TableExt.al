TableExtension 52193506 tableextension52193506 extends "Extended Text Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""All Language Codes"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "All Language Codes" THEN
              "Language Code" := ''
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "All Language Codes" THEN
              "Language Code" := ''
            ELSE
              TESTFIELD("Language Code");
            */
        //end;
    }
}

