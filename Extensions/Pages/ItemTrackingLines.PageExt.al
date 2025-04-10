PageExtension 52193619 pageextension52193619 extends "Item Tracking Lines" 
{

    //Unsupported feature: Code Modification on "AddReservEntriesToTempRecSet(PROCEDURE 15)".

    //procedure AddReservEntriesToTempRecSet();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ReservEntry.FINDSET THEN
          REPEAT
            IF Color = 0 THEN BEGIN
              TempReservEntry := ReservEntry;
              TempReservEntry.INSERT;
            END;
            IF (ReservEntry."Serial No." <> '') OR (ReservEntry."Lot No." <> '') THEN BEGIN
              AddTracking := TRUE;
              IF SecondSourceID = DATABASE::"Warehouse Shipment Line" THEN
                IF FromReservEntry.GET(ReservEntry."Entry No.",NOT ReservEntry.Positive) THEN
                  AddTracking := (FromReservEntry."Source Type" = DATABASE::"Assembly Header") = IsAssembleToOrder
                ELSE
                  AddTracking := NOT IsAssembleToOrder;

              IF AddTracking THEN BEGIN
                TempTrackingSpecification.TRANSFERFIELDS(ReservEntry);
                // Ensure uniqueness of Entry No. by making it negative:
                TempTrackingSpecification."Entry No." *= -1;
                IF SwapSign THEN
                  TempTrackingSpecification."Quantity (Base)" *= -1;
                IF Color <> 0 THEN BEGIN
                  TempTrackingSpecification."Quantity Handled (Base)" :=
                    TempTrackingSpecification."Quantity (Base)";
                  TempTrackingSpecification."Quantity Invoiced (Base)" :=
                    TempTrackingSpecification."Quantity (Base)";
                  TempTrackingSpecification."Qty. to Handle (Base)" := 0;
                  TempTrackingSpecification."Qty. to Invoice (Base)" := 0;
                END;
                TempTrackingSpecification."Buffer Status" := Color;
                TempTrackingSpecification.INSERT;
              END;
            END;
          UNTIL ReservEntry.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
            IF (ReservEntry."Lot No." <> '') OR (ReservEntry."Serial No." <> '') THEN BEGIN
              TempTrackingSpecification.TRANSFERFIELDS(ReservEntry);
              // Ensure uniqueness of Entry No. by making it negative:
              TempTrackingSpecification."Entry No." *= -1;
              IF SwapSign THEN
                TempTrackingSpecification."Quantity (Base)" *= -1;
              IF Color <> 0 THEN BEGIN
                TempTrackingSpecification."Quantity Handled (Base)" :=
                  TempTrackingSpecification."Quantity (Base)";
                TempTrackingSpecification."Quantity Invoiced (Base)" :=
                  TempTrackingSpecification."Quantity (Base)";
                TempTrackingSpecification."Qty. to Handle (Base)" := 0;
                TempTrackingSpecification."Qty. to Invoice (Base)" := 0;
              END;
              TempTrackingSpecification."Buffer Status" := Color;
              TempTrackingSpecification.INSERT;
            END;
          UNTIL ReservEntry.NEXT = 0;
        */
    //end;


    //Unsupported feature: Code Modification on "WriteToDatabase(PROCEDURE 10)".

    //procedure WriteToDatabase();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CurrentFormIsOpen THEN BEGIN
          TempReservEntry.LOCKTABLE;
          TempRecValid;
        #4..43
                         (TempItemTrackLineInsert."Quantity (Base)" <> TempItemTrackLineInsert."Qty. to Invoice (Base)")
                      THEN
                        SetQtyToHandleAndInvoice(TempItemTrackLineInsert);
                    END ELSE BEGIN
                      RegisterChange(xTempItemTrackingLine,TempItemTrackLineModify,ChangeType::Modify,FALSE);
                      SetQtyToHandleAndInvoice(TempItemTrackLineModify);
                    END;
                    TempItemTrackLineModify.DELETE;
                  END;
                END ELSE BEGIN
        #54..65
                Window.UPDATE(2,ROUND(i / NoOfLines * 10000,1));
              IF TempItemTrackLineModify.GET(TempItemTrackLineInsert."Entry No.") THEN
                TempItemTrackLineInsert.TRANSFERFIELDS(TempItemTrackLineModify);
              IF NOT RegisterChange(TempItemTrackLineInsert,TempItemTrackLineInsert,ChangeType::Insert,FALSE) THEN
                ERROR(Text005);
              IF (TempItemTrackLineInsert."Quantity (Base)" <> TempItemTrackLineInsert."Qty. to Handle (Base)") OR
                 (TempItemTrackLineInsert."Quantity (Base)" <> TempItemTrackLineInsert."Qty. to Invoice (Base)")
              THEN
                SetQtyToHandleAndInvoice(TempItemTrackLineInsert);
            UNTIL TempItemTrackLineInsert.NEXT = 0;
            TempItemTrackLineInsert.DELETEALL;
          END;
        #78..130

        IF NOT BlockCommit THEN
          COMMIT;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..46
                    END ELSE
                      IF NOT ChangeAlreadyNonSpecificReservations(
                           TempItemTrackLineModify,TempItemTrackLineModify."Quantity (Base)" - xTempItemTrackingLine."Quantity (Base)")
                      THEN BEGIN
                        RegisterChange(xTempItemTrackingLine,TempItemTrackLineModify,ChangeType::Modify,FALSE);
                        SetQtyToHandleAndInvoice(TempItemTrackLineModify);
                      END;
        #51..68
              IF NOT ChangeAlreadyNonSpecificReservations(TempItemTrackLineInsert,TempItemTrackLineInsert."Quantity (Base)") THEN BEGIN
                IF NOT RegisterChange(TempItemTrackLineInsert,TempItemTrackLineInsert,ChangeType::Insert,FALSE) THEN
                  ERROR(Text005);
                IF (TempItemTrackLineInsert."Quantity (Base)" <> TempItemTrackLineInsert."Qty. to Handle (Base)") OR
                   (TempItemTrackLineInsert."Quantity (Base)" <> TempItemTrackLineInsert."Qty. to Invoice (Base)")
                THEN
                  SetQtyToHandleAndInvoice(TempItemTrackLineInsert);
              END;
        #75..133
        */
    //end;

    //Unsupported feature: ReturnValue Insertion (ReturnValue: OK) (ReturnValueCollection) on "SetQtyToHandleAndInvoice(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: QtyAlreadyHandledToInvoice) (VariableCollection) on "SetQtyToHandleAndInvoice(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "SetQtyToHandleAndInvoice(PROCEDURE 7)".

    //procedure SetQtyToHandleAndInvoice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF IsCorrection THEN
          EXIT;

        TotalQtyToHandle := TrackingSpecification."Qty. to Handle (Base)" * CurrentSignFactor;
        TotalQtyToInvoice := TrackingSpecification."Qty. to Invoice (Base)" * CurrentSignFactor;

        ReservEntry1.TRANSFERFIELDS(TrackingSpecification);
        ReservationMgt.SetPointerFilter(ReservEntry1);
        ReservEntry1.SETRANGE("Lot No.",ReservEntry1."Lot No.");
        #10..22
                IF ABS(QtyToInvoiceThisLine) > ABS(TotalQtyToInvoice) THEN
                  QtyToInvoiceThisLine := TotalQtyToInvoice;

                IF TrackingSpecification."Qty. to Invoice (Base)" <> QtyToInvoiceThisLine THEN BEGIN
                  TrackingSpecification."Qty. to Invoice (Base)" := QtyToInvoiceThisLine;
                  TrackingSpecification.MODIFY;
                END;

                TotalQtyToInvoice -= QtyToInvoiceThisLine;
              END;
            UNTIL (TrackingSpecification.NEXT = 0);
        END;

        IF TrackingSpecification."Lot No." <> '' THEN
          FOR ReservEntry1."Reservation Status" := ReservEntry1."Reservation Status"::Reservation TO
              ReservEntry1."Reservation Status"::Prospect
          DO BEGIN
        #40..59
                TotalQtyToInvoice -= QtyToInvoiceThisLine;

              UNTIL (ReservEntry1.NEXT = 0);
          END
        ELSE
          IF ReservEntry1.FIND('-') THEN
            IF (ReservEntry1."Qty. to Handle (Base)" <> TotalQtyToHandle) OR
               (ReservEntry1."Qty. to Invoice (Base)" <> TotalQtyToInvoice) AND NOT ReservEntry1.Correction
            THEN BEGIN
              ReservEntry1."Qty. to Handle (Base)" := TotalQtyToHandle;
              ReservEntry1."Qty. to Invoice (Base)" := TotalQtyToInvoice;
              ReservEntry1.MODIFY;
            END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF IsCorrection THEN
          EXIT;
        OK := FALSE;
        #3..6
        IF ABS(TotalQtyToHandle) > ABS(TotalQtyToInvoice) THEN
          QtyAlreadyHandledToInvoice := 0
        ELSE
          QtyAlreadyHandledToInvoice := TotalQtyToInvoice - TotalQtyToHandle;

        #7..25
                IF ABS(QtyToInvoiceThisLine) > ABS(QtyAlreadyHandledToInvoice) THEN BEGIN
                  QtyToInvoiceThisLine := QtyAlreadyHandledToInvoice;
                  QtyAlreadyHandledToInvoice := 0;
                END ELSE
                  QtyAlreadyHandledToInvoice -= QtyToInvoiceThisLine;

        #26..33

          OK := ((TotalQtyToHandle = 0) AND (TotalQtyToInvoice = 0));
        END;

        IF TrackingSpecification."Lot No." <> '' THEN BEGIN
        #37..62
          END;

          OK := ((TotalQtyToHandle = 0) AND (TotalQtyToInvoice = 0));
        END ELSE
        #65..72
        */
    //end;

    local procedure ChangeAlreadyNonSpecificReservations(var TempTrackingSpecification: Record "Tracking Specification" temporary;QuantityBase: Decimal): Boolean
    var
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        RemainingQtyBase: Decimal;
        EntryNo: Integer;
    begin
        // Checks if there is already a non specific reservation pointing on the chosen SN/LN,
        // and makes the reservation specific in that case
        with TempTrackingSpecification do begin
          if Positive then
            exit(false);

          if QuantityBase <= 0 then
            exit(false);

          ReservEntry.SetRange("Reservation Status",ReservEntry."reservation status"::Reservation);
          ReservEntry.SetRange("Source Type",Database::"Item Ledger Entry");
          ReservEntry.SetRange("Item No.","Item No.");
          ReservEntry.SetRange("Serial No.","Serial No.");
          ReservEntry.SetRange("Lot No.","Lot No.");
          ReservEntry.SetRange(Positive,not Positive);

          if ReservEntry.FindSet then begin
            if "Serial No." <> '' then begin
              if CompareToReservationEntry(TempTrackingSpecification,ReservEntry2,ReservEntry."Entry No.",ReservEntry.Positive) then begin
                ModifyReservationEntry(ReservEntry2,"Serial No.","Lot No.",0);
                exit(true);
              end;
              exit(false);
            end;

            if "Lot No." <> '' then begin
              RemainingQtyBase := QuantityBase;

              repeat
                if CompareToReservationEntry(TempTrackingSpecification,ReservEntry2,ReservEntry."Entry No.",ReservEntry.Positive) then begin
                  if ReservEntry."Quantity (Base)" = RemainingQtyBase then begin
                    ModifyReservationEntry(ReservEntry2,'',"Lot No.",0);
                    exit(true);
                  end;

                  if ReservEntry."Quantity (Base)" > RemainingQtyBase then begin
                    // Modify existing reservation pair, and create new reservation pair for the quantity exceeding the needed quantity
                    EntryNo := TransferToNewReservation(ReservEntry,ReservEntry."Quantity (Base)" - RemainingQtyBase,0);
                    TransferToNewReservation(ReservEntry2,ReservEntry."Quantity (Base)" - RemainingQtyBase,EntryNo);

                    ReservEntry.Validate("Quantity (Base)",RemainingQtyBase);
                    ReservEntry.Modify;

                    ModifyReservationEntry(ReservEntry2,'',"Lot No.",-RemainingQtyBase);
                    exit(true);
                  end;

                  if ReservEntry."Quantity (Base)" < RemainingQtyBase then begin
                    ModifyReservationEntry(ReservEntry2,'',"Lot No.",0);
                    RemainingQtyBase -= ReservEntry."Quantity (Base)";
                  end;
                end;
              until (ReservEntry.Next = 0) or (RemainingQtyBase = 0);

              if RemainingQtyBase > 0 then begin
                Validate("Quantity (Base)",RemainingQtyBase);
                Modify;
              end;

              exit(false);
            end;
          end;
        end;
    end;

    local procedure TransferToNewReservation(ReservEntry: Record "Reservation Entry";QtyBase: Decimal;EntryNo: Integer): Integer
    var
        ReservEntry2: Record "Reservation Entry";
        SignFactor: Integer;
    begin
        if ReservEntry.Positive then
          SignFactor := 1
        else
          SignFactor := -1;

        ReservEntry2.Init;
        ReservEntry2.TransferFields(ReservEntry,false);
        ReservEntry2.Validate("Quantity (Base)",SignFactor * QtyBase);
        if EntryNo <> 0 then
          ReservEntry2."Entry No." := EntryNo;
        ReservEntry2.Positive := ReservEntry.Positive;
        ReservEntry2.Insert;

        exit(ReservEntry2."Entry No.");
    end;

    procedure CompareToReservationEntry(TempTrackingSpecification: Record "Tracking Specification" temporary;var ReservEntry: Record "Reservation Entry";EntryNo: Integer;Pos: Boolean): Boolean
    begin
        with TempTrackingSpecification do begin
          ReservEntry.Get(EntryNo,not Pos);
          if (ReservEntry."Source ID" = "Source ID") and
             (ReservEntry."Source Ref. No." = "Source Ref. No.") and
             (ReservEntry."Source Type" = "Source Type") and
             (ReservEntry."Source Subtype" = "Source Subtype") and
             (ReservEntry."Source Prod. Order Line" = "Source Prod. Order Line") and
             (ReservEntry."Serial No." = '') and
             (ReservEntry."Lot No." = '')
          then
            exit(true);

          exit(false);
        end;
    end;

    procedure ModifyReservationEntry(var ReservEntry: Record "Reservation Entry";SerialNo: Code[20];LotNo: Code[20];QuantityBase: Decimal)
    begin
        ReservEntry.Validate("Serial No.",SerialNo);
        ReservEntry.Validate("Lot No.",LotNo);
        ReservEntry.UpdateItemTracking;
        if QuantityBase <> 0 then
          ReservEntry.Validate("Quantity (Base)",QuantityBase);
        ReservEntry.Modify;
    end;

    //Unsupported feature: Deletion (VariableCollection) on "AddReservEntriesToTempRecSet(PROCEDURE 15).FromReservEntry(Variable 1003)".


    //Unsupported feature: Deletion (VariableCollection) on "AddReservEntriesToTempRecSet(PROCEDURE 15).AddTracking(Variable 1005)".


    //Unsupported feature: Property Deletion (DelayedInsert).

}

