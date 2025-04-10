PageExtension 52193480 pageextension52193480 extends "Apply Vendor Entries" 
{
    layout
    {

        //Unsupported feature: Property Modification (Name) on "ApplyingVendorNo(Control 71)".


        //Unsupported feature: Property Modification (Name) on "ApplyingDescription(Control 85)".


        //Unsupported feature: Property Modification (Name) on "AppliesToID(Control 22)".


        //Unsupported feature: Property Modification (Name) on "PmtDiscAmount(Control 94)".

        modify(AppliesToID)
        {
            Visible = false;
        }
    }

    //Unsupported feature: Code Modification on "SetApplyingVendLedgEntry(PROCEDURE 9)".

    //procedure SetApplyingVendLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE CalcType OF
          CalcType::PurchHeader:
            BEGIN
        #4..45
              ApplyingVendLedgEntry."Posting Date" := GenJnlLine."Posting Date";
              ApplyingVendLedgEntry."Document Type" := GenJnlLine."Document Type";
              ApplyingVendLedgEntry."Document No." := GenJnlLine."Document No.";
              IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Vendor THEN BEGIN
                ApplyingVendLedgEntry."Vendor No." := GenJnlLine."Bal. Account No.";
                Vendor.GET(ApplyingVendLedgEntry."Vendor No.");
                ApplyingVendLedgEntry.Description := Vendor.Name;
              END ELSE BEGIN
                ApplyingVendLedgEntry."Vendor No." := GenJnlLine."Account No.";
                ApplyingVendLedgEntry.Description := GenJnlLine.Description;
              END;
              ApplyingVendLedgEntry."Currency Code" := GenJnlLine."Currency Code";
              ApplyingVendLedgEntry.Amount := GenJnlLine.Amount;
              ApplyingVendLedgEntry."Remaining Amount" := GenJnlLine.Amount;
              CalcApplnAmount;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..48
              ApplyingVendLedgEntry."Vendor No." := GenJnlLine."Account No.";
              ApplyingVendLedgEntry.Description := GenJnlLine.Description;
        #57..62
        */
    //end;


    //Unsupported feature: Code Modification on "HandlChosenEntries(PROCEDURE 8)".

    //procedure HandlChosenEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF AppliedVendLedgEntry.FINDSET(FALSE,FALSE) THEN BEGIN
          REPEAT
            AppliedVendLedgEntryTemp := AppliedVendLedgEntry;
        #4..47
                      AppliedVendLedgEntryTemp."Remaining Amount" - AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  END ELSE BEGIN
                    PossiblePmtdisc := AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
                    RemainingAmountExclDiscounts := AppliedVendLedgEntryTemp."Remaining Amount" - PossiblePmtdisc -
                      AppliedVendLedgEntryTemp."Max. Payment Tolerance";
                    IF ABS(CurrentAmount) + ABS(CalcOppositeEntriesAmount(AppliedVendLedgEntryTemp)) >= ABS(RemainingAmountExclDiscounts)
                    THEN BEGIN
                      PmtDiscAmount := PmtDiscAmount + PossiblePmtdisc;
                      AppliedAmount := AppliedAmount + CorrectionAmount;
                    END;
                    CurrentAmount := CurrentAmount + AppliedVendLedgEntryTemp."Remaining Amount" -
                      AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
                  END;
            END ELSE BEGIN
              IF ((CurrentAmount + AppliedVendLedgEntryTemp."Amount to Apply") * CurrentAmount) >= 0 THEN
        #63..87

        UNTIL NOT AppliedVendLedgEntryTemp.FINDFIRST;
        CheckRounding;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..50
                    IF (CurrentAmount + AppliedVendLedgEntryTemp."Remaining Amount" <= 0) <> (CurrentAmount <= 0) THEN BEGIN
        #55..57
                CurrentAmount := CurrentAmount + AppliedVendLedgEntryTemp."Remaining Amount" -
                  AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
        #60..90
        */
    //end;


    //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CalcType = CalcType::Direct THEN BEGIN
          IF ApplyingVendLedgEntry."Entry No." <> 0 THEN BEGIN
            Rec := ApplyingVendLedgEntry;
        #4..9
            END ELSE
              ERROR(Text019);

            Applied := VendEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

            IF Applied THEN BEGIN
              MESSAGE(Text012);
              PostingDone := TRUE;
              CurrPage.CLOSE;
            END;
          END ELSE
            ERROR(Text002);
        END ELSE
          ERROR(Text003);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
            VendEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

            MESSAGE(Text012);
            PostingDone := TRUE;
            CurrPage.CLOSE;
        #20..23
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SetApplyingVendLedgEntry(PROCEDURE 9).Vendor(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "HandlChosenEntries(PROCEDURE 8).RemainingAmountExclDiscounts(Variable 1012)".


    //Unsupported feature: Deletion (VariableCollection) on "PostDirectApplication(PROCEDURE 15).Applied(Variable 1006)".

}

