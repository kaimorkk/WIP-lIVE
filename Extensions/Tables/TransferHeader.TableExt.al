TableExtension 52193711 tableextension52193711 extends "Transfer Header" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Completely Shipped"(Field 5752)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Completely Received"(Field 5753)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 9000)".

    }

    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 19)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF TransferLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
          IF SalesLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "UpdateTransLines(PROCEDURE 15)".

    //procedure UpdateTransLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF GUIALLOWED THEN
          CASE FieldRef OF
            FIELDNO("Shipping Agent Code"),
        #4..10
          END;

        TransLine.SETRANGE("Document No.","No.");
        TransLine.SETFILTER("Item No.",'<>%1','');
        IF TransLine.FINDSET THEN BEGIN
          TransLine.LOCKTABLE;
          REPEAT
        #18..71
            TransLine.MODIFY(TRUE);
          UNTIL TransLine.NEXT = 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..13
        #15..74
        */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 3)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION,"No."),
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF TransferLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
          IF SalesLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */
    //end;

    //Unsupported feature: Property Modification (Name) on "TransferLinesExist(PROCEDURE 5)".



    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 34)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        // Update all lines with changed dimensions.

        IF NewParentDimSetID = OldParentDimSetID THEN
        #4..12
            NewDimSetID := DimMgt.GetDeltaDimSetID(TransLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF TransLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              TransLine."Dimension Set ID" := NewDimSetID;

              VerifyShippedLineDimChange(ShippedLineDimChangeConfirmed);

              DimMgt.UpdateGlobalDimFromDimSetID(
                TransLine."Dimension Set ID",TransLine."Shortcut Dimension 1 Code",TransLine."Shortcut Dimension 2 Code");
              TransLine.MODIFY;
            END;
          UNTIL TransLine.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..15
        #19..23
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "UpdateAllLineDim(PROCEDURE 34).ShippedLineDimChangeConfirmed(Variable 1003)".

}

