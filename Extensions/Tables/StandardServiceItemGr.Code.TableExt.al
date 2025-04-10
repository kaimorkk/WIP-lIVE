TableExtension 52193754 tableextension52193754 extends "Standard Service Item Gr. Code" 
{

    //Unsupported feature: Code Modification on "InsertServiceLines(PROCEDURE 1)".

    //procedure InsertServiceLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ServItemLine.TESTFIELD("Line No.");

        CLEAR(StdServItemGrCodesForm);
        #4..57
                    ROUND(StdServLine."Amount Excl. VAT" *
                      (ServLine."VAT %" / 100 * Factor + 1),Currency."Unit-Amount Rounding Precision"));
              END;

            ServLine."Shortcut Dimension 1 Code" := StdServLine."Shortcut Dimension 1 Code";
            ServLine."Shortcut Dimension 2 Code" := StdServLine."Shortcut Dimension 2 Code";

            CombineDimensions(ServLine,StdServLine);

            IF StdServLine.InsertLine THEN BEGIN
              ServLine."Line No." := GetNextLineNo(ServLine);
              ServLine.INSERT(TRUE);
              InsertExtendedText(ServLine);
            END;
          UNTIL StdServLine.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..60
            ServLine."Dimension Set ID" := StdServLine."Dimension Set ID";
        #67..72
        */
    //end;
}

