TableExtension 52193605 tableextension52193605 extends "Assemble-to-Order Link" 
{

    //Unsupported feature: Parameter Insertion (Parameter: NewSalesLine) (ParameterCollection) on "UpdateAsmFromSalesLine(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: SalesLine2) (VariableCollection) on "UpdateAsmFromSalesLine(PROCEDURE 1)".


    //Unsupported feature: Code Modification on "UpdateAsmFromSalesLine(PROCEDURE 1)".

    //procedure UpdateAsmFromSalesLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        UpdateAsm(NewSalesLine,AsmExistsForSalesLine(NewSalesLine));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF AsmExistsForSalesLine(NewSalesLine) THEN BEGIN
          IF NOT NewSalesLine.IsAsmToOrderAllowed THEN BEGIN
            DeleteAsmFromSalesLine(NewSalesLine);
            EXIT;
          END;
          IF NewSalesLine."Qty. to Assemble to Order" = 0 THEN BEGIN
            DeleteAsmFromSalesLine(NewSalesLine);
            INSERT;
            EXIT;
          END;
          IF NOT GetAsmHeader THEN BEGIN
            DELETE;
            InsertAsmHeader(AsmHeader,"Assembly Document Type","Assembly Document No.");
          END ELSE BEGIN
            IF NOT NeedsSynchronization(NewSalesLine) THEN
              EXIT;
            AsmReopenIfReleased;
            DELETE;
          END;
        END ELSE BEGIN
          IF NewSalesLine."Qty. to Assemble to Order" = 0 THEN
            EXIT;
          IF NOT SalesLine2.GET(NewSalesLine."Document Type",NewSalesLine."Document No.",NewSalesLine."Line No.") THEN
            EXIT;

          InsertAsmHeader(AsmHeader,NewSalesLine."Document Type",'');

          "Assembly Document Type" := AsmHeader."Document Type";
          "Assembly Document No." := AsmHeader."No.";
          Type := Type::Sale;
          "Document Type" := NewSalesLine."Document Type";
          "Document No." := NewSalesLine."Document No.";
          "Document Line No." := NewSalesLine."Line No.";
        END;

        SynchronizeAsmFromSalesLine(NewSalesLine);
        INSERT;
        AsmHeader."Shortcut Dimension 1 Code" := NewSalesLine."Shortcut Dimension 1 Code";
        AsmHeader."Shortcut Dimension 2 Code" := NewSalesLine."Shortcut Dimension 2 Code";
        AsmHeader.MODIFY(TRUE);
        */
    //end;


    //Unsupported feature: Code Modification on "SynchronizeAsmFromSalesLine(PROCEDURE 15)".

    //procedure SynchronizeAsmFromSalesLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetAsmHeader;

        Window.OPEN(GetWindowOpenTextSale(NewSalesLine));
        #4..26
        ChangeDim(NewSalesLine."Dimension Set ID");
        ChangePlanningFlexibility;
        ChangeQty(NewSalesLine."Qty. to Assemble to Order");
        IF NewSalesLine."Document Type" <> NewSalesLine."Document Type"::Quote THEN
          ChangeQtyToAsm(MaxQtyToAsm(NewSalesLine,AsmHeader));

        AsmHeader.MODIFY(TRUE);

        #35..40
        Window.CLOSE;

        AsmHeader.ShowDueDateBeforeWorkDateMsg;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..29
        ChangeQtyToAsm(MaxQtyToAsm(NewSalesLine,AsmHeader));
        #32..43
        */
    //end;


    //Unsupported feature: Code Modification on "MakeAsmOrderLinkedToSalesOrderLine(PROCEDURE 28)".

    //procedure MakeAsmOrderLinkedToSalesOrderLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF AsmExistsForSalesLine(FromSalesLine) THEN BEGIN
          ToSalesOrderLine.TESTFIELD(Type,ToSalesOrderLine.Type::Item);
          ToSalesOrderLine.TESTFIELD("No.",FromSalesLine."No.");
        #4..14
            "Document Line No." := ToSalesOrderLine."Line No.";

            SynchronizeAsmFromSalesLine(ToSalesOrderLine);
            RecalcAutoReserve(ToAsmOrderHeader);
            INSERT;
          END;
          IF FromSalesLine."Document Type" = FromSalesLine."Document Type"::Quote THEN
            DeleteAsmFromSalesLine(FromSalesLine);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..17
        #19..23
        */
    //end;


    //Unsupported feature: Code Modification on "CopyAsmToNewAsmOrder(PROCEDURE 21)".

    //procedure CopyAsmToNewAsmOrder();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ToAsmOrderHeader := FromAsmHeader;
        ToAsmOrderHeader."Document Type" := ToAsmOrderHeader."Document Type"::Order;
        ToAsmOrderHeader."No." := '';
        ToAsmOrderHeader.Status := ToAsmOrderHeader.Status::Open;
        ToAsmOrderHeader."Assembled Quantity" := 0;
        ToAsmOrderHeader."Assembled Quantity (Base)" := 0;
        ToAsmOrderHeader.VALIDATE(Quantity,FromAsmHeader."Quantity to Assemble");
        ToAsmOrderHeader.INSERT(TRUE);
        RecordLinkManagement.CopyLinks(FromAsmHeader,ToAsmOrderHeader);

        FromAsmLine.SETRANGE("Document Type",FromAsmHeader."Document Type");
        FromAsmLine.SETRANGE("Document No.",FromAsmHeader."No.");
        #13..34
              ToAsmCommentLine.INSERT(TRUE);
            UNTIL FromAsmCommentLine.NEXT = 0;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..8
        ToAsmOrderHeader.COPYLINKS(FromAsmHeader);
        #10..37
        */
    //end;


    //Unsupported feature: Code Modification on "RollUpPrice(PROCEDURE 22)".

    //procedure RollUpPrice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesLine.TESTFIELD(Quantity);
        SalesLine.TESTFIELD("Qty. to Asm. to Order (Base)");
        IF NOT CONFIRM(Text001) THEN
        #4..59
            END;
          UNTIL AsmLine.NEXT = 0;

        UnitPrice := ROUND(UnitPrice / AsmHeader.Quantity,Currency."Unit-Amount Rounding Precision");
        SalesLine.VALIDATE("Unit Price",UnitPrice);
        SalesLine.MODIFY(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..62
        UnitPrice := ROUND(UnitPrice / SalesLine.Quantity,Currency."Unit-Amount Rounding Precision");
        SalesLine.VALIDATE("Unit Price",UnitPrice);
        SalesLine.MODIFY(TRUE);
        */
    //end;


    //Unsupported feature: Code Modification on "RollUpCost(PROCEDURE 23)".

    //procedure RollUpCost();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesLine.TESTFIELD(Quantity);
        SalesLine.TESTFIELD("Qty. to Asm. to Order (Base)");
        IF NOT CONFIRM(Text002) THEN
        #4..13
            UnitCost += AsmLine."Cost Amount";
          UNTIL AsmLine.NEXT = 0;

        SalesLine.VALIDATE("Unit Cost (LCY)",ROUND(UnitCost / AsmHeader.Quantity,0.00001));
        SalesLine.MODIFY(TRUE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        SalesLine.VALIDATE("Unit Cost (LCY)",ROUND(UnitCost / SalesLine.Quantity,0.00001));
        SalesLine.MODIFY(TRUE);
        */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "UpdateAsmFromSalesLine(PROCEDURE 1).NewSalesLine(Parameter 1000)".


    //Unsupported feature: Deletion (VariableCollection) on "CopyAsmToNewAsmOrder(PROCEDURE 21).RecordLinkManagement(Variable 1008)".

}

