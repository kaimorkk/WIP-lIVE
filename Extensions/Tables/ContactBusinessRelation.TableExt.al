TableExtension 52193651 tableextension52193651 extends "Contact Business Relation" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Business Relation Code"(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("No." = '') AND
               ("Contact No." <> '') AND
               ("Business Relation Code" <> '') AND
               (CurrFieldNo <> 0)
            THEN BEGIN
              RMSetup.GET;
              IF "Business Relation Code" = RMSetup."Bus. Rel. Code for Customers" THEN
            #8..16
                  FIELDCAPTION("Business Relation Code"),"Business Relation Code",
                  Cont.TABLECAPTION,BankAcc.TABLECAPTION);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ("No." = '') AND
               ("Contact No." <> '') AND
               ("Business Relation Code" <> '')
            #5..19
            */
        //end;
    }
}

