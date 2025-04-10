TableExtension 52193775 tableextension52193775 extends "Bin Content" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Neg. Adjmt. Qty."(Field 30)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Pos. Adjmt. Qty."(Field 32)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Pick Quantity (Base)"(Field 51)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Negative Adjmt. Qty. (Base)"(Field 52)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Positive Adjmt. Qty. (Base)"(Field 54)".


        //Unsupported feature: Deletion (FieldCollection) on ""Unit of Measure Filter"(Field 6503)".

    }

    //Unsupported feature: Code Modification on "CalcQtyAvailToTake(PROCEDURE 15)".

    //procedure CalcQtyAvailToTake();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetFilterOnUnitOfMeasure;
        CALCFIELDS("Quantity (Base)","Negative Adjmt. Qty. (Base)","Pick Quantity (Base)","ATO Components Pick Qty (Base)");
        EXIT(
          "Quantity (Base)" -
          (("Pick Quantity (Base)" + "ATO Components Pick Qty (Base)") - ExcludeQtyBase + "Negative Adjmt. Qty. (Base)"));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..5
        */
    //end;


    //Unsupported feature: Code Modification on "CheckDecreaseBinContent(PROCEDURE 21)".

    //procedure CheckDecreaseBinContent();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Block Movement" IN ["Block Movement"::Outbound,"Block Movement"::All] THEN
          FIELDERROR("Block Movement");

        #4..22
          DecreaseQtyBase := DecreaseQtyBase + WhseActivLine."Qty. (Base)";
        END;

        QtyAvailToPickBase := CalcTotalQtyAvailToTake(DecreaseQtyBase);
        IF QtyAvailToPickBase < QtyBase THEN BEGIN
          GetItem("Item No.");
          QtyAvailToPick := ROUND(QtyAvailToPickBase / UOMMgt.GetQtyPerUnitOfMeasure(Item,"Unit of Measure Code"),0.00001);
          IF QtyAvailToPick = Qty THEN
            QtyBase := QtyAvailToPickBase // rounding issue- qty is same, but not qty (base)
          ELSE
            FIELDERROR("Quantity (Base)",STRSUBSTNO(Text006,ABS(QtyBase)));
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..25
        QtyAvailToPickBase := CalcQtyAvailToTake(DecreaseQtyBase);
        #27..34
        */
    //end;
}

